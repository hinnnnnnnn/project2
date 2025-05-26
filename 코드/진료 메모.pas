procedure TMDP990F1.qrbtn_MemoClick(Sender: TObject); //진료메모
begin

MDP990F2:= TMDP990F2.Create(Self);
MDP990F2.Show;

begin  //폼2에 값 넘겨주는 부분
SendLinkData.AllClear;
SendLinkData.PackageName := 'MDP990L1';
SendLinkData.ClassName := 'MDP990F2';
SendLinkData.Command:= 'MDP990F1';
SendLinkData.Destination := lddModalForm;

SendLinkData.Strings['ptno'] := MDP990D1.dt_MdpSearchList.FieldByName('ptno').AsString;
SendLinkData.Strings['gendCdAge'] := Format('%d세', [YearOf(Now) - StrToInt(Copy(MDP990D1.dt_MdpSearchList['btdt'].AsString, 1, 4))+1]);
SendLinkData.Strings['mdrpNo'] := MDP990D1.dt_MdpSearchList.FieldByName('mdrpNo').AsString;
SendLinkData.Strings['mdcrDt'] := FormatDateTime('YYYYMMDDHHNNSS',de_Date.Date);
SendLinkData.Strings['userId'] := VarToStr(lucombx_Dt.EditValue);

SendLinkData.Execute;

end;
end;
