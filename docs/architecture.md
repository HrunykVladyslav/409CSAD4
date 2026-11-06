# Архітектура AI-агента (Rust Build Engineer)

## Проблема
Автоматизація створення базового кросплатформного Rust-проєкту: структура Cargo, юніт-тест (`cargo test`), локальні скрипти складання та CI у GitHub Actions — без ручного написання цих файлів.

## Відповідність файлів ролям
Використовується GitHub Copilot у VS Code, тому формат файлів — `.agent.md`, `SKILL.md`, `.prompt.md`.

| Роль | Файл |
|------|------|
| Agent manifest | `.github/agents/build-engineer.agent.md` |
| Skill: створення проєкту | `.github/skills/project-scaffold/SKILL.md` |
| Skill: складання і тести | `.github/skills/build-and-test/SKILL.md` |
| Skill: GitHub Actions | `.github/skills/github-actions/SKILL.md` |
| Command | `.github/prompts/git-init.prompt.md` |
| Command | `.github/prompts/create-project.prompt.md` |
| Command | `.github/prompts/create-build.prompt.md` |
| Command | `.github/prompts/create-actions.prompt.md` |
| Command (лише читання) | `.github/prompts/check.prompt.md` |
| Orchestrator | `.github/prompts/init.prompt.md` |
| Система складання | `Cargo.toml` (замість `CMakeLists.txt` з методички) |
| Скрипти складання | `ci.sh`, `ci.bat` |
| CI workflow | `.github/workflows/ci.yml` |

## Skills
1. **project-scaffold** — `Cargo.toml` (bin `hello`), `src/main.rs`, `.gitignore` з `target/`, розділ запуску в `README.md`.
2. **build-and-test** — `src/math.rs` з функцією `add` і тестом `basic_addition`, скрипти `ci.sh` / `ci.bat` (`cargo build`, `cargo test`, запуск `hello`).
3. **github-actions** — `.github/workflows/ci.yml`: одна job, matrix з трьох ОС, виклик лише CI-скриптів, завантаження артефакту `hello`.

## Commands
| Команда | Skill | Вхід (передумова) | Вихід |
|---------|-------|-------------------|-------|
| `/git-init` | — | Git-репозиторій | `.gitignore` з `target/`, стан Git |
| `/create-project` | project-scaffold | `.gitignore` | `Cargo.toml`, `src/main.rs` |
| `/create-build` | build-and-test | `Cargo.toml` | `src/math.rs`, `ci.sh`, `ci.bat` |
| `/create-actions` | github-actions | `ci.sh`, `ci.bat` | `.github/workflows/ci.yml` |
| `/check` | — | усі файли | звіт PASS/FAIL (без змін) |
| `/init` | усі | корінь репозиторію | послідовний запуск 5 команд |

## Передача даних між етапами
Через файлову систему: кожна команда перевіряє наявність результатів попередньої (наприклад, `/create-actions` очікує `ci.sh` і `ci.bat`).

## Обробка помилок
Після кожного кроку оркестратор виконує «Команди перевірки» цього кроку. При першій помилці виводиться `INIT FAIL на кроці <назва>: <причина>` і наступні кроки не виконуються. `/init` повертає `INIT PASS` лише якщо `/check` дав `Загальний статус: PASS`.

## Ідемпотентність
Команди не перезаписують файли, що вже відповідають вимогам, і не дублюють рядки `.gitignore`, тести чи кроки CI. Повторний `/init` на готовому проєкті не змінює файли.
