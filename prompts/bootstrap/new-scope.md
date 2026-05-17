# Bootstrap: New Scope

Use this prompt to turn a signed proposal (or near-signed) into a working scope.

---

Read `SYSTEM.md` and `AGENTS.md`. Then:

- **Client:** <slug>
- **Source proposal:** <path under vault/clients/<slug>/proposals/>
- **Known constraints:** team availability, deadlines, integrations the client owns
- **Anything new since the proposal:** <fill in>

Run:

1. Solution Architect pass — finalize architecture under `architecture/`.
2. `scope-builder` skill — produce `scope/<YYYY-MM-DD>-scope.md`.
3. Surface assumptions and open questions clearly.
4. If anything is materially different from the proposal (price, scope, timeline), flag it before we ask the client to sign.

Goal: a scope document I can put in front of the client for signature.
