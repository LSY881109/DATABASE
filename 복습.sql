--문자열 관련 내장 함수, 오라클에 포함되어 있는 기능

SELECT ENAME
--이름을 모두 대문자로 출력
, UPPER(ENAME) AS "사원명 대문자"
--이름을 모두 소문자로 출력
, LOWER(ENAME) AS "사원명 소문자"
--이름의 첫자만 대문자로 출력
, INITCAP(ENAME) AS "사원명 첫자를 대문자"
FROM EMP;


SELECT ENAME
--사원 이름의 길이 출력
, LENGTH(ENAME) AS "사원명 글자 길이"
--사원 이름의 바이트 길이 출력
, LENGTHB(ENAME) AS "사원명 바이트 길이"
FROM EMP;

SELECT JOB
--직무 문자열 안에 'A'가 포함된 위치 확인
--INSTR (컬럼명, 찾을문자, 시작위치, 시작위치부터 몇번째의 문자)
, INSTR(JOB, 'A') AS "A가 몇번째 위치"

--직무 문자열 안에 시작위치로부터의 수만큼 결과 도출
--SUBSTR(컬럼명, 시작위치, 길이)
, SUBSTR(JOB,1,3) AS "1부터, 3글자 읽기"

--직무 문자열 안에 선택 문자를 지정 문자로 치환
--REPLACE(컬럼명, 바꿀대상, 바꿀내용)
, REPLACE(JOB, 'CLERK', '직원') AS "한글 직무"
FROM EMP;

-- LPAD, RPAD : 포맷 맞추기
SELECT ENAME
-- LPAD : 총 5글자를 출력, 좌측부터 부족한 칸 수를 '' 안의 내용으로 채운다.
-- LPAD ( 컬럼명, 총 길이, '채워질 문자' )
, LPAD(ENAME, 7, '*') AS "LPAD 7자"
-- RPAD : LPAD와 방향 반대
, RPAD(ENAME, 7, '*') AS "RPAD 7자"
FROM EMP;


----------------------------------------------------------------------
--TRIM : 문자열 양쪽의 문자 제거
--TRIM(LEADING | TRAILING | BOTH '제거문자' FROM 문자열)
--LEADING : 앞에서 제거
--TRAILING : 뒤에서 제거
--BOTH : 양쪽 제거, 생략시 기본값으로 적용
--DUAL : 더미 테이블 , 주로 간단한 테스트를 위해 불러옴.
SELECT
TRIM(' ORACLE ') AS "양쪽 공백 제거"
,LTRIM(' ORACLE ') AS "왼쪽 공백 제거"
,RTRIM(' ORACLE ') AS "오른쪽 공백 제거"
FROM DUAL;

--
SELECT
TRIM(BOTH '#' FROM '###hello###') AS "BOTH 결과"
,TRIM('#' FROM '###hello###') AS "BOTH 생략 결과"
,TRIM(LEADING '#' FROM '###hello###') AS "LEADING 결과"
,TRIM(TRAILING '#' FROM '###hello###') AS "TRAILING 결과"
FROM DUAL;


-- 문자열 연결 해보기
-- CONCAT (컬럼명1(문자열1),컬럼명2(문자열2))
-- 두 문자열을 연결 하는 함수
SELECT CONCAT(ENAME, JOB) AS "이름+직무" FROM EMP;
SELECT CONCAT('이','상용') AS "이름 결합" FROM DUAL;
--concat 2개 까지만 가능, 그 이상 연결시 (||)
SELECT '연결할 문자열 2개 이상'
|| ' 버티컬 바 2개를 붙이기'
|| ' 그러면 연결한 문자열을 합치기 가능함'
FROM DUAL;

-----------



--Q1. (SUBSTR) 주민번호에서 생년월일만 추출
-- (FROM DUAL) 별칭 생년월일로 출력 해보기
SELECT SUBSTR('930906-1******',1,6) AS "생년월일" FROM DUAL;

--Q2. (INSTR) 이메일에서 @ 위치 찾기
-- 별칭 '골뱅이위치'로 출력 해보기.
SELECT INSTR('test@oracle.com','@') AS "골뱅이위치" FROM DUAL;

--Q3. 전화번호에서 -(하이픈) 제거 해보기, 010-7661-3709
-- 별칭 '하이픈제거'로 출력 해보기.
-- FROM DUAL 이용하기
SELECT REPLACE('010-7661-3709', '-', '') AS "하이픈제거" FROM DUAL;

--Q4. (LPAD) 부서번호를 왼쪽으로 공백 채우기
-- (FROM EMP) 별칭 '정렬용' 출력 해보기
SELECT LPAD (DEPTNO,4,'*') AS "정렬용" FROM EMP;

--Q5. (TRIM) 앞뒤 공백 제거 해보기 예제 문자열 : 공백공백공백(본인명)공백공백공백
-- (FROM DUAL) 별칭 정리된문자 출력 해보기.
SELECT TRIM(' 이길주 ') AS "정리된 문자" FROM DUAL;

--Q6. (CONCAT) 사원명 + 부서번호
-- (FROM DUAL) 별칭은 '사원명 + 부서번호' 출력해보기
SELECT CONCAT(ENAME, DEPTNO) AS "사원명 + 부서번호" FROM EMP;




--숫자관련 함수의 기본

--소수점 N+1째 자리에서 반올림
SELECT ROUND(123.456, 1) AS "ROUND(SAL, 1)"
FROM DUAL;

--내림 소수점 N+1째 자리이하 제거
SELECT TRUNC(123.456, 1) AS "TRUNC(123.456, 1)"
FROM DUAL;

--사원 번호를 2로 나눈 나머지 출력
SELECT EMPNO, MOD(EMPNO,2) AS "2로 나눈 나머지"
FROM EMP;

--CEIL, FLOOR 비교
SELECT ENAME, SAL, CEIL(SAL / 3), FLOOR(SAL /3)
FROM EMP;



--

--Q1. 소수점 둘째자리까지 반올림
-- 별칭 소수점 둘째 자리까지 반올림
-- ex num 123.4567 ROUND
SELECT ROUND(123.4567, 2) AS "소수점 둘째 반올림" FROM DUAL;

--Q2. 소수점 첫째 자리에서 내림
-- 별칭 소수점 첫째 자리에서 내림
-- ex num 123.4567 TRUNC
SELECT TRUNC(123.4567, 1) AS "소수점 첫째 내림" FROM DUAL;

--Q3. CEIL, FLOOR 비교
-- 별칭 CEIL, FLOOR
-- ex num 1.5, -1.5

SELECT CEIL(1.5) AS "CEIL1.5", FLOOR(1.5) AS "FLOOR1.5",
CEIL(-1.5) AS "CEIL-1.5", FLOOR(-1.5) AS "FLOOR-1.5" FROM DUAL;

--Q4. MOD 사원 번호를 4로 나눈 나머지
-- 별칭 : 4로 나눈 나머지
SELECT EMPNO, MOD(EMPNO,4) AS "4로 나눈 나머지" FROM EMP;