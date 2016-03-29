@echo off
rem /**
rem  * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
rem  *
rem  * Author: Jeffen@pactera
rem  */
echo [install] 启动聚合的工程
echo.base directory : ${workspace_loc:/aggregator}
echo.Runtime JRE VM arguments: -Xms1024m -Xmx1024m -XX:PermSize=128M -XX:MaxNewSize=512m -XX:MaxPermSize=256m -Dfile.encoding=GBK -Dcargo.servlet.uriencoding=GBK
pause
echo.

cd %~dp0
cd..

rem Clean & Build & Deploy the aggreagated projects to tomcat server with skipping auto test.
call mvn clean install -Pdev_pdt -Dmaven.test.skip=true

cd bin
pause