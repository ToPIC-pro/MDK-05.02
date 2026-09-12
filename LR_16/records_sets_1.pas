program records_sets_1;

type anketa = record
  fio: string;
  birth: string;
  kurs: 1..5
end;

var student: anketa;

begin
  student.fio := 'Тукмачев Г.А.';
  student.birth := '27.04.2008';
  student.kurs := 2;
  
  writeln(student.fio, ' / ', student.birth, ' / ', student.kurs)
end.