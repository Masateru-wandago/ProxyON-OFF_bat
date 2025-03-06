@echo off

reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" | find /i "ProxyEnable" | find "0x1" >nul

if %errorlevel% equ 0 (
    echo プロキシ設定がONです。OFFに変更します。
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul
) else (
    echo プロキシ設定がOFFです。ONに変更します。
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f >nul
)

echo プロキシ設定を切り替えました。
pause