procedure TMDP990F1.combx_Dppropertieseditvaluechanged(Sender: TObject);
begin
if combx_Dp.ItemIndex = 0 then  // 외과 111210
  begin
    MDP990D1.dp_MdpDcotList.Request.FieldByName('mdcrDprtCd').AsString := '111210';
    MDP990D1.dp_MdpSearchList.Request.FieldByName('mcdpCd').AsString := '111210';
    MDP990D1.dp_MdpDcotList.Start;
  end
  else if combx_Dp.ItemIndex = 1 then  // 정형외과 111240
  begin
    MDP990D1.dp_MdpDcotList.Request.FieldByName('mdcrDprtCd').AsString := '111240';
    MDP990D1.dp_MdpSearchList.Request.FieldByName('mcdpCd').AsString := '111240';
    MDP990D1.dp_MdpDcotList.Start;
  end;
end;
