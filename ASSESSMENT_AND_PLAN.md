# TheHouseGuy Repo Assessment & Resurrection Plan

## Repo assessment
- The app is Rails 5.2.1 (from `Gemfile.lock`) but Docker is pinned to Ruby 3.2.2 (`Dockerfile`), which will likely not boot cleanly; Rails 5.2 is not compatible with Ruby 3.2.
- Docker startup is broken: `Dockerfile` points to `./bin/docker-entrypoint.sh`, but that file doesn’t exist (`bin/` has no entrypoint). `docker-compose.yml` will fail on boot.
- Database config is mismatched for Docker: `config/database.yml` hard-codes username `xlopez` with no password, but `docker-compose.yml` uses `POSTGRES_PASSWORD=changeme` and expects `PGUSER=postgres` from `.env`.
- Secrets are committed in plaintext in `config/secrets.yml` and `config/storage.yml` (RETS creds + S3 keys). These must be rotated and removed from git history before any public or shared use.
- There is no data ingestion pipeline yet—RETS is called live in controller/service (`app/services/rets_web_service.rb`, `app/controllers/properties_controller.rb`) and only populates views, not DB tables.
- The data model is currently blog/RSS-focused (`posts`, `feeds`, `entries`, `users`), but there’s no `properties` table at all (`db/schema.rb`), so the MLS data isn’t stored.
- The UI is already wired to display property details and images, but it depends entirely on the live RETS response.

## Resurrection plan

### Phase 0 — Safety & reproducible boot (1–2 sessions)
- Remove committed secrets and rotate keys immediately (`config/secrets.yml`, `config/storage.yml`). Move to ENV or encrypted credentials. Decide whether to purge git history or keep a private fork.
- Fix Docker boot: add a real entrypoint or remove the entrypoint line in `Dockerfile`. Align `config/database.yml` with `PG*` env vars used by Docker.
- Decide on Ruby/Rails path:
  1) Short-term: downgrade Ruby to a 2.6/2.7-compatible version to boot Rails 5.2 quickly, or
  2) Long-term: upgrade Rails to 6.1/7.1 and keep Ruby 3.2.

### Phase 1 — Provider abstraction + offline data (MHV)
- Create a provider interface for “listings” and implement a dataset provider (CSV/Parquet) to avoid CRMLS cost.
- Add a minimal `Listing` model/table and store only fields needed for the homepage + show page.
- Replace live RETS calls in controllers with DB-backed queries.
- Add a rake task or job for ingestion with idempotency and basic logging.

### Phase 2 — Platform contracts
- Add health checks and basic observability (structured logs, error reporting).
- Define config/secrets in a single place (Rails credentials or ENV), document deploy steps.
- Make ingestion scheduled (cron/ActiveJob/Sidekiq—your call).

### Phase 3 — Optional: Mock MLS or real API
- Build a mock MLS API if you want to prove vendor-agnostic ingestion.
- Later, swap in CRMLS provider without touching controllers/UI.
