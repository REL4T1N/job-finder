# Job Finder: VK Education Parser & Notifier

[![Language: RU|88](https://img.shields.io/badge/Language-RU-blue.svg)](README.ru.md)
[![Language: EN|88](https://img.shields.io/badge/Language-EN-green.svg)](README.md)

An automated event-driven system designed to track junior and internship backend vacancies on the **VK Education** portal and send real-time notifications to Telegram.

## 🛠 Tech Stack
* **Go** (Processing service, Telegram Bot)
* **Python** (Scraper service with Playwright)
* **Apache Kafka / Redpanda** (Message broker)
* **PostgreSQL** (Relational database)
* **gRPC** (Inter-service communication)
* **Docker & Docker Compose** (Containerization)

## 📐 Architecture Overview
The system is built with a microservice architecture in mind:
1. **Parser (Python):** Collects vacancies from the website via Playwright and streams them to Kafka.
2. **Processor (Go):** Consumes vacancies, deduplicates them, normalizes data, and saves them to PostgreSQL.
3. **Telegram Bot (Go):** Sends notifications about new vacancies to the user and handles interactive commands like `/parse_vacancy` via gRPC.

## 📂 Project Structure & Roadmap
Detailed documentation for each development phase:

* **Phase 1: Infrastructure & Base Setup** — [RU Docs](docs/ru/phase-1.md) | [EN Docs](docs/en/phase-1.md)