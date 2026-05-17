---
type: task
called_by: [op-build-proposal, op-build-scope, flow-research-client, flow-build-scope]
description: >
  Atomic primitive. Manages open questions for a client — things that need a human
  answer (from us or from the client) before the proposal can be finalized.
  Different from assumptions: assumptions are inferences we made; open questions are
  unknowns we need to ask. Appears in the proposal's "Open Questions" section.
---

# task-update-open-questions

**Type:** Task (atomic primitive — write to `open-loops.md`)
**Produces:** New or updated entry under `## Open Questions` in `~/Documents/psilodigital/vault/proposals/open-loops.md`

## Inputs (one operation per call)

### `add_question`
- `client` — required
- `question` — required, the question phrased as a question
- `needs_input_from` — required: `client` | `solution-architect` | `business-analyst` | `delivery` | `legal`
- `blocks_send` — required, boolean: must this be resolved before sending the proposal?
- `context` — optional, why the question matters

### `resolve_question`
- `client` — required
- `question` — required, must match an existing question
- `answer` — required, the resolution
- `answer_source` — required: `client` | `internal` | `assumption-accepted`

## Procedure

1. **Open** `~/Documents/psilodigital/vault/proposals/open-loops.md`.
2. **For `add_question`**: append under `## Open Questions` (create heading if missing). De-duplicate against existing questions for the same client.
3. **For `resolve_question`**: locate the matching question, move it to `## Resolved Questions` with the answer and source.

## Question Format

```markdown
- [ ] **<client>** | needs: <needs_input_from> | blocks_send: <yes|no> | logged: <YYYY-MM-DD>
  - Q: <question>
  - context: <context>
```

## Resolved Format

```markdown
- [x] **<client>** | resolved by: <answer_source> | <YYYY-MM-DD>
  - Q: <question>
  - A: <answer>
```

## Rules

- `blocks_send: true` questions must be visible in the proposal's "Open Questions" section.
- Never delete history — always move to `## Resolved Questions`.
- If the same client has 5+ unresolved questions, the calling op should recommend a clarification call instead of pushing the proposal forward.
