@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo YALBENA - Web preview
where py >nul 2>nul
if %errorlevel%==0 (
  start "YALBENA Preview" http://127.0.0.1:8765/index.html
  py -m http.server 8765 --bind 127.0.0.1 --directory web-preview
  goto :eof
)
where python >nul 2>nul
if %errorlevel%==0 (
  start "YALBENA Preview" http://127.0.0.1:8765/index.html
  python -m http.server 8765 --bind 127.0.0.1 --directory web-preview
  goto :eof
)
echo Python was not found. Install Python 3, then run this file again.
pause
