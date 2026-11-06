---
description: Створює базовий Rust Hello World проєкт (skill project-scaffold)
agent: Build Engineer
---
# Передумови
`git-init` виконано успішно: є Git-репозиторій і `.gitignore` з `target/`.

# Дії
Застосуй skill `.github/skills/project-scaffold/SKILL.md` з входом `language: rust`, `project_name: hello_world`, `bin_name: hello`.
Наявні файли, що вже відповідають вимогам, не змінюй.

# Очікувані файли
`Cargo.toml`, `src/main.rs`, `README.md` (розділ запуску).

# Команди перевірки
- `cargo check`
- `cargo run` → `Hello, world!`

# Повідомлення про помилку
`FAIL create-project: <вивід cargo>`. Далі не продовжуй.
