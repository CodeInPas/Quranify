unit uq_tema;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Clipbrd, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, JvNavigationPane, TplColorPanelUnit, RxDBGrid, StrUtils, DBGrids;

type

  { TFormTema }

  TFormTema = class(TForm)
    EdtCariTema: TEdit;
    gTema: TRxDBGrid;
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    pnJudulTafsir5: TJvNavPanelHeader;
    spGoSurat: TSpeedButton;
    procedure EdtCariTemaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gTemaCellClick(Column: TColumn);
    procedure gTemaDblClick(Sender: TObject);
    procedure spGoSuratClick(Sender: TObject);
  private

  public

  end;

var
  FormTema: TFormTema;

implementation

{$R *.lfm}

uses uq_main;
{ TFormTema }

procedure TFormTema.FormShow(Sender: TObject);
begin
  MainForm.DTDaftarTema.open;
end;

procedure TFormTema.gTemaCellClick(Column: TColumn);
var
  ida : string;
  tema:string;
begin

  ida := MainForm.DTDaftarTema.FieldByName('ayat').AsString;
  ida := Trim(ida);
  ida := AnsiReplaceStr(ida, ', ', ''',''');  // ganti , menjadi ','
  ida := '''' + ida + '''';

  tema := MainForm.DTDaftarTema.FieldByName('tema').AsString ;

  MainForm.LoadAyatByNomorTema(ida,tema);

end;

procedure TFormTema.EdtCariTemaChange(Sender: TObject);
begin

  MainForm.DTDaftarTema.Filtered:=false;
  MainForm.DTDaftarTema.Filter:='tema like' + QuotedStr('*'+ EdtCariTema.text +'*');
  MainForm.DTDaftarTema.Filtered:=true;
end;

procedure TFormTema.gTemaDblClick(Sender: TObject);
var
  ida : string;
  tema:string;
begin

  {
  ida := MainForm.DTDaftarTema.FieldByName('ayat').AsString;
  ida := Trim(ida);
  ida := AnsiReplaceStr(ida, ', ', ''',''');  // ganti , menjadi ','
  ida := '''' + ida + '''';

  tema := MainForm.DTDaftarTema.FieldByName('tema').AsString ;

  MainForm.LoadAyatByNomorTema(ida,tema);
  }

end;

procedure TFormTema.spGoSuratClick(Sender: TObject);
begin
  MainForm.pgLeft.ActivePageIndex:=1;
end;

end.

