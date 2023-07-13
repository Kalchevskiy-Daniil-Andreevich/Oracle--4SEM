ALTER SESSION  Set "_oracle_script" = TRUE;
ALTER SESSION SET CONTAINER = PDB_KDA;
ALTER SESSION SET CONTAINER = CDB$ROOT;
--1
SELECT * FROM DBA_TABLESPACES;
--2
CREATE TABLESPACE KDA_QDATA
DATAFILE 'C:\app\Tablespaces\TS_KDA_QDATA.dbf'
SIZE 10M
Autoextend On Next 5M 
MaxSize 30M
Extent Management Local;

DROP TABLESPACE TS_KDA
    INCLUDING CONTENTS AND DATAFILES;
    
ALTER TABLESPACE KDA_QDATA OFFLINE;
ALTER TABLESPACE KDA_QDATA ONLINE;

CREATE ROLE RL_KDA;

Grant Create Session,
Create Table,
Create View,
Create Procedure To RL_KDA;

Drop Role RL_KDA;

Create Profile PF_KDA Limit
PASSWORD_LIFE_TIME 180
SESSIONS_PER_USER 3
FAILED_LOGIN_ATTEMPTS 7
PASSWORD_LOCK_TIME 1
PASSWORD_REUSE_TIME 10
PASSWORD_GRACE_TIME DEFAULT
CONNECT_TIME 180
IDLE_TIME 30

DROP PROFILE PF_KDA CASCADE;

CREATE USER KDA IDENTIFIED BY 0344533
DEFAULT TABLESPACE KDA_QDATA
PROFILE PF_KDA
ACCOUNT UNLOCK
PASSWORD EXPIRE

Drop USER KDA CASCADE;

GRANT ALL PRIVILEGES TO KDA;

ALTER USER KDA
DEFAULT TABLESPACE  KDA_QDATA
QUOTA 2M ON  KDA_QDATA;

--3,4,5,6
SELECT
    tablespace_name,
    block_size,
    initial_extent,
    initial_extent/block_size,
    extent_management,
    segment_space_management,
    bigfile
    FROM dba_tablespaces;

SELECT owner, segment_name, segment_type, tablespace_name, bytes, blocks, buffer_pool FROM dba_segments
WHERE tablespace_name='KDA_QDATA';

SHOW PARAMETER SEGMENT;

SELECT segment_name, segment_type, tablespace_name, bytes, blocks, buffer_pool FROM user_segments

--7
SELECT object_name, original_name, operation, type, ts_name, createtime, droptime FROM user_recyclebin;

--10
SELECT * FROM dba_extents WHERE  tablespace_name = 'KDA_QDATA';

--11
SELECT * FROM dba_extents;
--UNIFORM указывает, что табличное пространство управляется едиными экстентами SIZE байт. 
--Однако вы должны указать UNIFORM, чтобы указать SIZE. 
