unit uq_kata;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, ZDataset,
  RxDBGrid, Clipbrd, Buttons, StdCtrls, TplColorPanelUnit, DBGrids,
  JvNavigationPane;

type

  { TFrmKata }

  TFrmKata = class(TForm)
    DSDaftarAyatByBasic: TDataSource;
    DSDaftarKataByID: TDataSource;
    DSAyatByBasic: TDataSource;
    DTDaftarAyatByBasic: TZQuery;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    GDaftarKataByID: TRxDBGrid;
    GDaftarKataBybasic: TRxDBGrid;
    DTDaftarKataByID: TZQuery;
    pnJudulTafsir5: TJvNavPanelHeader;
    spGoAnalis: TSpeedButton;
    DTAyatByBasic: TZQuery;
    procedure DTDaftarKataByIDAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure GDaftarKataBybasicDblClick(Sender: TObject);
    procedure GDaftarKataByIDCellClick(Column: TColumn);
    procedure spBackAyat3Click(Sender: TObject);
    procedure spGoAkarKataClick(Sender: TObject);
    procedure spGoAnalisClick(Sender: TObject);
    procedure spGoVisualClick(Sender: TObject);
  private

  public
    ida : string;
    procedure LoadDaftarKata;
  end;

var
  FrmKata: TFrmKata;

implementation

{$R *.lfm}

{ TFrmKata }
uses uq_main;

procedure TFrmKata.FormShow(Sender: TObject);
begin
 // LoadDaftarKata;

end;


procedure TFrmKata.GDaftarKataBybasicDblClick(Sender: TObject);
begin
   MainForm.LoadAyatByKata(DTAyatByBasic.FieldByName('arab_harokat').AsString);
end;

procedure TFrmKata.DTDaftarKataByIDAfterOpen(DataSet: TDataSet);
begin
    DTAyatByBasic.close;
    DTAyatByBasic.Prepare;
    DTAyatByBasic.ParamByName('basic').AsString:= DTDaftarKataByID.FieldByName('basic').AsString ;
    DTAyatByBasic.open;


end;

procedure TFrmKata.GDaftarKataByIDCellClick(Column: TColumn);
begin

   with DTAyatByBasic do
   begin
    close;
    Prepare;
    ParamByName('basic').AsString:= DTDaftarKataByID.FieldByName('basic').AsString ;
    open;

   end;


end;

procedure TFrmKata.spBackAyat3Click(Sender: TObject);
begin
  self.close;
end;

procedure TFrmKata.spGoAkarKataClick(Sender: TObject);
begin


end;

procedure TFrmKata.spGoAnalisClick(Sender: TObject);
var
  analisis:string;
begin

  with  MainForm.DTGetData do
  begin
       close;
       sql.Clear;
       sql.Add('select * from analisis_kata where kata=' + QuotedStr(DTDaftarKataByID.FieldByName('arab_harokat').AsUTF8String));
       open;
       analisis := FieldByName('penjelasan').AsString ;
       if analisis<>'' then
          begin
           if Dialogs.MessageDlg('Kata Ini telah dianalisis sebelumnya , Apakah Anda akan menganalisis Ulang ?' +
             'Tunggu dengan sabar ',  mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
                MainForm.BahasKata(DTDaftarKataByID.FieldByName('arab_harokat').AsUTF8String ,ida)
          else
              MainForm.EdgeBrowser.NavigateToString(analisis);
          end
       else
         if Dialogs.MessageDlg('Apakah Anda akan Membedah Ligusitik dari Kata ' +
             DTDaftarKataByID.FieldByName('arab_harokat').AsUTF8String + ' ?  '+ sLineBreak + 'Tunggu dengan sabar ',
             mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
                MainForm.BahasKata(DTDaftarKataByID.FieldByName('arab_harokat').AsUTF8String ,ida);
      end;


end;

procedure TFrmKata.spGoVisualClick(Sender: TObject);
begin
end;

procedure TFrmKata.LoadDaftarKata;
begin

  With DTDaftarKataByID do
  begin
    close;
    Prepare;
    ParamByName('ids').AsString:= ida ;
    open;

  end;

end;

end.

