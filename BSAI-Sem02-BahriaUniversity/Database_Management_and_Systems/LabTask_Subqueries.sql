-- ==========================================================
-- NAME        : MUHAMMAD TAQUI
-- ENROLLMENT  : 01-136221-021
-- LAB TASK    : Subqueries (Single-row, Multi-row, Correlated)
-- ==========================================================
-- Uses the standard Oracle EMP and DEPT tables
-- ==========================================================


-- ----------------------------------------------------------
-- TASK 1: Display employees whose salary is greater than the
-- average salary of the whole company (single-row subquery).
-- ----------------------------------------------------------
SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);


-- ----------------------------------------------------------
-- TASK 2: Display the employee(s) with the highest salary in
-- the company.
-- ----------------------------------------------------------
SELECT ENAME, SAL
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);


-- ----------------------------------------------------------
-- TASK 3: Display employees who work in the same department as
-- 'SMITH' (multi-row / nested subquery).
-- ----------------------------------------------------------
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME = 'SMITH')
AND ENAME <> 'SMITH';


-- ----------------------------------------------------------
-- TASK 4: Display employees who earn more than every employee
-- in department 30 (multi-row subquery using ALL).
-- ----------------------------------------------------------
SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);


-- ----------------------------------------------------------
-- TASK 5: Display employees who earn more than at least one
-- employee in department 10 (multi-row subquery using ANY).
-- ----------------------------------------------------------
SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 10);


-- ----------------------------------------------------------
-- TASK 6: Using a correlated subquery, display employees who
-- earn more than the average salary of their own department.
-- ----------------------------------------------------------
SELECT E.ENAME, E.DEPTNO, E.SAL
FROM EMP E
WHERE E.SAL > (
    SELECT AVG(E2.SAL)
    FROM EMP E2
    WHERE E2.DEPTNO = E.DEPTNO
);


-- ----------------------------------------------------------
-- TASK 7: Display department names that currently have no
-- employees, using a subquery with NOT IN.
-- ----------------------------------------------------------
SELECT DNAME
FROM DEPT
WHERE DEPTNO NOT IN (SELECT DEPTNO FROM EMP WHERE DEPTNO IS NOT NULL);
