# Лабораторна робота №1: AI-агент для автоматизації розробки (Rust)

**Виконав:** Груник Владислав Романович, група КІ-409
**Варіант:** 4 — Rust / Cargo / cargo test

## Опис проєкту
Репозиторій містить AI-агента **Build Engineer** (GitHub Copilot, VS Code), який генерує кросплатформний Rust-проєкт Hello World, налаштовує складання через Cargo, юніт-тест (`cargo test`), локальні скрипти `ci.sh` / `ci.bat` і GitHub Actions для Windows, Linux та macOS.

- `develop` — лише агент (manifest, skills, commands) та документація.
- `feature/hello-world` — результат запуску агента: код, тести, скрипти, CI.

## Запуск агента
1. Створіть гілку від `develop`: `git checkout develop && git checkout -b feature/hello-world`.
2. Відкрийте теку в VS Code, увійдіть у GitHub Copilot, відкрийте Copilot Chat.
3. Оберіть агента **Build Engineer** і виконайте `/init-project` (або прикріпіть `#init.prompt.md`).
4. Окремі кроки: `/git-init`, `/create-project`, `/create-build`, `/create-actions`, `/check`.

## Складання та запуск проєкту
| ОС | Повна перевірка | Запуск програми |
|----|-----------------|-----------------|
| Windows | `.\ci.bat` | `target\debug\hello.exe` або `cargo run` |
| Linux / macOS | `bash ./ci.sh` | `./target/debug/hello` або `cargo run` |

Очікуваний вивід програми:
```
Hello, world!
2 + 2 = 4
```

## Документація
- [docs/architecture.md](docs/architecture.md) — архітектура агента
- [docs/usage.md](docs/usage.md) — точні команди запуску та перевірки
- [docs/ai-log.md](docs/ai-log.md) — журнал взаємодії з AI
