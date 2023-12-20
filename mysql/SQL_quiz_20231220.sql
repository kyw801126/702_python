/* 내부조인 */
-- 1. bookstore 에서 고객 이름, 고객 주문 도서의 판매 가격을 출력
SELECT username, saleprice
	FROM CUSTOMER C
	INNER JOIN ORDERS O
	ON C.custid = O.custid;

SELECT username, saleprice
	FROM CUSTOMER C, ORDERS O
	WHERE C.custid = O.custid;
    
/* 외부조인 */
-- 1. 도서를 구매하지 않은 고객을 포함해 고객 이름/전화번호 와 주문 도서의 판매 가격을 출력
SELECT username, O.saleprice
	FROM customer  C
	LEFT OUTER JOIN orders O 
	ON C.custid = O.custid;
-- 2. 도서를 구매한 이력이 있는 고객 이름, 판매 도서의 가격을 출력하세요.(hint: crossjoin)
SELECT	Customer.username, saleprice, orderdate
	FROM  Customer
	CROSS JOIN ORDERS 
	ON Customer.custid = ORDERS.custid;
    
    
-- 3. bookstore 총구매액을 기준으로 60000만원 이상 '최우수고객' 50000이상 '우수고객'
-- 40000만원 이상 '일반고객' 4만원 이하면 유령고객 
SELECT custid, SUM(saleprice) AS '총구매액', 
       CASE  
          WHEN (sum(saleprice)  >= 60000) THEN '최우수고객'
          WHEN (sum(saleprice)  >= 50000) THEN '우수고객'
          WHEN (sum(saleprice ) >= 40000 ) THEN '일반고객'
          ELSE '유령고객'
        END AS '고객등급'
    FROM orders 
	GROUP BY custid; 



