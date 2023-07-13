ALTER SESSION  Set "_oracle_script" = TRUE;

CREATE TABLE KDA_T1(
IDPERSON NUMBER PRIMARY KEY,
NAME NVARCHAR2(50)
)TABLESPACE KDA_QDATA;

CREATE TABLE KDA_T2(
Block NUMBER(20)
)TABLESPACE KDA_QDATA;

INSERT INTO KDA_T1(IDPERSON, NAME)
VALUES (1, 'Danik');
INSERT INTO KDA_T1(IDPERSON, NAME)
VALUES (2, 'Lexa');
INSERT INTO KDA_T1(IDPERSON, NAME)
VALUES (3, 'Vova');
COMMIT;

Select * From KDA_T1;

DELETE KDA_T1;
DROP TABLE KDA_T1;

FLASHBACK TABLE KDA_T1 TO BEFORE DROP;

DROP TABLE KDA_T1 PURGE;
DROP TABLE KDA_T2 PURGE;

BEGIN
FOR k IN 1..10000
LOOP
INSERT INTO KDA_T2(BLOCK) VALUES(1);
END LOOP;
COMMIT;
END;

SELECT * FROM kda_t2;

SELECT IDPERSON, NAME, ROWID FROM KDA_T1; --�������������

SELECT IDPERSON, NAME, ORA_ROWSCN FROM KDA_T1;

