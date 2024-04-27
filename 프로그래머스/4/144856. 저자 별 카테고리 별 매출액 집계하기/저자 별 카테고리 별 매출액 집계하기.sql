-- 코드를 입력하세요
# SELECT b.author_id, a.author_name, b.category, SUM(bs.sales*b.price) as TOTAL_SALES
# FROM book as b join author as a on b.author_id = a.author_id join book_sales as bs on bs.book_id = b.book_id
# where sales_date >= 2022-01-01 and 2022-01-31 <= sales_date
# group by b.author_id, b.category
# order by b.author_id asc, b.category desc

SELECT 
  A.AUTHOR_ID, 
  B.AUTHOR_NAME, 
  A.CATEGORY,
  SUM(C.SALES * A.PRICE) AS TOTAL_SALES
FROM 
  BOOK A
JOIN 
  AUTHOR B ON A.AUTHOR_ID = B.AUTHOR_ID
JOIN 
  BOOK_SALES C ON C.BOOK_ID = A.BOOK_ID
WHERE 
  C.SALES_DATE BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY 
  A.AUTHOR_ID, 
  A.CATEGORY
ORDER BY 
  A.AUTHOR_ID ASC, 
  A.CATEGORY DESC