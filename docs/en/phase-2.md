# Phase 2: Database Schema & gRPC/Kafka Contracts

## 2.1. Git & GitHub Setup
- [x] Create a new Issue on GitHub: `Phase 2: DB Schema and gRPC/Kafka Contracts`.
- [x] Switch locally to the `main` branch, make sure it is updated.
- [x] Create a new working branch: `git checkout -b feat/contracts-and-schema`.

## 2.2. Database Schema (PostgreSQL Migrations)
- [x] Create the `migrations/` directory in the root of the project to store SQL migration files.
- [x] Design a `vacancies` table to store vacancies. Required fields:
    - `id` (unique identifier, `SERIAL`)
	- `title` (job title, `VARCHAR`)
	- `city` (city, `VARCHAR`)
	- company (company, `VARCHAR`)
	- `url` (link to job, `TEXT`, `UNIQUE`)
	- `direction` (category/direction, `VARCHAR`)
	- `created_at` (time of addition to the database, `TIMESTAMP`)
- [x] Write two SQL migration files:
	- `000001_init_schema.up.sql` — create a table and indexes.
    - `000001_init_schema.down.sql` — rollback of changes.

## 2.3. gRPC Contract Design (Protocol Buffers)
- [x] Create a shared directory `proto/` in the root of the project.
- [x] Write a file `proto/parser.proto` describing the gRPC service `VacancyParser`:
    - Define the `StartParsing` RPC method.
    - Define the input parameters of the `ParseRequest`.
    - Determine the `parseResponse` response (launch status, number of vacancies processed, or error message).

## 2.4. Arch Linux Dependencies & Protobuf Compilation
- [x] Install the system compiler `protocol` on Arch Linux: `sudo pacman -S protobuf`.
- [x] Prepare the environment for code generation (installing code generation plugins for Go).
- [x] Write a script/command to compile a `.proto` file:
	- Generate Go code (gRPC client files).


## 2.5. Kafka Message Format (JSON Schema)
- [ ] Design the message structure that the Python parser will send to Kafka.
- [ ] Document the format of the JSON message.

--- 

## Technical Specification

### Database Schema
The `vacancies` table is initialized via SQL migrations located in the `/migrations` folder.

### Kafka Message Format
The Python-based scraper publishes scraped vacancies to the `vacancies-raw` topic as JSON messages with the following schema:

#### Example:
```json
{
  "title": "Junior Go Developer",
  "company": "VK",
  "city": "Moscow",
  "url": "https://education.vk.company/vacancy/123",
  "direction": "backend-разработка",
  "scraped_at": "2024-03-07T15:30:00Z"
}
```

#### Fields Description:
* `title` (string, required): Title of the vacancy.
* `company` (string, required): Employer company name.
* `city` (string, required): Job location city.
* `url` (string, required, unique): Unique vacancy URL.
* `direction` (string, required): Vacancy direction.
* `scraped_at` (string, required): Scrape timestamp in ISO 8601 UTC format.
