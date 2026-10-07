unit uq_surat;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, ExtCtrls,
  StdCtrls, Buttons, JvNavigationPane, TplColorPanelUnit, RxDBGrid, DBGrids;


type

  { TFormSurat }

  TFormSurat = class(TForm)
    EdtCariSurat: TEdit;
    gSurat: TRxDBGrid;
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    pnJudulTafsir5: TJvNavPanelHeader;
    spGoTema: TSpeedButton;
    procedure EdtCariSuratChange(Sender: TObject);
    procedure gSuratCellClick(Column: TColumn);
    procedure gSuratDblClick(Sender: TObject);
    procedure spGoTemaClick(Sender: TObject);
  private

  public

  end;

var
  FormSurat: TFormSurat;

implementation

{$R *.lfm}
uses
   uq_main ;

{ TFormSurat }

procedure TFormSurat.gSuratDblClick(Sender: TObject);
var
  id : string;
begin

  //id := MainForm.DTDaftarSurat.FieldByName('id').AsString;
 // MainForm.LoadAyatByNomorSurat(id);


end;

procedure TFormSurat.spGoTemaClick(Sender: TObject);
begin
  MainForm.pgLeft.ActivePageIndex:=0;
end;

procedure TFormSurat.EdtCariSuratChange(Sender: TObject);
begin
   MainForm.DTDaftarSurat.Filtered:=false;
  MainForm.DTDaftarSurat.Filter:='nama_surat like' + QuotedStr('*'+ EdtCariSurat.text +'*');
  MainForm.DTDaftarSurat.Filtered:=true;
end;

procedure TFormSurat.gSuratCellClick(Column: TColumn);
var
  id : string;
begin

  id := MainForm.DTDaftarSurat.FieldByName('id').AsString;
  MainForm.LoadAyatByNomorSurat(id);
end;


end.

