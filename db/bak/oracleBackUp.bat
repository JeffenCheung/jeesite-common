@echo off
rem ==========================================================================================
rem ��������ʵ��֧��exp���ݿ��Oracle���ݿ�汾�����ݿ��߼����ݣ�����Ϊ���������ݵ�
rem ��Ŀ¼�£�Ȼ���dmp�ļ���rar��ʽ���뵱�챸������������Ŀ¼�£������Ժ����ڻָ���
rem
rem ��Ҫ���õĲ���˵����
rem BKFILE:��������
rem HHMMSS:����ʱ��
rem FilePrefix:�����ļ�����ǰ׺
rem UserName:���ݵ��û���
rem Password:���ݵ�����
rem NetServer:�������ݿ��NET������
rem ORA_HOME:ִ��exp�ļ���Ŀ¼
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

rem �ƶ�ORACLE�ݶ�·��һ��ָ������bin\���£�ע������з�б��
set ORA_HOME=D:\DB\oracle\product\11.2.0\dbhome_1\bin\
set WINRAR_HOME=C:\Program Files\WinRAR\
cd %ORA_HOME%
echo ORA_HOME=%ORA_HOME%
echo WINRAR_HOME=%WINRAR_HOME%

echo ��ʵʱ���ݡ�kickoff...
set file_name=%FilePrefix%_%BKFILE%_%HHMMSS%
set file_full_path=%dump_bak_path%\%file_name%.dmp
echo file_full_path=%file_full_path%
exp %UserName%/%Password%@%NetServer% file=%file_full_path%

echo ��ѹ���ļ���raring...
echo ��C:/Program Files/WinRAR�µ�Rar.exe������%SystemRoot%/system32��,
echo ������Ͳ�������rar�Ļ�������,����ֱ����cmd ������ʾ����ʹ��rar���� .
c:
cd %WINRAR_HOME%
rar a %dump_bak_path%\%file_name%.rar %file_full_path%

echo �������ļ���del... %file_full_path%
del %file_full_path%
pause;

rem ��ÿ�챸��һ�Ρ�ֻ�Ǳ������һ�����ڵı����ļ�
rem del D:\CAH_SMS_DATA_BAK\data\bak7.dmp 
rem ren D:\CAH_SMS_DATA_BAK\data\bak6.dmp bak7.dmp 
rem ren D:\CAH_SMS_DATA_BAK\data\bak5.dmp bak6.dmp 
rem ren D:\CAH_SMS_DATA_BAK\data\bak4.dmp bak5.dmp 
rem ren D:\CAH_SMS_DATA_BAK\data\bak3.dmp bak4.dmp 
rem ren D:\CAH_SMS_DATA_BAK\data\bak2.dmp bak3.dmp 
rem ren D:\CAH_SMS_DATA_BAK\data\bak.dmp bak2.dmp
rem %ORA_HOME%exp %UserName%/%Password%@%NetServer% file=%dump_bak_path%\bak.dmp
rem exit;


rem �����ݵĵ��� ��
rem 1 �� dmp �е����ݵ���cahsms���ݿ��С� 
rem imp %UserName%/%Password%@%NetServer% file=%dump_bak_path%\bak.dmp
rem ��������е����⣬��Ϊ�еı��Ѿ����ڣ�Ȼ�����ͱ����Ըñ�Ͳ����е��롣 
rem �ں������ ignore=y �Ϳ����ˡ� 
rem 2 �� dmp �еı�table1 ���� 
rem imp  %UserName%/%Password%@%NetServer% file=%dump_bak_path%\bak.dmp tables=(table1) 

