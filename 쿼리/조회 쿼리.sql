<!CDATA
SELECT
TO_CHAR(MDCR_APNT_APLC_YMD, 'HH24:MI') AS MDCR_APNT_APLC_YMD, /*당일접수시간*/
TO_CHAR(A.MDCR_DT, 'HH24:MI') AS MDCR_DT, /*예약시간*/
A.PTNO, /*환자번호*/
B.PTNT_NM, /*환자명*/
B.GEND_CD, /*성별*/
TO_CHAR(B.BTDT,'YYYYMMDD') AS BTDT, /*생년월일*/
(
SELECT f_a.KORN_DPRT_NM
FROM HZDEPTMMT f_a
WHERE f_a.DPRT_CD = A.MCCN_CD
AND ROWNUM < 2
GROUP BY f_a.KORN_DPRT_NM) AS MCCN_NM, /*센터*/
(
SELECT f_a.ABRV_DPRT_CD ABRV_DPRT_CD
FROM HZDEPTMMT f_a
WHERE f_a.DPRT_CD = A.MCDP_CD
AND ROWNUM = 1) AS ABRV_MCDP_CD, /*진료과*/
(
SELECT USER_NM MDDR_NM
FROM CCUSRDPHT f_a
WHERE f_a.USER_ID = A.MDDR_ID
AND ROWNUM = 1) AS MDDR_NM, /*진료의*/
(
SELECT DETL_CD_NM FVDV_NM
FROM CCCMCDDMT f_a
WHERE f_A.COMN_GRP_CD='AP019'
AND f_a.COMN_DTLS_CD = A.FVDV_CD
AND ROWNUM = 1) AS FVDV_NM, /*초재진*/
A.MDRP_NO /*접수번호*/
FROM APRCRPTNT A INNER JOIN APPTPTNTT B
ON A.PTNO = B.PTNO
WHERE A.MDCR_YMD = #{mdcrYmd}
AND A.MCDP_CD = #{mcdpCd}
AND A.MDDR_ID = #{mddrId}
AND A.MCCN_CD = #{mccnCd}
AND A.MDCR_YN = #{mdcrYn}
AND A.CODV_CD = 'O'
AND A.CNCL_DT IS NULL
AND (CASE WHEN A.MCFE_RCPC_CD IS NULL
THEN 'N' ELSE A.MCFE_RCPC_CD END) <> ('R')
AND (CASE WHEN A.MDCR_ANDV_CD IS NULL
THEN 'N' ELSE A.MDCR_ANDV_CD END) NOT IN ('7','C')
AND ((#{sec} = 'Y' AND (CASE WHEN A.MDCR_ANDV_CD IS NULL THEN '' ELSE A.MDCR_ANDV_CD END) NOT IN ('8')) OR #{sec} != 'Y') /*2차진료여부 미체크시*/
AND ((#{etch} = 'Y' AND (CASE WHEN A.MDCR_ANDV_CD IS NULL THEN '' ELSE A.MDCR_ANDV_CD END) NOT IN ('9','A','X')) OR #{etch} != 'Y') /*기타여부 미체크시*/
AND ((#{ampmDvsnCd} = 'A' AND (TO_CHAR(MDCR_DT, 'HH24MI') < '1300')) OR #{ampmDvsnCd} != 'A') /*오전 체크시*/
AND ((#{ampmDvsnCd} = 'P' AND (TO_CHAR(MDCR_DT, 'HH24MI') >= '1300')) OR #{ampmDvsnCd} != 'P'); /*오후 체크시*/
]]>
<if test="mdcrDt != null">
and MDCR_DT like '%' || #{mdcrDt} || '%'
</if>
<if test="mdcrApntAplcYmd != null">
and MDCR_APNT_APLC_YMD like '%' || #{mdcrApntAplcYmd} || '%'
</if>
<if test="ptno != null">
and PTNO like '%' || #{ptno} || '%'
</if>
<if test="ptntNm != null">
and PTNT_NM like '%' || #{ptntNm} || '%'
</if>
<if test="gendCd != null">
and GEND_CD like '%' || #{gendCd} || '%'
</if>
<if test="btdt != null">
and BTDT like '%' || #{btdt} || '%'
</if>
<if test="mccnNm != null">
and MCCN_NM like '%' || #{mccnNm} || '%'
</if>
<if test="abrvMcdpCd != null">
and ABRV_MCDP_CD like '%' || #{abrvMcdpCd} || '%'
</if>
<if test="mddrNm != null">
and MDDR_NM like '%' || #{mddrNm} || '%'
</if>
<if test="fvdvNm != null">
and FVDV_NM like '%' || #{fvdvNm} || '%'
</if>
