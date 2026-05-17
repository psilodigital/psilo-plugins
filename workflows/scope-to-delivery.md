# Scope to Delivery Workflow

## Purpose

Turn approved scope into delivery plan and implementation tasks.

## Trigger

Use after a proposal or scope is approved.

## Inputs

- Approved scope
- Timeline
- Team capacity
- Known technical constraints

## Primary agent

- solution-architect

## Supporting agents

- delivery-manager
- devops-agent

## Skills used

- scope-builder

## Vault context used

- vault/company/delivery-principles.md
- vault/clients/[client]/
- vault/templates/technical-scope-template.md

## Procedure

1. Read approved scope.
2. Identify deliverables.
3. Break into milestones.
4. Break milestones into implementation tasks.
5. Identify dependencies and risks.
6. Suggest GitHub issue structure.
7. Save delivery plan.

## Output

Output path:
`outputs/[client]/delivery-plan.md`

## Approval points

Human approval required before creating GitHub issues or committing timeline.
