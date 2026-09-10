-- ==========================================================
-- NAME        : MUHAMMAD TAQUI
-- ENROLLMENT  : 01-136221-021
-- LAB TASK    : SQL Joins (Inner, Left, Right, Full, Self Join)
-- ==========================================================
-- Uses two related tables: EMPLOYEE and DEPT
-- ==========================================================

CREATE TABLE DEPT (
    DEPTNO   NUMBER(5)   PRIMARY KEY,
    DNAME    VARCHAR2(30),
    LOC      VARCHAR2(30)
);

CREATE TABLE EMPLOYEE (
    EMPID    NUMBER(5)   PRIMARY KEY,
    ENAME    VARCHAR2(30),
    SALARY   NUMBER(10,2),
    MGRID    NUMBER(5),
    DEPTNO   NUMBER(5),
    FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);

INSERT INTO DEPT VALUES (10, 'Sales',       'New York');
INSERT INTO DEPT VALUES (20, 'IT',          'Boston');
INSERT INTO DEPT VALUES (30, 'HR',          'Chicago');
INSERT INTO DEPT VALUES (40, 'Finance',     'Dallas');

INSERT INTO EMPLOYEE VALUES (1, 'John',   50000, NULL, 10);
INSERT INTO EMPLOYEE VALUES (2, 'Sara',   60000, 1,    10);
INSERT INTO EMPLOYEE VALUES (3, 'Mike',   55000, NULL, 20);
INSERT INTO EMPLOYEE VALUES (4, 'Lisa',   45000, 3,    20);
INSERT INTO EMPLOYEE VALUES (5, 'Tom',    70000, NULL, NULL);

COMMIT;


-- ----------------------------------------------------------
-- TASK 1: Perform an INNER JOIN to list employee names with
-- their department name.
-- ----------------------------------------------------------
SELECT E.ENAME, D.DNAME
FROM EMPLOYEE E
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;


-- ----------------------------------------------------------
-- TASK 2: Perform a LEFT (OUTER) JOIN to list all employees
-- even if they don't belong to a department.
-- ----------------------------------------------------------
SELECT E.ENAME, D.DNAME
FROM EMPLOYEE E
LEFT JOIN DEPT D ON E.DEPTNO = D.DEPTNO;


-- ----------------------------------------------------------
-- TASK 3: Perform a RIGHT (OUTER) JOIN to list all departments
-- even if they currently have no employees.
-- ----------------------------------------------------------
SELECT E.ENAME, D.DNAME
FROM EMPLOYEE E
RIGHT JOIN DEPT D ON E.DEPTNO = D.DEPTNO;


-- ----------------------------------------------------------
-- TASK 4: Perform a FULL OUTER JOIN to show all employees and
-- all departments, matched where possible.
-- ----------------------------------------------------------
SELECT E.ENAME, D.DNAME
FROM EMPLOYEE E
FULL OUTER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;


-- ----------------------------------------------------------
-- TASK 5: Perform a SELF JOIN to list each employee alongside
-- the name of their manager.
-- ----------------------------------------------------------
SELECT E.ENAME AS EMPLOYEE_NAME, M.ENAME AS MANAGER_NAME
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON E.MGRID = M.EMPID;
