# TheHouseGuy

TheHouseGuy is a Rails app for showcasing listings, blog content, and neighborhood highlights.
It is currently being resurrected and modernized (Ruby 3.3 / Rails 8.1) with a Docker-first
workflow and a provider abstraction for real-estate data sources.

## TL;DR

- Run locally with Docker and a Postgres container
- Default data source is a CSV-backed seed/ingestion flow
- Legacy RETS integration is disabled by default
- CI checks: RuboCop, Brakeman, bundler-audit, tests

## Quick Start (Docker)

```sh
docker compose build
docker compose up -d

docker compose exec web bin/rails db:prepare
docker compose exec web bin/rails db:seed
```

Then visit: `http://localhost:3000`

## App Overview

Primary surfaces:

- Listings homepage (recent listings)
- Properties detail page
- Blog/entries (RSS feed content)

Data providers:

- CSV ingestion (current default, used for local/dev)
- Legacy RETS (disabled by default; requires valid credentials)

## Environment

Key env vars (see `.env.example`):

- `DATABASE_URL` or `POSTGRES_*` vars
- `USE_RETS` (default `false`)
- Optional data-provider keys (RETS/MLS)

## Data / Ingestion

Current local flow:

1) CSV dataset under `data/`
2) Ingestion task loads into `listings` table
3) Listings render on homepage and property views

Rake tasks:

```sh
docker compose exec web bin/rails -T
```

## Development

```sh
docker compose exec web bin/rails s
docker compose exec web bin/rails c
```

Assets:

- CSS built via `dartsass-rails`
- JS via Propshaft (no Webpack)

## Tests

```sh
docker compose exec web bin/rails test
docker compose exec web bin/rails test:system
```

If tests fail in CI, see Phase 0 test issues (Phase 0 milestone).

## Linting & Security

```sh
docker compose exec web bundle exec rubocop
docker compose exec web bundle exec brakeman
docker compose exec web bundle exec bundler-audit check
```

## Project Roadmap

Current plan is tracked via GitHub milestones:

- Phase 0: Safety & reproducible boot
- Phase 1: Provider abstraction + offline data
- Phase 2: Platform contracts
- Phase 3: Optional mock MLS or real API

## Contributing

1) Create a feature branch
2) Run lint + tests
3) Open a PR (CI required before merge)

## License

Proprietary (not open source at this time).
