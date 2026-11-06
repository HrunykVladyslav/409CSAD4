---
description: Створює тестову функцію, юніт-тест і скрипти складання (skill build-and-test)
agent: Build Engineer
---
# Передумови
Існують `Cargo.toml` і `src/main.rs`, `cargo check` проходить.

# Дії
Застосуй skill `.github/skills/build-and-test/SKILL.md`: модуль `src/math.rs` з `add` і тестом `basic_addition`, скрипти `ci.sh` та `ci.bat`.
Якщо тест `basic_addition` уже існує — не створюй дубль.

# Очікувані файли
`src/math.rs`, `src/main.rs` (з `mod math;`), `ci.sh`, `ci.bat`.

# Команди перевірки
- `cargo test` → `1 passed; 0 failed`
- Windows: `.\ci.bat`; Linux/macOS: `bash ./ci.sh` → `CI: PASS`

# Повідомлення про помилку
`FAIL create-build: <назва тесту / помилка компіляції>`. Тест не змінюй, щоб він «пройшов». Далі не продовжуй.
