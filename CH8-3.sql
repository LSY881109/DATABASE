-- 표준 SQL 99 이용해서, 조인의 표현식 연습 

--기본 개념 비교  

-- | 문법 | 설명 | 특징 |
--|------|------|------|
-- | `NATURAL JOIN` | 공통 열 이름 자동 조인 | 간결하지만 제어 불가 |
-- | `JOIN ... USING(col)` | 지정 열 기준 조인 | 동일 열 이름만 사용 가능 |
-- | `JOIN ... ON(cond)` | 조건 지정 조인 | 가장 유연하고 범용 |
-- | `LEFT/RIGHT/FULL OUTER JOIN` | 외부 조인 구현 | NULL 포함된 결과도 출력 |

-- 기본 문법 예시 
-- NATURAL JOIN 
select *
  from emp
natural join dept;

-- 생략 버전 
-- NATURAL JOIN	  ON, USING 모두 생략		두 테이블에 같은 이름의 컬럼이 반드시 있어야 함



-- JOING USING 
select ename,
       dname
  from emp
  join dept
using ( deptno );

-- 생략 버전 
--JOIN USING(col)	ON A.col = B.col 생략	조인 컬럼 이름이 동일해야 함


-- JOIN ON  ,가장 많이 사용하는 포맷 형식
--JOIN ON A.col = B.col	❌ 생략 불가		가장 명시적, 유연함
select ename,
       dname
  from emp
  join dept
on emp.deptno = dept.deptno;

-- LEFT OUTER JOIN			OUTER 생략 가능				LEFT JOIN만 써도 완전 동일하게 동작
-- LEFT OUTER JOIN, 왼쪽 외부 조인 
select ename,
       dname
  from emp
  left outer join dept
on emp.deptno = dept.deptno;

-- RIGHT OUTER JOIN, 오른쪽 외부 조인 
select ename,
       dname
  from emp
 right outer join dept
on emp.deptno = dept.deptno;

-- FULL OUTER JOIN, 양쪽 외부 조인 
select ename,
       dname
  from emp
  full outer join dept
on emp.deptno = dept.deptno;

-- 3개 이상 테이블 조인 
select emp.ename,
       dept.dname,
       location.loc_id
  from emp
  join dept
on emp.deptno = dept.deptno
  join location
on dept.deptno = location.loc_id;

select *
  from dept;
select *
  from location;

--임시 테이블 생성 
create table location (
   loc_id number primary key,
   loc    varchar2(50)
);

-- 처음 배울 때 가급적 생략 버전 보다, 일단 풀버전 학습
-- 생략된 버전을 보면 좋을 것 같아요.

--✅ 정리 표: 생략 가능 여부 요약
--JOIN 구문 유형		    	생략 가능 요소				생략 조건 또는 주의사항
--NATURAL JOIN			    ON, USING 모두 생략			두 테이블에 같은 이름의 컬럼이 반드시 있어야 함
--JOIN USING(col)			ON A.col = B.col 생략		조인 컬럼 이름이 동일해야 함
--JOIN ON A.col = B.col	❌ 생략 불가					가장 명시적, 유연함
--LEFT OUTER JOIN			OUTER 생략 가능				LEFT JOIN만 써도 완전 동일하게 동작


-- 퀴즈1
-- `JOIN ... ON`을 사용하여 EMP와 DEPT를 등가 조인하시오.  
select emp.ename,
       dept.dname
  from emp
  join dept
on emp.deptno = dept.deptno;

-- 퀴즈2
-- `NATURAL JOIN`으로 EMP와 DEPT를 연결하시오.  
select *
  from emp
natural join dept;

-- 퀴즈3
-- `USING`을 사용해 조인하되, 부서명이 있는 사원만 출력하시오.
select emp.ename,
       dept.dname
  from emp
  join dept
using ( deptno );

-- 퀴즈4
--`LEFT OUTER JOIN`을 사용하여 부서가 없는 사원도 포함한 결과를 출력하시오.  
select emp.ename,
       dept.dname
  from emp
  left outer join dept
on emp.deptno = dept.deptno;

-- 퀴즈5
-- EMP, DEPT, LOCATION 테이블을 SQL-99 방식으로 연결하여 
-- 사원이름, 부서명, 지역명을 출력하시오.  
select *
  from location;
select emp.ename,
       dept.dname,
       location.loc
  from emp
  join dept
on emp.deptno = dept.deptno
  join location
on dept.deptno = location.loc_id;

-- 퀴즈6
-- `FULL OUTER JOIN`으로 사원이 없는 부서와 
-- 부서가 없는 사원을 모두 출력하시오. 
select emp.ename,
       dept.dname
  from emp
  full outer join dept
on emp.deptno = dept.deptno;