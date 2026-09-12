unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus, Grids;

type
  TMaterial = record
    Code: string[10];
    Name: string[50];
    UnitName: string[10];
    Stock: integer;
    MinStock: integer;
  end;

type
  { TfMain }
  TfMain = class(TForm)
    CBUnit: TComboBox;
    ECode: TEdit;
    EName: TEdit;
    EStock: TEdit;
    EMin: TEdit;
    LCode: TLabel;
    LName: TLabel;
    LUnit: TLabel;
    LStock: TLabel;
    LMin: TLabel;
    MainMenu1: TMainMenu;
    MICloseFile: TMenuItem;
    MIAdd: TMenuItem;
    MIEdit: TMenuItem;
    MIDelete: TMenuItem;
    MISort: TMenuItem;
    MISortAsc: TMenuItem;
    MISortDesc: TMenuItem;
    MISearch: TMenuItem;
    MIClear: TMenuItem;
    MIRecord: TMenuItem;
    MIFile: TMenuItem;
    MICreate: TMenuItem;
    MIOpen: TMenuItem;
    MISave: TMenuItem;
    MISaveAs: TMenuItem;
    MIExit: TMenuItem;
    Panel: TPanel;
    SG: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure MIAddClick(Sender: TObject);
    procedure MIClearClick(Sender: TObject);
    procedure MICloseFileClick(Sender: TObject);
    procedure MICreateClick(Sender: TObject);
    procedure MIDeleteClick(Sender: TObject);
    procedure MIEditClick(Sender: TObject);
    procedure MIExitClick(Sender: TObject);
    procedure MIOpenClick(Sender: TObject);
    procedure MISaveAsClick(Sender: TObject);
    procedure MISaveClick(Sender: TObject);
    procedure MISearchClick(Sender: TObject);
    procedure MISortAscClick(Sender: TObject);
    procedure MISortDescClick(Sender: TObject);
    procedure SGSelectCell(Sender: TObject; aCol, aRow: Integer; var CanSelect: Boolean);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    F: file of TMaterial;
    tempF: file of TMaterial;
    CurrentFileName: string;
    FileOpened: Boolean;
    procedure RefreshGrid;
    function SelectField: Integer;
  public
  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

procedure TfMain.FormCreate(Sender: TObject);
begin
  // НАСТРОЙКА РАСТЯГИВАНИЯ ТАБЛИЦЫ
  SG.Align := alClient;
  Panel.Align := alTop;

  SG.ColCount := 5;
  SG.FixedCols := 0;
  SG.FixedRows := 1;
  SG.Cells[0, 0] := 'Код';
  SG.Cells[1, 0] := 'Наименование';
  SG.Cells[2, 0] := 'Единицы измерения';
  SG.Cells[3, 0] := 'Остаток';
  SG.Cells[4, 0] := 'Минимальный запас';
  SG.ColWidths[0] := 100;
  SG.ColWidths[1] := 250;
  SG.ColWidths[2] := 200;
  SG.ColWidths[3] := 150;
  SG.ColWidths[4] := 197;

  SG.OnSelectCell := @SGSelectCell;

  CurrentFileName := 'materials.dat';
  FileOpened := False;
  RefreshGrid;
end;

procedure TfMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  try
    if FileOpened then
    begin
      CloseFile(F);
      FileOpened := False;
    end;
  except
  end;
end;

procedure TfMain.SGSelectCell(Sender: TObject; aCol, aRow: Integer; var CanSelect: Boolean);
begin
  if aRow > 0 then
  begin
    ECode.Text := SG.Cells[0, aRow];
    EName.Text := SG.Cells[1, aRow];
    CBUnit.Text := SG.Cells[2, aRow];
    EStock.Text := SG.Cells[3, aRow];
    EMin.Text := SG.Cells[4, aRow];
  end
  else
  begin
    ECode.Clear;
    EName.Clear;
    EStock.Clear;
    EMin.Clear;
    CBUnit.ItemIndex := 0;
  end;
end;

procedure TfMain.RefreshGrid;
var
  Mat: TMaterial;
  i: integer;
begin
  SG.RowCount := 1;
  if not FileExists(CurrentFileName) then Exit;

  try
    if FileOpened then
      CloseFile(F);
    AssignFile(F, CurrentFileName);
    Reset(F);
    FileOpened := True;
    i := 1;
    while not Eof(F) do
    begin
      Read(F, Mat);
      SG.RowCount := SG.RowCount + 1;
      SG.Cells[0, i] := Mat.Code;
      SG.Cells[1, i] := Mat.Name;
      SG.Cells[2, i] := Mat.UnitName;
      SG.Cells[3, i] := IntToStr(Mat.Stock);
      SG.Cells[4, i] := IntToStr(Mat.MinStock);
      Inc(i);
    end;
    CloseFile(F);
    FileOpened := False;
  except
    ShowMessage('Ошибка при чтении файла');
  end;
end;

// ВОЗВРАЩАЕТ -1 ЕСЛИ ОТМЕНА, ИНАЧЕ ИНДЕКС ПОЛЯ
function TfMain.SelectField: Integer;
var
  s: string;
begin
  Result := -1;
  s := InputBox('Сортировка',
    'Выберите поле для сортировки:' + #13#10 +
    '1 - Код' + #13#10 +
    '2 - Наименование' + #13#10 +
    '3 - Единица измерения' + #13#10 +
    '4 - Остаток' + #13#10 +
    '5 - Минимальный запас', '1');

  if s = '' then Exit;

  if (s = '1') then Result := 0
  else if (s = '2') then Result := 1
  else if (s = '3') then Result := 2
  else if (s = '4') then Result := 3
  else if (s = '5') then Result := 4
  else ShowMessage('Введите число от 1 до 5');
end;

procedure TfMain.MIAddClick(Sender: TObject);
var
  Stock, MinStock: integer;
  Mat: TMaterial;
begin
  if (Trim(ECode.Text) = '') or (Trim(EName.Text) = '') or (CBUnit.Text = '') or
     (not TryStrToInt(Trim(EStock.Text), Stock)) or
     (not TryStrToInt(Trim(EMin.Text), MinStock)) then
  begin
    ShowMessage('Проверьте правильность ввода');
    Exit;
  end;

  Mat.Code := Trim(ECode.Text);
  Mat.Name := Trim(EName.Text);
  Mat.UnitName := CBUnit.Text;
  Mat.Stock := Stock;
  Mat.MinStock := MinStock;

  try
    if FileOpened then
      CloseFile(F);
    AssignFile(F, CurrentFileName);
    if FileExists(CurrentFileName) then Reset(F) else Rewrite(F);
    Seek(F, FileSize(F));
    Write(F, Mat);
    CloseFile(F);
    FileOpened := False;
  except
    ShowMessage('Ошибка при сохранении');
    Exit;
  end;

  RefreshGrid;
  ECode.Clear;
  EName.Clear;
  EStock.Clear;
  EMin.Clear;
  CBUnit.ItemIndex := 0;
  ECode.SetFocus;
end;

procedure TfMain.MIClearClick(Sender: TObject);
begin
  ECode.Clear;
  EName.Clear;
  EStock.Clear;
  EMin.Clear;
  CBUnit.ItemIndex := 0;
  ECode.SetFocus;
end;

procedure TfMain.MICloseFileClick(Sender: TObject);
begin
  try
    if FileOpened then
    begin
      CloseFile(F);
      FileOpened := False;
    end;
    CurrentFileName := '';
    SG.RowCount := 1;
    ShowMessage('Файл закрыт');
  except
    ShowMessage('Ошибка при закрытии файла');
  end;
end;

procedure TfMain.MICreateClick(Sender: TObject);
begin
  if FileExists(CurrentFileName) then
    if MessageDlg('Подтверждение', 'Файл уже существует. Создать новый?',
                  mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  try
    if FileOpened then
      CloseFile(F);
    AssignFile(F, CurrentFileName);
    Rewrite(F);
    CloseFile(F);
    FileOpened := False;
    RefreshGrid;
    ShowMessage('Новый файл создан');
  except
    ShowMessage('Ошибка при создании');
  end;
end;

procedure TfMain.MIDeleteClick(Sender: TObject);
var
  Mat: TMaterial;
  i, CurrentRow: Integer;
begin
  if SG.Row <= 0 then
  begin
    ShowMessage('Выберите запись для удаления!');
    Exit;
  end;

  if MessageDlg('Удалить запись?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

  CurrentRow := SG.Row - 1;

  if not FileExists(CurrentFileName) then
  begin
    ShowMessage('Файл не найден');
    Exit;
  end;

  try
    if FileOpened then
      CloseFile(F);
    AssignFile(F, CurrentFileName);
    Reset(F);
    AssignFile(tempF, 'temp.dat');
    Rewrite(tempF);

    i := 0;
    while not Eof(F) do
    begin
      Read(F, Mat);
      if i <> CurrentRow then Write(tempF, Mat);
      Inc(i);
    end;

    CloseFile(F);
    CloseFile(tempF);
    DeleteFile(CurrentFileName);
    RenameFile('temp.dat', CurrentFileName);
    FileOpened := False;
  except
    ShowMessage('Ошибка при удалении');
    Exit;
  end;

  RefreshGrid;
  ShowMessage('Запись удалена');
end;

procedure TfMain.MIEditClick(Sender: TObject);
var
  Mat: TMaterial;
  RowIndex: integer;
begin
  if SG.Row <= 0 then
  begin
    ShowMessage('Выберите запись для редактирования');
    Exit;
  end;

  RowIndex := SG.Row - 1;
  Mat.Code := Trim(ECode.Text);
  Mat.Name := Trim(EName.Text);
  Mat.UnitName := CBUnit.Text;

  if not TryStrToInt(Trim(EStock.Text), Mat.Stock) then
  begin
    ShowMessage('Остаток должен быть числом');
    Exit;
  end;

  if not TryStrToInt(Trim(EMin.Text), Mat.MinStock) then
  begin
    ShowMessage('Мин. запас должен быть числом');
    Exit;
  end;

  if not FileExists(CurrentFileName) then
  begin
    ShowMessage('Файл не найден');
    Exit;
  end;

  try
    if FileOpened then
      CloseFile(F);
    AssignFile(F, CurrentFileName);
    Reset(F);
    Seek(F, RowIndex);
    Write(F, Mat);
    CloseFile(F);
    FileOpened := False;
  except
    ShowMessage('Ошибка при редактировании');
    Exit;
  end;

  RefreshGrid;
  ShowMessage('Запись обновлена!');
end;

procedure TfMain.MIExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.MIOpenClick(Sender: TObject);
var
  od: TOpenDialog;
begin
  od := TOpenDialog.Create(Self);
  od.Filter := 'DAT файлы (*.dat)|*.dat|Все файлы (*.*)|*.*';
  if od.Execute then
  begin
    if FileOpened then
      CloseFile(F);
    CurrentFileName := od.FileName;
    RefreshGrid;
    ShowMessage('Файл открыт: ' + ExtractFileName(CurrentFileName));
  end;
  od.Free;
end;

procedure TfMain.MISaveClick(Sender: TObject);
var
  Mat: TMaterial;
  i: Integer;
begin
  if SG.RowCount <= 1 then
  begin
    ShowMessage('Нет данных для сохранения');
    Exit;
  end;

  try
    if FileOpened then
      CloseFile(F);
    AssignFile(F, CurrentFileName);
    Rewrite(F);
    for i := 1 to SG.RowCount - 1 do
    begin
      Mat.Code := SG.Cells[0, i];
      Mat.Name := SG.Cells[1, i];
      Mat.UnitName := SG.Cells[2, i];
      Mat.Stock := StrToIntDef(SG.Cells[3, i], 0);
      Mat.MinStock := StrToIntDef(SG.Cells[4, i], 0);
      Write(F, Mat);
    end;
    CloseFile(F);
    FileOpened := False;
    ShowMessage('Данные сохранены');
  except
    ShowMessage('Ошибка при сохранении');
  end;
end;

procedure TfMain.MISaveAsClick(Sender: TObject);
var
  sd: TSaveDialog;
  Mat: TMaterial;
  FileOut: file of TMaterial;
  i: Integer;
begin
  if SG.RowCount <= 1 then
  begin
    ShowMessage('Нет данных для сохранения');
    Exit;
  end;

  sd := TSaveDialog.Create(Self);
  try
    sd.Filter := 'DAT файлы (*.dat)|*.dat|Все файлы (*.*)|*.*';
    sd.DefaultExt := 'dat';
    if sd.Execute then
    begin
      AssignFile(FileOut, sd.FileName);
      Rewrite(FileOut);
      for i := 1 to SG.RowCount - 1 do
      begin
        Mat.Code := SG.Cells[0, i];
        Mat.Name := SG.Cells[1, i];
        Mat.UnitName := SG.Cells[2, i];
        Mat.Stock := StrToIntDef(SG.Cells[3, i], 0);
        Mat.MinStock := StrToIntDef(SG.Cells[4, i], 0);
        Write(FileOut, Mat);
      end;
      CloseFile(FileOut);
      ShowMessage('Файл сохранён: ' + ExtractFileName(sd.FileName));
    end;
  finally
    sd.Free;
  end;
end;

procedure TfMain.MISearchClick(Sender: TObject);
var
  SearchCode: string;
  i: Integer;
begin
  if SG.RowCount <= 1 then
  begin
    ShowMessage('Нет данных для поиска');
    Exit;
  end;

  SearchCode := InputBox('Поиск', 'Введите код материала:', '');
  if SearchCode = '' then Exit;

  for i := 1 to SG.RowCount - 1 do
    if SG.Cells[0, i] = SearchCode then
    begin
      SG.Row := i;
      SG.Col := 0;
      SG.TopRow := i;
      Exit;
    end;

  ShowMessage('Материал с кодом "' + SearchCode + '" не найден!');
end;

// СОРТИРОВКА ПО ВОЗРАСТАНИЮ
procedure TfMain.MISortAscClick(Sender: TObject);
var
  List: array of TMaterial;
  Material: TMaterial;
  i, j, count, FieldIndex: Integer;
begin
  if SG.RowCount <= 1 then
  begin
    ShowMessage('Нет данных для сортировки');
    Exit;
  end;

  FieldIndex := SelectField;
  if FieldIndex = -1 then Exit;

  if not FileExists(CurrentFileName) then Exit;

  try
    if FileOpened then CloseFile(F);
    AssignFile(F, CurrentFileName);
    Reset(F);
    count := FileSize(F);
    SetLength(List, count);
    for i := 0 to count - 1 do Read(F, List[i]);
    CloseFile(F);
    FileOpened := False;

    for i := 0 to count - 2 do
      for j := i + 1 to count - 1 do
      begin
        case FieldIndex of
          0: if List[i].Code > List[j].Code then
               begin Material := List[i]; List[i] := List[j]; List[j] := Material; end;
          1: if List[i].Name > List[j].Name then
               begin Material := List[i]; List[i] := List[j]; List[j] := Material; end;
          2: if List[i].UnitName > List[j].UnitName then
               begin Material := List[i]; List[i] := List[j]; List[j] := Material; end;
          3: if List[i].Stock > List[j].Stock then
               begin Material := List[i]; List[i] := List[j]; List[j] := Material; end;
          4: if List[i].MinStock > List[j].MinStock then
               begin Material := List[i]; List[i] := List[j]; List[j] := Material; end;
        end;
      end;

    AssignFile(F, CurrentFileName);
    Rewrite(F);
    for i := 0 to count - 1 do Write(F, List[i]);
    CloseFile(F);
    FileOpened := False;
    RefreshGrid;
  except
    ShowMessage('Ошибка при сортировке');
  end;
end;

// СОРТИРОВКА ПО УБЫВАНИЮ
procedure TfMain.MISortDescClick(Sender: TObject);
var
  List: array of TMaterial;
  Material: TMaterial;
  i, j, count, FieldIndex: Integer;
begin
  if SG.RowCount <= 1 then
  begin
    ShowMessage('Нет данных для сортировки');
    Exit;
  end;

  FieldIndex := SelectField;
  if FieldIndex = -1 then Exit;

  if not FileExists(CurrentFileName) then Exit;

  try
    if FileOpened then CloseFile(F);
    AssignFile(F, CurrentFileName);
    Reset(F);
    count := FileSize(F);
    SetLength(List, count);
    for i := 0 to count - 1 do Read(F, List[i]);
    CloseFile(F);
    FileOpened := False;

    for i := 0 to count - 2 do
      for j := i + 1 to count - 1 do
      begin
        case FieldIndex of
          0: if List[i].Code < List[j].Code then
               begin Material := List[i]; List[i] := List[j]; List[j] := Material; end;
          1: if List[i].Name < List[j].Name then
               begin Material := List[i]; List[i] := List[j]; List[j] := Material; end;
          2: if List[i].UnitName < List[j].UnitName then
               begin Material := List[i]; List[i] := List[j]; List[j] := Material; end;
          3: if List[i].Stock < List[j].Stock then
               begin Material := List[i]; List[i] := List[j]; List[j] := Material; end;
          4: if List[i].MinStock < List[j].MinStock then
               begin Material := List[i]; List[i] := List[j]; List[j] := Material; end;
        end;
      end;

    AssignFile(F, CurrentFileName);
    Rewrite(F);
    for i := 0 to count - 1 do Write(F, List[i]);
    CloseFile(F);
    FileOpened := False;
    RefreshGrid;
  except
    ShowMessage('Ошибка при сортировке');
  end;
end;

end.
