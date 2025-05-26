procedure TMDP990F2.qrbtn_DelClick(Sender: TObject); //삭제 버튼 클릭

begin
MDP990D1.dp_mdpListDelete.Request.FieldByName('ptno').AsString := ptno;
MDP990D1.dp_mdpListDelete.Request.FieldByName('mdrpNo').AsInteger := mdrpNo;

mdfcDt := MDP990D1.dt_mdpMemoList.FieldByName('lastUpdtDt').AsString;
MDP990D1.dp_mdpListDelete.Request.FieldByName('mdfcDt').AsString  := mdfcDt;

MDP990D1.dp_mdpListDelete.Start(Self);

MDP990D1.dp_mdpMemoList.Request.FieldByName('mdrpNo').AsInteger := mdrpNo;
MDP990D1.dp_mdpMemoList.Start(Self);
end;
