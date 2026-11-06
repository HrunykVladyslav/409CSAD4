---
description: Перевіряє проєкт без внесення змін (лише читання) і виводить PASS/FAIL
agent: Build Engineer
---
# Передумови
Попередні кроки виконано. **Нічого не створюй, не змінюй і не виправляй — лише перевіряй.**

# Перевірки
1. Маніфест `.github/agents/build-engineer.agent.md` існує і містить розділи «Роль», «Безпека та заборонені дії», «Критерії завершення».
2. Існують 3 skills (`project-scaffold`, `build-and-test`, `github-actions`); кожен має розділи «Вхідні дані», «Очікуваний результат», «Як перевірити».
3. Існують 6 prompts: `git-init`, `create-project`, `create-build`, `create-actions`, `check`, `init`.
4. `init.prompt.md` викликає команди в порядку git-init → create-project → create-build → create-actions → check.
5. Існують `Cargo.toml`, `src/main.rs`, `src/math.rs`, `ci.sh`, `ci.bat`.
6. `.gitignore` містить `target/`, а `git ls-files target` порожній.
7. `cargo build` успішний і існує `target/debug/hello` (`hello.exe` на Windows).
8. `cargo test` успішний, тест `basic_addition` має статус `ok`.
9. `.github/workflows/ci.yml` — коректний YAML, одна job, matrix з трьома ОС, викликає `ci.bat`/`ci.sh`, має `upload-artifact`.
10. У репозиторії немає секретів (`git ls-files` не містить `.env`, `*.pem`, `*.key`).

# Очікуваний результат
Таблиця: Перевірка | Статус (`PASS`/`FAIL`) | Результат. Останній рядок — `Загальний статус: PASS` лише якщо всі пункти PASS, інакше `FAIL`. Наприкінці — «Проєкт не змінювався».

# Повідомлення про помилку
Для кожного FAIL вкажи причину (наприклад, «тест basic_addition: очікується 5, фактично 4»). Код не виправляй.
