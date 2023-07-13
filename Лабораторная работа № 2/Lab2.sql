Alter Session Set "_oracle_script" = TRUE;--Эта команда позволяет создавать роли, профили безопасности и пользователей с именами,

Create TableSpace TS_KDA -- Создание табличного пространство с постоянными данными permanent
DataFile 'C:\app\Tablespaces\TS_KDA.dbf'
Size 7M
Autoextend On Next 5M -- автоматическое приращение
MaxSize 30M
Extent Management Local; --непрерывный фрагмент дисковой памяти

DROP TABLESPACE TS_KDA
    INCLUDING CONTENTS AND DATAFILES;

Create TEMPORARY TableSpace TS_KDA_TEMP -- Создание табличного пространство с временными данными
TEMPFILE 'C:\app\Tablespaces\TS_KDA_TEMP.dbf'
Size 5M
Autoextend On Next 3M
MaxSize 20M
EXTENT MANAGEMENT LOCAL;

DROP TABLESPACE TS_KDA_TEMP
    INCLUDING CONTENTS AND DATAFILES;

Select TableSpace_Name, Status, contents logging From SYS.DBA_TABLESPACES; -- получение списка всех табличных пространств
Select FILE_NAME, TABLESPACE_NAME, STATUS, MAXBYTES, USER_BYTES FROM DBA_DATA_FILES -- получение списка всех файлов табличных пространств
UNION
Select FILE_NAME, TABLESPACE_NAME, STATUS, MAXBYTES, USER_BYTES FROM DBA_TEMP_FILES

CREATE ROLE RL_KDACORE;

Grant Create Session,-- назначение системных привилегий
Create Table,
Create View,
Create Procedure To RL_KDACORE;

Select * From dba_roles Where Role Like 'RL%' -- роль в словаре
Select * From DBA_SYS_PRIVS WHERE GRANTEE = 'RL_KDACORE'; -- привилегии

Drop Role RL_KDACORE;

Create Profile PF_KDACORE Limit
PASSWORD_LIFE_TIME 180
SESSIONS_PER_USER 3
FAILED_LOGIN_ATTEMPTS 7
PASSWORD_LOCK_TIME 1
PASSWORD_REUSE_TIME 10
PASSWORD_GRACE_TIME DEFAULT
CONNECT_TIME 180
IDLE_TIME 30

SELECT * FROM DBA_PROFILES
SELECT * FROM DBA_PROFILES WHERE PROFILE = 'PF_KDACORE';-- получение всех параметров профиля....
SELECT * FROM DBA_PROFILES WHERE PROFILE = 'DEFAULT';

DROP PROFILE PF_KDACORE CASCADE;

CREATE USER KDACORE IDENTIFIED BY 12345
DEFAULT TABLESPACE TS_KDA 
TEMPORARY TABLESPACE TS_KDA_TEMP
PROFILE PF_KDACORE
ACCOUNT UNLOCK
PASSWORD EXPIRE

Grant RL_KDACORE to KDACORE;

GRANT CREATE TABLE TO KDACORE;

Select * From DBA_USERS;

Drop USER KDACORE CASCADE;

ALTER USER KDACORE
DEFAULT TABLESPACE TS_KDA
QUOTA 2M ON TS_KDA;

ALTER USER C##KDA
DEFAULT TABLESPACE TS_KDA
QUOTA 2M ON TS_KDA

ALTER TABLESPACE TS_KDA OFFLINE;

ALTER TABLESPACE TS_KDA ONLINE;

