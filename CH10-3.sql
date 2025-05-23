-- 테이블에 있는 데이터 삭제 하기

-- 기본 문법
-- 조건에 맞는 데이터 삭제
delete from 테이블명
 where 조건;
delete from emp
 where deptno = 30;

-- 서브쿼리 활용한 삭제
delete from emp_copy
 where deptno in (
   select deptno
     from dept
    where loc = 'DALLAS'
);

-- 전체 행 삭제하기
delete from emp_copy;

-- 삭제하기 전 데이터 조회
select *
  from emp_copy;
-- 부서번호가 30인 사원 삭제하기
delete from emp_copy
 where deptno = 30;
--삭제 후 데이터 조회
select *
  from emp_copy;

-- 서브쿼리로 -DALLAS 부서의 사원 삭제하기
delete from emp_copy
 where deptno in (
   select deptno
     from dept
    where loc = 'DALLAS'
);
-- 삭제 후 데이터 조회
select *
  from emp_copy;

--EMP_COPY 테이블의 모든 데이터 삭제
delete from emp_copy;



-- 연습전 카피 테이블 먼저 생성
create table emp_temp2
   as
      select *
        from emp;
-- 퀴즈1, 
-- EMP_TEMP2 테이블에서 급여가 3000 이상인 사원을 삭제하시오. 
delete from emp_temp2
 where sal >= 3000;
select *
  from emp_temp2;
 
-- 퀴즈2, 
-- EMP_TEMP2 테이블에서 부서번호가 10 또는 20인 사원을 삭제하시오.
delete from emp_temp2
 where deptno in ( 10,
                   20 );
select *
  from emp_temp2;
  
-- 퀴즈3, 
-- EMP_TEMP2 테이블의 모든 데이터를 삭제하시오.
delete from emp_temp2;
select *
  from emp_temp2;