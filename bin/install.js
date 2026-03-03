#!/usr/bin/env node
'use strict';

const fs = require('fs');
const path = require('path');
const os = require('os');
const readline = require('readline');

const PKG_ROOT = path.join(__dirname, '..');
const DIRS = [
  { from: 'commands/szw', to: 'commands/szw' },
  { from: 'workflows', to: 'workflows' },
  { from: 'agents', to: 'agents' },
  { from: 'references', to: 'references' },
  { from: 'templates', to: 'templates' },
  { from: 'docs', to: 'docs' },
];

function getVersion() {
  try {
    const pkg = JSON.parse(fs.readFileSync(path.join(PKG_ROOT, 'package.json'), 'utf8'));
    return pkg.version || '0.0.0';
  } catch {
    return fs.readFileSync(path.join(PKG_ROOT, 'VERSION'), 'utf8').trim() || '0.0.0';
  }
}

function resolveTarget(globalInstall) {
  const envDir = process.env.OPENCODE_CONFIG_DIR;
  if (envDir) return path.resolve(envDir);
  if (globalInstall) {
    const home = os.homedir();
    return path.join(home, '.config', 'opencode');
  }
  return path.join(process.cwd(), '.opencode');
}

function copyRecursive(src, dest) {
  const stat = fs.statSync(src);
  if (stat.isDirectory()) {
    fs.mkdirSync(dest, { recursive: true });
    for (const name of fs.readdirSync(src)) {
      copyRecursive(path.join(src, name), path.join(dest, name));
    }
  } else {
    fs.mkdirSync(path.dirname(dest), { recursive: true });
    fs.copyFileSync(src, dest);
  }
}

function rmRecursive(dir) {
  if (!fs.existsSync(dir)) return;
  const stat = fs.statSync(dir);
  if (stat.isFile()) {
    fs.unlinkSync(dir);
    return;
  }
  for (const name of fs.readdirSync(dir)) {
    rmRecursive(path.join(dir, name));
  }
  fs.rmdirSync(dir);
}

function isInstalled(target) {
  const marker = path.join(target, 'commands', 'szw');
  return fs.existsSync(marker);
}

function check(target) {
  const results = [];
  for (const { to } of DIRS) {
    const p = path.join(target, to);
    const ok = fs.existsSync(p);
    results.push({ path: to, ok });
  }
  const versionPath = path.join(target, 'VERSION');
  const versionOk = fs.existsSync(versionPath);
  results.push({ path: 'VERSION', ok: versionOk });
  return results;
}

function prompt(question) {
  const rl = readline.createInterface({ input: process.stdin, output: process.stdout });
  return new Promise((resolve) => {
    rl.question(question, (answer) => {
      rl.close();
      resolve((answer || '').trim().toLowerCase());
    });
  });
}

async function main() {
  const args = process.argv.slice(2);
  const force = args.includes('--force') || args.includes('-f');
  const doCheck = args.includes('--check') || args.includes('-c');
  let globalInstall = args.includes('--global') || args.includes('-g');
  const localInstall = args.includes('--local') || args.includes('-l');

  if (doCheck) {
    const target = localInstall ? resolveTarget(false) : resolveTarget(true);
    if (!fs.existsSync(target)) {
      console.log('SchwarzWorker: not installed (target missing:', target, ')');
      process.exit(1);
    }
    const results = check(target);
    const versionPath = path.join(target, 'VERSION');
    const versionOk = fs.existsSync(versionPath);
    const allOk = results.every((r) => r.ok);
    console.log('SchwarzWorker install check:', target);
    for (const r of results) {
      console.log('  ', r.ok ? '\u2713' : '\u2717', r.path);
    }
    if (versionOk) {
      const v = fs.readFileSync(versionPath, 'utf8').trim();
      console.log('  Version:', v);
    }
    process.exit(allOk ? 0 : 1);
  }

  if (localInstall) globalInstall = false;
  if (!globalInstall && !localInstall) {
    const answer = await prompt('Install globally (~/.config/opencode/) or locally (./.opencode/)? (g/l): ');
    globalInstall = answer === 'g' || answer === 'global';
  }

  const target = resolveTarget(globalInstall);

  if (isInstalled(target) && !force) {
    const answer = await prompt('SchwarzWorker already installed at ' + target + '. Reinstall? (y/N): ');
    if (answer !== 'y' && answer !== 'yes') {
      console.log('Skipped.');
      process.exit(0);
    }
  }

  fs.mkdirSync(target, { recursive: true });

  for (const { from, to } of DIRS) {
    const src = path.join(PKG_ROOT, from);
    const dest = path.join(target, to);
    if (!fs.existsSync(src)) continue;
    if (fs.existsSync(dest)) rmRecursive(dest);
    copyRecursive(src, dest);
  }

  const version = getVersion();
  fs.writeFileSync(path.join(target, 'VERSION'), version + '\n', 'utf8');

  console.log('SchwarzWorker v' + version + ' installed to ' + target);
  console.log('Restart OpenCode and run /szw-help to verify.');
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
