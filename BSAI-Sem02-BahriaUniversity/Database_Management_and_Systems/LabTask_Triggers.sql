-- ==========================================================
-- NAME        : MUHAMMAD TAQUI
-- ENROLLMENT  : 01-136221-021
-- LAB TASK    : Database Triggers
-- ==========================================================
-- Uses the standard Oracle EMP table, plus a log table to
-- demonstrate audit-style triggers.
-- ==========================================================

CREATE TABLE EMP_AUDIT_LOG (
    LOG_ID     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    EMPNO      NUMBER,
    ACTION     VARCHAR2(10),
    OLD_SAL    NUMBER,
    NEW_SAL    NUMBER,
    ACTION_DATE DATE DEFAULT SYSDATE
);


-- ----------------------------------------------------------
-- TASK 1: Create a BEFORE INSERT trigger on EMP that prevents
-- inserting an employee with a negative salary.
-- ----------------------------------------------------------
CREATE OR REPLACE TRIGGER TRG_CHECK_SALARY
BEFORE INSERT ON EMP
FOR EACH ROW
BEGIN
    IF :NEW.SAL < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be negative.');
    END IF;
END;
/

-- Test: this should fail
-- INSERT INTO EMP (EMPNO, ENAME, JOB, SAL, DEPTNO) VALUES (9999, 'TEST', 'CLERK', -500, 10);


-- ----------------------------------------------------------
-- TASK 2: Create an AFTER UPDATE trigger on EMP that logs every
-- salary change into EMP_AUDIT_LOG.
-- ----------------------------------------------------------
CREATE OR REPLACE TRIGGER TRG_LOG_SALARY_UPDATE
AFTER UPDATE OF SAL ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO EMP_AUDIT_LOG (EMPNO, ACTION, OLD_SAL, NEW_SAL)
    VALUES (:OLD.EMPNO, 'UPDATE', :OLD.SAL, :NEW.SAL);
END;
/

-- Test the trigger
UPDATE EMP SET SAL = SAL + 100 WHERE EMPNO = 7521;
SELECT * FROM EMP_AUDIT_LOG;


-- ----------------------------------------------------------
-- TASK 3: Create an AFTER DELETE trigger on EMP that logs
-- deleted employee records into EMP_AUDIT_LOG.
-- ----------------------------------------------------------
CREATE OR REPLACE TRIGGER TRG_LOG_DELETE
AFTER DELETE ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO EMP_AUDIT_LOG (EMPNO, ACTION, OLD_SAL, NEW_SAL)
    VALUES (:OLD.EMPNO, 'DELETE', :OLD.SAL, NULL);
END;
/


-- ----------------------------------------------------------
-- TASK 4: Create a BEFORE INSERT trigger that automatically
-- converts the employee name to uppercase before saving.
-- ----------------------------------------------------------
CREATE OR REPLACE TRIGGER TRG_UPPER_ENAME
BEFORE INSERT ON EMP
FOR EACH ROW
BEGIN
    :NEW.ENAME := UPPER(:NEW.ENAME);
END;
/


-- ----------------------------------------------------------
-- TASK 5: Disable and then re-enable the salary-check trigger,
-- and finally drop all triggers created above (cleanup).
-- ----------------------------------------------------------
ALTER TRIGGER TRG_CHECK_SALARY DISABLE;
ALTER TRIGGER TRG_CHECK_SALARY ENABLE;

DROP TRIGGER TRG_CHECK_SALARY;
DROP TRIGGER TRG_LOG_SALARY_UPDATE;
DROP TRIGGER TRG_LOG_DELETE;
DROP TRIGGER TRG_UPPER_ENAME;
