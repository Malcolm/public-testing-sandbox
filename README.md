# public-testing-sandbox

Throwaway rehearsal bench for GitHub approval features (CODEOWNERS enforcement, required reviewers,
environment protection, bot-opened bump PRs). **Dummy content only.** Nothing here deploys anything:
the "deploy" jobs only print the pinned digest. No cloud credentials, no cloud trust.

| Path | What |
|---|---|
| `envs/<env>.yaml` | Dummy pinned image digest per environment |
| `.github/CODEOWNERS` | Every path owned by the repo owner |
| `.github/workflows/validate.yml` | PR / push check: env files are well-formed |
| `.github/workflows/bump.yml` | Opens a "bump" PR changing `envs/dev.yaml` with `GITHUB_TOKEN` |
| `.github/workflows/deploy.yml` | On push to `main`: `dev` then `prod` environment jobs (print only) |
| `.github/workflows/relay.yml` | Dispatches `deploy.yml` with `GITHUB_TOKEN` (who is the triggering actor?) |
| `.github/workflows/bot-approve.yml` | Submits an approval with `GITHUB_TOKEN` (does a bot approval count?) |
| `.github/workflows/oidc-probe.yml` | Job in an environment; prints only the OIDC `sub` claim (audience is not a cloud) |
