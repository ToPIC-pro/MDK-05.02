program pointers_lists_4;

type
  PNode = ^Node;
  Node = record
    data: integer;
    next: PNode;
  end;

var
  Head, NewNode, p: PNode;
  i, min, max: integer;

begin
  Head := nil;

  { создаём список из 10 элементов }
  for i := 1 to 10 do
  begin
    New(NewNode);
    NewNode^.data := i;
    NewNode^.next := Head;
    Head := NewNode;
  end;

  { если список пуст }
  if Head = nil then
  begin
    writeln('Список пуст');
    halt;
  end;

  { начинаем с первого элемента }
  p := Head;
  min := p^.data;
  max := p^.data;

  { идём по списку }
  while p <> nil do
  begin
    if p^.data < min then
      min := p^.data;

    if p^.data > max then
      max := p^.data;

    p := p^.next;
  end;

  writeln('Минимальный элемент: ', min);
  writeln('Максимальный элемент: ', max);

end.
