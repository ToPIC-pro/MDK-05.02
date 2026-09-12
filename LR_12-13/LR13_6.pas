program LR13_6;

var
  f1, f2: file of real;
  n, i, ind_max, ind_min: integer;
  r, max_el, min_el: real;
  
begin
  assign(f1, 'C:LR13_6.txt');
  rewrite(f1); 
  
  writeln('Сколько чисел будет в файле?');
  readln(n);
  
  for i := 1 to n do
  begin
    read(r);
    write(f1, r);
  end;
  
  close(f1);
  reset(f1);
  
  // Поиск максимального элемента
  read(f1, max_el);
  ind_max := 0;
  i := 1;
  while not Eof(f1) do
  begin
    read(f1, r);
    if r > max_el then
    begin
      ind_max := i;
      max_el := r;
    end;
    i += 1;
  end;

  reset(f1);
  
  // Поиск минимального элемента
  read(f1, min_el);
  ind_min := 0;
  i := 1;
  while not Eof(f1) do
  begin
    read(f1, r);
    if r < min_el then
    begin
      ind_min := i;
      min_el := r;
    end;
    i += 1;
  end;

  assign(f2, 'C:LR13_6_temp.txt');
  rewrite(f2);
  
  reset(f1);
  i := 0;
  while not Eof(f1) do
  begin
    read(f1, r);
    if i = ind_min then
      write(f2, max_el)
    else if i = ind_max then
      write(f2, min_el)
    else
      write(f2, r);
    i += 1;
  end;
  
  close(f1);
  close(f2);
  
  // Переименование временного файла в основной
  erase(f1);
  assign(f2, 'C:LR13_6_temp.txt');
  rename(f2, 'C:LR13_6.txt');
  
  // Вывод результата
  assign(f1, 'C:LR13_6.txt');
  reset(f1);
  writeln('Содержимое файла после изменений:');
  while not Eof(f1) do
  begin
    read(f1, r);
    write(r:0:2, ' ');
  end;
  close(f1);
end.