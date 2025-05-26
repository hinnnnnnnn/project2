<!CDATA
insert
into MDBMEHIST
(
ASNDR_ID /* 담당의사ID */
, MDCR_MEMO_SNO /* 진료메모일련번호 */
, MDRP_NO /* 진료접수번호 */
, MDFC_DT /* 변경일시 */
, PTNO /* 환자번호 */
, CODV_CD /* 내원구분코드 */
, MDCR_MEMO_CTN /* 진료메모내용 */
, FRST_RGSR_ID
, FRST_RGST_IP
, FRST_RGST_DT
, FRST_RGST_CLNT_PRGM_ID
, FRST_RGST_SRVR_PRGM_ID
, LAST_UPDR_ID
, LAST_UPDT_IP
, LAST_UPDT_DT
, LAST_UPDT_CLNT_PRGM_ID
, LAST_UPDT_SRVR_PRGM_ID
)
values
(
#{asndrId} /* 담당의사ID */
, (SELECT COALESCE(MAX(MDCR_MEMO_SNO), 0) + 1 FROM MDBMEHIST WHERE MDRP_NO = #{mdrpNo} AND ASNDR_ID = #{asndrId})
, #{mdrpNo} /* 진료접수번호 */
, sysdate /* 변경일시 */
, #{ptno} /* 환자번호 */
, 'O' /* 내원구분코드 */
, #{mdcrMemoCtn} /* 진료메모내용 */
, #{gvUserId}
, #{gvUserIp}
, sysdate
, #{gvClntPrgmId}
, #{gvSrvrPrgmId}
, #{lastUpdrId}
, #{gvUserIp}
, sysdate
, #{gvClntPrgmId}
, #{gvSrvrPrgmId}
)
]]>
