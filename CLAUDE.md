# Project Context for AI Assistants

## Purpose
Rails application for real estate listings, blog content, and neighborhood information. Consumes data from panchito API service.

## Current State
Resurrected and modernized (Ruby 3.3 / Rails 8.1). Docker-first workflow operational. CSV-backed data provider active. Issue backlog tracked in GitHub for feature development and test fixes.

## Key Files
- `README.md` - Overview and quick start
- `docker-compose.yml` - PostgreSQL + Rails services
- `app/` - Rails application code
- `.github/workflows/` - CI/CD (test, lint, security)
- GitHub Issues - Feature tracking and bug fixes

## Working With This Repo

**Local development:**
```bash
# Start services
docker compose up -d

# Database setup
docker compose exec web bin/rails db:prepare
docker compose exec web bin/rails db:seed

# Rails console
docker compose exec web bin/rails c

# Run tests
docker compose exec web bin/rails test

# Code quality
docker compose exec web bundle exec rubocop
docker compose exec web bundle exec brakeman
```

**Data providers:**
- CSV ingestion (current default for local/dev)
- Legacy RETS (disabled by default, requires credentials)
- Future: panchito API integration

## Architecture

**Rails 8.1 Stack:**
- Ruby 3.3
- PostgreSQL database
- Active Storage (S3-backed in production)
- Propshaft for assets (no Webpack)
- dartsass-rails for CSS

**Key Models:**
- `Listing` - Real estate properties
- `Post` - Blog entries with PgSearch
- `Entry` - RSS feed content

**Pages:**
- Listings homepage (recent listings)
- Property detail pages
- Blog/entries feed

## Related Repos
- **zavestudios** - Parent documentation hub
- **platform-pipelines** - CI/CD workflows (Rails test/lint, security)
- **panchito** - Data provider service (future integration)
- **pg-multitenant** - Target database platform

## CI/CD
GitHub Actions workflows:
- `test.yml` - RSpec/Minitest with PostgreSQL
- `lint.yml` - RuboCop + Brakeman + bundler-audit
- `security.yml` - gitleaks secret scanning
- `runner-sanity.yml` - Sanity checks for GitHub-hosted runners

**Known Issues:**
- Test failures are currently non-blocking to allow development

---

## Maintaining This File

**When to update:**
- Major Rails version upgrades
- Data provider changes (panchito integration)
- Test suite fixed (update Known Issues)
- New major features (update Architecture)
- Database migration to pg-multitenant (update Related Repos)

**What NOT to include:**
- Detailed model documentation (self-documenting in app/models/)
- Feature specifications (belongs in GitHub Issues)
- Development debugging notes (ephemeral)
- Configuration details (belongs in README.md)

**Keep it under 100 lines total.**
