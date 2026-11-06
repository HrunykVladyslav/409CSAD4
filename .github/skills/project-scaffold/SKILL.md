---
name: project-scaffold
description: Створення мінімального Rust Hello World проєкту (Cargo.toml, src/main.rs, README.md, .gitignore). Використовувати в команді create-project.
---
# Skill: project-scaffold

## Коли застосовувати
Коли в репозиторії ще немає Rust-проєкту або його структура неповна (команда `create-project`).

## Вхідні дані
- `language` — мова проєкту (для варіанта 4: `rust`);
- `project_name` — назва пакета (за замовчуванням `hello_world`);
- `bin_name` — назва виконуваного файлу (за замовчуванням `hello`).

## Приклад входу
```
language: rust
project_name: hello_world
bin_name: hello
```

## Кроки
1. Якщо `Cargo.toml` відсутній — створити його з `[package]` (name, version `0.1.0`, edition `2021`) і секцією `[[bin]]` (`name = "hello"`, `path = "src/main.rs"`).
2. Якщо `src/main.rs` відсутній — створити функцію `main`, що виводить `Hello, world!`.
3. Переконатися, що `.gitignore` містить `target/` (без дублювання рядка).
4. Додати до `README.md` розділ «Локальний запуск» з командою `cargo run`, якщо його ще немає.

## Очікуваний результат
`Cargo.toml`, `src/main.rs`, `.gitignore` з `target/`, `README.md` з командою запуску.

## Як перевірити
- Файли `Cargo.toml` і `src/main.rs` існують.
- `cargo check` завершується з кодом 0.
- `cargo run` виводить `Hello, world!`.

## Типовий сценарій помилки
`cargo check` → «cargo не розпізнано» / «command not found»: Rust не встановлено або не в PATH. Дія: зупинитися, вивести повідомлення «Встановіть Rust через rustup і перезапустіть VS Code», не продовжувати `init`.
