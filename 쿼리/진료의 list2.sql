<![CDATA[
SELECT  
A.LAST_UPDT_DT, /*변경일시*/
    A.MDCR_MEMO_CTN, /*메모내용*/
    (SELECT f_a.USER_NM FROM CCUSRDPHT f_a WHERE f_a.USER_ID = A.LAST_UPDR_ID) AS USER_NM /*수정자*/
 FROM MDBMEHIST A 
WHERE A.MDRP_NO = #{mdrpNo}
ORDER BY A.LAST_UPDT_DT DESC;
]]>
<if test="lastUpdtDt != null">
 and LAST_UPDT_DT like '%' || #{lastUpdtDt} || '%'
</if>
<if test="mdcrMemoCtn != null">
 and MDCR_MEMO_CTN like '%' || #{mdcrMemoCtn} || '%'
</if>
<if test="userNm != null">
 and USER_NM like '%' || #{userNm} || '%'
</if>
