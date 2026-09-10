-- ==========================================================
-- NAME        : MUHAMMAD TAQUI
-- ENROLLMENT  : 01-136221-021
-- LAB TASK    : PL/SQL Fundamentals (Blocks, Conditions, Loops)
-- ==========================================================


-- ----------------------------------------------------------
-- TASK 1: Write a PL/SQL block that declares two numbers and
-- prints the larger of the two.
-- ----------------------------------------------------------
SET SERVEROUTPUT ON;

DECLARE
    a NUMBER := 15;
    b NUMBER := 27;
BEGIN
    IF a > b THEN
        DBMS_OUTPUT.PUT_LINE('Larger number is: ' || a);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Larger number is: ' || b);
    END IF;
END;
/


-- ----------------------------------------------------------
-- TASK 2: Write a PL/SQL block that checks whether a number
-- entered at run time is even or odd.
-- ----------------------------------------------------------
DECLARE
    num NUMBER := &INPUT_NUM;
BEGIN
    IF MOD(num, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(num || ' is Even');
    ELSE
        DBMS_OUTPUT.PUT_LINE(num || ' is Odd');
    END IF;
END;
/


-- ----------------------------------------------------------
-- TASK 3: Write a PL/SQL block using a FOR loop to print the
-- first 10 natural numbers.
-- ----------------------------------------------------------
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/


-- ----------------------------------------------------------
-- TASK 4: Write a PL/SQL block using a WHILE loop to print the
-- multiplication table of a number entered at run time.
-- ----------------------------------------------------------
DECLARE
    n NUMBER := &TABLE_NUM;
    i NUMBER := 1;
BEGIN
    WHILE i <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE(n || ' x ' || i || ' = ' || (n * i));
        i := i + 1;
    END LOOP;
END;
/


-- ----------------------------------------------------------
-- TASK 5: Write a PL/SQL block that calculates the factorial
-- of a number entered at run time.
-- ----------------------------------------------------------
DECLARE
    n NUMBER := &FACT_NUM;
    fact NUMBER := 1;
BEGIN
    FOR i IN 1..n LOOP
        fact := fact * i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Factorial of ' || n || ' is ' || fact);
END;
/


-- ----------------------------------------------------------
-- TASK 6: Write a PL/SQL block that gives every employee in
-- department 10 a 10% raise and prints their updated salary.
-- ----------------------------------------------------------
DECLARE
    CURSOR emp_cursor IS
        SELECT EMPNO, ENAME, SAL FROM EMP WHERE DEPTNO = 10;
BEGIN
    FOR emp_rec IN emp_cursor LOOP
        UPDATE EMP
        SET SAL = SAL * 1.10
        WHERE EMPNO = emp_rec.EMPNO;

        DBMS_OUTPUT.PUT_LINE(emp_rec.ENAME || ' new salary: ' || (emp_rec.SAL * 1.10));
    END LOOP;
    COMMIT;
END;
/
