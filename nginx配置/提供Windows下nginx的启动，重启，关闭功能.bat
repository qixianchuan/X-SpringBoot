@echo off
rem 当前bat的作用

echo ==================begin========================

cls 
SET NGINX_PATH=G:
SET NGINX_DIR=G:\nginx-1.13.12\
color 0a 
TITLE Nginx 管理程序 Power By Ants (http://leleroyn.cnblogs.com)

CLS 

ECHO. 
ECHO. * * Nginx 管理程序 Power By Ants (http://leleroyn.cnblogs.com)  *  
ECHO. * update by 鑫哥 2013-03-13 *  
ECHO. 

:MENU 

ECHO. * nginx 进程list *  
tasklist|findstr /i "nginx.exe"

if ERRORLEVEL 1 (echo nginx.exe不存在) else (echo nginx.exe存在)


ECHO. 
	ECHO.  [1] 启动Nginx  
	ECHO.  [2] 关闭Nginx  
	ECHO.  [3] 重启Nginx  
	ECHO.  [4] 退 出 
ECHO. 

ECHO.请输入选择项目的序号:
set /p ID=
	IF "%id%"=="1" GOTO start 
	IF "%id%"=="2" GOTO stop 
	IF "%id%"=="3" GOTO restart 
	IF "%id%"=="4" EXIT
PAUSE 

:start 
	call :startNginx
	GOTO MENU

:stop 
	call :shutdownNginx
	GOTO MENU

:restart 
	call :shutdownNginx
	call :startNginx
	GOTO MENU

:shutdownNginx
	ECHO. 
	ECHO.关闭Nginx...... 
	taskkill /F /IM nginx.exe > nul
	ECHO.OK,关闭所有nginx 进程
	goto :eof

:startNginx
	ECHO. 
	ECHO.启动Nginx...... 
	IF NOT EXIST "%NGINX_DIR%nginx.exe" ECHO "%NGINX_DIR%nginx.exe"不存在 

	%NGINX_PATH% 

	cd "%NGINX_DIR%" 

	IF EXIST "%NGINX_DIR%nginx.exe" (
		echo "start '' nginx.exe"
		start "" nginx.exe
	)
	ECHO.OK
	goto :eof