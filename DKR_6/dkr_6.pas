

procedure PopBack;
begin
  if IsEmpty then
  begin
    writeln('Дек пуст');
    exit;
  end;

  writeln('Удалено: ', d.data[d.rear]);

  if d.front = d.rear then
    InitDeque
  else
    d.rear := d.rear - 1;
end;

procedure ShowDeque;
var
  i: integer;
begin
  if IsEmpty then
  begin
    writeln('Дек пуст');
    exit;
  end;

  writeln('Содержимое дека:');

  write('| ');
  for i := d.front to d.rear do
    write(d.data[i], ' | ');
  writeln;
end;

begin
  InitDeque;

  repeat
    writeln;
    writeln('===== МЕНЮ ДЕКА =====');
    writeln('1 - Добавить в начало');
    writeln('2 - Добавить в конец');
    writeln('3 - Удалить с начала');
    writeln('4 - Удалить с конца');
    writeln('5 - Показать дек');
    writeln('0 - Выход');
    write('Выберите действие: ');
    readln(choice);

    case choice of
      1:
        begin
          write('Введите число: ');
          readln(chislo);
          PushFront(chislo);
        end;

      2:
        begin
          write('Введите число: ');
          readln(chislo);
          PushBack(chislo);
        end;

      3: PopFront;

      4: PopBack;

      5: ShowDeque;
    end;

  until choice = 0;

end.