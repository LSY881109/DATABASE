-- 객체를 생성, 변경, 삭제하는 데이터 정의어

-- CREATE : 객체를 생성하는 명령어
-- ALTER : 객체를 변경하는 명령어
-- DROP : 객체를 삭제하는 명령어
-- TRUNCATE : 테이블의 데이터를 삭제하는 명령어


create table member (
   member_id    number(5) primary key,    -- PK = NOT NULL, --UNIQUE 제약조건이 있는 열
   member_name  varchar2(20) not null,  -- 값이 비어 있으면 안됨. 
   member_email varchar2(50) not null
);

select *
  from member;

-- -- MEMBER 테이블에 데이터 삽입하기
insert into member (
   member_id,
   member_name,
   member_email
) values ( 1,
           '홍길동',
           'HONG@NAVER.COM' );

-- 테이블의 구조 변경하기
alter table member add member_phone varchar2(20); -- 테이블에 열 추가하기

--샘플데이터 추가하기
insert into member (
   member_id,
   member_name,
   member_email,
   member_phone
) values ( 3,
           '송영욱',
           'SSS@NAVER,COM',
           '010-1234-5678' );
      
--조회
select *
  from member;

-- 테이블의 내용만 삭제하기
truncate table member; -- 테이블의 내용만 삭제하기
-- 테이블의 구조는 그대로 남아 있음
-- 테이블의 내용 삭제 후 조회
select *
  from member;
-- 테이블 삭제하기
drop table member;
-- 테이블 삭제 후 조회
select *
  from member;


-- 퀴즈1, 
-- 테이블 : BOARD , 
-- 컬럼: BOARD_ID(NUMBER 5), TITLE(VARCHART2(30)), 
-- CONTENT(VARCHART2(300)), WRITER(VARCHART2(30)), REGDATE(DATE)
-- 테이블 생성하기
create table board (
   board_id number(5) primary key,
   title    varchar2(30),
   content  varchar2(300),
   writer   varchar2(30),
   regdate  date
);  
-- 테이블 생성 후 조회
select *
  from board;
 
-- 퀴즈2,ALTER ~ MODIFY
-- BOARD 테이블에 특정 컬럼의 타입 변경 변경해보기. (WRITER VARCHART2 40으로 변경)
alter table board modify
   writer varchar2(40);
-- 테이블 구조 변경 후 조회
select *
  from board;
  
-- 퀴즈3, 
-- BOARD 테이블에 , 내용만 삭제 해보기
truncate table board;
-- 테이블 내용 삭제 후 조회
select *
  from board;

-- 테이블안에 데이터 넣어보기

insert into board (
   board_id,
   title,
   content,
   writer,
   regdate
) values ( 2,
           '빠른 퇴근',
           '퇴근 방법',
           '나',
           sysdate );
-- 테이블에 데이터 삽입 후 조회
select *
  from board;