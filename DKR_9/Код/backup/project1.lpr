program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces,
  Forms, Unit1, SelectFieldUnit;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.MainFormOnTaskbar:=True;
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);  // ТОЛЬКО ЭТА ФОРМА
  Application.Run;
end.
