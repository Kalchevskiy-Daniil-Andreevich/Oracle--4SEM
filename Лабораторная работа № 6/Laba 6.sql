--‘айл параметров Ч это файл, содержащий список параметров инициализации и значение дл€ каждого параметра. 
ALTER SESSION  Set "_oracle_script" = TRUE;
ALTER SESSION SET CONTAINER = PDB_KDA;
ALTER SESSION SET CONTAINER = CDB$ROOT;

--1
SHOW PARAMETER SPFILE;

SELECT NAME, VALUE, DESCRIPTION FROM V$PARAMETER; --‘айл параметров предназначен дл€ хранени€ параметров экземпл€ра

SELECT NAME, VALUE FROM V$PARAMETER WHERE NAME = 'open_cursors';

--3
CREATE PFILE = 'KDA_PFILE.ORA' FROM SPFILE;

--4
SELECT NAME, VALUE FROM V$PARAMETER WHERE NAME = 'open_cursors';
ALTER SYSTEM SET OPEN_CURSORS=400 SCOPE=SPFILE;

--5
CREATE SPFILE = 'SPFILEORCL1.ora' FROM PFILE = 'KDA_PFILE.ORA'; --Cформировать бинарный файл SPFILE параметров из текстового файла PFILE 

SELECT NAME, VALUE FROM V$PARAMETER WHERE NAME = 'open_cursors';

--8
SHOW PARAMETER CONTROL;
SELECT NAME FROM V$CONTROLFILE;
SELECT TYPE, RECORD_SIZE, RECORDS_TOTAL FROM V$CONTROLFILE_RECORD_SECTION;

--9
ALTER DATABASE BACKUP CONTROLFILE TO TRACE; --≈сли надо изменить управл€ющий файл, то следует создать сценарий, откорректировать его и выполнить 

SELECT * FROM V$PWFILE_USERS; --ѕросмотр пользователей в файле паролей

--12
SELECT * FROM V$DIAG_INFO;

--spfileORACLE_SID.ora
--spfile.ora
--initORACLE_SID.ora