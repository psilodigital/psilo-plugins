# Proposal Generation Workflow

## Purpose

Turn meeting notes and client context into a proposal draft.

## Trigger

Use after a discovery meeting or when enough scope context exists.

## Inputs

- Client context
- Meeting notes
- Pain points
- Desired outcomes
- Scope assumptions

## Primary agent

- sales-strategist

## Supporting agents

- business-analyst
- solution-architect

## Skills used

- proposal-writer
- scope-builder

## Vault context used

- vault/company/
- vault/templates/proposal-template.md
- vault/clients/[client]/

## Procedure

1. Read client context and meeting notes.
2. Identify business problems.
3. Draft proposed solution.
4. Use scope-builder for MVP boundaries.
5. Use proposal-writer for proposal structure.
6. Mark assumptions and open questions.
7. Save proposal draft.

## Output

Output path:
`outputs/[client]/proposal-draft.md`

## Approval points

Human approval required before sending to client.
