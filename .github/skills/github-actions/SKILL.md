---
name: github-actions
description: Створення .github/workflows/ci.yml з matrix Windows/Linux/macOS, що лише викликає ci.sh / ci.bat і зберігає виконуваний файл як артефакт. Використовувати в команді create-actions.
---
# Skill: github-actions

## Коли застосовувати
Коли існують `ci.sh` і `ci.bat`, а CI workflow ще немає або він неповний (команда `create-actions`).

## Вхідні дані
- наявні `ci.sh`, `ci.bat`;
- цільові гілки: `develop`, `master`, `main`;
- назва виконуваного файлу: `hello`.

## Приклад входу
```
scripts: ci.sh, ci.bat
branches: develop, master, main
bin: hello
```

## Кроки
Створити `.github/workflows/ci.yml`, який містить:
1. Тригери `push` (develop, master, main, feature/**) і `pull_request` (develop, master, main).
2. Одну job `build` зі `strategy.matrix.os: [ubuntu-latest, windows-latest, macos-latest]`.
3. Крок `actions/checkout@v4`.
4. Windows: `call ci.bat` (`shell: cmd`).
5. Linux/macOS: `bash ./ci.sh`.
6. `actions/upload-artifact@v4` з `target/debug/hello` і `target/debug/hello.exe`, назва `hello-${{ matrix.os }}`.
Workflow не повинен сам викликати `cargo` — тільки CI-скрипти. Секрети не використовуються.

## Очікуваний результат
`.github/workflows/ci.yml`.

## Як перевірити
- YAML коректний (наприклад, `python -c "import yaml; yaml.safe_load(open('.github/workflows/ci.yml'))"`).
- У matrix є всі три ОС, є кроки checkout, запуску скриптів і upload-artifact.
- Після push у вкладці Actions три job мають статус Success, а в розділі Artifacts є три архіви.

## Типовий сценарій помилки
Job на Windows падає з «ci.bat is not recognized» — крок запущено не з кореня репозиторію або в іншій оболонці. Дія: використати `shell: cmd` і `call ci.bat`. Якщо артефакт не знайдено (`if-no-files-found: error`) — перевірити `[[bin]] name = "hello"` у `Cargo.toml`.
