--BAI 1
--1
--A
CREATE TABLE CAU1(
    ID NUMBER(10),
    NAME VARCHAR2(20)
);
--B
CREATE SEQUENCE CAU1SEQ 
START WITH 1
INCREMENT BY 5;

--C, D
--C1
DECLARE 
    V_NAME CAU1.NAME%TYPE;
    V_ID CAU1.ID%TYPE;
    CURSOR CURSOR_D IS SELECT S.STUDENTID, S.FIRSTNAME FROM ENROLLMENT E JOIN STUDENT S ON E.STUDENTID = S.STUDENTID
    GROUP BY S.STUDENTID, S.FIRSTNAME
    ORDER BY COUNT(*) DESC
    FETCH FIRST 1 ROW WITH TIES;
BEGIN
    OPEN CURSOR_D;
    LOOP
        FETCH CURSOR_D INTO V_ID, V_NAME;
        EXIT WHEN CURSOR_D%NOTFOUND;
        INSERT INTO CAU1 VALUES (CAU1SEQ.NEXTVAL, V_NAME);
    END LOOP;
    CLOSE CURSOR_D;
END;
--D

BEGIN
    FOR RES IN (SELECT S.STUDENTID, S.FIRSTNAME FROM ENROLLMENT E JOIN STUDENT S ON E.STUDENTID = S.STUDENTID
    GROUP BY S.STUDENTID, S.FIRSTNAME
    ORDER BY COUNT(*) DESC
    FETCH FIRST 1 ROW WITH TIES)
    LOOP
        INSERT INTO CAU1 VALUES(CAU1SEQ.NEXTVAL, RES.FIRSTNAME);
    END LOOP;
END;
SAVEPOINT A;
--E
BEGIN
    FOR RES IN (SELECT S.STUDENTID, S.FIRSTNAME FROM ENROLLMENT E JOIN STUDENT S ON E.STUDENTID = S.STUDENTID
    GROUP BY S.STUDENTID, S.FIRSTNAME
    ORDER BY COUNT(*) ASC
    FETCH FIRST 1 ROW WITH TIES)
    LOOP
        INSERT INTO CAU1 VALUES(CAU1SEQ.NEXTVAL, RES.FIRSTNAME);
    END LOOP;
END;
SAVEPOINT B;
--F
BEGIN
    FOR RES IN (SELECT I.INSTRUCTORID, I.FIRSTNAME FROM INSTRUCTOR I JOIN CLASS C ON I.INSTRUCTORID = C.INSTRUCTORID 
    GROUP BY I.INSTRUCTORID, I.FIRSTNAME
    ORDER BY COUNT(*) DESC
    FETCH FIRST 1 ROW WITH TIES)
    LOOP
        INSERT INTO CAU1 VALUES(CAU1SEQ.NEXTVAL, RES.FIRSTNAME);
    END LOOP;
END;

SAVEPOINT C;

--G
SET SERVEROUTPUT ON;
DECLARE 
    V_ID INSTRUCTOR.INSTRUCTORID%TYPE;
    V_NAME INSTRUCTOR.FIRSTNAME%TYPE;
BEGIN
    SELECT INSTRUCTORID, FIRSTNAME INTO V_ID, V_NAME FROM INSTRUCTOR WHERE INSTRUCTORID = 101;
    DBMS_OUTPUT.PUT_LINE(V_NAME);
END;

--H

--2
DECLARE
    MASV STUDENT.STUDENTID%TYPE;
    HO STUDENT.FIRSTNAME%TYPE;
    TEN STUDENT.LASTNAME%TYPE;
    DIACHI STUDENT.ADDRESS%TYPE;
    DEM INT;
BEGIN
    MASV := &MASV;
    SELECT COUNT(*) INTO DEM FROM STUDENT WHERE STUDENTID = MASV;
    IF(DEM > 0) THEN
        SELECT FIRSTNAME, LASTNAME INTO TEN, HO FROM STUDENT
        WHERE STUDENTID = MASV;
        SELECT COUNT(*) INTO DEM FROM ENROLLMENT
        WHERE STUDENTID = MASV;
        DBMS_OUTPUT.PUT_LINE(HO || '  '|| TEN || '  ' || DEM);
   ELSIF (DEM = 0) THEN
      HO := '&HO';
      TEN := '&TEN';
      DIACHI := '&DIACHI';
      INSERT INTO STUDENT(STUDENTID, FIRSTNAME, LASTNAME, ADDRESS)VALUES (MASV, HO, TEN, DIACHI);
    END IF;
END;



