program dkr3_dkr4;
Uses GraphABC;

function f(x: real): real;
begin
  f := x**3 + (-1) * x**2 + -2 * x + 4
end;

function f_orig(x: real): real;
begin
  f_orig := (x**4 / 4) - (x**3 / 3) - x**2 + 4*x
end;

function S(a, b, n: integer): real;
var h, x: real;
begin
  h := (b-a)/n;
  x := a+h;
  S := 0;
  while x < b do
    begin
    S += f(x);
    x += h
    end;
  S += (f(a)+f(b)) / 2;
  S *= h;
end;

function AbsoluteError(s1, s2: real): real;
begin
   AbsoluteError := abs(s2 - s1)
end;

function RelativeError(absolute_error, s2: real): real;
begin
   RelativeError := (absolute_error / abs(s2)) * 100
end;

var
  a, b, n, choice: integer;
  h, x, S_exact: real;
  // Переменные для графика
  xg, yg: real;
  screenX, screenY: integer;
  i: integer;

begin
  repeat
    writeln('-----------------------Меню-----------------------');
    writeln('1 - Ввод данных: границы интегрирования и количество частей');
    writeln('2 - Вычисление примерной площади криволинейной трапеции при помощи метода трапеций');
    writeln('3 - Вычисление точной площади криволинейной трапеции при помощи первообразной');
    writeln('4 - Вычисление абсолютной и относительной погрешности');
    writeln('5 - Визуализация');
    writeln('6 - Информация о программе');
    writeln('0 - Выход из программы');
    writeln('Выберите пункт меню: ');
    readln(choice);
    
  case choice of
    1:
      begin
      writeln('Границы должны принадлежать промежутку ( -∞ ; -1.67 ) или  ( -1.65 ; ∞)');
      writeln('Введите границы интегрирования через пробел');
      readln(a, b);
      writeln('Введите количество частей');
      readln(n);
      end;
      
    2:
      begin
      writeln('Площадь криволинейной трапеции, вычисленная методом трапеций примерно равна: ', S(a, b, n):0:5);
      end;
      
    3:
      begin
      S_exact := 0;
      S_exact := abs(f_orig(b) - f_orig(a));
      writeln('Площадь криволинейной трапеции равна: ', S_exact:0:5); 
      end;
    
    4:
      begin
      S_exact := 0;
      S_exact := abs(f_orig(b) - f_orig(a));
      writeln('Абсолютная погрешность вычисления равна: ', AbsoluteError(S(a, b, n), S_exact):0:5);
      writeln('Относительная погрешность вычисления равна: ', RelativeError(AbsoluteError(S(a, b, n), S_exact), S_exact):0:5, '%');
      end;
      
    5:
      begin
      ClearWindow();
      if (a <> 0) and (b <> 0) then
        begin
        // График функции
        SetWindowSize(800, 600);
        SetWindowTitle('График функции (независимое масштабирование)');
        
        // Определяем масштабы для осей X и Y
        var scaleX: real;
        var scaleY: real;
        
        // Определяем диапазон по X для отображения
        var xMin, xMax: real;
        if abs(b - a) < 0.1 then // Очень маленький интервал
        begin
          xMin := a - 5 * abs(b - a);
          xMax := b + 5 * abs(b - a);
          scaleX := 700 / (xMax - xMin); // Масштаб по X
        end
        else if abs(b - a) > 100 then // Очень большой интервал
        begin
          xMin := a;
          xMax := b;
          scaleX := 700 / (xMax - xMin); // Масштаб по X
        end
        else // Нормальный интервал
        begin
          xMin := Min(a, b) - 0.2 * abs(b - a);
          xMax := Max(a, b) + 0.2 * abs(b - a);
          scaleX := 700 / (xMax - xMin); // Масштаб по X
        end;
        
        // Определяем диапазон значений функции на интервале [a, b] для масштабирования по Y
        var yMin := f(a);
        var yMax := f(a);
        var step := (b - a) / 100;
        
        xg := a;
        for i := 0 to 100 do
        begin
          yg := f(xg);
          if yg < yMin then yMin := yg;
          if yg > yMax then yMax := yg;
          xg := xg + step;
        end;
        
        // Добавляем запас по Y
        var yRange := yMax - yMin;
        if abs(yRange) < 0.1 then // Очень маленькие значения по Y
        begin
          yMin := yMin - 5;
          yMax := yMax + 5;
          scaleY := 500 / (yMax - yMin); // Масштаб по Y
        end
        else if abs(yRange) > 100 then // Очень большие значения по Y
        begin
          scaleY := 500 / (yMax - yMin); // Масштаб по Y
        end
        else // Нормальный диапазон
        begin
          yMin := yMin - 0.1 * yRange;
          yMax := yMax + 0.1 * yRange;
          scaleY := 500 / (yMax - yMin); // Масштаб по Y
        end;
        
        // Центр координат в окне
        var centerX := 50 + Round(-xMin * scaleX);
        var centerY := 550 - Round(-yMin * scaleY);
        
        // Оси координат
        SetPenColor(clBlack);
        SetPenWidth(1);
        
        // Ось X
        if (yMin <= 0) and (yMax >= 0) then
        begin
          var yZero := centerY - Round(yMin * scaleY);
          Line(50, yZero, 750, yZero); // Ось X
        end
        else
          Line(50, centerY, 750, centerY); // Ось X в центре
        
        // Ось Y
        if (xMin <= 0) and (xMax >= 0) then
        begin
          var xZero := centerX;
          Line(xZero, 50, xZero, 550); // Ось Y
        end
        else
          Line(centerX, 50, centerX, 550); // Ось Y в центре
        
        // Наконечники стрелок для оси X
        Line(750, centerY, 745, centerY - 5);
        Line(750, centerY, 745, centerY + 5);
        
        // Наконечники стрелок для оси Y
        Line(centerX, 50, centerX - 5, 55);
        Line(centerX, 50, centerX + 5, 55);
        
        // Подписи осей
        TextOut(755, centerY - 15, 'X');
        TextOut(centerX + 10, 45, 'Y');
        
        // Штриховка вычисляемой площади
        SetPenColor(clGreen);
        SetPenWidth(1);
        
        // Определяем координату оси X для штриховки
        var axisY: integer;
        if (yMin <= 0) and (yMax >= 0) then
          axisY := centerY - Round(yMin * scaleY)
        else
          axisY := centerY;
        
        for i := 1 to 50 do
        begin
          xg := a + (b - a) * i / 51;
          yg := f(xg);
          
          screenX := centerX + Round(xg * scaleX);
          screenY := centerY - Round(yg * scaleY);
          
          // Рисуем вертикальную линию штриховки
          if yg >= 0 then
            Line(screenX, axisY, screenX, screenY) // от оси X до графика
          else
            Line(screenX, screenY, screenX, axisY); // от графика до оси X
        end;
        
        // Рисование графика
        SetPenColor(clBlue);
        SetPenWidth(2);
        
        var numPoints := Round(1200 * (xMax - xMin) / 12); // Адаптивное количество точек
        if numPoints < 100 then numPoints := 100;
        if numPoints > 2000 then numPoints := 2000;
        
        step := (xMax - xMin) / numPoints;
        xg := xMin;
        
        for i := 0 to numPoints do
        begin
          yg := f(xg);
          
          screenX := centerX + Round(xg * scaleX);
          screenY := centerY - Round(yg * scaleY);
          
          // Ограничиваем точки, чтобы они не выходили за пределы окна
          if (screenX >= 0) and (screenX <= 800) and (screenY >= 0) and (screenY <= 600) then
          begin
            if i = 0 then
              MoveTo(screenX, screenY)
            else
              LineTo(screenX, screenY);
          end
          else
          begin
            if i < numPoints then
              MoveTo(screenX, screenY);
          end;
          
          xg := xg + step;
        end;
        
        // Отметки границ интегрирования a и b
        SetPenColor(clRed);
        SetPenWidth(2);
        
        // Вертикальная линия для a
        var aScreenX := centerX + Round(a * scaleX);
        var aScreenY := centerY - Round(f(a) * scaleY);
        if f(a) >= 0 then
          Line(aScreenX, axisY, aScreenX, aScreenY) // от оси X до графика
        else
          Line(aScreenX, aScreenY, aScreenX, axisY); // от графика до оси X
        
        // Подпись для a
        SetFontColor(clRed);
        SetFontSize(10);
        TextOut(aScreenX - 25, axisY + 10, 'a = ' + a.ToString('0.##'));
        
        // Вертикальная линия для b
        var bScreenX := centerX + Round(b * scaleX);
        var bScreenY := centerY - Round(f(b) * scaleY);
        if f(b) >= 0 then
          Line(bScreenX, axisY, bScreenX, bScreenY) // от оси X до графика
        else
          Line(bScreenX, bScreenY, bScreenX, axisY); // от графика до оси X
        
        // Подпись для b
        SetFontColor(clRed);
        SetFontSize(10);
        TextOut(bScreenX - 25, axisY + 10, 'b = ' + b.ToString('0.##'));
        
        // Вывод информации о задании на графике
        SetFontColor(clBlack);
        SetFontSize(10);
        TextOut(30, 20, 'ДКР 4');
        TextOut(30, 40, 'Тукмачев, вариант 15');
        TextOut(30, 60, 'Цель: освоить принципы работы');
        TextOut(30, 80, 'в графическом режиме');
        TextOut(30, 100, 'f(x) = x^3 - x^2 - 2x + 4');
        TextOut(30, 120, 'Штриховка: вычисляемая площадь');
  
        // Дополнительная информация о границах
        SetFontColor(clDarkBlue);
        SetFontSize(10);
        TextOut(30, 150, 'Границы интегрирования:');
        TextOut(30, 170, 'a = ' + a.ToString('0.##'));
        TextOut(30, 190, 'b = ' + b.ToString('0.##'));
        TextOut(30, 210, 'Интервал: [' + a.ToString('0.##') + ', ' + b.ToString('0.##') + ']');
        
        // Значения функции в точках a и b
        TextOut(30, 240, 'f(a) = ' + f(a).ToString('0.##'));
        TextOut(30, 260, 'f(b) = ' + f(b).ToString('0.##'));
        
        TextOut(30, 500, 'Нажмите Enter для продолжения...');
        readln();
        ClearWindow();
        end
      else
        writeln('Сначала введите a и b');
        readln();
        ClearWindow();
      end;
      
    6:
      begin
      writeln('Программа работает по функции x^3 - x^2 - 2x + 4');
      writeln('Программа может вычислять как точное, так и приблизительное значение площади криволинейной трапеции');
      writeln('Также в программе осуществлена функция нахождения абсолютной и относительной погрешности');
      writeln('Нажмите Enter для продолжения...');
      readln;
      end;
   
    end;
    writeln;
    
  until choice = 0;
  
  writeln('ПРОГРАММА ЗАВЕРШЕНА');
end.