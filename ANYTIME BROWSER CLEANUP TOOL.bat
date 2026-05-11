@echo off
title Anytime Browser Cleanup Tool

echo ====================================================
echo         ANYTIME TELECARE TECH TOOL
echo ====================================================
echo.
echo This tool was provided by Anytime Telecare Tech.
echo Unauthorized modification is not recommended.
echo.
echo ====================================================
echo.
echo This tool clears browser session data, cookies,
echo cache, and local site storage for Chrome and Edge.
echo.
echo Saved passwords and bookmarks will NOT be deleted.
echo.
echo IMPORTANT:
echo - Do NOT run during an active call or encounter
echo - You will need to log in again after cleanup
echo.
pause

echo.
echo Checking browsers...

:: ----- CHROME CHECK -----
tasklist | find /i "chrome.exe" >nul
if %errorlevel%==0 (
    echo.
    echo Chrome processes are still running.
    echo.
    choice /c YN /m "Force close Chrome now?"

    if errorlevel 2 exit
    if errorlevel 1 taskkill /F /IM chrome.exe /T
)

:: ----- EDGE CHECK -----
tasklist | find /i "msedge.exe" >nul
if %errorlevel%==0 (
    echo.
    echo Edge processes are still running.
    echo.
    choice /c YN /m "Force close Edge now?"

    if errorlevel 2 exit
    if errorlevel 1 taskkill /F /IM msedge.exe /T
)

echo.
echo Cleaning Chrome profiles...

for /d %%p in ("%LOCALAPPDATA%\Google\Chrome\User Data\*") do (
    rmdir /s /q "%%p\Cache" 2>nul
    rmdir /s /q "%%p\Code Cache" 2>nul
    rmdir /s /q "%%p\GPUCache" 2>nul
    rmdir /s /q "%%p\Local Storage" 2>nul
    rmdir /s /q "%%p\Session Storage" 2>nul
    rmdir /s /q "%%p\IndexedDB" 2>nul
    rmdir /s /q "%%p\Service Worker" 2>nul
    del /f /q "%%p\Cookies" 2>nul
    del /f /q "%%p\Network\Cookies" 2>nul
)

echo.
echo Cleaning Edge profiles...

for /d %%p in ("%LOCALAPPDATA%\Microsoft\Edge\User Data\*") do (
    rmdir /s /q "%%p\Cache" 2>nul
    rmdir /s /q "%%p\Code Cache" 2>nul
    rmdir /s /q "%%p\GPUCache" 2>nul
    rmdir /s /q "%%p\Local Storage" 2>nul
    rmdir /s /q "%%p\Session Storage" 2>nul
    rmdir /s /q "%%p\IndexedDB" 2>nul
    rmdir /s /q "%%p\Service Worker" 2>nul
    del /f /q "%%p\Cookies" 2>nul
    del /f /q "%%p\Network\Cookies" 2>nul
)

echo.
echo ==========================================
echo Browser cleanup completed successfully.
echo ==========================================
echo.
echo You can now reopen the browser and log in.
echo.
pause