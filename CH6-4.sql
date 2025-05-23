-- 날짜 데이터를 다루는 내장 함수 

-- 현재 날짜 
select sysdate
  from dual;

-- 3개월 후 
select add_months(
   sysdate,
   3
)
  from dual;

-- 개월 차이 
select months_between(
   sysdate,
   hiredate
)
  from emp;

--다음 금요일 , 요일 선택 부분에 서버의 언어맞게 설정하기.
select next_day(
   sysdate,
   '금요일'
)
  from dual;

--이번달 말일 
select last_day(sysdate)
  from dual;

--날짜 반올림 / 버림 
select round(
   sysdate,
   'MONTH'
),
       trunc(
          sysdate,
          'MONTH'
       )
  from dual;

-- 입사일로부터 10주년 구하기 
select ename,
       add_months(
          hiredate,
          120
       ) as "10주년"
  from emp;

--퀴즈1 
--입사일로부터 32년이 지난 사원만 출력해보기. 
-- 32 * 12 = 384
select *
  from emp;
select *
  from emp
 where months_between(
   sysdate,
   hiredate
) > 384;

--퀴즈2
-- 사원별로 입사일 기준 다음 월요일 출력해보기 
select ename,
       hiredate,
       next_day(
          hiredate,
          '월요일'
       ) as "다음 월요일"
  from emp;

--퀴즈3 
-- 사원의 입사일을 월 단위로 반올림 해서 출력 해보기.
select ename,
       hiredate,
       round(
          hiredate,
          'MONTH'
       ) as "반올림일자"
  from emp;

alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS';
select sysdate
  from dual;


-- 오라클 시간 동기화 
-- 도커 데스크톱 실행 후 
-- 도커 데스크톱 -> 컨테이너 아이디 복사 
-- 예시 
-- 1ab078435e089644fb46258ee8b017f3aa2b6e2dbc30bb718a812c8de2941a9e

-- 터미널에서 해보기. 
-- 마이크로 소프트의 스토어 : store -> 터미널 
-- docker exec -it 컨테이너 아이디 복사  /bin/bash

-- dpkg-reconfigure tzdata 

-- 만약, 안될 경우1, apt-get update
-- 만약, 안될 경우2, apt-get install --reinstall tzdata

-- 6 asis , 선택

-- 69 seolu 선택 

-- date, 명령어 확인