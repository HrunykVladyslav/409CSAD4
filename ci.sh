#!/usr/bin/env bash
set -euo pipefail

echo "== cargo build =="
cargo build

echo "== cargo test =="
cargo test

echo "== run hello =="
./target/debug/hello

echo "CI: PASS"
