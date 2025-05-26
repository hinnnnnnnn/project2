procedure TMDP990F1.qrbtn_PrintClick(Sender: TObject); //출력 버튼 클릭
var
Connection : TSMCReportConnection;
i : Integer;
sStrings:TStrings;
begin
   sStrings:=TStringList.Create;
 try
      sStrings.Values['mdcrYmd'] := de_Date.Text;
      sStrings.Values['adrvMcdpCd'] := combx_Dp.Text;
      sStrings.Values['mddrNm'] := lucombx_Dt.Text;

      if cbx_Nemt.Checked = true then
        begin
          sStrings.Values['nemt'] := 'true';
        end;

      if cbx_Emt.Checked = true then
        begin
          sStrings.Values['emt'] := 'true';
        end;

      if cbx_Sec.Checked = true then
        begin
          sStrings.Values['sec'] := 'true';
        end;

      if cbx_Ect.Checked = true then
        begin
          sStrings.Values['etc'] := 'true';
        end;

      if cbx_am.Checked = true then
        begin
          sStrings.Values['am'] := 'true';
        end;

      if cbx_pm.Checked = true then
        begin
          sStrings.Values['pm'] := 'true';
        end;

      if cbx_Gmedi.Checked = true then
        begin
          sStrings.Values['gmedi'] := 'true';
        end;

    SMCReport1.Clear;
    SMCReport1.DataFormat := rdfXML;
    SMCReport1.Connections.Clear;

    Connection := SMCReport1.Connections.Add('XML1');
    Connection.Add('rexdataset/row1/row2', MDP990D1.dt_MdpSearchList);

    SMCReport1.Print('MDP990R1.reb',sStrings,[],true);
finally
     sStrings.Free;
end;
end;
