--ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--SELECT SYSDATE FROM DUAL;



-- 오라클 시간 동기화 date
-- 도커 데스크톱 실행 후 
-- 도커 데스크톱 -> 컨테이너 아이디 복사 
-- 예시 
-- 6b2355671b6d2ea7217e783b1ef3e1ebef377a9b35de48d2f54216ea48efa807

-- 터미널에서 해보기. 
-- 마이크로 소프트의 스토어 : store -> 터미널 
docker exec -it 6b2355671b6d2ea7217e783b1ef3e1ebef377a9b35de48d2f54216ea48efa807  /bin/bash

-- dpkg-reconfigure tzdata 

-- 만약, 안될 경우1, apt-get update
-- 만약, 안될 경우2, apt-get install --reinstall tzdata

-- 6 asis , 선택

-- 69 seolu 선택 

-- date, 명령어 확인

--시간 동기화 진행후 도커데스크탑 정지후 재시작