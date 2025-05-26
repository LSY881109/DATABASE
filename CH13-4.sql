--규칙에 따라 순번을 생성하는 시퀀스(sequence) 생성
create sequence seq_order start with 1 increment by 1 minvalue 1 maxvalue 9999999999 cycle

no;

  -- 시퀀스 생성
create sequence emp_seq --시퀀스 이름, 의미 있는 이름으로 지정
 start with 1        -- 시작 값, 1부터 시작
 increment by 1      -- 증가 값, 1씩 증가
 maxvalue 9999       -- 최대값, 9999까지 증가
 nocycle;            -- 최대값에 도달하면 다시 시작하지 않음

-- 빈 테이블 조회
select *
  from emp_sequence_test;

-- 테스트 할 빈 테이블 복사 
create table emp_sequence_test
   as
      select *
        from emp
       where 1 = 0;
-- 테이블의 내용만 삭제
truncate table emp_sequence_test;

-- 빈 테이블 조회 
select *
  from emp_sequence_test;
select *
  from emp;
-- 시퀀스 조회 
select emp_seq.nextval
  from dual;
DESC EMP_SEQUENCE_TEST;



-- 시퀀스 이용해서, 데이터 추가 해보기. 
insert into emp_sequence_test values ( emp_seq.nextval, -- empno 기존에는 숫자 형태로 직접 지정 했고, 자동 생성.자 타입
                                       '홍길동',         -- ename 문자열 타입
                                       '강사',         -- job 문자열 타입
                                       7839,           -- mgr, 숫자 타입
                                       sysdate,    -- hiredate, DATE 타입
                                       1000,            -- sal 숫자 타입
                                       500,             -- comm 숫자 타입
                                       10               -- deptno 숫자 타입
                                        );

rollback; -- 트랜잭션 취소

select *
  from emp_sequence_test;

-- 기존 시퀀스 삭제 후 다시 생성
drop sequence emp_seq;

-- 시퀀스 마지막 값 조회
select emp_seq.currval
  from dual;

-- 시퀀스 수정 
alter sequence emp_seq increment by 10 -- 증가값을 10으로 변경
    -- START WITH 1000; -- 시작값을 1000으로 변경




-- 연습용 테이블 생성 후 작업하기. 
-- DEPT -> DEPT_SEQ_TEST 테이블 복사 후 작업. 
create table dept_seq_test
   as
      select *
        from dept
       where 1 = 0;
-- 퀴즈1, 
-- 1부터 시작하는 DEPT_SEQ 시퀀스를 생성하시오.  
-- 증감 10씩, 맥스 : 999999999, NOCYCLE 옵션 사용. 
create sequence dept_seq start with 1 increment by 10 maxvalue 999999999 nocycle;
 
-- 퀴즈2, 
-- DEPT_SEQ_TEST, 샘플 데이터를 추가해서, 증감값 확인,.(자동증가 확인이 목적)
DESC DEPT_SEQ_TEST;

insert into dept_seq_test values ( dept_seq.nextval, -- deptno 자동 생성
                                   '인사부',          -- dname
                                   '서울'             -- loc
                                    );
  
-- 퀴즈3, 
-- 마지막으로 생성된 시퀀스 번호 확인 및 증감 10 -> 100 변경도 해보고, 삭제도 해보기
-- 정의가 NUMBER(2) -> 수정 해보기. 
alter table dept_seq_test modify (
   deptno number(3)
);
alter sequence dept_seq increment by 100; -- 증감값 변경
-- 시퀀스 삭제 
drop sequence dept_seq;    
-- 시퀀스 확인 
select *
  from user_sequences
 where sequence_name = 'DEPT_SEQ';
-- 시퀀스가 삭제되었는지 확인

-- 시퀀스 개념이 이해가 안될경우, 예시 회원가입
-- 사용자 웹에서 회원가입 진행함. 
-- 사용자가 개인정보와 자기의 사용자 아이디 번호를 입력을 하기 어렵다(거의 불가능)
-- 그러면, 개발자가 대신, 사용자의 아이디 번호를 매번 수동으로 입력하기 어렵다. 
-- 그래서, 시퀀스, 테이블에 자동 번호 증가 기능(함수) 이용하면, 알아서 번호를 생성 해줌
-- 예시
-- ID,(자동생성), 이름, 이메일, 비밀번호, 가입일시
-- 1(자동생성) 홍길동,
-- 2(자동생성) 김철수,
-- 3(자동생성) 이영희,

-- ID(자동생성), 사용자는 순서 걱정 말고, 단순 입력만 하면 시스템에서 알아서 자동으로 번호를 생성해줌
-- 회원 가입 할 때 , 등록 시간도 같은 게이스, (가입시간, 글작성 시간 수동으로 입력 불가능)