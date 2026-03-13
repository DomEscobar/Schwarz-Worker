const { hashToken, verifyToken } = require("./auth");

function runSelfCheck() {
  const token = hashToken("seed-user");
  const valid = verifyToken(token);

  if (!valid) {
    process.exitCode = 1;
    console.error("Self-check failed.");
    return;
  }

  console.log("Self-check passed.");
}

if (process.argv.includes("--self-check")) {
  runSelfCheck();
} else {
  console.log("Seed app ready.");
}
