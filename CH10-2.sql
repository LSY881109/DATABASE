-- 테이블에 있는 데이터 수정하기

-- 기본 문법 
-- UPDATE 테이블명 SET 수정할컬럼명 = 수정할값 WHERE 조건절;

-- 복사한 테이블에서 연습하기. 
-- EMP -> EMP_COPY 테이블 복사 
create table emp_copy
   as
      select *
        from emp;
select *
  from emp_copy;

--복사 테이블 이외의 테이블 전체 롤백

--전체 수정 
update emp_copy
   set
   sal = 1000;
-- 반영, 저장
--COMMIT;

-- 조건 수정
update emp_copy
   set
   sal = 2000
 where deptno = 10;
-- 되돌리기
rollback;

-- 서브쿼리 활용 
select deptno
  from emp
 where ename = 'ALLEN'; -- 30
update emp_copy
   set
   sal = 2000
 where deptno = (
   select deptno
     from emp
    where ename = 'ALLEN'
);


create table dept_temp2
   as
      select *
        from dept;
--테이블이 먼저 생성

-- 먼저는 연습용, 
-- DEPT -> DEPT_TEMP2 테이블 복사해보기
-- 퀴즈1, 
-- DEPT_TEMP2 테이블에서 부서번호가 20인 행의 지역을 'JEJU'로 수정하시오.
update dept_temp2
   set
   loc = 'JEJU'
 where deptno = 20;
select *
  from dept_temp2;

 
-- 퀴즈2, 
-- DEPT_TEMP2 테이블의 전체 지역을 'SEOUL'로 변경하시오. 
update dept_temp2
   set
   loc = 'SEOUL';
select *
  from dept_temp2;
  
-- 퀴즈3, 
-- 직책이 'MANAGER'인 사원의 급여를 5000으로 일괄 수정하시오.
update emp_copy
   set
   sal = 5000
 where job = 'MANAGER';
select *
  from emp_copy;