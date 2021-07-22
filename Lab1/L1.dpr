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

 // сменим кодовые страницы  для консольного ввода и вывода
  setConsoleCP(1251); // для ввода 
  setConsoleOutputCP(1251); // для вывода

  AssignFile(dat,paramstr(1));
  reset(dat);
  AssignFile(res,paramstr(2));
  rewrite(res);


  Writeln(res,'10 Вар. Введите строку (смените шрифт на Lucida Console)');
  readln(dat,S); // ввод

 S1:=Copy(S, 1, Length(S)); S2:=Copy(S, 1, Length(S)); // создание копий дин.строки 

  // без своей таблицы символов (со сложным условием обмена)
  Writeln(res,#13#10, 'Строка до сортировки'#13#10'*', S1,'*');
  Nom:= Prov1(s1); // проверка
  Case Nom of
    1: writeln(res,'Пустая строка');
    2: writeln(res,'Некорректные символы');
    else
     begin // сортировка
       Sort1(s1);
       Writeln(res,'Отсортированная строка 1'#13#10'*', S1,'*');  // вывод строки S1
     end; {else}
  End; {case}
  
  // со своей таблицей символов
  Writeln(res,#13#10'Строка до сортировки'#13#10'*', S2,'*');
  Nom:= Prov2(s2); // проверка
  Case Nom of
    1: writeln(res,'Пустая строка');
    2: writeln(res,'Некорректные символы');
    else
     begin // сортировка
       Sort2(s2);
       Writeln(res,'Отсортированная строка 2'#13#10'*', S2,'*');  // вывод строки S2
     end; {else}
  End; {case}

  CloseFile(dat);
  CloseFile(res);
  //writeln(#13#10'Press ENTER to exit');
  //readln

End.

