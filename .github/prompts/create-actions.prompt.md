---
description: Створює GitHub Actions workflow (skill github-actions)
agent: Build Engineer
---
# Передумови
Існують `ci.sh` і `ci.bat`, локальний запуск скрипта успішний.

# Дії
Застосуй skill `.github/skills/github-actions/SKILL.md` і створи `.github/workflows/ci.yml`.
Якщо файл уже існує — порівняй з вимогами skill і доповни лише відсутні частини (без дублювання job або кроків).

# Очікувані файли
`.github/workflows/ci.yml`.

# Команди перевірки
- `python -c "import yaml; yaml.safe_load(open('.github/workflows/ci.yml'))"` (або перевірка YAML вручну);
- у файлі є `ubuntu-latest`, `windows-latest`, `macos-latest`, `ci.bat`, `ci.sh`, `upload-artifact`.

# Повідомлення про помилку
`FAIL create-actions: <що відсутнє або некоректне в ci.yml>`. Далі не продовжуй.
