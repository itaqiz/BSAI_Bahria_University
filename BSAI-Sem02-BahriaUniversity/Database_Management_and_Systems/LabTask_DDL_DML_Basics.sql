-- ==========================================================
-- NAME        : MUHAMMAD TAQUI
-- ENROLLMENT  : 01-136221-021
-- LAB TASK    : Basic DDL & DML (Table Creation, Constraints, CRUD)
-- ==========================================================


-- ----------------------------------------------------------
-- TASK 1: Create a table named DEPARTMENT with columns
-- DEPT_ID (primary key), DEPT_NAME, LOCATION. Insert 5 rows.
-- ----------------------------------------------------------
CREATE TABLE DEPARTMENT (
    DEPT_ID   NUMBER(5)   PRIMARY KEY,
    DEPT_NAME VARCHAR2(30) NOT NULL,
    LOCATION  VARCHAR2(30)
);

INSERT INTO DEPARTMENT VALUES (10, 'Computer Science',       'Block A');
INSERT INTO DEPARTMENT VALUES (20, 'Electrical Engineering', 'Block B');
INSERT INTO DEPARTMENT VALUES (30, 'Business Administration','Block C');
INSERT INTO DEPARTMENT VALUES (40, 'Mathematics',            'Block D');
INSERT INTO DEPARTMENT VALUES (50, 'Physics',                'Block E');

COMMIT;


-- ----------------------------------------------------------
-- TASK 2: Alter the DEPARTMENT table to add a new column
-- HEAD_OF_DEPT and update its values for existing rows.
-- ----------------------------------------------------------
ALTER TABLE DEPARTMENT ADD (HEAD_OF_DEPT VARCHAR2(30));

UPDATE DEPARTMENT SET HEAD_OF_DEPT = 'Dr. Ahsan'   WHERE DEPT_ID = 10;
UPDATE DEPARTMENT SET HEAD_OF_DEPT = 'Dr. Bilal'   WHERE DEPT_ID = 20;
UPDATE DEPARTMENT SET HEAD_OF_DEPT = 'Dr. Sana'    WHERE DEPT_ID = 30;
UPDATE DEPARTMENT SET HEAD_OF_DEPT = 'Dr. Kamran'  WHERE DEPT_ID = 40;
UPDATE DEPARTMENT SET HEAD_OF_DEPT = 'Dr. Nadia'   WHERE DEPT_ID = 50;

COMMIT;


-- ----------------------------------------------------------
-- TASK 3: Delete the department whose ID is 50. Verify with SELECT.
-- ----------------------------------------------------------
DELETE FROM DEPARTMENT WHERE DEPT_ID = 50;

SELECT * FROM DEPARTMENT;


-- ----------------------------------------------------------
-- TASK 4: Rename the DEPARTMENT table to DEPT_MASTER and rename
-- the LOCATION column to DEPT_LOCATION.
-- ----------------------------------------------------------
RENAME DEPARTMENT TO DEPT_MASTER;

ALTER TABLE DEPT_MASTER RENAME COLUMN LOCATION TO DEPT_LOCATION;

SELECT * FROM DEPT_MASTER;


-- ----------------------------------------------------------
-- TASK 5: Drop the HEAD_OF_DEPT column, then describe the table
-- to confirm the structure change.
-- ----------------------------------------------------------
ALTER TABLE DEPT_MASTER DROP COLUMN HEAD_OF_DEPT;

DESCRIBE DEPT_MASTER;
