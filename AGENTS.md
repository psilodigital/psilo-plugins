# AGENTS.md

## Repository purpose

This repo is Psilodigital's Business Agent System.

Agents should use this repo to understand:
- who Psilodigital is
- what services/products we offer
- how we prepare meetings
- how we write proposals
- how we scope delivery
- how we structure reusable agent skills

## Working rules

- Read `SYSTEM.md` first.
- Use `ARCHITECTURE.md` to understand folder purpose.
- Use `agents/` for role behavior.
- Use `skills/` for procedures.
- Use `vault/` for facts and context.
- Use `workflows/` for process orchestration.
- Never add secrets.
- Never invent client facts.
- Mark assumptions clearly.

## Editing rules

When creating a new skill:
- create a folder under `skills/`
- include `SKILL.md`
- include `templates/`, `references/`, and `examples/`

When creating a new agent:
- create a folder under `agents/`
- include `agent.md`
- list allowed skills and allowed vault folders
