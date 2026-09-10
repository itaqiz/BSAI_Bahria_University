-- ==========================================================
-- NAME        : MUHAMMAD TAQUI
-- ENROLLMENT  : 01-136221-021
-- LAB TASK    : Substitution Variables, Date/Time Functions,
--               Dynamic ORDER BY, Formatting (Employee Table - EMP)
-- ==========================================================
-- Uses the standard Oracle EMP table:
-- EMPNO | ENAME | JOB | MGR | HIREDATE | SAL | COMM | DEPTNO
-- ==========================================================


-- ----------------------------------------------------------
-- TASK 1: Display the records of the Employee table based on
-- Employee No. Prompt for the Employee No. at run time.
-- (Execute at least 5 times with different empno values)
-- ----------------------------------------------------------
SELECT * FROM EMP WHERE EMPNO = &EMPLOYEE_NO;

-- Sample runs:
--   Run 1: EMPLOYEE_NO = 7521
--   Run 2: EMPLOYEE_NO = 7839
--   Run 3: EMPLOYEE_NO = 7934
--   Run 4: EMPLOYEE_NO = 7369
--   Run 5: EMPLOYEE_NO = 7900


-- ----------------------------------------------------------
-- TASK 2: Show all records of the Employee table filtered by
-- EmpName. The Employee name is entered by user at run time.
-- (Run at least 4 times with different values)
-- ----------------------------------------------------------
SELECT * FROM EMP WHERE ENAME = '&EMP_NAME';

-- Sample runs:
--   Run 1: EMP_NAME = 'JAMES'
--   Run 2: EMP_NAME = 'SMITH'
--   Run 3: EMP_NAME = 'ALLEN'
--   Run 4: EMP_NAME = 'MILLER'


-- ----------------------------------------------------------
-- TASK 3: Show empno, name and designation of employees whose
-- hiredate falls between two dates entered by the user at run time.
-- (Execute at least 3 times with different dates)
-- ----------------------------------------------------------
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE HIREDATE BETWEEN TO_DATE('&START_DATE', 'DD-MON-YY')
                    AND TO_DATE('&END_DATE', 'DD-MON-YY');

-- Sample runs:
--   Run 1: START_DATE = 01-JAN-81, END_DATE = 31-DEC-81
--   Run 2: START_DATE = 01-JAN-82, END_DATE = 31-DEC-82
--   Run 3: START_DATE = 01-JAN-80, END_DATE = 31-DEC-87


-- ----------------------------------------------------------
-- TASK 4: Display the employee record hired on a specific date.
-- The hiredate is entered by user at run time in
-- "12th December 2014" format.
-- ----------------------------------------------------------
SELECT * FROM EMP WHERE HIREDATE = TO_DATE('&HIRE_DATE', 'DDth Month YYYY');

-- Example run: HIRE_DATE = 12th December 2014


-- ----------------------------------------------------------
-- TASK 5: Display record of all employees sorted by any column.
-- The column_name is entered by the user at run time.
-- ----------------------------------------------------------
SELECT * FROM EMP ORDER BY &COLUMN_NAME;

-- Sample runs:
--   Run 1: COLUMN_NAME = SAL
--   Run 2: COLUMN_NAME = ENAME
--   Run 3: COLUMN_NAME = HIREDATE


-- ----------------------------------------------------------
-- TASK 6: Display the record of any table (entered by user) and
-- sort by any column (entered by user). Table name should be
-- prompted once per session (double ampersand) while the sort
-- column must be entered every time the query runs.
-- ----------------------------------------------------------
SELECT * FROM &&TABLE_NAME ORDER BY &COLUMN_NAME;

-- &&TABLE_NAME is defined once per session (e.g. EMP)
-- &COLUMN_NAME must be supplied on every execution
-- To clear the session-defined table name, run: UNDEFINE TABLE_NAME


-- ----------------------------------------------------------
-- TASK 7: Display the current date and time of the database
-- server machine.
-- Expected format: 28th September 2014, 15:26:09
-- ----------------------------------------------------------
SELECT TO_CHAR(SYSDATE, 'fmDDth Month YYYY, HH24:MI:SS') AS CURRENT_DATE_TIME
FROM DUAL;


-- ----------------------------------------------------------
-- TASK 8: Show the system time in three different columns with
-- different formats and aliases:
--   12hrsPM      24hrs         12hrspm
--   03:26:09 PM  15.26.09      03-26-09 pm
-- ----------------------------------------------------------
SELECT
    TO_CHAR(SYSDATE, 'HH:MI:SS AM')  AS "12hrsPM",
    TO_CHAR(SYSDATE, 'HH24.MI.SS')   AS "24hrs",
    TO_CHAR(SYSDATE, 'HH-MI-SS am')  AS "12hrspm"
FROM DUAL;


-- ----------------------------------------------------------
-- TASK 9: Display hiredate and time of all employees in eight
-- different columns with aliases:
-- DATE MONTH YEAR DAY DY HOUR MIN SEC AM/PM
-- e.g. 12-sep-14 10:15:52 am -> 12 SEPTEMBER 2014 FRIDAY FRI 10 15 52 AM
-- ----------------------------------------------------------
SELECT
    TO_CHAR(HIREDATE, 'DD')       AS "DATE",
    TO_CHAR(HIREDATE, 'MONTH')    AS "MONTH",
    TO_CHAR(HIREDATE, 'YYYY')     AS "YEAR",
    TO_CHAR(HIREDATE, 'DAY')      AS "DAY",
    TO_CHAR(HIREDATE, 'DY')       AS "DY",
    TO_CHAR(HIREDATE, 'HH12')     AS "HOUR",
    TO_CHAR(HIREDATE, 'MI')       AS "MIN",
    TO_CHAR(HIREDATE, 'SS')       AS "SEC",
    TO_CHAR(HIREDATE, 'AM')       AS "AM/PM"
FROM EMP;

-- Note: EMP.HIREDATE typically stores only the date portion (no time
-- component), so HOUR/MIN/SEC will show 00 unless the column also
-- stores a time value.


-- ----------------------------------------------------------
-- TASK 10: Display the salary in words for all employees.
-- e.g. 8547 -> "eight thousand four hundred and forty seven"
-- ----------------------------------------------------------
SELECT
    EMPNO,
    ENAME,
    SAL,
    TRIM(TO_CHAR(TO_DATE(SAL, 'J'), 'JSP')) AS SALARY_IN_WORDS
FROM EMP;

-- TO_DATE(SAL,'J') converts the numeric salary into a "Julian day"
-- date value, and the 'JSP' format then spells that number out in words.
