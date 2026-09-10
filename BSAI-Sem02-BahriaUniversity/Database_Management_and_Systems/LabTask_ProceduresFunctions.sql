-- ==========================================================
-- NAME        : MUHAMMAD TAQUI
-- ENROLLMENT  : 01-136221-021
-- LAB TASK    : Stored Procedures and Functions
-- ==========================================================
-- Uses the standard Oracle EMP table
-- ==========================================================


-- ----------------------------------------------------------
-- TASK 1: Create a procedure that accepts an employee number
-- and displays the employee's name and salary.
-- ----------------------------------------------------------
CREATE OR REPLACE PROCEDURE GET_EMP_DETAILS (p_empno IN NUMBER) IS
    v_name EMP.ENAME%TYPE;
    v_sal  EMP.SAL%TYPE;
BEGIN
    SELECT ENAME, SAL INTO v_name, v_sal
    FROM EMP
    WHERE EMPNO = p_empno;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Salary: ' || v_sal);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with EMPNO = ' || p_empno);
END;
/

-- Execute the procedure
SET SERVEROUTPUT ON;
EXEC GET_EMP_DETAILS(7521);
EXEC GET_EMP_DETAILS(7934);


-- ----------------------------------------------------------
-- TASK 2: Create a procedure that gives a raise to an employee
-- given the empno and raise percentage.
-- ----------------------------------------------------------
CREATE OR REPLACE PROCEDURE GIVE_RAISE (
    p_empno IN NUMBER,
    p_percent IN NUMBER
) IS
BEGIN
    UPDATE EMP
    SET SAL = SAL + (SAL * p_percent / 100)
    WHERE EMPNO = p_empno;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with EMPNO = ' || p_empno);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary updated for EMPNO = ' || p_empno);
        COMMIT;
    END IF;
END;
/

EXEC GIVE_RAISE(7521, 10);


-- ----------------------------------------------------------
-- TASK 3: Create a function that accepts a department number
-- and returns the total number of employees in it.
-- ----------------------------------------------------------
CREATE OR REPLACE FUNCTION COUNT_EMP_IN_DEPT (p_deptno IN NUMBER)
RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM EMP
    WHERE DEPTNO = p_deptno;

    RETURN v_count;
END;
/

-- Test the function
SELECT COUNT_EMP_IN_DEPT(10) AS EMP_COUNT_DEPT10 FROM DUAL;

DECLARE
    v_total NUMBER;
BEGIN
    v_total := COUNT_EMP_IN_DEPT(20);
    DBMS_OUTPUT.PUT_LINE('Employees in Dept 20: ' || v_total);
END;
/


-- ----------------------------------------------------------
-- TASK 4: Create a function that accepts an employee number and
-- returns 'High', 'Medium', or 'Low' based on their salary.
-- ----------------------------------------------------------
CREATE OR REPLACE FUNCTION SALARY_CATEGORY (p_empno IN NUMBER)
RETURN VARCHAR2 IS
    v_sal EMP.SAL%TYPE;
BEGIN
    SELECT SAL INTO v_sal FROM EMP WHERE EMPNO = p_empno;

    IF v_sal >= 3000 THEN
        RETURN 'High';
    ELSIF v_sal >= 1500 THEN
        RETURN 'Medium';
    ELSE
        RETURN 'Low';
    END IF;
END;
/

SELECT EMPNO, ENAME, SAL, SALARY_CATEGORY(EMPNO) AS CATEGORY
FROM EMP;


-- ----------------------------------------------------------
-- TASK 5: Drop the procedures and functions created above
-- (cleanup).
-- ----------------------------------------------------------
DROP PROCEDURE GET_EMP_DETAILS;
DROP PROCEDURE GIVE_RAISE;
DROP FUNCTION COUNT_EMP_IN_DEPT;
DROP FUNCTION SALARY_CATEGORY;
