/* selecting  from the main table the session_id and fees after filtering on a subquery that grouped by session id and selected the latest timestamp*/

SELECT 
    session_id, delivery_fee_lc
FROM
    sessions
WHERE
    created_at IN (SELECT 
            MAX(created_at)
        FROM
            sessions
        GROUP BY session_id
        ORDER BY created_at DESC); 
        

/* USING CASE TO conditon on the surge_aplicable column to populate a fifth colum  as a label */
SELECT 
    *,
    CASE
        WHEN surge_applicable = 'YES' THEN 'Surge Applicable'
        ELSE 'Surge Not applicable'
    END AS 'Label'
FROM
    sessions

