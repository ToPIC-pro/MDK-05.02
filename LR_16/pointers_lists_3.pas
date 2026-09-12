program pointers_lists_3;

type
  PNode = ^Node;
  Node = record
    data: integer;
    next: PNode;
  end;

var
  Head, NewNode, p: PNode;
  i: integer;

begin
  Head := nil;

  { создаём 10 элементов }
  for i := 1 to 10 do
  begin
    New(NewNode);           { создаём узел }
    NewNode^.data := i;     { записываем число }
    NewNode^.next := Head;  { новый указывает на старый первый }
    Head := NewNode;        { новый становится первым }
  end;

  { вывод всего списка }
  writeln('Весь список:');
  p := Head;
  while p <> nil do
  begin
    write(p^.data, ' ');
    p := p^.next;
  end;

  writeln;
  writeln('Чётные элементы:');

  { вывод только чётных }
  p := Head;
  while p <> nil do
  begin
    if p^.data mod 2 = 0 then
      write(p^.data, ' ');
    p := p^.next;
  end;

end.