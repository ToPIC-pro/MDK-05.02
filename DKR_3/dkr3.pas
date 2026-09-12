program dkr3;


function f(x: real): real;
begin
  f := abs(x**3 + (-1) * x**2 + -2 * x + 4)
end;


function f_orig(x: real): real;
begin
  f_orig := abs(x**4 / 4) - (x**3 / 3) - x**2 + 4*x
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
begin
  repeat
    writeln('-----------------------Меню-----------------------');
    writeln('1 - Ввод данных: границы интегрирования и количество частей');
    writeln('2 - Вычисление примерной площади криволинейной трапеции при помощи метода трапеций');
    writeln('3 - Вычисление точной площади криволинейной трапеции при помощи первообразной');
    writeln('4 - Вычисление абсолютной и относительной погрешности');
    writeln('5 - Информация о программе');
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
     writeln('Программа работает по функции x^3 - x^2 - 2x + 4');
     writeln('Программа может вычислять как точное, так и приблизительное значение площади криволинейной трапеции');
     writeln('Также в программе осуществлена функция нахождения абсолютной и относительной погрешности');
     end;
     
    end;
    writeln;
  until choice = 0;
  writeln('ПРОГРАММА ЗАВЕРШЕНА')
end.