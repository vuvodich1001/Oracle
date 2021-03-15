CREATE TABLE EMPLOYEE(
    EMPNO NUMBER(5),
    EMPNAME VARCHAR2(30),
    BIRTHDADY DATE,
    DEPTNO NUMBER(5),
    MGRNO NUMBER(5) NOT NULL,
    STARTDATE DATE,
    SALARY NUMBER(10),
    LEVEL_V NUMBER(5),
    STATUS NUMBER(5),
    NOTE LONG,
    CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMPNO),
    CONSTRAINT CHK_LEVEL CHECK(LEVEL_V BETWEEN 1 AND 7),
    CONSTRAINT CHK_STATUS CHECK(STATUS IN ('0', '1', '2'))
);

CREATE SEQUENCE SEQ_SKILL 
START WITH 1 INCREMENT BY 1;
CREATE TABLE SKILL(
    SKILLNO NUMBER(5),
    SKILLNAME VARCHAR2(10),
    NOTE LONG, 
    CONSTRAINT PK_SKILL PRIMARY KEY(SKILLNO)
);

CREATE TABLE EMP_SKILL(
    SKILLNO NUMBER(5),
    EMPNO NUMBER(5),
    SKILLEVEL NUMBER(5),
    REGDATE DATE,
    DESCRIPTION LONG,
    CONSTRAINT PK_EMP_SKILL PRIMARY KEY(SKILLNO, EMPNO),
    CONSTRAINT FK_SKILLNO FOREIGN KEY(SKILLNO) REFERENCES SKILL(SKILLNO),
    CONSTRAINT FK_EMPNO FOREIGN KEY(EMPNO) REFERENCES EMPLOYEE(EMPNO)
);

CREATE SEQUENCE SEQ_DEPTNO 
START WITH 1 INCREMENT BY 1;
CREATE TABLE DEPARTMENT(
    DEPTNO NUMBER(5),
    DEPTNAME VARCHAR2(30),
    NOTE LONG,
    CONSTRAINT PK_DEPARTMENT PRIMARY KEY(DEPTNO)
);

-- 2
-- A
ALTER TABLE EMPLOYEE
ADD EMALI VARCHAR2(30) UNIQUE;
-- B
ALTER TABLE EMPLOYEE
MODIFY MGRNO DEFAULT 0;

--3
-- A
ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EMPLOYEE_DEPTNO
FOREIGN KEY(DEPTNO) REFERENCES DEPARTMENT(DEPTNO);

-- B
ALTER TABLE EMP_SKILL
DROP COLUMN DESCRIPTION;

-- 4
-- A
--INSERT VAO TABLE DEPARTMENT
INSERT INTO DEPARTMENT(DEPTNO, DEPTNAME, NOTE) VALUES(SEQ_DEPTNO.NEXTVAL, 'THUONG MAI', '');
INSERT INTO DEPARTMENT(DEPTNO, DEPTNAME, NOTE) VALUES(SEQ_DEPTNO.NEXTVAL, 'DIEN TU', '');
INSERT INTO DEPARTMENT(DEPTNO, DEPTNAME, NOTE) VALUES(SEQ_DEPTNO.NEXTVAL, 'CHUNG KHOAN', '');
INSERT INTO DEPARTMENT(DEPTNO, DEPTNAME, NOTE) VALUES(SEQ_DEPTNO.NEXTVAL, 'TAI CHINH', '');
INSERT INTO DEPARTMENT(DEPTNO, DEPTNAME, NOTE) VALUES(SEQ_DEPTNO.NEXTVAL, 'BAT DONG SAN', '');

--INSERT VAO TABLE EMPLOYEE
INSERT INTO EMPLOYEE(EMPNO, EMPNAME, BIRTHDADY, DEPTNO, MGRNO, STARTDATE, SALARY, LEVEL_V, STATUS, NOTE)
VALUES(1, 'NGUYEN VAN A', TO_DATE('01/01/2000', 'DD/MM/YYYY'), 1, 1, TO_DATE('2/2/2001', 'DD/MM/YYYY'), 30000, 3, 1, '');
INSERT INTO EMPLOYEE(EMPNO, EMPNAME, BIRTHDADY, DEPTNO, MGRNO, STARTDATE, SALARY, LEVEL_V, STATUS, NOTE)
VALUES(2, 'NGUYEN VAN B', TO_DATE('1/1/2010', 'DD/MM/YYYY'), 1, 1, TO_DATE('2/2/2001', 'DD/MM/YYYY'), 40000, 4, 1, '');
INSERT INTO EMPLOYEE(EMPNO, EMPNAME, BIRTHDADY, DEPTNO, MGRNO, STARTDATE, SALARY, LEVEL_V, STATUS, NOTE)
VALUES(3, 'NGUYEN VAN C', TO_DATE('1/1/2006', 'DD/MM/YYYY'), 1, 1, TO_DATE('2/2/2001', 'DD/MM/YYYY'), 50000, 7, 1, '');
INSERT INTO EMPLOYEE(EMPNO, EMPNAME, BIRTHDADY, DEPTNO, MGRNO, STARTDATE, SALARY, LEVEL_V, STATUS, NOTE)
VALUES(4, 'NGUYEN THI D', TO_DATE('1/1/2001', 'DD/MM/YYYY'), 1, 1, TO_DATE('2/2/2001', 'DD/MM/YYYY'), 30000, 1, 1, '');
INSERT INTO EMPLOYEE(EMPNO, EMPNAME, BIRTHDADY, DEPTNO, MGRNO, STARTDATE, SALARY, LEVEL_V, STATUS, NOTE)
VALUES(5, 'NGUYEN VAN E', TO_DATE('1/1/2007', 'DD/MM/YYYY'), 1, 1, TO_DATE('2/2/2001', 'DD/MM/YYYY'), 80000, 5, 1, '');

--INSERT VAO TABLE SKILL
INSERT INTO SKILL(SKILLNO, SKILLNAME, NOTE) VALUES(SEQ_SKILL.NEXTVAL, 'CODE', '');
INSERT INTO SKILL(SKILLNO, SKILLNAME, NOTE) VALUES(SEQ_SKILL.NEXTVAL, 'EXECL', '');
INSERT INTO SKILL(SKILLNO, SKILLNAME, NOTE) VALUES(SEQ_SKILL.NEXTVAL, 'WORD', '');
INSERT INTO SKILL(SKILLNO, SKILLNAME, NOTE) VALUES(SEQ_SKILL.NEXTVAL, 'PP', '');
INSERT INTO SKILL(SKILLNO, SKILLNAME, NOTE) VALUES(SEQ_SKILL.NEXTVAL, 'ACESS', '');

--INSERT VAO TABLE EMP_SKILL
INSERT INTO EMP_SKILL(SKILLNO, EMPNO, SKILLEVEL, REGDATE) VALUES(1, 1, 1 , TO_DATE('1/8/1990', 'DD/MM/YYYY'));
INSERT INTO EMP_SKILL(SKILLNO, EMPNO, SKILLEVEL, REGDATE) VALUES(2, 1, 1 , TO_DATE('1/5/1991', 'DD/MM/YYYY'));
INSERT INTO EMP_SKILL(SKILLNO, EMPNO, SKILLEVEL, REGDATE) VALUES(3, 1, 1 , TO_DATE('1/4/1992', 'DD/MM/YYYY'));
INSERT INTO EMP_SKILL(SKILLNO, EMPNO, SKILLEVEL, REGDATE) VALUES(4, 1, 1 , TO_DATE('1/2/1993', 'DD/MM/YYYY'));
INSERT INTO EMP_SKILL(SKILLNO, EMPNO, SKILLEVEL, REGDATE) VALUES(5, 1, 1 , TO_DATE('1/1/1995', 'DD/MM/YYYY'));

-- B
CREATE VIEW EMPLOYEE_TRACKING AS
SELECT EMPNO, EMPNAME FROM EMPLOYEE WHERE LEVEL_V BETWEEN 3 AND 5;

