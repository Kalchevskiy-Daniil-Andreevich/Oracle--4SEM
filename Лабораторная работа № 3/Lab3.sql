SELECT NAME, OPEN_MODE FROM v$PDBS; --������ ���� ������������ PDB

SELECT TABLESPACE_NAME, STATUS, CONTENTS LOGGING FROM SYS.DBA_TABLESPACES;

Select TableSpace_Name, Status, contents logging From SYS.DBA_TABLESPACES; -- ��������� ������ ���� ��������� �����������
Select FILE_NAME, TABLESPACE_NAME, STATUS, MAXBYTES, USER_BYTES FROM DBA_DATA_FILES -- ��������� ������ ���� ������ ��������� �����������
UNION
Select FILE_NAME, TABLESPACE_NAME, STATUS, MAXBYTES, USER_BYTES FROM DBA_TEMP_FILES

Select * From dba_roles 
Select * From DBA_SYS_PRIVS

SELECT * FROM DBA_PROFILES

Select * From DBA_USERS;

Select * From User_objects;

SELECT * FROM V$SESSION;

commit;
