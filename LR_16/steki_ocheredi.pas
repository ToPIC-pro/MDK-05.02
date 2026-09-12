program steki_ocheredi;

type
  PNode = ^Node; { указатель на узел }
  Node = record
    data: integer;  { хранить число }
    next: PNode;    { указатель на след. элемент }
  end;


{ функция Pop — снимает верхний элемент стека и возвращает его }
function Pop(var Head: PNode): integer;
var
  q: PNode;
begin
  if Head = nil then begin
    Result := 0; { пустой стек }
    Exit;
  end;
  Result := Head^.data;
  q := Head;
  Head := Head^.next;
  Dispose(q);
end;


{ процедура Push — добавляет элемент в стек }
procedure Push(var Head: PNode; x: integer);
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^.data := x;
  NewNode^.next := Head;
  Head := NewNode;
end;




var
  f_in, f_out: text;
  Head: PNode;
  x: integer;
begin
  Head := nil; { инициализируем стек }

  { открываем исходный файл }
  assign(f_in, 'C:\Users\ToPIC\Documents\IV Семестр\МДК 05.02 Разработка кода информационных систем\LR_16\chisla.txt');
  reset(f_in);

  { читаем все числа из файла и кладём в стек }
  while not eof(f_in) do
  begin
    read(f_in, x);
    Push(Head, x);
  end;
  close(f_in);

  { открываем выходной файл }
  assign(f_out, 'C:\Users\ToPIC\Documents\IV Семестр\МДК 05.02 Разработка кода информационных систем\LR_16\reverse_chisla.txt');
  rewrite(f_out);

  { снимаем все элементы со стека — получаем в обратном порядке }
  while Head <> nil do
  begin
    x := Pop(Head);
    writeln(f_out, x);
  end;

  close(f_out);
  
  writeln('Числа записаны в новый файл в обратном порядке.')
end.