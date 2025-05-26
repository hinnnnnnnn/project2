procedure TMDP990F2.SMCGrid2SMCGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
     memo_list.Text := MDP990D1.dt_mdpMemoList.FieldByName('mdcrMemoCtn').AsString;
end;
