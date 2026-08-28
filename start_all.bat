@echo off
REM ============================================
REM Запуск всех Photon инстансов как приложений
REM Запускать от имени Администратора!
REM ============================================

SET mypath=%~dp0
CD %mypath%

REM Убиваем старые процессы если есть
taskkill /F /IM PhotonSocketServer.exe >nul 2>&1
timeout /t 2 /nobreak >nul

echo.
echo ========================================
echo Запуск 10 инстансов LoadBalancing + WOEServer
echo ========================================
echo.

start "LB1"  PhotonSocketServer.exe /run LoadBalancing1
timeout /t 1 /nobreak >nul
start "LB2"  PhotonSocketServer.exe /run LoadBalancing2
timeout /t 1 /nobreak >nul
start "LB3"  PhotonSocketServer.exe /run LoadBalancing3
timeout /t 1 /nobreak >nul
start "LB4"  PhotonSocketServer.exe /run LoadBalancing4
timeout /t 1 /nobreak >nul
start "LB5"  PhotonSocketServer.exe /run LoadBalancing5
timeout /t 1 /nobreak >nul
start "LB6"  PhotonSocketServer.exe /run LoadBalancing6
timeout /t 1 /nobreak >nul
start "LB7"  PhotonSocketServer.exe /run LoadBalancing7
timeout /t 1 /nobreak >nul
start "LB8"  PhotonSocketServer.exe /run LoadBalancing8
timeout /t 1 /nobreak >nul
start "LB9"  PhotonSocketServer.exe /run LoadBalancing9
timeout /t 1 /nobreak >nul
start "LB10" PhotonSocketServer.exe /run LoadBalancing10
timeout /t 1 /nobreak >nul
start "WOE"  PhotonSocketServer.exe /run WOEServer
timeout /t 3 /nobreak >nul

echo.
echo ========================================
echo Проверка процессов:
echo ========================================
tasklist | findstr "PhotonSocketServer"

echo.
echo ========================================
echo Проверка портов:
echo ========================================
netstat -an | findstr "LISTENING" | findstr " 505"

echo.
echo Готово! 200 CCU активно.
echo Логи: %mypath%log\
echo.
pause
