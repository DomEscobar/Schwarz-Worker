# Verification Patterns

How to verify artifacts are real implementations, not stubs or placeholders.

## Core principle

**Existence ≠ Implementation.** Verification checks:

1. **Exists** — File at expected path.
2. **Substantive** — Real implementation, not placeholder (no TODO-only, no empty returns where behavior is required).
3. **Wired** — Connected to the rest of the system (imported, used, data flow).
4. **Functional** — Works when invoked (often requires human UAT).

Levels 1–3 can be checked programmatically. Level 4 is the role of verify-work (UAT).

## Stub detection

- Comment-based: TODO, FIXME, PLACEHOLDER, "implement later", "coming soon".
- Empty or trivial: return null/undefined/[]/{}; pass; console.log only.
- Hardcoded values where dynamic data is expected.
- Placeholder text in UI: "lorem ipsum", "coming soon", "under construction".

## Artifact types

- **Components:** Export present, returns JSX (not placeholder div), uses props/state, wired (imports and API calls if data-fetching).
- **API routes:** Exports handler, has real logic (DB/service calls), error handling, meaningful response (not "Not implemented").
- **Links:** Component → API (fetch/axios to correct path, response handled). API → DB (query and return). Form → handler → API.

Verifier uses these patterns when checking must_haves (truths, artifacts, key_links) and writes VERIFICATION.md with status and evidence.
