procedure TMDP990F1.SMCFormShow(Sender: TObject);
begin
 MDP990D1.dp_MdpDcotList.Start(Self);
 Width := Screen.Width;
 Height := Screen.Height;
end;




procedure TMDP990F1.SMCFormCreate(Sender: TObject);
begin
if not Assigned(MDP990D1) then
begin
MDP990D1:= TMDP990D1.Create(Self);
MDP990D1.Name:= '';
end;

cbx_Am.Checked :=True;
cbx_Pm.Checked :=True;
cbx_Nemt.Checked :=True;

de_Date.date := Now;

gd_Board.Align := alClient;

end;
