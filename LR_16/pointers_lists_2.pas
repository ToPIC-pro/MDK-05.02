program pointers_lists_2;

type
  PNode = ^Node;
  Node = record
    word: string;
    count: integer;
    next: PNode;
  end;

var
  Head: PNode;

procedure AddWord(w: string);
var
  p, prev, newNode: PNode;
begin
  p := Head;
  prev := nil;

  { ищем место вставки по алфавиту }
  while (p <> nil) and (p^.word < w) do
  begin
    prev := p;
    p := p^.next;
  end;

  { если слово уже есть }
  if (p <> nil) and (p^.word = w) then
  begin
    p^.count := p^.count + 1;
    exit;
  end;

  { создаём новый узел }
  New(newNode);
  newNode^.word := w;
  newNode^.count := 1;
  newNode^.next := p;

  if prev = nil then
    Head := newNode
  else
    prev^.next := newNode;
end;

procedure PrintCount;
var
  p: PNode;
  total: integer;
begin
  total := 0;
  p := Head;
  while p <> nil do
  begin
    total := total + 1;
    p := p^.next;
  end;
  writeln('Количество различных слов: ', total);
end;

var
  s, w: string;
  i: integer;

begin
  Head := nil;

  writeln('Введите строку:');
  readln(s);

  w := '';
  for i := 1 to length(s) do
  begin
    if s[i] <> ' ' then
      w := w + s[i]
    else
    begin
      if w <> '' then
        AddWord(w);
      w := '';
    end;
  end;

  { добавляем последнее слово }
  if w <> '' then
    AddWord(w);

  PrintCount;
end.