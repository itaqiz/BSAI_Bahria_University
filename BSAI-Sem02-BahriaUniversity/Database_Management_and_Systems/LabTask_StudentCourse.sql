-- ==========================================================
-- NAME        : MUHAMMAD TAQUI
-- ENROLLMENT  : 01-136221-021
-- LAB TASK    : Foreign Key Relationship (Student & Course Tables)
-- ==========================================================


-- ----------------------------------------------------------
-- TASK 1: Create STUDENT and COURSE tables with a foreign key
-- in the COURSE table. Add 5 rows to each table.
-- ----------------------------------------------------------

-- Parent table: STUDENT
CREATE TABLE STUDENT (
    S_ID     INT PRIMARY KEY,
    SNAME    VARCHAR(20),
    ADDRESS  VARCHAR(50)
);

-- Child table: COURSE, referencing STUDENT via foreign key
CREATE TABLE COURSE (
    C_ID   INT PRIMARY KEY,
    CNAME  VARCHAR(20),
    S_ID   INT,
    FOREIGN KEY (S_ID) REFERENCES STUDENT(S_ID)
);


-- ----------------------------------------------------------
-- Insert 5 rows into STUDENT
-- ----------------------------------------------------------
INSERT INTO STUDENT (S_ID, SNAME, ADDRESS) VALUES (1, 'Ali',    'Lahore');
INSERT INTO STUDENT (S_ID, SNAME, ADDRESS) VALUES (2, 'Ahmed',  'Karachi');
INSERT INTO STUDENT (S_ID, SNAME, ADDRESS) VALUES (3, 'Bilal',  'Islamabad');
INSERT INTO STUDENT (S_ID, SNAME, ADDRESS) VALUES (4, 'Hassan', 'Faisalabad');
INSERT INTO STUDENT (S_ID, SNAME, ADDRESS) VALUES (5, 'Usman',  'Multan');


-- ----------------------------------------------------------
-- Insert 5 rows into COURSE (each S_ID must exist in STUDENT)
-- ----------------------------------------------------------
INSERT INTO COURSE (C_ID, CNAME, S_ID) VALUES (1, 'Database Systems',  1);
INSERT INTO COURSE (C_ID, CNAME, S_ID) VALUES (2, 'Data Structures',   2);
INSERT INTO COURSE (C_ID, CNAME, S_ID) VALUES (3, 'Operating Systems', 3);
INSERT INTO COURSE (C_ID, CNAME, S_ID) VALUES (4, 'Computer Networks', 4);
INSERT INTO COURSE (C_ID, CNAME, S_ID) VALUES (5, 'Software Engineering', 5);


-- ----------------------------------------------------------
-- Verify structure and data
-- ----------------------------------------------------------
DESCRIBE STUDENT;
DESCRIBE COURSE;

SELECT * FROM STUDENT;
SELECT * FROM COURSE;

-- Join example: list each course with the student it belongs to
SELECT C.C_ID, C.CNAME, S.S_ID, S.SNAME, S.ADDRESS
FROM COURSE C
JOIN STUDENT S ON C.S_ID = S.S_ID;
