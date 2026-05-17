# Example Output — Scope Builder

Client: Artway
Project: Artist Profile & Press Kit System

## 1. Business goal

Give the Artway team a single internal tool that manages artist data and press kits, and powers public artist pages and inquiry intake — reducing manual coordination and email back-and-forth.

## 2. MVP scope

- Internal admin to create, edit, and publish artist profiles.
- Press kit fields: bio, photos, audio links, downloadable assets.
- Publish / unpublish toggle with an approval step.
- Public artist profile page using the same data.
- Booking inquiry form on the public site, captured into a shared inbox.

## 3. Out of scope

- Full CRM replacement.
- Payment processing.
- Multi-language artist content.
- Mobile app.
- Public artist self-service portal (phase 2).

## 4. User roles

| Role | Description | Permissions |
|---|---|---|
| Admin | Artway team lead | Full CRUD, publish, manage users |
| Editor | Artway staff | Create and edit profiles, submit for publish |
| Public | Site visitors | Read public profile pages, submit inquiries |

## 5. Core features

| # | Feature | Description | Priority |
|---|---|---|---|
| 1 | Artist profile CRUD | Add/edit artists and core fields | P0 |
| 2 | Press kit fields | Bio, photos, audio links, downloads | P0 |
| 3 | Approval flow | Editor → Admin → Public | P0 |
| 4 | Public profile page | Renders artist data on the site | P0 |
| 5 | Inquiry form | Capture booking inquiries | P0 |
| 6 | Shared inbox | View and assign inquiries | P1 |
| 7 | PDF press kit export | Generated on demand | P2 |

## 6. Data model overview

- **Artist** — name, slug, bio, photos, audio links, status (draft / pending / published).
- **PressKitAsset** — file, type, label, linked to Artist.
- **Inquiry** — name, contact, message, artist (optional), status (new / in-progress / closed).
- **User** — Artway team member with role.

## 7. Integrations

| System | Direction | Method | Auth | Status |
|---|---|---|---|---|
| Existing website CMS | Read content from admin | TBD | TBD | unknown — needs spike |
| Email (inquiry notifications) | Send | SMTP / provider | API key | planned |
| Cloud storage for assets | Upload | S3-compatible | API key | planned |

## 8. Risks

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| CMS integration not feasible | medium | high | Time-box a spike in discovery |
| Asset sizes exceed storage limits | low | medium | Confirm typical asset sizes early |
| Approval flow adoption fails | medium | medium | Keep it minimal in MVP |

## 9. Assumptions

- The team is on a CMS that exposes a usable API or supports embedding.
- Public site can be modified to render artist profiles from the new admin.
- The team will manage the system day-to-day after handover.

## 10. Suggested phases

| Phase | Outputs | Duration | Exit criteria |
|---|---|---|---|
| Discovery & Design | Final scope, designs, integration spike result | 1–2 weeks | Signed scope and data model |
| Build | Admin, public pages, inquiry form working in staging | 5–7 weeks | Team uses it in staging without help |
| Launch & Handover | Production deployment, docs, training | 1 week | First real artist profile live |
