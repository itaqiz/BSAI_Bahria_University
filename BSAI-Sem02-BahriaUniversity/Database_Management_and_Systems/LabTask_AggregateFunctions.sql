-- ==========================================================
-- NAME        : MUHAMMAD TAQUI
-- ENROLLMENT  : 01-136221-021
-- LAB TASK    : Aggregate Functions, GROUP BY, HAVING
-- ==========================================================
-- Uses the standard Oracle EMP table:
-- EMPNO | ENAME | JOB | MGR | HIREDATE | SAL | COMM | DEPTNO
-- ==========================================================


-- ----------------------------------------------------------
-- TASK 1: Find the total number of employees, and the total,
-- average, minimum, and maximum salary across the company.
-- ----------------------------------------------------------
SELECT
    COUNT(*)      AS TOTAL_EMPLOYEES,
    SUM(SAL)      AS TOTAL_SALARY,
    AVG(SAL)      AS AVG_SALARY,
    MIN(SAL)      AS MIN_SALARY,
    MAX(SAL)      AS MAX_SALARY
FROM EMP;


-- ----------------------------------------------------------
-- TASK 2: Display the number of employees and average salary
-- for each department.
-- ----------------------------------------------------------
SELECT DEPTNO, COUNT(*) AS EMP_COUNT, AVG(SAL) AS AVG_SALARY
FROM EMP
GROUP BY DEPTNO;


-- ----------------------------------------------------------
-- TASK 3: Display departments having more than 3 employees.
-- ----------------------------------------------------------
SELECT DEPTNO, COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 3;


-- ----------------------------------------------------------
-- TASK 4: Display the highest salary paid for each job role,
-- ordered from highest to lowest.
-- ----------------------------------------------------------
SELECT JOB, MAX(SAL) AS HIGHEST_SALARY
FROM EMP
GROUP BY JOB
ORDER BY HIGHEST_SALARY DESC;


-- ----------------------------------------------------------
-- TASK 5: Display department-wise average salary, but only for
-- departments whose average salary is greater than 2000.
-- ----------------------------------------------------------
SELECT DEPTNO, AVG(SAL) AS AVG_SALARY
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) > 2000;


-- ----------------------------------------------------------
-- TASK 6: Count how many employees earn commission (COMM) versus
-- how many don't.
-- ----------------------------------------------------------
SELECT
    CASE WHEN COMM IS NULL OR COMM = 0 THEN 'No Commission' ELSE 'Gets Commission' END AS COMM_STATUS,
    COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY CASE WHEN COMM IS NULL OR COMM = 0 THEN 'No Commission' ELSE 'Gets Commission' END;
