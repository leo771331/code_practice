-- 코드를 작성해주세요
SELECT
    child.ITEM_ID,
    child.ITEM_NAME,
    child.RARITY
FROM ITEM_INFO AS parent
JOIN ITEM_TREE AS t
ON parent.ITEM_ID = t.PARENT_ITEM_ID
JOIN ITEM_INFO AS child
ON t.ITEM_ID = child.ITEM_ID
WHERE parent.RARITY = 'RARE'
ORDER BY child.ITEM_ID DESC;