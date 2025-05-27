-- 사용자 관리 (단순, 생성만 했지, 다른 권한이 없음. 
-- 그래서, 결론은, 접근도 아직은 안된다.)

-- 사용자 생성 예시 
create user lsy2 identified by 1234; -- 사용자 생성

-- 사용자 정보 조회 
select *
  from all_users
 where username = 'LSY2'; -- 새 사용자 확인
-- 사용자 상태 확인
select username,
       account_status,
       created
  from dba_users
 where username = 'LSY2'; 

-- 사용자 비밀번호 변경 
alter user lsy2 identified by 5678; -- 비밀번호 변경
 
 -- 사용자 삭제 
drop user lsy2; -- 기본 사용자 삭제 
drop user lsy2 cascade; -- 사용자 삭제 (CASCADE 옵션으로 모든 객체도 삭제)

-- 사용자 권한 부여 , 기본 권한, 접근 권한, 자원에 접근하는 권한 2가지 확인. 
-- CONNECT : 데이터베이스 접속 가능 권한 
-- RESOURCE : 자원에 접근 가능 권한, 테이블, 인덱스, 시퀀스 등 객체 생성 권한
grant connect to lsy2; -- 세션 생성 권한 부여
grant resource to lsy2; -- 자원 접근 권한 부여

-- RESOURCE 권한으로 테이블 생성 가능
create table user_primay3 (
   id       number(5),
   name     varchar2(20) not null,
    -- USER_ID VARCHAR2(20) PRIMARY KEY -- 방법1
    -- USER_ID2 VARCHAR2(20) CONSTRAINT user_id_primary PRIMARY KEY -- 방법2
   user_id2 varchar2(20) -- 방법3
);

-- SCOTT 계정으로 생성한 테이블 조회. 
select *
  from emp;


-- 퀴즈1, 
-- SYSTEM 계정에서, LSY3 사용자 생성 , 패스워드 1234
create user lsy3 identified by 1234; -- 사용자 생성
-- 퀴즈2, 
-- LSY3 계정에 접근 권한, 자원 권한 부여 
grant connect,resource to lsy3; -- 세션 생성 권한 부여
-- SCOTT 계정으로 생성한 테이블 EMP -> LSY3 계정에서 접근 가능 확인
grant select on scott.emp to lsy3; -- SCOTT.EMP 테이블에 대한 SELECT 권한 부여

select *
  from scott.emp;  
-- 퀴즈3, 
-- 패스워드 5678 변경해보기., 유저 삭제 확인 
alter user lsy3 identified by 5678; -- 비밀번호 변경



-- 퀴즈1,
-- SYSTEM(계정 또는 스콧) 사용자 정의 롤 (CREATE TABLE, CRATE VIEW) 생성 하기
-- LSY5 새로운 계정 생성 하고
-- 사용자 정의 롤 부여(CREATE TABLE, CRATE VIEW)
create role my_role; -- 사용자 정의 롤 생성
grant
   create table,
   create view
to my_role; -- 롤에 권한 부여
create user lsy5 identified by 1234; -- 새 사용자 생성
grant my_role to lsy5; -- 사용자에게 롤 부여
grant connect to lsy5; -- 세션 생성 권한 부여



-- 퀴즈2,
-- 부여된 계정 LSY5, 접근 및 테이블 생성, 뷰 생성도 한번 해보기. 
-- 사용량 부분 오류 발생시, 조정해보기. 힌트) 미리보기 RESOURCE 권한 주기.ALTER
grant resource to lsy5; -- 자원 접근 권한 부여
create table lsy5.test_table (
   id   number,
   name varchar2(50)
); -- 테이블 생성
create view lsy5.test_view as
   select *
     from lsy5.test_table; -- 뷰 생성
-- LSY5 계정으로 생성한 테이블 및 뷰 조회
select *
  from lsy5.test_table; -- 테이블 조회
select *
  from lsy5.test_view; -- 뷰 조회


-- 퀴즈3,
-- 권한 조회 확인.
select *
  from user_role_privs
 where username = 'LSY5'; -- 사용자에게 부여된 롤 조회
select *
  from user_sys_privs
 where username = 'LSY5'; -- 사용자에게 부여된 시스템 권한 조회

--사용자 조회
select *
  from all_users
 where username = 'LSY5'; -- 새 사용자 확인