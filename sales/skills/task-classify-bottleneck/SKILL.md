---
name: task-classify-bottleneck
type: task
version: 0.1.0
status: active
risk_level: low
requires_approval: false
description: |
  Atomic primitive. Given a described symptom (e.g. "they answer the same 5 questions on
  email every week"), classify it against documented SME bottleneck patterns from
  _company/_shared/common-sme-bottlenecks.md. Returns up to 3 ranked matches or unmatched.
user-invocable: false
called_by:
  - op-prep-discovery-call
  - flow-research-prospect
calls: []
inputs:
  - symptom
  - evidence?
  - sector?
outputs:
  - matched_patterns
---

# task-classify-bottleneck

**Type:** Task (atomic primitive)
**Produces:** Classification returned to caller (in-memory; no file write)

## Inputs

- `symptom` — required, one-line description
- `evidence` — optional, supporting observation or quote
- `sector` — optional, helps narrow patterns

## Procedure

1. **Read** `~/Documents/psilodigital/vault/_company/_shared/common-sme-bottlenecks.md`. If missing, return `{matched: [], reason: "bottleneck reference missing"}` and let the caller decide.
2. **Match the symptom** against each documented pattern. Use semantic similarity, not keyword match.
3. **Return up to 3 matches** ranked by confidence.

## Output Structure

```yaml
symptom: "<input>"
matched:
  - {pattern_id: "...", pattern_name: "...", confidence: low|medium|high, reasoning: "one sentence"}
unmatched: false
```

If no pattern matches with at least `low` confidence, return `unmatched: true` and let the caller flag as a new pattern candidate.

## Rules

- Never invent a pattern. Only return patterns documented in `common-sme-bottlenecks.md`.
- Confidence must be justified by reasoning in one sentence.
- Multiple matches are fine — bottlenecks compound.
