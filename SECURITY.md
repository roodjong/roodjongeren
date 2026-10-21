# Security policy

Thanks for taking the time to report a security issue with roodjongeren.nl.

## Reporting a vulnerability

If you've found something that could compromise user data, the petition flow,
or the integrity of our public site, please **don't open a public GitHub issue**.

Instead, email **security@roodjongeren.nl** with:

- A short description of the issue.
- Steps to reproduce or a proof of concept.
- Your contact details so we can follow up.

We aim to acknowledge reports within 3 working days and to provide a status
update within 10 working days.

If you'd prefer encrypted email, ask for our PGP key in the first message
and we'll send it back through a separate channel.

## Scope

In scope:

- The public site at `roodjongeren.nl`.
- The Strapi admin at `roodjongeren.nl/backend/admin`.
- The petition signature flow (form, confirmation, redirect).
- Authenticated areas linked from the public site.

Out of scope (not because they don't matter, but because they're handled
elsewhere):

- `mijn.roodjongeren.nl` (separate codebase, separate disclosure address).
- Third-party services we link to.
- Best-practice recommendations with no concrete vulnerability (e.g.
  "you should add header X" without a demonstrated attack).

## What we appreciate

- Reports that include a clear repro and a proposed fix or mitigation.
- Coordinated disclosure (we credit researchers in release notes if you'd
  like).
- Patience while we triage; this is a small volunteer team.

## What we don't appreciate

- Automated scanner output without manual validation.
- Testing that disrupts the service for real users (rate-limit testing,
  spam, etc.). Please request permission first.
- Attempts to access data that isn't yours.
