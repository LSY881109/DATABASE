-- 테이블의 데이터 추가하기
-- 기본 문법, 열의 순서에는 상관없음
-- INSERT INTO 테이블명 (열1,열2,...) VALUES (값1,값2,...);

-- 열 이름 생략
-- INSERT INTO 테이블명 VALUES (값1,값2,...);

-- NULL 삽입, 날짜 입력
-- INSERT INTO 테이블명 VALUES (101, '2925/05/22', SYSDATE)

-- 서브쿼리 삽입
-- INSERT INTO 테이블명 (열1, 열2)
-- SELECT 열1, 열2 FROM 다른 테이블 WHERE 조건;

-- 예시
-- 열을 지정 INSERT 
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (60, '개발부', '서울');
SELECT * FROM DEPT;

-- 열을 생략 INSERT
INSERT INTO DEPT VALUES (70, '인사부', '부산'); 
SELECT * FROM DEPT;
-- SYSDATE 삽입
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (1001, '홍길동', '사원', 7839, SYSDATE, 3000, 500, 10);
SELECT * FROM EMP;

-- 퀴즈1, 
-- DEPT 테이블에 (99, ‘AI팀’, ‘JEJU’) 데이터를 추가하시오. 
SELECT * FROM DEPT;
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (99, 'AI팀', 'JEJU');

 
-- 퀴즈2, 
-- EMP 테이블에 사번 1234, 이름 'LEE', 입사일을 SYSDATE로 추가하시오.
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (1234, 'LEE', '사원', NULL, SYSDATE, NULL, NULL, NULL);
  
-- 퀴즈3, 
-- DEPT에 NULL을 포함한 값 삽입 
SELECT * FROM DEPT;
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (100, 'NULL부서', NULL);
          

