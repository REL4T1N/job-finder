# Phase 1: Infrastructure and Standards Setup

## 1.1. GitHub & Git Workflow Setup
- [x] Изучить базовый процесс работы с GitHub CLI (авторизация, проверка статуса).
- [x] Создать первую задачу (Issue) на GitHub через веб-интерфейс или GitHub CLI с описанием задач первого этапа.
- [x] Создать рабочую ветку для первого этапа: `git checkout -b feat/infrastructure-setup`.
- [x] Ознакомиться с правилами Conventional Commits для будущих коммитов.

## 1.2. Documentation Structure
- [x] Создать директорию `docs` для хранения документации по этапам.
- [x] Создать структуру поддиректорий: `docs/ru/` и `docs/en/`.
- [x] Создать стартовые файлы для Этапа 1 
- [x] Написать базовую структуру в корневом `README.md` (краткое описание проекта, стек, ссылки на двуязычную документацию).

## 1.3. Linux Environment Setup
- [ ] Проверить установку и запуск службы Docker: `sudo systemctl status docker`.
- [ ] Убедиться, что текущий пользователь добавлен в группу `docker`, чтобы запускать команды без `sudo`.
- [ ] Проверить наличие `docker-compose` (или современного плагина `docker compose`).
- [ ] Установить Go (рекомендуется последняя стабильная версия через `pacman -S go`).
- [ ] Установить Python и инструмент управления зависимостями (рекомендуется `poetry` через `pacman -S python-poetry` или `pipx install poetry`).

## 1.4. Base Infrastructure (Docker Compose)
- [ ] Создать файл `docker-compose.yml` в корне проекта.
- [ ] Настроить сервис **PostgreSQL**:
    - Использовать официальный образ (например, `postgres:15-alpine`).
    - Настроить volume для персистентности данных (чтобы данные не пропадали при перезапуске контейнера).
- [ ] Настроить **Kafka**:
    - *Вариант:* Использовать облегченную версию Redpanda (полностью совместима с API Kafka, но потребляет гораздо меньше памяти и запускается без Zookeeper) ИЛИ стандартный образ Bitnami Kafka.
- [ ] Настроить UI-интерфейс для мониторинга очередей (например, `Kafdrop` или `Redpanda Console`).
- [ ] Запустить инфраструктуру командой `docker-compose up -d` и проверить работоспособность через порты в браузере (Kafka UI) и подключение к БД.

## 1.5. Environment Variables Configuration
- [ ] Наполнить файл `.env.example` базовыми переменными:
    - Порты и доступы к PostgreSQL (DB_USER, DB_PASSWORD, DB_NAME, DB_PORT).
    - Адрес брокера Kafka (KAFKA_BROKERS).
    - Шаблон для токена Telegram-бота.
- [ ] Скопировать `.env.example` в реальный `.env` (который должен быть в `.gitignore`).