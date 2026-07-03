# Phase 1: Infrastructure and Standards Setup

## 1.1. GitHub & Git Workflow Setup
- [x] Study the basic process of working with the GitHub CLI (authorization, status verification).
- [x] Create the first Issue on GitHub via the web interface or GitHub CLI with a description of the tasks of the first stage.
- [x] Create a working branch for the first stage: `git checkout -b feat/infrastructure-setup'.
- [x] Review the rules of Conventional Commits for future commits.

## 1.2. Documentation Structure
- [x] Create a `docs` directory to store the documentation for the steps.
- [x] Create a subdirectory structure: `docs/ru/` and `docs/en/`.
- [x] Create the start files for Stage 1 (for example, `docs/ru/01-infrastructure.md` and similar in English).
- [x] Write the basic structure in the root `README.md `brief description of the project, stack, links to bilingual documentation).

## 1.3. Linux Environment Setup
- [ ] Check the installation and launch of the Docker service: `sudo systemctl status docker'.
- [ ] Make sure that the current user is added to the `docker` group in order to run commands without `sudo`.
- [ ] Check for the availability of `docker-compose' (or the modern `docker compose` plugin).
- [ ] Install Go (the latest stable version is recommended via `pacman's go`).
- [ ] Install Python and the dependency management tool (recommended by `poetry` via `pacman 's python-poetry` or `pipx install poetry`).

## 1.4. Base Infrastructure (Docker Compose)
- [ ] Create a `docker-compose' file.yml` in the root of the project.
- [ ] Configure the **PostgreSQL** service:
- Use the official image (for example, `postgres:15-alpine`).
    - Configure volume for data persistence (so that data does not disappear when the container is restarted).
- [ ] Configure **Kafka**:
- *Option:* Use the lite version of Redpanda (fully compatible with the Kafka API, but consumes much less memory and runs without Zookeeper) OR the standard Bitnami Kafka image.
- [ ] Configure the UI interface for queue monitoring (for example, 'Kafdrop` or `Redpanda Console`).
- [ ] Launch the infrastructure with the `docker-compose up -d` command and check the functionality via ports in the browser (Kafka UI) and connection to the database.

## 1.5. Environment Variables Configuration
- [ ] Fill the '.env.example` file with base variables:
    - Ports and accesses to PostgreSQL (DB_USER, DB_PASSWORD, DB_NAME, DB_PORT).
    - The address of the Kafka broker (KAF_KA_BROKERS).
    - A template for the Telegram bot token.
- [ ] Copy the `.env.example` to the real `.env` (which should be in `.gitignore').