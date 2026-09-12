uses GraphABC, dkr7_fractal;

begin
  // Задаем начальные параметры
  depth := 1;            // начальная глубина
  size := 300;           // размер треугольника
  SetWindowSize(800, 800);
  SetPenColor(clBlue);
  centerX := WindowWidth / 2;
  centerY := WindowHeight / 2;

  // Привязка обработчиков
  OnKeyDown := KeyDownHandler;
  OnMouseDown := MouseDownHandler;
  OnMouseUp := MouseUpHandler;
  OnMouseMove := MouseMoveHandler;

  // Сразу рисуем
  DrawFractal;

  while True do Sleep(50);
end.
