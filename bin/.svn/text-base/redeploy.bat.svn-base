@echo off
rem /**
rem  * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.
rem  * Auto redeploy files from workspace to web server(jsp/xml eg.)
rem  * Author: jeffen@pactera
rem  * Date: 2015/7/1
rem  * Version: 0.0.1
rem  */
echo.
echo [Auto redeploy] from workspace to web server.
echo.

set DaysAgo=0
rem system date formate: yyyy-mm-dd
call :DateToDays %date:~0,4% %date:~5,2% %date:~8,2% PassDays
set /a PassDays-=%DaysAgo%
call :DaysToDate %PassDays% DstYear DstMonth DstDay
echo deploy %DaysAgo% days later£º%DstYear%-%DstMonth%-%DstDay%
set XcopyArgs=xcopy /D:%DstMonth%-%DstDay%-%DstYear% /E /Y
echo deploy action and arguments£º%XcopyArgs% from to

rem set workspace direction and Tomcat webapps direction
cd..
cd..
set workspace=%cd%
echo workspace path: %workspace%
set web-context-root=pactera-jeesite
echo workspace path: %workspace%

rem echo Using CATALINA_HOME:   %CATALINA_HOME%
rem if "%CATALINA_HOME%" == "" goto gotNgHome
set CATALINA_HOME=E:\workspace_jeesite\jeesite-web-dist\target

:restart_hit
set from=%workspace%\jeesite-web\src\main\resources
set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\classes
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%

echo.
set from=%workspace%\jeesite-gen\src\main\resources
set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\classes
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%

echo.
set from=%workspace%\jeesite-soa\src\main\resources
set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\classes
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%

echo.
set from=%workspace%\pactera-sms\src\main\resources
set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\classes
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%

echo.
set from=%workspace%\jeesite-web\src\main\webapp\static
set to=%CATALINA_HOME%\%web-context-root%\static
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%

echo.
set from=%workspace%\jeesite-web\src\main\webapp\WEB-INF\tags
set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\tags
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%

echo.
set from=%workspace%\jeesite-web\src\main\webapp\WEB-INF\views
set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\views
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%

echo.
set from=%workspace%\jeesite-cms\src\main\webapp\WEB-INF\views
set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\views
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%

echo.
set from=%workspace%\jeesite-gen\src\main\webapp\WEB-INF\views
set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\views
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%

echo.
set from=%workspace%\jeesite-oa\src\main\webapp\WEB-INF\views
set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\views
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%

echo.
set from=%workspace%\jeesite-gen\src\target\classes
set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\classes
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%

echo.
set from=%workspace%\jeesite-oa\src\target\classes
set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\classes
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%

echo.
set from=%workspace%\jeesite-oa-core\src\target\classes
set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\classes
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%

echo.
set from=%workspace%\jeesite-cms\src\target\classes
set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\classes
echo.
echo deploy from£º%from%\*
echo deploy to£º%to%\*
echo redeploy files...
call %XcopyArgs% %from% %to%


rem project demo
rem echo.
rem set from=%workspace%\pactera-crm\src\main\webapp\WEB-INF\views
rem set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\views
rem echo.
rem echo deploy from£º%from%\*
rem echo deploy to£º%to%\*
rem echo redeploy files...
rem call %XcopyArgs% %from% %to%
rem 
rem echo.
rem set from=%workspace%\pactera-sms\src\main\webapp\WEB-INF\views
rem set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\views
rem echo.
rem echo deploy from£º%from%\*
rem echo deploy to£º%to%\*
rem echo redeploy files...
rem call %XcopyArgs% %from% %to%



rem change project path
rem cd..
rem set workspace_project=%cd%workspace_project
rem echo workspace_project path: %workspace_project%

rem echo.
rem set from=%workspace_project%\jeesite-soa\src\main\resources
rem set to=%CATALINA_HOME%\%web-context-root%\WEB-INF\classes
rem echo.
rem echo deploy from£º%from%\*
rem echo deploy to£º%to%\*
rem echo redeploy files...
rem call %XcopyArgs% %from% %to%




echo waiting 5s.....
ping -n 6 127.1>nul
goto :restart_hit

goto :eof

:gotNgHome
echo CATALINA_HOME is not setted.
pause

rem find the day before days
:DateToDays %yy% %mm% %dd% days
setlocal ENABLEEXTENSIONS
set yy=%1&set mm=%2&set dd=%3
if 1%yy% LSS 200 if 1%yy% LSS 170 (set yy=20%yy%) else (set yy=19%yy%)
set /a dd=100%dd%%%100,mm=100%mm%%%100
set /a z=14-mm,z/=12,y=yy+4800-z,m=mm+12*z-3,j=153*m+2
set /a j=j/5+dd+y*365+y/4-y/100+y/400-2472633
endlocal&set %4=%j%&goto :EOF

:DaysToDate %days% yy mm dd
setlocal ENABLEEXTENSIONS
set /a a=%1+2472632,b=4*a+3,b/=146097,c=-b*146097,c/=4,c+=a
set /a d=4*c+3,d/=1461,e=-1461*d,e/=4,e+=c,m=5*e+2,m/=153,dd=153*m+2,dd/=5
set /a dd=-dd+e+1,mm=-m/10,mm*=12,mm+=m+3,yy=b*100+d-4800+m/10
(if %mm% LSS 10 set mm=0%mm%)&(if %dd% LSS 10 set dd=0%dd%)
endlocal&set %2=%yy%&set %3=%mm%&set %4=%dd%&goto :EOF