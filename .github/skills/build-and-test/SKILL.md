---
name: build-and-test
description: Додавання тестової функції add, юніт-тесту basic_addition і локальних скриптів складання ci.sh / ci.bat. Використовувати в команді create-build.
---
# Skill: build-and-test

## Коли застосовувати
Коли базовий Rust-проєкт уже створено, а тестів або скриптів складання ще немає (команда `create-build`).

## Вхідні дані
Наявні `Cargo.toml` і `src/main.rs`.

## Приклад входу
```
Cargo.toml (package hello_world, bin hello)
src/main.rs з fn main()
```

## Кроки
1. Створити модуль `src/math.rs` з функцією `pub fn add(left: i32, right: i32) -> i32`.
2. У тому ж файлі додати `#[cfg(test)] mod tests` з тестом `basic_addition`: `assert_eq!(add(2, 2), 4)`.
3. Підключити модуль у `src/main.rs` (`mod math;`) і використати `add` у `main` (щоб не було попередження `dead_code`).
4. Створити `ci.sh` (Linux/macOS): `set -euo pipefail`, `cargo build`, `cargo test`, запуск `./target/debug/hello`.
5. Створити `ci.bat` (Windows): `cargo build`, `cargo test`, запуск `target\debug\hello.exe`, після кожної команди `if errorlevel 1 exit /b %errorlevel%`.

## Очікуваний результат
`src/math.rs` з тестом, оновлений `src/main.rs`, `ci.sh`, `ci.bat`.

## Як перевірити
- `cargo test` → `test math::tests::basic_addition ... ok`, `1 passed; 0 failed`.
- `bash ./ci.sh` або `ci.bat` завершується з кодом 0 і виводить `CI: PASS`.
- Існує `target/debug/hello` (`hello.exe` на Windows).

## Типовий сценарій помилки
Тест падає (`assertion left == right failed`): не змінювати тест, щоб він «пройшов», а зупинитися і вивести причину. Скрипт має повернути ненульовий код виходу.
