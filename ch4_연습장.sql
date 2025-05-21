select * from dept;
select * from emp;
select * from salgrade;
desc emp;
desc dept;
desc salgrade;

--오라클 sql developer 에서 주석은(--) 입니다.
--행 기준으로 검색, where 조건 이용
select * from emp;
select * from emp where job = 'MANAGER';

-- 열기준으로 프로젝션, 보고 싶은 열만 선택해서 조회해보기
select ename, job from emp where job = 'MANAGER';
select ename, job from emp;


--기본 퀴즈1
--셀력션 - 'SALES' 부서 소속 직원만 조회
--select * from dept;
select * from emp where deptno ='30';
--기본 퀴즈2
--프로젝션 - 사원명과 입사일만 조회
select ename, HIREDATE from emp;

--급여가 3000 이상인 직원만 조회
select * from emp where sal >= '3000';

--EMP 테이블에서 이름(ename), 급어(sal), 부서번호(deptno)만 조회 해보기

select ename, sal, deptno from emp;

----------------------------------------------------------------------

--DISTINCT 중복 제거

select distinct job from emp;

--all, 중복 포함
select all job from emp;
select job from emp;

--직무 + 부서 번호 조합의 고유 데이터 추출
--job 직무, 부서 번호 조합의 중복 되지 않는 행만 조회. 
--결론, 동인한 직무와 동일한 부서 번호를 가진 직원이
--여려명 있어도 한번만 결과에 나타남. 
--주의사항
--1 DISTINCT는 select 문 뒤에 위치를 하고
--2 하나의 컬럼에 적용 되는게 아니라, 예씨
--2 개의 컬럼이 하나처럼

select DISTINCT job, deptno from emp;
select job, deptno from emp;

--퀴즈1
--EMP 테이블에서 중복되지 않는 부서번호만 출력하기
select DISTINCT deptno from emp;

--퀴즈2
--EMP 테이블에서 사원 직무와 부서 번호 조합이 고유한 결과 한번더 해보기
select DISTINCT job, deptno from emp;

--퀴즈3
--EMP 테이블에서 중복을 제거하지 않고 사원 직무와 부서 번호를 모두 출력하기
--ALL 키워드 이용해보기
select all job, deptno from emp;


--ALUAS 별칭 사용해보기
SELECT ENAME AS "사원명" FROM EMP;

SELECT ENAME AS "직원 이름" FROM EMP;
--SELECT ENAME "직원 이름" FROM EMP;

SELECT ENAME AS "사원명" , SAL * 12 AS "연봉" FROM EMP;

--퀴즈1
--EMP 테이블에서 사원이름이 '각자 정하고 싶은 '이름' 별칭을 부여해서 출력하기
SELECT ENAME AS "A팀" FROM EMP;

--퀴즈2
--EMP 테이블에서 급여(SAL)를 연봉으로 계산해서 출력해보기 한번더
SELECT ENAME AS "A팀" , SAL *12 AS "연봉" FROM EMP;

--퀴즈3
--사원명과 직무를 각각 '사원이름', '직무'로 출력해보기
SELECT ENAME AS "사원이름", JOB AS "직무" FROM EMP;

-퀴즈4
--사원명과 급여, 그리고(COMM)이 있을경우 총 수입을 계산하기, 출력 별칭은
--"총 급여"로 지정해서 출력.
--특정 옵션 함수
--NVL(COMM, 0) : CONM 있으면, COMM 값으로 출력
--NVL(COMM, 0) : COMM 없으면, 0 값으로 출력,
--NVL의미 : N(NULL) 값이 없음
--V (Valeu) : 값
--L (Logic) null 값을 처리하기 위한 로직

SELECT ENAME AS"이름", SAL "급여",COMM AS 커미션, SAL + NVL(COMM, 0) AS "총 급여" FROM EMP;

select ename as "사원명", sal "기본급", sal * 12 + NVL(COMM, 0) as "총급여" from emp; 



-- order by 컬럼명 desc(asc 기본)
select ename as "사원명", sal as "기본급",
sal * 12 + NVL(COMM,0) AS "총 급여" FROM EMP
order by sal desc;

select ename as "사원명", sal as "기본급",
sal * 12 + NVL(COMM,0) AS "총 급여" FROM EMP
order by sal asc;


select * from emp;
SELECT * FROM EMP ORDER BY SAL DESC;

--열 인덱스로 정렬하기
select ename, job , sal from emp order by 3 desc;

--시간은 최신일 값으로 하면 큰값
--과거 일수록 값으로 하면 작은 값.

--emp 테이블에서 모든 사원의 입사일 기준으로 최신순으로 정렬해보기.
select * from emp order by hiredate desc;

SELECT * FROM EMP ORDER BY SAL; --오름 차순
SELECT * FROM EMP ORDER BY SAL DESC; --내림 차순

--퀴즈1 
--커미션이 높은 순으로, 급여가 낮은 순으로 정렬
--특정 컬럼 언급 없으면 모든 컬럼 출력.
select * from emp order by comm desc, sal asc;

--퀴즈2
--emp 테이블에서 이름, 부서번호, 급여를 출력 하되 급여가 높은 순으로 정렬해보기 
select ename, deptno, sal from emp order by sal desc;

--퀴즈3
--salgrade 테이블에서 급여 등급(grade)을 오름차순,
--최고 급여 (hisal) 내림 차순으로 정렬
select * from salgrade order by grade asc, hisal desc;

--where기본 문법 확인
--where 조건식(true) 일 경우의 행만 출력
--부서 번호가 30인 경우
select * from emp where deptno = 30;

-- 직무(job)가 'SALESMAN'인 사원 조회
select * from emp where job = 'SALESMAN';

--퀴즈
--급여가(sal) 2000이상인 사원만 조회하기.
select * from emp where sal >= 2000 order by sal;

--퀴즈2
--입사일(hiredate)이 '1981-2-20' 이후인 사원만 조회하기
--날짜가 이후이면, 값으로 치면 큰값 최신이다.
select * from emp where hiredate > '1981-2-20'
order by hiredate asc;
--퀴즈3
--부서 번호가 10이 아닌 사원만 조회 하기.
--아니다는 표현은 일단은 '<>'로 표현 하기.
select * from emp where deptno <> 10;

select * from emp where deptno ! =10;

--5-2 and, or 논리 조건, 다중 조건

--부서가 30번이고 직무가 SALESMAN인 사원만 조회됩니다. and
--모든 조건을 동시에 만족해야 결과에 포함됩니다.
SELECT * FROM EMP WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

--직무가 CLERK이거나 MANAGER인 사원 모두 조회됩니다. or
--하나라도 만족하면 결과에 포함됩니다.
SELECT * FROM EMP WHERE JOB = 'CLERK' OR JOB = 'MANAGER';

--괄호 없는 경우
--AND가 OR보다 우선순위가 높습니다.
--괄호 있는 경우
--괄호 안의 조건이 먼저 계산됩니다.
SELECT * FROM EMP WHERE (DEPTNO = 10 OR DEPTNO = 20) AND SAL > 2000;


-- 퀴즈1 
-- 급여가 1500 이상이고, 
-- 커미션이 NULL 이 아닌 사원만 조회
-- 힌트) NULL 이 아닌 표현 : IS NOT NULL
select * from emp where sal >= 1500 and comm is not null;

-- 퀴즈2
-- 직무가 'SALESMAN'이거나 급여가 3000이상인 사원 출력
select * from emp where job = 'SALESMAN' or sal >= 3000;

-- 퀴즈3
-- 부서번호가 10,20,30 중 하나이고, 
-- 급여가 2000 이상인 사원 출력
-- 힌트) 10,20,30 중 하나 표현 : IN (10, 20, 30) 이용
select * from emp where deptno in (10,20,30) and sal >=2000;

-- 5-3 연산자 종류와 활용 기본 
-- 산술 연산자 
SELECT ENAME, SAL * 12 AS "기본 연봉" FROM EMP;

-- 비교 연산자 
SELECT * FROM EMP WHERE SAL >= 2000;

-- 문자 비교 ( 1글자 VS 여러글자)
-- L 보다 뒤에 , 사전식 기준 생각하기
SELECT * FROM EMP WHERE ENAME > 'L';
-- 여러 글자 , 순서대로 앞의 글자 비교하고 다음글자 비교
SELECT * FROM EMP WHERE ENAME < 'MILLER';

-- 등가 비교 연산자 
-- !=, <>, ^=
-- JOB CLERK 이 아닌 사원만 출력 해보기 
SELECT * FROM EMP WHERE JOB != 'CLERK';
SELECT * FROM EMP WHERE JOB <> 'CLERK';
SELECT * FROM EMP WHERE JOB ^= 'CLERK';

-- NOT 연산자 
-- JOB 이 MANAGER 가 아닌 사원만 출력 해보기 
SELECT * FROM EMP WHERE NOT JOB = 'MANAGER';

-- IN 연산자 (NOT 포함 버전)
-- OR을 간결히 사용하기, 
-- 컬럼명 IN (값1,값2,값3,...)
-- 컬럼의 값이 IN 연산자 안의 값을 만족하면 TRUE 
-- 부서 번호가 10, 30 이 아닌 사원을 출력 해보기. 
SELECT * FROM EMP WHERE DEPTNO NOT IN (10,30);

-- BETWEEN A AND B 
-- 급여가 1100 이상 3000 이하 인 사원 출력 해보기 
SELECT * FROM EMP WHERE SAL BETWEEN 1100 AND 3000;

-- 위의 경우의 반대인 경우 
SELECT * FROM EMP WHERE SAL NOT BETWEEN 1100 AND 3000;

-- LIKE 연산자 
-- 컬러명 LIKE '조건식'
-- % : 모든 글자 
-- (_)언더바 : 특정 글자 수
-- 사원명이 S로 시작하는 사원 출력 해보기 
SELECT * FROM EMP WHERE ENAME LIKE 'S%';

--사원명이 두 번째 글자가 L을 포함하는 사원 출력하기
SELECT * FROM EMP WHERE ENAME LIKE '_L%';

-- 사원명이 AM 글자를 포함하는 사원 출력하기
SELECT * FROM EMP WHERE ENAME LIKE '%AM%';

--위의 경우, 반대
SELECT * FROM EMP WHERE ENAME NOT LIKE '%AM%';

-- IS NULL 널 조건이니? 
-- IS NOT NULL 널이 아닌 조건이니?
-- 커미션이 널인 사원만 출력하기 
SELECT * FROM EMP WHERE COMM IS NULL;
-- 위의 경우 반대인 경우 
SELECT * FROM EMP WHERE COMM IS NOT NULL;

-- AND + IS NULL 
-- JOB 가 SALESMAN 이고 COMM 이 널 인 사원만 출력
SELECT * FROM EMP 
WHERE JOB = 'SALESMAN'
AND COMM IS NULL;

-- 위의 경우 반대 
SELECT * FROM EMP 
WHERE JOB = 'SALESMAN'
AND COMM IS NOT NULL;

-- OR + IS NULL 
-- JOB MANAGER 이거나 
-- MGR(직속상관)이 NULL 인 사원 출력하기
SELECT * FROM EMP WHERE JOB = 'MANAGER'
OR 
MGR IS NULL;

-- 집합 연산자 
-- 1 UNION 중복 제거 
-- JOB MANAGER 이거나 ,  DEPTNO 10인 사원 출력하기 
SELECT ENAME,JOB,DEPTNO FROM EMP WHERE JOB = 'MANAGER'
UNION 
SELECT ENAME,JOB,DEPTNO FROM EMP WHERE DEPTNO = 10;
-- CLARK 중복이 되어서 출력이 안됨

-- 2 UNION ALL 중복 포함
-- JOB MANAGER 이거나 ,  DEPTNO 10인 사원 출력하기 
SELECT ENAME,JOB,DEPTNO FROM EMP WHERE JOB = 'MANAGER'
UNION ALL
SELECT ENAME,JOB,DEPTNO FROM EMP WHERE DEPTNO = 10;
-- CLARK 중복이 되어서 출력이 됨

-- 3 MINUS (차집합)
-- 부서 번호가 10인 사원들 중에서 
-- 직무가 MANAGER 인 사원을 제외한 모든 사원 출력하기. 
SELECT ENAME,JOB,DEPTNO FROM EMP 
WHERE DEPTNO = 10
MINUS 
SELECT ENAME,JOB,DEPTNO FROM EMP 
WHERE JOB = 'MANAGER';

--4 INTERSECT (교집합)
-- JOB CLERK 이면서 동시에, 부서번호가 20인 사원 SELECT ENAME,JOB,DEPTNO FROM EMP 
SELECT ENAME,JOB,DEPTNO FROM EMP 
WHERE JOB = 'CLERK'
INTERSECT
SELECT ENAME,JOB,DEPTNO FROM EMP 
WHERE DEPTNO = 20;



--퀴즈1
--급여가 2500이상인 사원들의 이름과 급여를 조회하기
SELECT ENAME,SAL FROM EMP WHERE SAL >= 2500;

--퀴즈2
--부서번호가 10 또는 20이면서, 직무가 'CLERK'인 사원 조회하기
SELECT * FROM EMP WHERE (DEPTNO = 10 OR DEPTNO = 20)
AND JOB = 'CLERK';
  
--퀴즈3
--IN 연산사, AND 연산자 조합으로 수당이 존재하지 않는 사원 중에서 직무가 'SALESMAN'인 사원 조회하기
SELECT * FROM EMP WHERE JOB IN ('SALESMAN') AND COMM IS NULL;

--퀴즈4
--직무가 'CLERK'인 사원 중 급여가 1000이상 1500이하 인 사원 조회하기
SELECT * FROM EMP WHERE JOB = 'CLERK' AND SAL BETWEEN 1000 AND 1500;

--퀴즈5
--이름에 'DA'을 포함하는 사원 이름과 직무를 조회하기
SELECT ENAME, JOB FROM EMP WHERE ENAME LIKE '%DA%';


--퀴즈6
--부서번호가 10번인 사원중, 직무가 'MANAGER'가 아닌 사원을 출력하기
--단 MGR이 NULL인 사람도 포함하기
SELECT * FROM EMP WHERE DEPTNO = 10 AND (JOB != 'MANAGER' OR MGR IS NULL);

--문자열 관련 내장 함수 오라클에서 미리 만든 기능
--우리는 이용하는 부분을 공부함.

-- 이름은 모두 대문자로 출력
SELECT 
ENAME, UPPER(ENAME) AS "사원명 대문자",
LOWER(ENAME) AS "사원명 소문자",
INITCAP(ENAME) AS"사원명 첫글자 대문자" 
FROM EMP;

--사원 이름의 길이, 바이트 수 출력
SELECT ENAME,
LENGTH(ENAME) AS "사원명 글자 길이",
LENGTHB(ENAME) AS "사원명 글자 길이"
FROM EMP;

--직문 문자열 안에 'A'가 포함된 위치
SELECT JOB, INSTR(JOB,'A') AS "A가 몇번째 위치", 
--문자열 찾기
SUBSTR (JOB, 1, 3) AS "1~3글자 읽기",
--문자열 일부 추출
REPLACE(JOB, 'CLERK', '직원') AS "한글 직무"
--문자열 바꾸기
FROM EMP;

--LPAD, RPAD : 포맷 맞추기
--LPAD(컬럼명, 총길이, '채워질 문자')
--사원명에서 전체길이 9자리 만들고, 남은 부분은 채워질 문자로 채움
SELECT ENAME, LPAD(ENAME, 9, '*') AS "5글자포맷마스킹처리" FROM EMP;

--숫자 관련 함수 기본 
-- 급여의 소수점 둘째 자리에서 반올림 
SELECT ENAME,SAL, ROUND(123.456, 1) AS "ROUND(123.456, 1)" 
FROM EMP ;
-- 내림 소수점 이하 제거 TRUNC
SELECT ENAME,SAL, TRUNC(123.456, 0) AS "TRUNC(123.456, 1)" 
FROM EMP ;

-- 사원 번호를 2로 나눈 나머지 출력 
SELECT ENAME, EMPNO, MOD(EMPNO,2) AS "2로 나눈 나머지"
FROM EMP;

--CEIL, FLOOR 비교 
SELECT ENAME, SAL, CEIL(SAL / 3), FLOOR(SAL /3)
FROM EMP;

-- 퀴즈1 ROUND
-- 소수점 둘째 자리까지 반올림 해보기, 
-- 임의 숫자 : 123.4567
-- 별칭 : 소수점 둘째 자리까지 반올림
-- FROM DUAL 

-- 퀴즈2 TRUNC
-- 소수점 첫째 자리에서 내림 해보기, 
-- 임의 숫자 : 123.4567
-- 별칭 : 소수점 첫째 자리에서 내림
-- FROM DUAL 

-- 퀴즈3 CEIL, FLOOR
-- CEIL, FLOOR 비교 해보기, 
-- 임의 숫자 : 1.5, -1.5
-- 별칭 : CEIL , FLOOR
-- FROM DUAL 

-- 퀴즈4 MOD
-- 사원 번호를 4로 나눈 나머지 출력
-- 별칭 : 4로 나눈 나머지
-- FROM DUAL 





--문자열 관련 내장 함수
SELECT ENAME , UPPER(ENAME), LOWER;

--글자 길이 비교, 바이트로 비교
SELECT LENGTH)('이승엽'), LENGTHB('이승엽'),
LENGTH('ABC'),LENGTHB('ABC') FROM DUAL;

--SUBSTR , 문자열에서 특정 구간을 자르기 할 때 사용
--SUBSTR (선태 컬럼(문자열), 시작위치(1부터 시작), 길이만큼 추출
--SUBSTR('HELLO',1,3) -> HEL
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,6) FROM EMP;
--조금 어려운 표현
SELECT JOB, SUBSTR(JOB, -LENGTH(JOB)),
SUBSTR(JOB,-LENGTH(JOB),3),
FROM EMP;
SELECT SUBSTR('HELLO',-5,2)FROM DUAL;

--문자의 특정 위치 추출 해보기
--INSTR(컬러명{문자열), 찾기 위한 문자, 시작 위치, 몇번째 위치
SELECT INSTR('HELLO HI LOTTO', 'L'),
INSTR('HELLO HI LOTTO', 'L',5),
INSTR('HELLO HI LOTTO', 'L',2,2),
INSTR('HELLO HI LOTTO', 'O',2,2)
FROM DUAL;
--REPLACE

SELECT '010-766-3709' AS "번경전 문자열",
REPLACE('010-766-3709', '-',' ') AS "-,공백으로 변경",
REPLACE('010-766-3709', '-') AS "변경 옵션이 없을 경우"
FROM DUAL;

--LPAD, 왼쪽으로 특정 문자 채우기
--RPAD, 오른쪽으로 특정 문자 채우기
--TRIM, 양쪽 공백 제거하기
SELECT 'ORALCE', LPAD('ORACLE',10,'#'),
RPAD('ORACLE',10,'#'),
RPAD('841213-12',14,'*')
FROM DUAL;

SELECT TRIM('   ORACLE   '),
TRIM(LEADING FROM'   ORACLE   '),
TRIM(TRALLING FROM '   ORACLE   ')
FROM DUAL;

--검색, %am%
--현재 EMP 테이블의 데이터 내용은 모두 대문자.
--만약, 나중에 데이터가 대, 소문자가 섞여 있는 상황
--사용자가 검색을 단순 소문자로만 했을 경우,
--검색의 결과는 대소문자 상관없이 겨롸에 나오게 하기


--1 정확히 일치하는것만 검색
SELECT ENAME FROM EMP
WHERE LOWER(ENAME) = LOWER('scott');

--2 am포함 하는 키워드 찾기.
SELECT ENAME FROM EMP
WHERE ENAME LIKE UPPER('%am%');

--3 기존 데이터를 모두 소문자로 변경후 am 포함하는 키워드 찾기.
SELECT ENAME FROM EMP
WHERE LOWER(ENAME) LIKE LOWER('%am%');









