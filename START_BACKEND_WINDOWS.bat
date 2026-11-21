@echo off
chcp 65001 >nul
cd /d "%~dp0backend"
echo YALBENA API - setup checks
where node >nul 2>nul || (echo Node.js 20+ is required.& pause& exit /b 1)
where npm >nul 2>nul || (echo npm is required.& pause& exit /b 1)
if not exist .env (
  copy .env.example .env >nul
  echo Created backend\.env. Edit DATABASE_URL and set a strong unique JWT_ACCESS_SECRET before continuing.
  notepad .env
  pause
)
if not exist node_modules (
  echo Installing API dependencies...
  call npm install || (echo Dependency installation failed.& pause& exit /b 1)
)
echo Checking release source...
call npm run verify:release || (pause& exit /b 1)
echo Checking database migration plan (does not connect to PostgreSQL)...
call npm run migrate:plan || (pause& exit /b 1)
echo To actually start the API, first configure a real PostgreSQL database and DATABASE_URL.
echo Then run: npm run migrate:database ^&^& npm run verify:database ^&^& npm run build ^&^& npm start
pause
