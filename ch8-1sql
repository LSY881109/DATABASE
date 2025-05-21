--조인 사용 하기 전에 문제점 제시
--카티션 곱,
SELECT * FROM EMP; --14개
SELECT * FROM DEPT; --4개
--KING, DEPTNO 10, DNAME : ACCOUNTION,
--이거 외에 다른 부서도 또 출력이됨. 중복이됨
SELECT E.ENAME, D.DNAME --56개
FROM EMP E, DEPT D;

---------테이블 별칭 이용해서, 조인 해보기.
SELECT E.ENAME, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO ;

-- EMP와 DEPT 테이블 등가 조인하여 부서번호가 30번인
-- 사원만 출력해보기

SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.DEPTNO = 30;

--퀴즈1
-- EMP와 DEPT 테이블 조인하여 관리자(MANAGER) 직무를 가진 사원의 이름과
--부서명 출력 해보기
--별칭 : 사원명, 부서명
SELECT E.ENAME AS 사원명, E.JOB, D.DNAME AS 부서명
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND E.JOB = 'MANAGER';

--퀴즈2 - 힌트 : 같은 테이블 활용해보기
-- 각 사원의 이름과 그 사원의 직속 상관의 이름을 함께 출력해보기
--별칭 : 사원명, 직속 상관명
SELECT * FROM EMP;
SELECT E.ENAME AS 사원명, M.ENAME AS 직속_상관명
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO;


