# Інструкція з використання

## Передумови
- VS Code + розширення GitHub Copilot (студентський план), вхід у свій GitHub-акаунт.
- Rust (rustup, cargo): `cargo --version` має працювати в терміналі VS Code.
- Git.

## Запуск агента
```bash
git clone https://github.com/HrunykVladyslav/409CSAD4.git
cd 409CSAD4
git checkout develop
git checkout -b feature/hello-world
code .
```
У Copilot Chat: оберіть агента **Build Engineer** і виконайте:
```
/init-project
```
Якщо Copilot не підхоплює команду — прикріпіть файл явно: `#init.prompt.md`.

Окремі команди: `/git-init`, `/create-project`, `/create-build`, `/create-actions`, `/check`.

## Локальна перевірка
Windows (PowerShell / cmd):
```
.\ci.bat
target\debug\hello.exe
```
Linux / macOS:
```bash
bash ./ci.sh
./target/debug/hello
```
Лише тести: `cargo test`. Перевірка, що `target/` не в Git: `git ls-files target` (має бути порожньо).

## Перевірка реакції на зламаний тест
1. У `src/math.rs` тимчасово змініть `assert_eq!(add(2, 2), 4)` на `assert_eq!(add(2, 2), 5)`.
2. Виконайте `/check` — очікується `FAIL` для `cargo test`, а `.\ci.bat` / `ci.sh` завершується з ненульовим кодом.
3. Поверніть `4` і переконайтеся, що `/check` дає `PASS`.

## GitHub Actions
Workflow `.github/workflows/ci.yml` запускається при push у `develop`, `master`, `main`, `feature/**` і при pull request у `develop`, `master`, `main`. Результати: вкладка **Actions**; виконувані файли — у розділі **Artifacts** (`hello-ubuntu-latest`, `hello-windows-latest`, `hello-macos-latest`).
