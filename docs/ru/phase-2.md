# Phase 2: Database Schema & gRPC/Kafka Contracts

## 2.1. Git & GitHub Setup
- [x] Создать новую задачу (Issue) на GitHub: `Phase 2: DB Schema and gRPC/Kafka Contracts`.
- [x] Переключиться локально на ветку `main`, убедиться, что она обновлена.
- [x] Создать новую рабочую ветку: `git checkout -b feat/contracts-and-schema`.

## 2.2. Database Schema (PostgreSQL Migrations)
- [x] Создать директорию `migrations/` в корне проекта для хранения SQL-файлов миграций.
- [x] Спроектировать таблицу `vacancies` для хранения вакансий. Необходимые поля:
    - `id` (уникальный идентификатор, `SERIAL`)
    - `title` (название вакансии, `VARCHAR`)
    - `city` (город, `VARCHAR`)
    - company (компания, `VARCHAR`)
    - `url` (ссылка на вакансию, `TEXT`,  `UNIQUE`)
    - `direction` (категория/направление, `VARCHAR`)
    - `created_at` (время добавления в БД, `TIMESTAMP`)
- [x] Написать два SQL-файла миграции:
    - `000001_init_schema.up.sql` — создание таблицы и индексов.
    - `000001_init_schema.down.sql` — откат изменений.

## 2.3. gRPC Contract Design (Protocol Buffers)
- [x] Создать общую директорию `proto/` в корне проекта.
- [ ] Написать файл `proto/parser.proto`, описывающий gRPC-сервис `VacancyParser`:
    - Определить RPC-метод `StartParsing` (запуск парсинга).
    - Определить входные параметры `ParseRequest`.
    - Определить ответ `ParseResponse` (статус запуска, количество обработанных вакансий или сообщение об ошибке).

## 2.4. Arch Linux Dependencies & Protobuf Compilation
- [x] Установить системный компилятор `protoc` на Arch Linux: `sudo pacman -S protobuf`.
- [ ] Подготовить окружение для генерации кода (установка плагинов генерации кода для Go и Python).
- [ ] Написать скрипт/команду для компиляции `.proto` файла:
    - Сгенерировать Go-код (клиентские файлы gRPC).
    - Сгенерировать Python-код (серверные файлы gRPC).

## 2.5. Kafka Message Format (JSON Schema)
- [ ] Спроектировать структуру сообщения, которую Python-парсер будет отправлять в Kafka.
- [ ] Задокументировать формат JSON-сообщения.
