program LR13_1;

var
    f: file of char;
    c: char;
    probel, pos: integer;
    
begin
    assign(f, 'C:file.txt');
    reset(f); 
    
    probel := 0;
    pos := 0;
    
    // Находим позицию последнего пробела
    while not eof(f) do 
    begin 
        read(f, c);
        pos := pos + 1;       
        if c = ' ' then
            probel := pos;
    end;
    
    // Обрезаем файл после последнего пробела
    if probel > 0 then
    begin
        seek(f, probel - 1);  // Переходим к последнему пробелу
        truncate(f);          // Обрезаем файл с этой позиции
    end;
    
    close(f);
    
    writeln('Программа выполнена')
end.