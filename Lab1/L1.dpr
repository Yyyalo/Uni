Program L1;
{$AppType CONSOLE}

uses
  Windows,
  U1 in 'U1.pas';

Var 
	S, S1, S2: ANSIString;
	Nom: Byte;
  dat,res:textfile;
Begin

 // ������ ������� ��������  ��� ����������� ����� � ������
  setConsoleCP(1251); // ��� ����� 
  setConsoleOutputCP(1251); // ��� ������

  AssignFile(dat,paramstr(1));
  reset(dat);
  AssignFile(res,paramstr(2));
  rewrite(res);


  Writeln(res,'10 ���. ������� ������ (������� ����� �� Lucida Console)');
  readln(dat,S); // ����

 S1:=Copy(S, 1, Length(S)); S2:=Copy(S, 1, Length(S)); // �������� ����� ���.������ 

  // ��� ����� ������� �������� (�� ������� �������� ������)
  Writeln(res,#13#10, '������ �� ����������'#13#10'*', S1,'*');
  Nom:= Prov1(s1); // ��������
  Case Nom of
    1: writeln(res,'������ ������');
    2: writeln(res,'������������ �������');
    else
     begin // ����������
       Sort1(s1);
       Writeln(res,'��������������� ������ 1'#13#10'*', S1,'*');  // ����� ������ S1
     end; {else}
  End; {case}
  
  // �� ����� �������� ��������
  Writeln(res,#13#10'������ �� ����������'#13#10'*', S2,'*');
  Nom:= Prov2(s2); // ��������
  Case Nom of
    1: writeln(res,'������ ������');
    2: writeln(res,'������������ �������');
    else
     begin // ����������
       Sort2(s2);
       Writeln(res,'��������������� ������ 2'#13#10'*', S2,'*');  // ����� ������ S2
     end; {else}
  End; {case}

  CloseFile(dat);
  CloseFile(res);
  //writeln(#13#10'Press ENTER to exit');
  //readln

End.

