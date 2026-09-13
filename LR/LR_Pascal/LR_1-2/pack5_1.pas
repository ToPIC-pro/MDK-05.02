program pack5_1;
var N, M, K: real;
begin
  writeln('Введите кол-во банок, которые собрал медведь:');
  readln(N);
  writeln('Введите кол-во мёда, сколько должно быть в банке:');
  readln(M);
  writeln('Введите кол-во мёда, сколько медведю надо на зиму:');
  readln(K);
  if N*M >= K then
    write('YES')
  else
    write('NO')
end.