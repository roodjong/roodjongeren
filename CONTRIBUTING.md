# Contributing to roodjongeren.nl

Thanks for helping out. This guide is short on purpose; the goal is to get
you to a green PR without a lot of friction.

## Setup

See [`README.md`](./README.md) for the full local-development setup. The
short version:

```bash
# Start the supporting services (Postgres, Nginx, Mailcatcher)
docker compose -f docker/roodjongeren_dev/docker-compose.yml up -d

# Backend
cd backend
yarn install
yarn dev   # http://localhost:1337

# Frontend (separate terminal)
cd frontend
yarn install
yarn dev   # http://localhost:3000
```

If port 80 (Nginx) is already taken on your machine, override the host port:

```bash
NGINX_HOST_PORT=8081 docker compose ...
```

The same pattern works for `POSTGRES_HOST_PORT`, `MAILCATCHER_SMTP_HOST_PORT`,
`MAILCATCHER_WEB_HOST_PORT`. Make sure `DATABASE_PORT` in `backend/.env`
matches whatever you set for Postgres.

## Tooling

- Node and yarn versions are pinned in `.tool-versions`. Use `mise` or
  `asdf` to keep them straight, or just match them manually.
- Yarn 1 across the monorepo. Don't let corepack pull in yarn 4 by accident.
- Prettier formats. Run `yarn lint:prettier` at the repo root before opening
  a PR.
- TypeScript on the frontend (`cd frontend && yarn ts-lint`).
- ESLint on the frontend (`cd frontend && yarn lint`).
- Backend test runner is built-in `node:test`. Run `yarn test` from
  `backend/`.

## Branches and commits

- Branch off `main`. Name branches with a prefix like `feat/`, `fix/`,
  `chore/`, `ci/`, `refactor/`. Keep them short.
- Commit messages follow Conventional Commits loosely:
  `type(scope): short summary`. Body explains the why, not the what.
- PRs are squash-merged. Keep your commit history readable, but don't sweat
  it; the squash commit message is what ends up on `main`.

## Pull requests

The repo has a PR template. Fill in:

1. **What** changed (1-3 sentences).
2. **Why** (the motivation, linked issue).
3. **Test plan** (how you verified it, manual or automated).
4. **Rollback** plan (often just "revert this commit").
5. **Related** issues or PRs.

Keep PRs small. If you can't describe the change in one or two sentences,
split it.

## Code review

- Tag a code owner (`.github/CODEOWNERS`) plus anyone with relevant context.
- Reviewers focus on: correctness, security, accessibility, and whether the
  diff matches the description.
- Don't merge your own PR without at least one approval, even if you have
  the permissions.

## Security

See [`SECURITY.md`](./SECURITY.md) for how to report vulnerabilities. Don't
open public issues for security problems.

## Accessibility

- Set `lang` on every page (Dutch by default; English when `next-intl` lands).
- All interactive elements must be keyboard-operable (`<button>`, not
  `<div onClick>`).
- Images need meaningful `alt` text; decorative images get `alt=""`.
- Form fields need associated labels (`htmlFor` matching `id`).
- Targets WCAG 2.2 AA. When in doubt, run `axe` against your change.

## Questions

Open a discussion or ping the codeowners on Slack. We're friendly.
