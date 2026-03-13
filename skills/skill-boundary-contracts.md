# Skill: Boundary Contracts

Use this skill when planning or implementing work that crosses phase boundaries.

## Checklist

1. Identify what this phase must produce for downstream phases.
2. Identify what this phase consumes from upstream phases.
3. Map each must-have to a concrete contract artifact (type, function, endpoint, schema).
4. Ensure plan verification criteria include contract checks.
5. Ensure summary includes provides/requires and any contract deviation.

## Anti-patterns

- Producing unnamed "helper" outputs with no consumer mapping.
- Consuming upstream behavior that is not declared in ROADMAP boundary map.
- Renaming exported contracts without reassessment updates.
