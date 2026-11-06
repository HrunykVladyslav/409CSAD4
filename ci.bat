@echo off
setlocal

echo == cargo build ==
cargo build
if errorlevel 1 exit /b %errorlevel%

echo == cargo test ==
cargo test
if errorlevel 1 exit /b %errorlevel%

echo == run hello ==
target\debug\hello.exe
if errorlevel 1 exit /b %errorlevel%

echo CI: PASS
