--1
CREATE TABLE EXAMPLE_TABLE(
ID NUMBER(10) PRIMARY KEY,
NAME VARCHAR2(50),
AGE NUMBER(3),
EMAIL VARCHAR2(100),
Address VARCHAR2(200)
);

--2
INSERT INTO EXAMPLE_TABLE (id, name, age, email, address) VALUES (1, 'John', 25, 'john@example.com', '123 Main St');
INSERT INTO EXAMPLE_TABLE (id, name, age, email, address) VALUES (2, 'Jane', 30, 'jane@example.com', '456 Elm St');
INSERT INTO EXAMPLE_TABLE (id, name, age, email, address) VALUES (3, 'Bob', 40, 'bob@example.com', '789 Oak St');
INSERT INTO EXAMPLE_TABLE (id, name, age, email, address) VALUES (4, 'Alice', 35, 'alice@example.com', '321 Maple Ave');
INSERT INTO EXAMPLE_TABLE (id, name, age, email, address) VALUES (5, 'Tom', 28, 'tom@example.com', '654 Pine St');
INSERT INTO EXAMPLE_TABLE (id, name, age, email, address) VALUES (6, 'Sara', 42, 'sara@example.com', '987 Cedar St');
INSERT INTO EXAMPLE_TABLE (id, name, age, email, address) VALUES (7, 'Mike', 31, 'mike@example.com', '246 Birch Rd');
INSERT INTO EXAMPLE_TABLE (id, name, age, email, address) VALUES (8, 'Emily', 27, 'emily@example.com', '135 Oak Ave');
INSERT INTO EXAMPLE_TABLE (id, name, age, email, address) VALUES (9, 'David', 38, 'david@example.com', '864 Maple St');
INSERT INTO EXAMPLE_TABLE (id, name, age, email, address) VALUES (10, 'Amy', 29, 'amy@example.com', '753 Pine Rd');
INSERT INTO EXAMPLE_TABLE (id, name, age, email, address) VALUES (11, 'Amy', 29, 'amy@example.com', '753 Pine Rd');
INSERT INTO EXAMPLE_TABLE (id, name, age, email, address) VALUES (12, 'Amy', 29, 'amy@example.com', '753 Pine Rd');

--3
CREATE OR REPLACE TRIGGER TRIGGER_FIRST
BEFORE INSERT OR DELETE OR UPDATE ON EXAMPLE_TABLE
DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('example_trigger fired');
END;

--4
CREATE OR REPLACE TRIGGER TRIGGER_SECOND
BEFORE INSERT OR DELETE OR UPDATE ON EXAMPLE_TABLE
FOR EACH ROW
DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('example_trigger fired');
END;

--5
CREATE OR REPLACE TRIGGER TRIGGER_THIRD
BEFORE INSERT ON EXAMPLE_TABLE
FOR EACH ROW
DECLARE
BEGIN
  IF INSERTING THEN
    DBMS_OUTPUT.PUT_LINE('New row inserted with ID ' || :NEW.id);
  END IF;
END;

CREATE OR REPLACE TRIGGER TRIGGER_FOURTH
BEFORE INSERT ON EXAMPLE_TABLE
FOR EACH ROW
DECLARE
BEGIN
  IF UPDATING THEN
    DBMS_OUTPUT.PUT_LINE('New row inserted with ID ' || :NEW.id);
  END IF;
END;

CREATE OR REPLACE TRIGGER TRIGGER_FIFTH
BEFORE INSERT ON EXAMPLE_TABLE
FOR EACH ROW
DECLARE
BEGIN
  IF UPDATING THEN
    DBMS_OUTPUT.PUT_LINE('New row inserted with ID ' || :NEW.id);
  END IF;
END;

--6
CREATE OR REPLACE TRIGGER TRIGGER_SIX
AFTER INSERT OR DELETE OR UPDATE ON EXAMPLE_TABLE
DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('example_trigger fired');
END;

--7
CREATE OR REPLACE TRIGGER TRIGGER_SEVENTH
AFTER INSERT OR DELETE OR UPDATE ON EXAMPLE_TABLE
FOR EACH ROW
DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('example_trigger fired for row ' || :OLD.id);
END;

--8
CREATE TABLE AUDIT_s(
  OperationDate DATE,
  OperationType NVARCHAR2(10),
  TriggerName NVARCHAR2(30),
  Data NVARCHAR2(50)
);

SELECT * FROM AUDIT_S;

--9

