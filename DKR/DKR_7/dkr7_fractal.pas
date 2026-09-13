unit dkr7_fractal;

interface

uses GraphABC;

var
  depth: integer;        // текущая глубина фрактала
  size: real;            // размер треугольника
  centerX, centerY: real; // центр фрактала
  MaxDepth: integer = 10;

procedure DrawKochLine(x1, y1, x2, y2: real; level: integer);
procedure DrawFractal;
procedure KeyDownHandler(Key: integer);
procedure MouseDownHandler(x, y, mb: integer);
procedure MouseUpHandler(x, y, mb: integer);
procedure MouseMoveHandler(x, y, mb: integer);

implementation

var
  dragging: boolean = false;
  lastX, lastY: integer;

// Рекурсивная функция Коха
procedure DrawKochLine(x1, y1, x2, y2: real; level: integer);
var
  x3, y3, x4, y4, x5, y5: real;
begin
  if level = 1 then
    Line(Round(x1), Round(y1), Round(x2), Round(y2))
  else
  begin
    x3 := x1 + (x2 - x1) / 3;
    y3 := y1 + (y2 - y1) / 3;

    x5 := x1 + 2 * (x2 - x1) / 3;
    y5 := y1 + 2 * (y2 - y1) / 3;

    x4 := (x3 + x5) / 2 - (y5 - y3) * sqrt(3) / 2;
    y4 := (y3 + y5) / 2 + (x5 - x3) * sqrt(3) / 2;

    DrawKochLine(x1, y1, x3, y3, level - 1);
    DrawKochLine(x3, y3, x4, y4, level - 1);
    DrawKochLine(x4, y4, x5, y5, level - 1);
    DrawKochLine(x5, y5, x2, y2, level - 1);
  end;
end;

// Перерисовка фрактала с инструкцией управления
procedure DrawFractal;
var
  h: real;
begin
  LockDrawing;
  ClearWindow(clWhite);

  h := size * sqrt(3) / 2;

  // Рисуем треугольник Коха
  DrawKochLine(centerX - size/2, centerY + h/3,
               centerX + size/2, centerY + h/3, depth);
  DrawKochLine(centerX + size/2, centerY + h/3,
               centerX, centerY - 2*h/3, depth);
  DrawKochLine(centerX, centerY - 2*h/3,
               centerX - size/2, centerY + h/3, depth);

  // Информация о фрактале
  SetFontSize(14);
  SetFontColor(clBlack);
  TextOut(10, 10, 'Глубина: ' + IntToStr(depth));
  TextOut(10, 30, 'Размер: ' + IntToStr(Round(size)));
  TextOut(10, 50, 'Центр: (' + IntToStr(Round(centerX)) + ', ' + IntToStr(Round(centerY)) + ')');

  // Инструкция по управлению
  SetFontSize(12);
  TextOut(10, 80, 'Управление:');
  TextOut(10, 100, 'Стрелки ↑ / ↓   - увеличить/уменьшить размер');
  TextOut(10, 120, 'PageUp / PageDown - увеличить/уменьшить глубину');
  TextOut(10, 140, 'ЛКМ - перемещать фрактал');

  UnlockDrawing;
end;

// Управление клавишами
procedure KeyDownHandler(Key: integer);
begin
  case Key of
    VK_Up: size := size + 20;                  // ↑ — увеличить размер
    VK_Down: if size > 60 then size := size - 20; // ↓ — уменьшить размер
    VK_PageUp: if depth < MaxDepth then Inc(depth);   // PageUp — увеличить глубину
    VK_PageDown: if depth > 1 then Dec(depth);       // PageDown — уменьшить глубину
  end;
  DrawFractal;
end;

// Обработка мыши
procedure MouseDownHandler(x, y, mb: integer);
begin
  if mb = 1 then
  begin
    dragging := true;
    lastX := x;
    lastY := y;
  end;
end;

procedure MouseUpHandler(x, y, mb: integer);
begin
  if mb = 1 then dragging := false;
end;

procedure MouseMoveHandler(x, y, mb: integer);
begin
  if dragging then
  begin
    centerX := centerX + (x - lastX);
    centerY := centerY + (y - lastY);

    lastX := x;
    lastY := y;

    DrawFractal;
  end;
end;

end.
