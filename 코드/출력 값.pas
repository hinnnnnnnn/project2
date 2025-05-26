procedure TMDP990F1.qrbtn_PtptintClick(Sender: TObject);
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
    sStrings.Values['mdcrDt'] := MDP990D1.dt_mdpSearchList.FieldByName('mdcrDt').AsString;
    sStrings.Values['ptno'] := MDP990D1.dt_mdpSearchList.FieldByName('ptno').AsString;
    sStrings.Values['ptnoNm'] := MDP990D1.dt_mdpSearchList.FieldByName('ptntNm').AsString;
    sStrings.Values['gendCdAge'] := MDP990D1.dt_mdpSearchList.FieldByName('gendCdAge').AsString;
    sStrings.Values['qr'] := de_Date.Text + '/' + combx_Dp.Text + '/' + lucombx_Dt.Text + '/' + MDP990D1.dt_mdpSearchList.FieldByName('mdcrDt').AsString
    + '/' + MDP990D1.dt_mdpSearchList.FieldByName('ptno').AsString
    + '/' + MDP990D1.dt_mdpSearchList.FieldByName('ptntNm').AsString
    + '/' + MDP990D1.dt_mdpSearchList.FieldByName('gendCdAge').AsString;


    SMCReport1.Clear;
    SMCReport1.DataFormat := rdfXML;
    SMCReport1.Connections.Clear;

    Connection := SMCReport1.Connections.Add('XML2');
//    Connection.Add('rexdataset/row1/row2', MDP990D1.dt_MdpSearchList);

    SMCReport1.Print('MDP990R2.reb',sStrings,[],true);
finally
     sStrings.Free;
end;
end;

procedure TMDP990F1.SMCFormShow(Sender: TObject);
begin
 MDP990D1.dp_MdpDcotList.Start(Self);
 Width := Screen.Width;
 Height := Screen.Height;
end;
