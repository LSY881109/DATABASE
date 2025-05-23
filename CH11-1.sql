-- 하나의 단위로 데이터를 처리하는 트랜잭션 

-- 기본문법 
-- 데이터 변경 
select *
  from emp_copy;
-- EMP_COPY 테이블에 원본 EMP 테이블 복사
insert into emp_copy
   select *
     from emp;
commit;

-- EMP_COPY 순서1, 테이블 테이터 변경 
update emp_copy
   set
   sal = sal + 10000
 where deptno = 10;

-- 순서2, 트랜잭션 저장 
commit;

-- 순서3, 트랜잭션 취소 
rollback;

-- 순서4, 특정 지점으로 설정
savepoint sp1;

-- 순서5, 특정 지점으로 롤백 
rollback to sp1;


-------------------------------------------------------
-- ENP_COPT2 테이블 먼저 조회 해보기
select *
  from emp_copy2;
-- EMP -> EMP_COPY2 테이블 복사를 먼저 진행 후
-- EMP_COPY2 테이블에서 연습하기.
-- EMP_COPY2 테이블 복사
create table emp_copy2
   as
      select *
        from emp;


-- 퀴즈1, 
-- 부서번호가 20인 사원들의 급여를 10% 인상 후, 
-- 조건에 따라 되돌릴 수 있도록 SAVEPOINT (SP2)를 설정하시오. 
update emp_copy2
   set
   sal = sal * 1.1
 where deptno = 20;
-- SAVEPOINT 설정
savepoint sp2;

 
-- 퀴즈2, 
-- 사번이 7839인 사원의 급여를 5000으로 변경하고, 
-- 이 작업만 ROLLBACK하시오.
update emp_copy2
   set
   sal = 5000
 where empno = 7839;
-- ROLLBACK
rollback to sp2;
  
-- 퀴즈3, 
-- 여러 UPDATE 작업 수행 후 COMMIT하지 않고
-- 전체를 ROLLBACK 하시오.
update emp_copy2
   set
   sal = sal * 1.1
 where deptno = 10;

update emp_copy2
   set
   sal = sal * 1.2
 where deptno = 20;

update emp_copy2
   set
   sal = sal * 1.3
 where deptno = 30;
 
 --조회
select *
  from emp_copy2;
-- ROLLBACK
rollback;

commit;