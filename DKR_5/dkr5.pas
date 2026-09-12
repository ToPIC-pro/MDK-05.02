program dkr5;
Uses CRT;
type
  TCompareFunc = function(a, b: string): integer;

// Компаратор для сортировки по возрастанию
function CompareAsc(a, b: string): integer;
begin
  if a < b then Result := -1
  else if a > b then Result := 1
  else Result := 0;
end;

// Компаратор для сортировки по убыванию  
function CompareDesc(a, b: string): integer;
begin
  if a > b then Result := -1
  else if a < b then Result := 1
  else Result := 0;
end;

// Компаратор для сортировки без учета регистра по возрастанию
function CompareNoCaseAsc(a, b: string): integer;
begin
  a := LowerCase(a);
  b := LowerCase(b);
  if a < b then Result := -1
  else if a > b then Result := 1
  else Result := 0;
end;

// Компаратор для сортировки без учета регистра по убыванию
function CompareNoCaseDesc(a, b: string): integer;
begin
  a := LowerCase(a);
  b := LowerCase(b);
  if a > b then Result := -1
  else if a < b then Result := 1
  else Result := 0;
end;

// Процедура пузырьковой сортировки с компаратором
procedure BubbleSort(var lines: array of string; count: integer; Compare: TCompareFunc);
var
  i, j: integer;
  temp: string;
begin
  for i := 0 to count - 2 do
    for j := 0 to count - i - 2 do
      if Compare(lines[j], lines[j + 1]) > 0 then
        begin
        temp := lines[j];
        lines[j] := lines[j + 1];
        lines[j + 1] := temp;
        end;
end;

// Процедура быстрой сортировки с компаратором
procedure QuickSort(var lines: array of string; left, right: integer; Compare: TCompareFunc);
var
  i, j: integer;
  pivot, temp: string;
begin
  if left < right then
  begin
    pivot := lines[(left + right) div 2];
    i := left;
    j := right;
    
    repeat
      while Compare(lines[i], pivot) < 0 do
        i := i + 1;
      while Compare(lines[j], pivot) > 0 do
        j := j - 1;
      
      if i <= j then
      begin
        temp := lines[i];
        lines[i] := lines[j];
        lines[j] := temp;
        i := i + 1;
        j := j - 1;
      end;
    until i > j;
    
    if left < j then
      QuickSort(lines, left, j, Compare);
    if i < right then
      QuickSort(lines, i, right, Compare);
  end;
end;

var
  f: text;
  i, count, sortChoice, compareChoice: integer;
  lines: array of string;
  compareFunc: TCompareFunc;
  resultFile, sortType, compareType: string;
  exitProgram: boolean;

begin
  exitProgram := False;
  
  // Главный цикл выбора сортировки
  while not exitProgram do
  begin
    // Меню выбора сортировки
    writeln;
    writeln('======== ВЫБОР СОРТИРОВКИ ========');
    writeln('1 - Пузырьковая сортировка');
    writeln('2 - Быстрая сортировка');
    writeln('0 - Выход из программы');
    writeln('================================');
    write('Выберите тип сортировки: ');
    readln(sortChoice);
    
    if sortChoice = 0 then
    begin
      exitProgram := True;
      continue;
    end;
    
    // Цикл выбора компаратора
    var chooseComparator := True;
    while chooseComparator do
    begin
      // Меню выбора компаратора
      writeln;
      writeln('====== ВЫБОР КОМПАРАТОРА ======');
      writeln('1 - По возрастанию (A-Z)');
      writeln('2 - По убыванию (Z-A)');
      writeln('3 - Без учета регистра по возрастанию');
      writeln('4 - Без учета регистра по убыванию');
      writeln('0 - Назад к выбору сортировки');
      writeln('================================');
      write('Выберите порядок сортировки: ');
      readln(compareChoice);
      
      if compareChoice = 0 then
      begin
        chooseComparator := False;
        continue;
      end;
      
      // Выбор функции сравнения
      case compareChoice of
        1:
        begin compareFunc := CompareAsc; compareType := 'По возрастанию'; end;
        
        2:
        begin compareFunc := CompareDesc; compareType := 'По убыванию'; end;
        
        3:
        begin compareFunc := CompareNoCaseAsc; compareType := 'Без учета регистра (возрастание)'; end;
        
        4:
        begin compareFunc := CompareNoCaseDesc; compareType := 'Без учета регистра (убывание)'; end;
      else
        begin compareFunc := CompareAsc; compareType := 'По возрастанию'; end;
      end;
      
      // Чтение данных из файла
      assign(f, 'C:dkr5.txt');
      reset(f);
      count := 0;
      
      while not eof(f) do
      begin
        SetLength(lines, count + 1);
        readln(f, lines[count]);
        count := count + 1;
      end;
      close(f);
      
      if count > 0 then
      begin
        // Объединенный блок: выбор типа сортировки и её выполнение
        case sortChoice of
          1: // Пузырьковая сортировка
            begin
              resultFile := 'C:dkr5_bubble.txt';
              sortType := 'Пузырьковая';
              BubbleSort(lines, count, compareFunc);
              writeln('Выполняется пузырьковая сортировка...');
            end;
            
          2: // Быстрая сортировка
            begin
              resultFile := 'C:dkr5_quick.txt';
              sortType := 'Быстрая';
              QuickSort(lines, 0, count - 1, compareFunc);
              writeln('Выполняется быстрая сортировка...');
            end;
            
        else
          begin
            resultFile := 'C:dkr5_result.txt';
            sortType := 'Неизвестная';
            writeln('Неизвестный тип сортировки.');
          end;
        end;
        
        // Сохранение результата
        assign(f, resultFile);
        rewrite(f);
        for i := 0 to count - 1 do
          writeln(f, lines[i]);
        close(f);
        
        // Вывод информации о результате
        writeln;
        writeln('======================================');
        writeln('РЕЗУЛЬТАТ СОРТИРОВКИ:');
        writeln('Тип сортировки: ', sortType);
        writeln('Порядок сортировки: ', compareType);
        writeln('Файл с результатом: ', resultFile);
        writeln('Количество строк: ', count);
        writeln('======================================');
        
        // Спросить, выполнить еще с другим компаратором
        writeln;
        write('Выбрать другой компаратор для этой же сортировки? (1-Да, 0-Нет): ');
        var choice: integer;
        readln(choice);
        
        if choice = 0 then
          chooseComparator := False;
      end
      else
      begin
        writeln('Файл пуст или не содержит данных.');
        chooseComparator := False;
      end;
    end;
  end; 
  
  writeln('Программа завершена.');
end.