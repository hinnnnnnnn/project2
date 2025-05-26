<![CDATA[
UPDATE APRCRPTNT
SET MDCR_MEMO_CTN = #{mdcrMemoCtn} 
WHERE PTNO = #{ptno}
AND MDRP_NO = #{mdrpNo};
]]>



<![CDATA[ 
UPDATE APRCADBLT 
SET MDCR_MEMO_CTN = #{mdcrMemoCtn}     
WHERE MDRP_NO = #{mdrpNo};  
]]>
