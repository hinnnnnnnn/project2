procedure TMDP990F2.SMCFormLinkDataReceive(Sender: TObject; AReceiveData, //폼1에서 데이터 값 받아오기
  AReturnData: TLinkData);
begin
  ptno := AReceiveData.Strings['ptno'];
  mdrpNo := AReceiveData.Integers['mdrpNo'];
  gendCdAge := AReceiveData.Strings['gendCdAge'];
  mdcrDt := AReceiveData.Strings['mdcrDt'];
  userId := AReceiveData.Strings['userId'];

  //메모 실행 시 메모장과 그리드에 뜨는 부분
  txt_ptno.Text := ptno + ' (' + gendCdAge + ')';

  MDP990D1.dp_mdpMemoList.Request.FieldByName('mdrpNo').AsInteger := mdrpNo;
  MDP990D1.dp_mdpMdetList.Request.FieldByName('mdrpNo').AsInteger := mdrpNo;

  MDP990D1.dp_mdpMemoList.Start(Self);
  MDP990D1.dp_mdpMdetList.Start(Self);

end;
