program LR11_7;

uses GraphABC;
var 
  x, y: integer;
  
begin
  x := 40;
  y := 350;

  repeat 
    LockDrawing; // Блокируем прорисовку
    ClearWindow; // Очищаем окно
    SetPenColor(clBlack);
    Rectangle(x, y, x+20, y+20);
    FloodFill(x+10, y+10, clBlack);
    Redraw; // Выводим на экран
    x := x + 1;	
    y := y - 2;
    Sleep(1); // Задержка для плавности
  until (x > 400) or (y < 20);

  repeat 
    LockDrawing;
    ClearWindow;
    SetPenColor(clBlack);
    Rectangle(x, y, x+20, y+20);
    FloodFill(x+10, y+10, clBlack);
    Redraw;
    x := x + 1;	
    y := y + 2;
    Sleep(10);
  until (x > 550) or (y > 350);
end.