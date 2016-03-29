@echo off
rem ==========================================================================================
rem 本批处理实现支持exp数据库的Oracle数据库版本的数据库逻辑备份，流程为：导出数据到
rem 本目录下，然后把dmp文件以rar格式放入当天备份日期命名的目录下，便于以后按日期恢复。
rem
rem 需要配置的参数说明：
rem BKFILE:备份日期
rem HHMMSS:备份时间
rem FilePrefix:备份文件名的前缀
rem UserName:备份的用户名
rem Password:备份的密码
rem NetServer:连接数据库的NET服务名
rem ORA_HOME:执行exp文件的目录
rem Author: Jeffen@pactera
rem Time: 2015-07-29
rem ==========================================================================================
rem

set dump_bak_path=%cd%
set BKFILE=%Date:~0,4%%Date:~5,2%%Date:~8,2%
set HHMMSS=%time:~0,2%%time:~3,2%%time:~6,2%
set FilePrefix=pactera_jeesite
set UserName=jeesite
set Password=123456
set NetServer=192.168.5.5:1521/orcl

rem 制定ORACLE据对路径一定指定到【bin\】下，注意最后有反斜杠
set ORA_HOME=D:\DB\oracle\product\11.2.0\dbhome_1\bin\
set WINRAR_HOME=C:\Program Files\WinRAR\
cd %ORA_HOME%
echo ORA_HOME=%ORA_HOME%
echo WINRAR_HOME=%WINRAR_HOME%

echo 【实时备份】kickoff...
set file_name=%FilePrefix%_%BKFILE%_%HHMMSS%
set file_full_path=%dump_bak_path%\%file_name%.dmp
echo file_full_path=%file_full_path%
exp %UserName%/%Password%@%NetServer% file=%file_full_path%

echo 【压缩文件】raring...
echo 将C:/Program Files/WinRAR下的Rar.exe拷贝到%SystemRoot%/system32下,
echo 这样你就不必设置rar的环境变量,而能直接再cmd 命令提示符下使用rar命令 .
c:
cd %WINRAR_HOME%
rar a %dump_bak_path%\%file_name%.rar %file_full_path%

echo 【清理文件】del... %file_full_path%
del %file_full_path%
pause;

rem 【每天备份一次】只是保留最近一个星期的备份文件
rem del D:\CAH_SMS_DATA_BAK\data\bak7.dmp 
rem ren D:\CAH_SMS_DATA_BAK\data\bak6.dmp bak7.dmp 
rem ren D:\CAH_SMS_DATA_BAK\data\bak5.dmp bak6.dmp 
rem ren D:\CAH_SMS_DATA_BAK\data\bak4.dmp bak5.dmp 
rem ren D:\CAH_SMS_DATA_BAK\data\bak3.dmp bak4.dmp 
rem ren D:\CAH_SMS_DATA_BAK\data\bak2.dmp bak3.dmp 
rem ren D:\CAH_SMS_DATA_BAK\data\bak.dmp bak2.dmp
rem %ORA_HOME%exp %UserName%/%Password%@%NetServer% file=%dump_bak_path%\bak.dmp
rem exit;


rem 【数据的导入 】
rem 1 将 dmp 中的数据导入cahsms数据库中。 
rem imp %UserName%/%Password%@%NetServer% file=%dump_bak_path%\bak.dmp
rem 上面可能有点问题，因为有的表已经存在，然后它就报错，对该表就不进行导入。 
rem 在后面加上 ignore=y 就可以了。 
rem 2 将 dmp 中的表table1 导入 
rem imp  %UserName%/%Password%@%NetServer% file=%dump_bak_path%\bak.dmp tables=(table1) 

