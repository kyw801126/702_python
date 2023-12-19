-- 박씨 성을 가진 고객을 출력하시오.
SELECT username FROM customer WHERE username LIKE '박%';

-- 2번째 글자가 '지'인 고객을 출력하시오.
SELECT username FROM customer WHERE username LIKE '_지%';

-- '철학의 역사'를 출간한 출판사를 검색하시오.
SELECT	bookname, publisher
FROM	Book
WHERE	bookname LIKE '철학의 역사';


-- 질의 도서이름에 '파이썬'가 포함된 출판사를 검색하시오.
SELECT	bookname, publisher
FROM	Book
WHERE	bookname LIKE '%파이썬%';

-- '썬'으로 일치하는 도서 중 가격이 20,000원 이상인 도서를 검색

SELECT	*
FROM	Book
WHERE	bookname LIKE '%썬%' AND price >= 20000;

--  출판사 이름이 ‘정론사’ 혹은 ‘새미디어’인 도서를 검색하시오.
SELECT	*
FROM	Book
WHERE	publisher='정론사'  OR  publisher='새미디어';


/* order by */
-- 도서를 이름순으로 검색하시오.
SELECT	*
FROM	Book
ORDER BY	bookname;

-- 질의)  도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색
SELECT	*
FROM	Book
ORDER BY	price, bookname; 

-- 도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름 차순으로 검색한다.
SELECT	*
FROM	Book
ORDER BY	price DESC, publisher ASC;

-- 주문일자를 내림차순으로 정렬하시오 
SELECT	*
FROM	orders
ORDER BY orderdate DESC;


SELECT	*
FROM	Book
WHERE	bookname LIKE '%썬%' AND price < 20000
ORDER BY publisher DESC;


SELECT * FROM orders WHERE saleprice > 1000
ORDER BY bookid;

-- 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.
SELECT *
FROM Orders;

SELECT	custid, 
		COUNT(*) AS '도서수량', 
		SUM(saleprice) AS '판매액'
FROM Orders
GROUP BY custid;


-- 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가와 고객아이디를 출력하시오.
SELECT custid, 
       SUM(saleprice) AS 총매출,
       AVG(saleprice) AS 평균,
       MIN(saleprice) AS 최소값,
       MAX(saleprice) AS 최대값
FROM Orders
GROUP BY custid;
