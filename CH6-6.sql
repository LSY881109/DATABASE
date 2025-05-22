-- NVL, NVL2 함수 기본 예시

-- 급여가 NULL 이면 0으로 대체
SELECT ENAME, NVL(COMM, 0) AS "수당"
FROM EMP;
SELECT ENAME, JOB, COMM, NVL(COMM, 0) AS "수당"
FROM EMP;

-- 커미션이 있으면 '0' , 없으면 'X'
SELECT ENAME, NVL2(COMM,'0', 'X') AS "NVL2 함수"
FROM EMP;


--퀴즈1
--EMP 테이블에서 커미션이 있는 직원 'O', 나머지는 'X' 표시하고 NVL2 로 표기
--별칭 "수당여부"
SELECT ENAME, COMM, NVL2(COMM, 'O', 'X') AS "수당여부"
FROM EMP;

--전체 급여 계산해보기, NVL이용해서 NULL인 경우, 0으로 해서 계산 해보기
--별칭 "전체 급여"

SELECT COMM, SAL *12 +NVL(COMM, 0) AS "전체 급여" FROM EMP;

--위 두가지를 묶어서 한번에 표기
SELECT ENAME, COMM, NVL2(COMM, 'O', 'X') AS "수당여부",
SAL * 12 + NVL(COMM, 0) AS "전체급여"
FROM EMP;



