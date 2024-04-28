# -- 코드를 입력하세요

SELECT USER_ID, NICKNAME, SUM(PRICE) as TOTAL_SALES
FROM USED_GOODS_BOARD a JOIN USED_GOODS_USER b ON a.WRITER_ID = b.USER_ID
WHERE STATUS = 'DONE'
GROUP BY WRITER_ID 
HAVING SUM(PRICE) >= 700000 
ORDER BY TOTAL_SALES