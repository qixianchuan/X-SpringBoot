@echo off
rem ��ǰbat������

echo ==================begin========================

cls 
SET NGINX_PATH=G:
SET NGINX_DIR=G:\nginx-1.13.12\
color 0a 
TITLE Nginx ������� Power By Ants (http://leleroyn.cnblogs.com)

CLS 

ECHO. 
ECHO. * * Nginx ������� Power By Ants (http://leleroyn.cnblogs.com)  *  
ECHO. * update by �θ� 2013-03-13 *  
ECHO. 

:MENU 

ECHO. * nginx ����list *  
tasklist|findstr /i "nginx.exe"

if ERRORLEVEL 1 (echo nginx.exe������) else (echo nginx.exe����)


ECHO. 
	ECHO.  [1] ����Nginx  
	ECHO.  [2] �ر�Nginx  
	ECHO.  [3] ����Nginx  
	ECHO.  [4] �� �� 
ECHO. 

ECHO.������ѡ����Ŀ�����:
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
	ECHO.�ر�Nginx...... 
	taskkill /F /IM nginx.exe > nul
	ECHO.OK,�ر�����nginx ����
	goto :eof

:startNginx
	ECHO. 
	ECHO.����Nginx...... 
	IF NOT EXIST "%NGINX_DIR%nginx.exe" ECHO "%NGINX_DIR%nginx.exe"������ 

	%NGINX_PATH% 

	cd "%NGINX_DIR%" 

	IF EXIST "%NGINX_DIR%nginx.exe" (
		echo "start '' nginx.exe"
		start "" nginx.exe
	)
	ECHO.OK
	goto :eof