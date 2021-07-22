Unit U1;
Interface       // ������ �������� ������������� ����������

Uses     
  SysUtils;   
Const
  SymbTable = '�����������娸��������������������������������������������������zyxwvutsrqponmlkjihgfedcbaABCDEFGHIJKLMNOPQRSTUVYXYZ '; //������ ���������?

Const
  //Cifr : set of '0'.. '9' = ['0'.. '9'];
  BukvKir: set of ANSIchar = ['�'..'�','�'..'�','�','�'];//?
  BukvLat: set of ANSIchar = ['a'..'z','A'..'Z'];        //      ?

Function Prov1(const s: ANSIString): Byte; // �������� ��� SymbTable
Function Prov2(const s: ANSIString): Byte; // �������� � SymbTable
Procedure Sort1(var s: ANSIString);  // ���������� ��� SymbTable
Procedure Sort2(var s: ANSIString);  // ���������� � SymbTable

Implementation  // ������ ���������� � �������� �������� ��������

Function Prov1; // �������� ��� SymbTable
Var
  Nom: byte; // ����� ��������
  i,Len: word; // ������� ������ � ����� ������
Begin
  Nom:=0; len:= Length(S);
  If Len=0 then Nom:=1
  Else
    Begin
      i:=1;
      while (i<=Len) and (Nom=0) do
      begin
        if Not ((S[i] in BukvKir) or (S[i] in BukvLat) or (s[i]=' ')) then Nom:=2;
        Inc(i);
      end;
    End;
  Prov1:=Nom;
End;

Function Prov2; // �������� � SymbTable
Var
  Nom: byte; // ����� ��������
  i,Len: word; // ������� ������ � ����� ������
Begin
  Nom:=0; len:= Length(S);
  If Len=0 then Nom:=1
  Else
    Begin
      i:=1;
      while (i<=Len) and (Nom=0) do
      begin
        if Not (Pos(S[i], SymbTable)>0) then Nom:=2;   //=0,���� ��� ������� � ������
        Inc(i);
      end;
    End;
  Prov2:=Nom; 
End;
Procedure Sort1;  // ���������� ��� SymbTable
Var 
  i, z, len: Word; // ����� �������� �������, ����� �������� (����), ����� ������
  flag: Boolean; // �����������? (��� �������?)
  ch: char; // ��� ������
Begin
  Z:=1;  len:=length(s);
  Repeat // ������
    flag:=true;
    for i:=1 to len-z do
      if
         (s[i] in BukvLat) and (s[i+1] in BukvKir) or
         (s[i] in BukvKir) and (s[i+1] in BukvKir) and (AnsiLowerCase(s[i+1])<AnsiLowerCase(s[i])) and not ((AnsiLowerCase(s[i])='�') or (AnsiLowerCase(s[I+1])='�')) or
         (s[i] in BukvKir) and (s[i+1] in BukvKir) and (AnsiLowerCase(s[i+1])=AnsiLowerCase(s[i])) and (s[i+1]<s[i]) or
         (s[i]=' ') and (s[i+1]<>' ') or
         //(s[i]=' ') and ((s[i+1] in BukvLat) or (s[i+1] in BukvKir)) or
         (AnsiLowerCase(s[i])='�') and (s[i+1] in BukvKir) and not (AnsiLowerCase(s[i+1])='�') and (AnsiUpperCase(s[i+1])<='�') or
         (s[i]='�') and (s[i+1]='�') or
         (s[i] in BukvKir) and (AnsiLowerCase(s[i+1])='�') and (AnsiLowerCase(s[i])>'�') and (AnsiLowerCase(s[i])<>'�')
      then
      begin // �����
        ch:=s[i]; s[i]:=s[i+1]; s[i+1]:=ch; flag:= false;
      end;
    inc(z);
  Until flag or (z=len);
End; 

Procedure Sort2;  // ���������� � SymbTable
Var 
  i, z, len: Word; // ����� �������� �������, ����� �������� (����), ����� ������
  flag: Boolean; // �����������? (��� �������?)
  ch: char; // ��� ������
Begin
  z:=1;  len:=length(s);
  Repeat // ������
    flag:=true;
    for i:=1 to len-z do
      if (Pos(s[i], SymbTable) > Pos(s[i+1], SymbTable))  // ������������ ������� �� ����� ��������
        and not ((s[i] in BukvLat) and (s[i+1] in BukvLat))  // �� �������� �� �������������
      then
      begin // �����
        ch:=s[i]; s[i]:=s[i+1]; s[i+1]:=ch; flag:= false;
      end;
    inc(z);
  Until flag or (z=len);
End;

end.
