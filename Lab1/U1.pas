Unit U1;
Interface       // раздел описани€ межмодульного интерфейса

Uses     
  SysUtils;   
Const
  SymbTable = 'јаЅб¬в√гƒд≈е®Є∆ж«з»и кЋлћмЌнќоѕп–р—с“т”у‘ф’х÷ц„чЎшўщЏъџы№ьЁэёюя€zyxwvutsrqponmlkjihgfedcbaABCDEFGHIJKLMNOPQRSTUVYXYZ '; //пробел считаетс€?

Const
  //Cifr : set of '0'.. '9' = ['0'.. '9'];
  BukvKir: set of ANSIchar = ['а'..'€','ј'..'я','®','Є'];//?
  BukvLat: set of ANSIchar = ['a'..'z','A'..'Z'];        //      ?

Function Prov1(const s: ANSIString): Byte; // проверка без SymbTable
Function Prov2(const s: ANSIString): Byte; // проверка с SymbTable
Procedure Sort1(var s: ANSIString);  // сортировка без SymbTable
Procedure Sort2(var s: ANSIString);  // сортировка с SymbTable

Implementation  // раздел реализации и описани€ закрытых процедур

Function Prov1; // проверка без SymbTable
Var
  Nom: byte; // номер аномалии
  i,Len: word; // текущий символ и длина строки
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

Function Prov2; // проверка с SymbTable
Var
  Nom: byte; // номер аномалии
  i,Len: word; // текущий символ и длина строки
Begin
  Nom:=0; len:= Length(S);
  If Len=0 then Nom:=1
  Else
    Begin
      i:=1;
      while (i<=Len) and (Nom=0) do
      begin
        if Not (Pos(S[i], SymbTable)>0) then Nom:=2;   //=0,если нет символа в строке
        Inc(i);
      end;
    End;
  Prov2:=Nom; 
End;
Procedure Sort1;  // сортировка без SymbTable
Var 
  i, z, len: Word; // номер текущего символа, номер итерации (шага), длина строки
  flag: Boolean; // упор€дочено? (нет обменов?)
  ch: char; // дл€ обмена
Begin
  Z:=1;  len:=length(s);
  Repeat // пузырЄк
    flag:=true;
    for i:=1 to len-z do
      if
         (s[i] in BukvLat) and (s[i+1] in BukvKir) or
         (s[i] in BukvKir) and (s[i+1] in BukvKir) and (AnsiLowerCase(s[i+1])<AnsiLowerCase(s[i])) and not ((AnsiLowerCase(s[i])='Є') or (AnsiLowerCase(s[I+1])='Є')) or
         (s[i] in BukvKir) and (s[i+1] in BukvKir) and (AnsiLowerCase(s[i+1])=AnsiLowerCase(s[i])) and (s[i+1]<s[i]) or
         (s[i]=' ') and (s[i+1]<>' ') or
         //(s[i]=' ') and ((s[i+1] in BukvLat) or (s[i+1] in BukvKir)) or
         (AnsiLowerCase(s[i])='Є') and (s[i+1] in BukvKir) and not (AnsiLowerCase(s[i+1])='Є') and (AnsiUpperCase(s[i+1])<='≈') or
         (s[i]='Є') and (s[i+1]='®') or
         (s[i] in BukvKir) and (AnsiLowerCase(s[i+1])='Є') and (AnsiLowerCase(s[i])>'е') and (AnsiLowerCase(s[i])<>'Є')
      then
      begin // обмен
        ch:=s[i]; s[i]:=s[i+1]; s[i+1]:=ch; flag:= false;
      end;
    inc(z);
  Until flag or (z=len);
End; 

Procedure Sort2;  // сортировка с SymbTable
Var 
  i, z, len: Word; // номер текущего символа, номер итерации (шага), длина строки
  flag: Boolean; // упор€дочено? (нет обменов?)
  ch: char; // дл€ обмена
Begin
  z:=1;  len:=length(s);
  Repeat // пузырЄк
    flag:=true;
    for i:=1 to len-z do
      if (Pos(s[i], SymbTable) > Pos(s[i+1], SymbTable))  // неправильный пор€док по своей Ђтаблицеї
        and not ((s[i] in BukvLat) and (s[i+1] in BukvLat))  // но латиницу не упор€дочивать
      then
      begin // обмен
        ch:=s[i]; s[i]:=s[i+1]; s[i+1]:=ch; flag:= false;
      end;
    inc(z);
  Until flag or (z=len);
End;

end.
