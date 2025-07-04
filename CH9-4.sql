-- 비교할 열이 여러 개인 다중열 서브쿼리 

-- 기본문법
-- 부서번호가 10번인 사원들의 (직무, 부서번호) 조합
-- 동일한 (직무, 부서번호)를 가진 사우너을 EMP테이블에서 조회
SELECT ENAME, JOB, DEPTNO 
FROM EMP
WHERE (JOB, DEPTNO) IN (
    SELECT JOB, DEPTNO 
    FROM EMP 
    WHERE DEPTNO = 10
);

-- 직책과 부서 (직책, 부서번호) 튜플과 일치하는 사원
SELECT ENAME, JOB, DEPTNO 
FROM EMP
WHERE (JOB, DEPTNO) IN (
    SELECT JOB, DEPTNO 
    FROM EMP 
    WHERE DEPTNO = 20
);

-- (사원번호, 부서번호) 특정 목록과 일치하는 데이터 출력
SELECT EMPNO, ENAME FROM EMP
WHERE (EMPNO, DEPTNO) IN (
    SELECT EMPNO,DEPTNO FROM EMP
    WHERE SAL > 2000
);

-- (급여, 부서번호) 기준으로 특정 조건과 일치하는 사원 추출
SELECT ENAME, SAL, DEPTNO FROM EMP
WHERE (SAL, DEPTNO) IN (
    SELECT MAX(SAL), DEPTNO FROM EMP
    GROUP BY DEPTNO
);


-- 퀴즈1 WHERE (JOB, DEPTNO)
-- 20번과 30번 부서에 있는 'MANAGER'
-- 직책 사원과 동일한 (직책, 부서번호) 조합을 가진 사원 출력
SELECT ENAME, JOB, DEPTNO 
FROM EMP
WHERE(JOB, DEPTNO) IN (
SELECT JOB, DEPTNO FROM EMP
    WHERE DEPTNO IN (20, 30)
    AND JOB = 'MANAGER'
);

-- 퀴즈2 WHERE(SAL, DEPTNO)
-- 각 부서별 최저 급여를 받는 사원 출력
SELECT ENAME, SAL, DEPTNO FROM EMP
WHERE (SAL, DEPTNO) IN (
SELECT MIN(SAL), DEPTNO FROM EMP
GROUP BY DEPTNO
);


-- 퀴즈3 WWHERE ( EMPNO, DEPTNO)
-- 특정 기준 사원들과 동일한 (사원번호, 부서번호) 조합을
-- 가진 사원을 출력하되, 급여는 2000이상인 경우만 표시
SELECT ENAME, EMPNO, DEPTNO, SAL FROM EMP
WHERE (EMPNO, DEPTNO) IN (
    SELECT EMPNO,DEPTNO FROM EMP
    WHERE SAL > 2000
);












