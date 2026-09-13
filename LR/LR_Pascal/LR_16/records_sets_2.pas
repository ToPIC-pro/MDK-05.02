program records_sets_2;

type zap1 = record
  fio: string;
  birth: string;
  kurs: 1..5
end;

var students:array[1..3] of zap1;

begin
  students[1].fio := 'Тукмачев Г.А.';
  students[2].fio := 'Черезов Е.Д.';
  students[3].fio := 'Порубов С.С.';
  
  students[1].birth := '27.04.2008';
  students[2].birth := '01.06.2008';
  students[3].birth := '27.07.2008';

  students[1].kurs := 2;
  students[2].kurs := 2;
  students[3].kurs := 2;
  
  students.println
end.