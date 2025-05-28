-- copilot, GPT , ai 툴을 이용해서, 

-- 샘플 디비 설계, (쇼핑몰 예시)
-- ERD 다이어그램 확인. 
-- 시퀀스 다이어그램 확인. 
-- DFD 다이어그램 확인.

-- 샘플 디비 설계, 쇼핑몰을 예시로 해서, 
-- 간단한 프롬프트 명령어를 작성 해보기. 

-- 예시 
-- 간단한 쇼핑몰 DB 설계를 할거야, 
-- 생각한 테이블은 사용자, 게시글, 댓글, 상품, 장바구니, 주문, 결제, 배송
-- 중간 테이블 (장바구니에 담긴 상품), (주문된 상품)등도 고려해줘. 
-- 혹시나 빠진 중간 테이블이 있다면, 추가도 해줘. 
-- 설계한 코드는 DDL.sql 파일로 제공해주고, 
-- create 코드 형식으로 코드 알려줘

-- 1차 견본, 받은 후, 
-- filepath: c:\Users\it\Desktop\이승엽\database\DDL.sql
-- 테이블 이름 중복으로 생성이 안될시
-- drop table 테이블명; 삭제후 재 생성이 빠름
-- 사용자 테이블
CREATE TABLE USERS (
    USER_ID      NUMBER PRIMARY KEY,
    USERNAME     VARCHAR2(50) NOT NULL,
    PASSWORD     VARCHAR2(100) NOT NULL,
    EMAIL        VARCHAR2(100) NOT NULL,
    PHONE        VARCHAR2(20),
    CREATED_AT   DATE DEFAULT SYSDATE
);

-- 게시글 테이블
CREATE TABLE POSTS (
    POST_ID      NUMBER PRIMARY KEY,
    USER_ID      NUMBER REFERENCES USERS(USER_ID),
    TITLE        VARCHAR2(200) NOT NULL,
    CONTENT      CLOB,
    CREATED_AT   DATE DEFAULT SYSDATE
);

-- 댓글 테이블
CREATE TABLE COMMENTS (
    COMMENT_ID   NUMBER PRIMARY KEY,
    POST_ID      NUMBER REFERENCES POSTS(POST_ID),
    USER_ID      NUMBER REFERENCES USERS(USER_ID),
    CONTENT      VARCHAR2(500) NOT NULL,
    CREATED_AT   DATE DEFAULT SYSDATE
);

-- 상품 테이블
CREATE TABLE PRODUCTS (
    PRODUCT_ID   NUMBER PRIMARY KEY,
    NAME         VARCHAR2(100) NOT NULL,
    DESCRIPTION  VARCHAR2(1000),
    PRICE        NUMBER(10,2) NOT NULL,
    STOCK        NUMBER DEFAULT 0,
    CREATED_AT   DATE DEFAULT SYSDATE
);

-- 장바구니 테이블
CREATE TABLE CARTS (
    CART_ID      NUMBER PRIMARY KEY,
    USER_ID      NUMBER REFERENCES USERS(USER_ID),
    CREATED_AT   DATE DEFAULT SYSDATE
);

-- 장바구니에 담긴 상품 (중간 테이블)
CREATE TABLE CART_ITEMS (
    CART_ITEM_ID NUMBER PRIMARY KEY,
    CART_ID      NUMBER REFERENCES CARTS(CART_ID),
    PRODUCT_ID   NUMBER REFERENCES PRODUCTS(PRODUCT_ID),
    QUANTITY     NUMBER DEFAULT 1
);

-- 주문 테이블
CREATE TABLE ORDERS (
    ORDER_ID     NUMBER PRIMARY KEY,
    USER_ID      NUMBER REFERENCES USERS(USER_ID),
    ORDER_DATE   DATE DEFAULT SYSDATE,
    STATUS       VARCHAR2(20)
);

-- 주문된 상품 (중간 테이블)
CREATE TABLE ORDER_ITEMS (
    ORDER_ITEM_ID NUMBER PRIMARY KEY,
    ORDER_ID      NUMBER REFERENCES ORDERS(ORDER_ID),
    PRODUCT_ID    NUMBER REFERENCES PRODUCTS(PRODUCT_ID),
    QUANTITY      NUMBER DEFAULT 1,
    PRICE         NUMBER(10,2) NOT NULL
);

-- 결제 테이블
CREATE TABLE PAYMENTS (
    PAYMENT_ID   NUMBER PRIMARY KEY,
    ORDER_ID     NUMBER REFERENCES ORDERS(ORDER_ID),
    AMOUNT       NUMBER(10,2) NOT NULL,
    PAYMENT_DATE DATE DEFAULT SYSDATE,
    METHOD       VARCHAR2(20)
);

-- 배송 테이블
CREATE TABLE DELIVERIES (
    DELIVERY_ID  NUMBER PRIMARY KEY,
    ORDER_ID     NUMBER REFERENCES ORDERS(ORDER_ID),
    ADDRESS      VARCHAR2(200) NOT NULL,
    STATUS       VARCHAR2(20),
    DELIVERY_DATE DATE
);


-- 누락된 부분, 또는 테스트나 검증등을 해서 수정될 가능성이 있음. 
-- 제공 해준 테이블을 이용해서, 샘플 데이터를 추가하는 예시를 제공해줘
-- 각각의 모든 테이블을 검사 할수 있는 샘플 데이터를 추가하는 예시코드
-- 추가 하는 명령어, 조회 명령어도 같이 첨부해줘
-- USERS 테이블 샘플 데이터
INSERT INTO USERS VALUES (1, 'hong', 'pw1234', 'hong@test.com', '010-1111-2222', SYSDATE);
INSERT INTO USERS VALUES (2, 'kim', 'pw5678', 'kim@test.com', '010-3333-4444', SYSDATE);
SELECT * FROM USERS;

-- PRODUCTS 테이블 샘플 데이터
INSERT INTO PRODUCTS VALUES (1, '노트북', '고성능 노트북', 1200000, 10, SYSDATE);
INSERT INTO PRODUCTS VALUES (2, '마우스', '무선 마우스', 25000, 100, SYSDATE);
SELECT * FROM PRODUCTS;

-- CARTS 테이블 샘플 데이터
INSERT INTO CARTS VALUES (1, 1, SYSDATE);
INSERT INTO CARTS VALUES (2, 2, SYSDATE);
SELECT * FROM CARTS;

-- CART_ITEMS 테이블 샘플 데이터
INSERT INTO CART_ITEMS VALUES (1, 1, 1, 1); -- hong의 장바구니에 노트북 1개
INSERT INTO CART_ITEMS VALUES (2, 1, 2, 2); -- hong의 장바구니에 마우스 2개
INSERT INTO CART_ITEMS VALUES (3, 2, 2, 1); -- kim의 장바구니에 마우스 1개
SELECT * FROM CART_ITEMS;

-- ORDERS 테이블 샘플 데이터
INSERT INTO ORDERS VALUES (1, 1, SYSDATE, '결제완료');
INSERT INTO ORDERS VALUES (2, 2, SYSDATE, '배송중');
SELECT * FROM ORDERS;

-- ORDER_ITEMS 테이블 샘플 데이터
INSERT INTO ORDER_ITEMS VALUES (1, 1, 1, 1, 1200000); -- hong의 주문에 노트북 1개
INSERT INTO ORDER_ITEMS VALUES (2, 1, 2, 2, 25000);   -- hong의 주문에 마우스 2개
INSERT INTO ORDER_ITEMS VALUES (3, 2, 2, 1, 25000);   -- kim의 주문에 마우스 1개
SELECT * FROM ORDER_ITEMS;

-- PAYMENTS 테이블 샘플 데이터
INSERT INTO PAYMENTS VALUES (1, 1, 1250000, SYSDATE, '카드');
INSERT INTO PAYMENTS VALUES (2, 2, 25000, SYSDATE, '계좌이체');
SELECT * FROM PAYMENTS;

-- DELIVERIES 테이블 샘플 데이터
INSERT INTO DELIVERIES VALUES (1, 1, '서울시 강남구', '배송완료', SYSDATE);
INSERT INTO DELIVERIES VALUES (2, 2, '부산시 해운대구', '배송중', NULL);
SELECT * FROM DELIVERIES;

-- POSTS 테이블 샘플 데이터
INSERT INTO POSTS VALUES (1, 1, '첫 게시글', '안녕하세요!', SYSDATE);
INSERT INTO POSTS VALUES (2, 2, '리뷰', '상품이 좋아요!', SYSDATE);
SELECT * FROM POSTS;

-- COMMENTS 테이블 샘플 데이터
INSERT INTO COMMENTS VALUES (1, 1, 2, '환영합니다!', SYSDATE);
INSERT INTO COMMENTS VALUES (2, 2, 1, '감사합니다!', SYSDATE);
SELECT * FROM COMMENTS;



-- 검사 도구로, 다이어그램 등을 이용해서 그림으로 확인. 
-- 아래 사이트에서, 그림 도식화 할 예정
-- https://gist.github.com
-- md 파일에, mermaid 라는 문법을 통해서 erd 그림을 그리기

-- 예시 연속적으로 작업 하는 중이라서, 이미 코파일럿 메모리에 작성된 테이블이 있다는 가정하에
-- 만약 연속 작업이 아니라고 한다면 실제 테이블을 같이 복사를 하고 물어보기
-- 현재는 연속적인 상황이라서 이렇게만 질의하기
-- 위에 작성된 ddl.sql 파일을, create 테이블을 참고해서
-- mermaid 문법으로 erd 다이어그램 작성하는 코드 작성해줘

-- 1차 결과 코드에서, 앞쪽에 ` 백티 3개 있고 마지막에서 ` 백티 3개가 있음
-- 맨 마지막 백티 3개는 삭제

```mermaid
erDiagram
    USERS {
        NUMBER USER_ID PK
        VARCHAR USERNAME
        VARCHAR PASSWORD
        VARCHAR EMAIL
        VARCHAR PHONE
        DATE CREATED_AT
    }
    POSTS {
        NUMBER POST_ID PK
        NUMBER USER_ID FK
        VARCHAR TITLE
        CLOB CONTENT
        DATE CREATED_AT
    }
    COMMENTS {
        NUMBER COMMENT_ID PK
        NUMBER POST_ID FK
        NUMBER USER_ID FK
        VARCHAR CONTENT
        DATE CREATED_AT
    }
    PRODUCTS {
        NUMBER PRODUCT_ID PK
        VARCHAR NAME
        VARCHAR DESCRIPTION
        NUMBER PRICE
        NUMBER STOCK
        DATE CREATED_AT
    }
    CARTS {
        NUMBER CART_ID PK
        NUMBER USER_ID FK
        DATE CREATED_AT
    }
    CART_ITEMS {
        NUMBER CART_ITEM_ID PK
        NUMBER CART_ID FK
        NUMBER PRODUCT_ID FK
        NUMBER QUANTITY
    }
    ORDERS {
        NUMBER ORDER_ID PK
        NUMBER USER_ID FK
        DATE ORDER_DATE
        VARCHAR STATUS
    }
    ORDER_ITEMS {
        NUMBER ORDER_ITEM_ID PK
        NUMBER ORDER_ID FK
        NUMBER PRODUCT_ID FK
        NUMBER QUANTITY
        NUMBER PRICE
    }
    PAYMENTS {
        NUMBER PAYMENT_ID PK
        NUMBER ORDER_ID FK
        NUMBER AMOUNT
        DATE PAYMENT_DATE
        VARCHAR METHOD
    }
    DELIVERIES {
        NUMBER DELIVERY_ID PK
        NUMBER ORDER_ID FK
        VARCHAR ADDRESS
        VARCHAR STATUS
        DATE DELIVERY_DATE
    }

    USERS ||--o{ POSTS : "writes"
    USERS ||--o{ COMMENTS : "writes"
    USERS ||--o{ CARTS : "has"
    USERS ||--o{ ORDERS : "places"
    POSTS ||--o{ COMMENTS : "has"
    PRODUCTS ||--o{ CART_ITEMS : "in"
    PRODUCTS ||--o{ ORDER_ITEMS : "ordered"
    CARTS ||--o{ CART_ITEMS : "contains"
    ORDERS ||--o{ ORDER_ITEMS : "contains"
    ORDERS ||--o{ PAYMENTS : "paid by"
    ORDERS ||--o{ DELIVERIES : "delivered by"


--같은 형식으로 
-- 2) DFD 다이어그램 코드 만들어줘

-- 아래 사이트에서, 그림 도식화 할 예정
-- https://gist.github.com
-- md 파일에, mermaid 라는 문법을 통해서 erd 그림을 그리기
```mermaid
flowchart TD
    사용자((사용자))
    웹사이트[쇼핑몰 웹사이트]
    DB[(DB)]
    결제시스템[결제 시스템]
    배송시스템[배송 시스템]
    
    사용자 -- 회원가입/로그인/상품조회/장바구니/주문/게시글/댓글 --> 웹사이트
    웹사이트 -- 사용자 정보, 게시글, 댓글, 상품, 장바구니, 주문, 결제, 배송 데이터 CRUD --> DB
    웹사이트 -- 결제 요청/결과 --> 결제시스템
    결제시스템 -- 결제 결과 --> 웹사이트
    웹사이트 -- 배송 요청/상태조회 --> 배송시스템
    배송시스템 -- 배송 상태 --> 웹사이트



-- 3) 시퀀스다이어그램 코드 만들어줘
-- 아래 사이트에서, 그림 도식화 할 예정
-- https://gist.github.com
-- md 파일에, mermaid 라는 문법을 통해서 erd 그림을 그리기

```mermaid
sequenceDiagram
    participant User as 사용자
    participant Web as 웹사이트
    participant DB as 데이터베이스
    participant Pay as 결제시스템
    participant Delivery as 배송시스템

    User->>Web: 회원가입/로그인 요청
    Web->>DB: 사용자 정보 저장/조회

    User->>Web: 상품 조회
    Web->>DB: 상품 정보 조회

    User->>Web: 장바구니 담기
    Web->>DB: 장바구니/상품 정보 저장

    User->>Web: 주문 요청
    Web->>DB: 주문 정보 저장

    Web->>Pay: 결제 요청
    Pay-->>Web: 결제 결과 반환
    Web->>DB: 결제 정보 저장

    Web->>Delivery: 배송 요청
    Delivery-->>Web: 배송 상태 반환
    Web->>DB: 배송 정보 저장

    User->>Web: 주문/배송/결제 내역 조회
    Web->>DB: 관련 정보 조회
    Web-->>User: 결과 반환


-------------------------

-- 아래 사이트에서, 그림 도식화 할 예정
-- https://gist.github.com
-- md 파일에, mermaid 라는 문법을 통해서 erd 그림을 그리기
