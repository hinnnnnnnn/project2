procedure TMDP990F2.qrbtn_SaveClick(Sender: TObject); //저장 버튼 클릭
begin
//진료접수부가내역에 진료메모내용 저장
MDP990D1.dp_mdpMdbmUpdate.Request.FieldByName('mdrpNo').AsInteger := mdrpNo;
MDP990D1.dp_mdpMdbmUpdate.Request.FieldByName('mdcrMemoCtn').AsString := memo_list.Text;
MDP990D1.dp_mdpMdbmUpdate.Start(Self);

//진료접수정보에 저장
MDP990D1.dp_mdpAprcUpdate.Request.FieldByName('ptno').AsString := ptno;
MDP990D1.dp_mdpAprcUpdate.Request.FieldByName('mdcrDt').AsString := mdcrDt;
MDP990D1.dp_mdpAprcUpdate.Request.FieldByName('mdcrMemoCtn').AsString := memo_list.Text;
MDP990D1.dp_mdpAprcUpdate.Request.FieldByName('mdrpNo').AsInteger := mdrpNo;
MDP990D1.dp_mdpAprcUpdate.Start(Self) ;

//의사진료메모이력에 저장
MDP990D1.dp_mdpDctoInsert.Request.FieldByName('asndrId').AsString := userId;
MDP990D1.dp_mdpDctoInsert.Request.FieldByName('mdrpNo').AsInteger := mdrpNo;
MDP990D1.dp_mdpDctoInsert.Request.FieldByName('ptno').AsString := ptno;
MDP990D1.dp_mdpDctoInsert.Request.FieldByName('mdcrMemoCtn').AsString := memo_list.Text;
MDP990D1.dp_mdpDctoInsert.Request.FieldByName('lastUpdrId').AsString := userId;
MDP990D1.dp_mdpDctoInsert.Start(Self);

//저장 후 리스트 바로 뜨도록 코드 입력
MDP990D1.dp_mdpMemoList.Request.FieldByName('mdrpNo').AsInteger := mdrpNo;
MDP990D1.dp_mdpMemoList.Start(Self);

end;
