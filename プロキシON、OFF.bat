@echo off

reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" | find /i "ProxyEnable" | find "0x1" >nul

if %errorlevel% equ 0 (
    echo �v���L�V�ݒ肪ON�ł��BOFF�ɕύX���܂��B
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul
) else (
    echo �v���L�V�ݒ肪OFF�ł��BON�ɕύX���܂��B
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f >nul
)

echo �v���L�V�ݒ��؂�ւ��܂����B
pause