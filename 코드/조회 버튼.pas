procedure TMDP990F1.qrbtn_lnqClick(Sender: TObject);
var
result : string;
seq : Integer; //나이 변수 생성
begin
  //오류 팝업 ----------------------------------------------------------------------------------------
  if de_Date.Date = NullDate then  //날짜 미선택시, 오류 메시지 팝업
    begin
      SMCShowMessage('EC11924');
      combx_Dp.SetFocus;
      Exit;
    end;


  if combx_Dp.ItemIndex = -1 then  //진료과 미선택시, 오류 메시지 팝업
    begin
      SMCShowMessage('EC88005');
      combx_Dp.SetFocus;
      Exit;
    end;

  if lucombx_Dt.ItemIndex = -1 then  //진료의  미선택시, 오류 메시지 팝업
    begin
      SMCShowMessage('EC08863');
      lucombx_Dt.SetFocus;
      Exit;
    end;

  if cbx_Nemt.Checked or cbx_Emt.Checked = False then  //미진찰 및 진찰 모두 미체크시, 오류 메시지 팝업
    begin
      SMCShowMessage('EC03028');
      cbx_Nemt.SetFocus;
      Exit;
    end;

  if cbx_Am.Checked or cbx_Pm.Checked = False then  //오전, 오후 미체크시, 오류 메시지 팝업
    begin
      SMCShowMessage('EC05886');
      cbx_Nemt.SetFocus;
      Exit;
    end
  else


    if cbx_Sec.Checked = False then  //2차진료여부 미체크시, 쿼리 실행
      begin
        MDP990D1.dp_MdpSearchList.Request.FieldByName('sec').AsString := 'Y';
      end
    else if cbx_Sec.Checked = True then
      begin
        MDP990D1.dp_MdpSearchList.Request.FieldByName('sec').AsString := 'N'
      end;

    if cbx_Ect.Checked = False then  //기타 여부 미체크시, 쿼리 실행
      begin
        MDP990D1.dp_MdpSearchList.Request.FieldByName('etch').AsString := 'Y';
      end
    else if cbx_Ect.Checked = True then
      begin
        MDP990D1.dp_MdpSearchList.Request.FieldByName('etch').AsString := 'N';
      end;


    if cbx_am.Checked = True then   //오전 체크시
      begin
        MDP990D1.dp_mdpSearchList.Request.FieldByName('ampmDvsnCd').AsString := 'A';
      end;

    if cbx_pm.Checked = True then   //오후 체크시
      begin
        MDP990D1.dp_mdpSearchList.Request.FieldByName('ampmDvsnCd').AsString := 'P';
      end;

    if cbx_am.Checked = True and cbx_pm.Checked = True then    //오전, 오후 둘 다 체크시
      begin
        MDP990D1.dp_mdpSearchList.Request.FieldByName('ampmDvsnCd').AsString := 'Y';
      end;

    MDP990D1.dp_MdpSearchList.Request.FieldByName('mdcrYmd').AsString := de_Date.Text;  //내원일자 선택
    MDP990D1.dp_MdpSearchList.Request.FieldByName('mddrId').AsString := VarToStr(lucombx_Dt.EditValue); //진료의 선택
    MDP990D1.dp_MdpSearchList.Request.FieldByName('mccnCd').AsString := '201387'; //진료 센터 코드 본원으로 고정

    if cbx_Emt.Checked = False then //진찰 미선택시, N 값 전달
      begin
        MDP990D1.dp_MdpSearchList.Request.FieldByName('mdcrYn').AsString := 'N';
      end
    else if cbx_Nemt.Checked = False then //미진찰 미선택시, Y값 전달
      begin
        MDP990D1.dp_MdpSearchList.Request.FieldByName('mdcrYn').AsString := 'Y';
      end;


    MDP990D1.dt_mdpSearchList.DisableControls;

    if MDP990D1.dp_mdpSearchList.Start then
    begin
      seq := 1;
      MDP990D1.dt_MdpSearchList.First;
      while NOT MDP990D1.dt_mdpSearchList.Eof do
      begin
        MDP990D1.dt_MdpSearchList.Edit;
        result := Format('%d세', [YearOf(Now) - StrToInt(Copy(MDP990D1.dt_MdpSearchList['btdt'].AsString, 1, 4))+1]); //00세 나이 표현 값
        MDP990D1.dt_MdpSearchList['gendCdAge'].AsString := MDP990D1.dt_MdpSearchList['gendCd'].AsString + '/' + result; //S/A 표현 값
        MDP990D1.dt_MdpSearchList['addSqnc'].AsString := IntToStr(seq);
        inc(seq);
        MDP990D1.dt_MdpSearchList.Post;
        MDP990D1.dt_MdpSearchList.Next;
      end;
    end;
    MDP990D1.dt_mdpSearchList.EnableControls;
end;
