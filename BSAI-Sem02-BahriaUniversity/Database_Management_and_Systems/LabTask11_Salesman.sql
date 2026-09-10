-- ==========================================================
-- NAME        : MUHAMMAD TAQUI
-- ENROLLMENT  : 01-136221-021
-- LAB TASK 11 : Views, Substitution Variables, DML (Salesman Table)
-- ==========================================================
-- Source data:
-- salesman_id | name       | city      | commission
-- ------------|------------|-----------|-----------
-- 5001        | James Hoog | New York  | 0.15
-- 5002        | Nail Knite | Paris     | 0.13
-- 5005        | Pit Alex   | London    | 0.11
-- 5006        | Mc Lyon    | Paris     | 0.14
-- 5007        | Paul Adam  | Rome      | 0.13
-- 5003        | Lauson Hen | San Jose  | 0.12
-- ==========================================================


-- ----------------------------------------------------------
-- TASK (a): Create table named SALESMAN. Insert rows and Commit.
-- ----------------------------------------------------------
CREATE TABLE SALESMAN (
    SALES_ID  NUMBER(10)      PRIMARY KEY,
    SAL_NAME  VARCHAR2(50),
    CITY      VARCHAR2(50),
    COMMISON  NUMBER(5,2)
);

INSERT INTO SALESMAN (SALES_ID, SAL_NAME, CITY, COMMISON) VALUES (5001, 'James Hoog', 'New York', 0.15);
INSERT INTO SALESMAN (SALES_ID, SAL_NAME, CITY, COMMISON) VALUES (5002, 'Nail Knite', 'Paris',    0.13);
INSERT INTO SALESMAN (SALES_ID, SAL_NAME, CITY, COMMISON) VALUES (5003, 'Lauson Hen', 'San Jose', 0.12);
INSERT INTO SALESMAN (SALES_ID, SAL_NAME, CITY, COMMISON) VALUES (5005, 'Pit Alex',   'London',   0.11);
INSERT INTO SALESMAN (SALES_ID, SAL_NAME, CITY, COMMISON) VALUES (5006, 'Mc Lyon',    'Paris',    0.14);
INSERT INTO SALESMAN (SALES_ID, SAL_NAME, CITY, COMMISON) VALUES (5007, 'Paul Adam',  'Rome',     0.13);

COMMIT;

SELECT * FROM SALESMAN;


-- ----------------------------------------------------------
-- TASK 1: From the SALESMAN table, create a view for those
-- salespersons who belong to the city 'New York'.
-- ----------------------------------------------------------
CREATE VIEW SALESPERSON AS
SELECT * FROM SALESMAN WHERE CITY = 'New York';

SELECT * FROM SALESPERSON;


-- ----------------------------------------------------------
-- TASK 2: Display the records of the SALESMAN table based on id.
-- Prompt for the id at run time.
-- (Run this query at least 5 times with different ids and observe output)
-- ----------------------------------------------------------
SELECT * FROM SALESMAN WHERE SALES_ID = &NEWID;

-- Sample runs (enter different values when prompted):
--   Run 1: NEWID = 5001
--   Run 2: NEWID = 5002
--   Run 3: NEWID = 5003
--   Run 4: NEWID = 5005
--   Run 5: NEWID = 5007


-- ----------------------------------------------------------
-- TASK 3: Create a view of salesperson whose commission is
-- greater than 0.13 and whose city is 'New York'.
-- ----------------------------------------------------------
CREATE VIEW SALESPERSON_COMM AS
SELECT * FROM SALESMAN WHERE COMMISON > 0.13 AND CITY = 'New York';

SELECT * FROM SALESPERSON_COMM;


-- ----------------------------------------------------------
-- TASK 4: Show names of the SALESMAN table filtered by city.
-- The city is entered by the user at run time.
-- (Run this query at least 4 times with different values)
-- ----------------------------------------------------------
SELECT * FROM SALESMAN WHERE CITY = '&CITY';

-- Sample runs (enter different values when prompted):
--   Run 1: CITY = 'Paris'
--   Run 2: CITY = 'London'
--   Run 3: CITY = 'Rome'
--   Run 4: CITY = 'San Jose'


-- ----------------------------------------------------------
-- TASK 5: Delete record of salesperson whose id is 5005. Rollback.
-- ----------------------------------------------------------
DELETE FROM SALESMAN WHERE SALES_ID = 5005;

ROLLBACK;

-- Verify the record still exists after rollback
SELECT * FROM SALESMAN WHERE SALES_ID = 5005;
