<!CDATA
SELECT B.USER_ID, B.USER_NM
FROM CCUSERAMV A
INNER JOIN CCUSRDPHT B ON A.LGIN_ID = B.LGIN_ID
WHERE B.MDCR_DPRT_CD = #{mdcrDprtCd} AND A.OCFM_CD = 'HAA' AND NOT A.USER_STTS_CD IN ('4','9') AND A.LGIN_ID NOT LIKE 'K%'
AND A.LGIN_ID NOT LIKE 'R%' AND CURRENT_DATE BETWEEN A.APST_YMD-1 AND A.APFN_YMD+1
ORDER BY B.LGIN_ID
]]>
<if test="userId != null">
and USER_ID like '%' || #{userId} || '%'
</if>
<if test="userNm != null">
and USER_NM like '%' || #{userNm} || '%'
</if>
