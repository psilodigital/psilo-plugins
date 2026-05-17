# vault/products

Reference data for **Psilodigital's products** — primarily PsiloBooking, plus any reusable internal accelerators.

## Suggested structure

```
products/
├── psilobooking/
│   ├── overview.md       # what it is, who it's for
│   ├── feature-map.md    # capabilities, modules
│   ├── architecture.md   # current system architecture
│   ├── pricing.md        # tiers, add-ons
│   ├── changelog.md      # release log
│   ├── incidents/        # post-incident reports
│   └── audits/           # monthly ops audits
├── stack.md              # canonical Psilodigital tech stack
└── accelerators.md       # internal templates / starter kits
```

## Rules

- **PsiloBooking is the flagship.** Always keep `psilobooking/overview.md` current.
- **`stack.md` overrides agent defaults.** If we deviate from defaults on a client project, justify it in that project's architecture file.
- **Customer-specific config never lives here.** That belongs under `vault/clients/<client>/`.
