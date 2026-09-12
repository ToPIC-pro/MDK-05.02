unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Calendar, EditBtn,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button2: TButton;
    Calendar1: TCalendar;
    DateEdit1: TDateEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.DateEdit1Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  dt: TDateTime;
  Year, Month, Day: Word;
  Hour, Min, Sec, MSec: Word;
  dayName: string;
  resultText: string;
  s: string;
begin
  resultText := '===== ДЕМОНСТРАЦИЯ ФУНКЦИЙ ДАТЫ И ВРЕМЕНИ =====' + #13#13;

  // 1. Текущая дата
  resultText := resultText + '1. Текущие дата и время:' + #13;
  resultText := resultText + '   ' + DateTimeToStr(Now) + #13#13;

  // 2. DayOfWeek
  case DayOfWeek(Now) of
    1: dayName := 'Sunday';
    2: dayName := 'Monday';
    3: dayName := 'Tuesday';
    4: dayName := 'Wednesday';
    5: dayName := 'Thursday';
    6: dayName := 'Friday';
    7: dayName := 'Saturday';
  end;
  resultText := resultText + '2. Day of week:' + #13;
  resultText := resultText + '   ' + dayName + #13#13;

  // 3. FormatDateTime
  resultText := resultText + '3. FormatDateTime:' + #13;
  resultText := resultText + '   Short date: ' + FormatDateTime('ddddd', Now) + #13;
  resultText := resultText + '   Long date: ' + FormatDateTime('dddddd', Now) + #13;
  resultText := resultText + '   Time: ' + FormatDateTime('hh:nn:ss', Now) + #13#13;

  // 4. DecodeDate
  DecodeDate(Now, Year, Month, Day);
  resultText := resultText + '4. DecodeDate:' + #13;
  resultText := resultText + '   Year=' + IntToStr(Year) + ', Month=' + IntToStr(Month) + ', Day=' + IntToStr(Day) + #13#13;

  // 5. EncodeDate
  dt := EncodeDate(1999, 3, 9);
  resultText := resultText + '5. EncodeDate (09.03.1999):' + #13;
  resultText := resultText + '   ' + FormatDateTime('dd.mm.yyyy', dt) + #13#13;

  // 6. DecodeTime
  DecodeTime(Now, Hour, Min, Sec, MSec);
  resultText := resultText + '6. DecodeTime:' + #13;
  resultText := resultText + '   Hour=' + IntToStr(Hour) + ', Min=' + IntToStr(Min) + ', Sec=' + IntToStr(Sec) + #13#13;

  // 7. EncodeTime
  dt := EncodeTime(14, 30, 0, 0);
  resultText := resultText + '7. EncodeTime (14:30):' + #13;
  resultText := resultText + '   ' + FormatDateTime('hh:nn:ss', dt) + #13#13;

  // 8. IsLeapYear
  Year := 2024;
  resultText := resultText + '8. IsLeapYear (2024):' + #13;
  if IsLeapYear(Year) then
    resultText := resultText + '   2024 is leap year' + #13#13
  else
    resultText := resultText + '   2024 is not leap year' + #13#13;

  // 9. StrToDateTime
  dt := StrToDateTime('21.10.2013 14:25:30');
  resultText := resultText + '9. StrToDateTime:' + #13;
  resultText := resultText + '   "21.10.2013 14:25:30" -> ' + FormatDateTime('dd.mm.yyyy hh:nn:ss', dt) + #13#13;

  // 10. DateTimeToString
  DateTimeToString(s, 'dddddd', Now);
  resultText := resultText + '10. DateTimeToString:' + #13;
  resultText := resultText + '    ' + s;

  ShowMessage(resultText);
end;

end.

