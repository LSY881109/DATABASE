//몽고디비 서버 시작 명령어
//mongod --dbpath C:\Users\it\Documents\mongodb

//명령어창에서 붙여넣기

//종료는 컨트롤+c
//또는 창닫기
//vscode에서, 연결 서버 주소 기본
//mongodb://localhost:27017
//[파일명].mongodb.js

//NOSQL-TEST.mongodb.js
//test.mongodb.js


use('test')//기본 데이터 베이스, test 사용함. 생략시 기본 test 데이터베이스 사용


//SQL 사용 하는 테이블, NOSQL 컬렉션으로 사용함.
//테이블 생성,
//db.[컬렉션명].insertone({
//    [컬럼명]:[값],
//    name: '홍길동',
//    age: 20,
//  favorite: ['apple', 'banana'],
//})


//한줄 실행 : ctrl + alt + s  [실행한 부분 전체 드래그]
//전체 실행 : ctrl + alt + r  [실행한 부분 전체 드래그]
db.users.insertOne({
    name: '홍길동',
    age: 20,
    favorite: ['apple', 'banana'],
});



db.users.insertOne({
    name: '이승엽',
    age: 99,
    favorite: ['banana', 'kiwi'],
});

// 조회
//db.[컬렉션명].find()
db.users.find();

//수정
//db.[컬렉션명].updateone({[조건]},{[수정할 값]})
db.users.updateOne(
    { name: '홍길동' },
    { $set: { age: 30 } }
);


//삭제
//db.[컬렉션명].deleteone({[조건]})
db.users.deleteOne({ name: '홍길동' });

// capped collection, 컬렉션 = 테이블
// 컬렉션의 용량이 초과하게 되면 오래된 데이터 부터 차례대로 삭제하는 기능.
// db.createCollection('capped', { capped: true, size: 1000000, maxDocuments: 1000 });
//  용량이 5KB인 컬렉션을 생성하고, 부가 기능으로 용량 초과시 오래된 데이터 삭제
db.createCollection('logs4', { capped: true, size: 5000, }); // 5KB
// 샘플 데이터 추가, 반복문을 이용해서, 샘플로 1000개 추가
for (let i = 2000; i < 3000; i++) {
    db.logs.insertOne({
        message: `로그 메시지 ${i}`,
        timestamp: new Date() // 오라클로 표현 sysdate() 같은 현재 날짜
    });
}


db.logs.find().pretty(); // pretty() : 보기 좋게 출력

db.createCollection('logs4', { capped: true, size: 5000, }); // 5KB
for (let i = 1000; i < 2000; i++) {
    db.logs2.insertOne({
        message: `로그 메시지 ${i}`,
        timestamp: new Date() // 오라클로 표현 sysdate() 같은 현재 날짜
    });
}

--퀴즈1
--한개 문서 삽입, 컬렉션 명: users2
--이름, 생년월일, 좋아하는 음식 등, 등록날짜
db.users2.insertOne({
    name: '김지연',
    birth: '1994-11-04',
    favorite: ['떡볶이 ', '빵'],
    createdAt: new Date(),
});
--조회 해보기
db.users2.find();

--퀴즈2
--users2, 수정해보기
--항목들 중, 자전거 문자열 추가해보기.
    db.users2.updateOne(
        { name: '김지연' },
        { $set: { favorite: ['떡볶이 ', '빵', '자전거'] } }
    );

--퀴즈3
--users2, 에서 등록한 항복 삭제해보기
--항목들 중, 자전거 문자열 삭제해보기.
    db.users2.updateOne(
        { name: '김지연' },
        { $pull: { favorite: '자전거' } }
    );

--한번에 여러개 바꿔보기
--users2, 에서 등록한 항복 삭제해보기
--항목들 중, 자전거, 떡볶이 문자열 삭제해보기. 
--이름도 수정 해보기
db.users2.updateOne(
    { name: '김지연' },
    { $set: { name: '김지연2' } }
);
db.users2.updateOne(
    { name: '김지연' },
    { $pull: { favorite: { $in: ['자전거', '떡볶이'] } } }
);


db.logs.drop();



17. logs 라는 컬렉션 이름으로, Capped Collection, 컬렉션 생성합니다.
    옵션, 5KB(size : 5000) 이용해서, 오래된 데이터 삭제 되는 부분 확인.
        제출 1) Capped Collection, 컬렉션 생성 쿼리 화면 2) 샘플 데이터 추가 쿼리 3) 결과 쿼리

// 1) logs라는 이름의 Capped Collection 생성 (5KB)
db.createCollection('logs', { capped: true, size: 5000 });

// 2) 샘플 데이터 100개 추가
for (let i = 1; i <= 100; i++) {
    db.logs.insertOne({
        message: `로그 메시지 ${i}`,
        timestamp: new Date()
    });
}

// 3) 결과 조회 (최신 100개만 남아있는지 확인)
db.logs.find().pretty();


18. 한 개 문서 삽입, 컬렉션 명: users, 컬럼 : 이름, 생년월일, 좋아하는 음식, 등록날짜,
    샘플 데이터 3개 추가
제출 1) 추가하는 쿼리 화면 2) 조회 결과 화면

// 1) users 컬렉션에 샘플 데이터 3개 추가
db.users.insertOne({
    name: '홍길동',
    birth: '1990-01-01',
    favorite: ['떡볶이', '치킨'],
    createdAt: new Date()
});
db.users.insertOne({
    name: '김철수',
    birth: '1985-05-12',
    favorite: ['피자', '초밥'],
    createdAt: new Date()
});
db.users.insertOne({
    name: '이영희',
    birth: '2000-09-30',
    favorite: ['파스타', '샐러드'],
    createdAt: new Date()
});

// 2) users 컬렉션 전체 조회
db.users.find();


19. 컬렉션 명: users, 좋아하는 음식 컬럼 수정해보기, 하나만 수정하기
제출 1) 수정하는 쿼리 화면 2) 조회 결과 화면

// 1) users 컬렉션에서 '홍길동'의 좋아하는 음식(favorite)만 수정
db.users.updateOne(
    { name: '홍길동' },
    { $set: { favorite: ['떡볶이', '치킨', '라면'] } }
);

// 2) 조회
db.users.find();


20. 컬렉션 명: users, 에서, 등록한 항목 하나 삭제 해보기.
    제출 1) 삭제하는 쿼리 화면 2) 조회 결과 화면

// 1) users 컬렉션에서 '이영희' 문서 하나 삭제
db.users.deleteOne({ name: '이영희' });

// 2) users 컬렉션 전체 조회 (삭제 결과 확인)
db.users.find();

