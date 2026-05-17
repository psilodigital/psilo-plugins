# System Rules

This repository (`psilodigital-plugins`) defines how Psilodigital plugins operate across Claude Code, Codex CLI, and Gemini CLI.

## Global principles

- Use business-friendly language first, technical language second.
- Separate facts, assumptions, risks, and recommendations.
- Do not overpromise integrations or automation.
- Do not expose secrets. Secrets live only in the user's secret manager, never in this repo or in any vault file.
- Do not mix client contexts.
- Ask for human approval before any external action (sending email, posting to chat, creating issues).
- Never send communications directly — drafts only.
- Treat plugin code as Psilodigital internal IP unless explicitly open-sourced.

## Plugins

The marketplace ships three plugins, each independently installable:

1. **sales** — Sales Strategist: prospect research, discovery prep, outreach, follow-ups
2. **proposals** — Business Analyst + Solution Architect: meeting notes → proposal + MVP scope
3. **delivery** — Delivery Manager + Solution Architect + DevOps: approved scope → milestones, sprints, status updates

See each plugin's own `CLAUDE.md` for its operational rules and skill index.
