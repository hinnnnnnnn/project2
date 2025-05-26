<![CDATA[
SELECT
f_b.MDCR_MEMO_CTN /*진료메모내용*/
FROM APRCRPTNT f_a, APRCADBLT f_b 
WHERE f_a.MDRP_NO = f_b.MDRP_NO(+) 
AND f_a.MDRP_NO = #{mdrpNo};
]]>
<if test="mdcrMemoCtn != null">
 and MDCR_MEMO_CTN like '%' || #{mdcrMemoCtn} || '%'
</if>
