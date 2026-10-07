unit uq_prompt;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, atshapeline, ATListbox, TplListBoxUnit, TplColorPanelUnit;

type

  { TFrmPrompting }

  TFrmPrompting = class(TForm)
    cbGaya: TComboBox;
    cbLanguage: TComboBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    mTambahan: TMemo;
    plColorPanel1: TplColorPanel;
    rgPersona: TRadioGroup;
    ShapeLine1: TShapeLine;
    spBuatArtikel: TSpeedButton;
    spTranslate: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure spBuatArtikelClick(Sender: TObject);
    procedure spTranslateClick(Sender: TObject);
  private
    function ShowCustomMsg(const AMessage: string):TModalResult;

  public
    sumber : string;
  end;

var
  FrmPrompting: TFrmPrompting;

implementation

{$R *.lfm}
uses
  uq_main;

{ TFrmPrompting }

procedure TFrmPrompting.spBuatArtikelClick(Sender: TObject);
var
  persona:string;
  tambahan:string;
  gaya :string;
  bahasa : string;
begin

       if rgPersona.ItemIndex <> -1 then
    persona := rgPersona.Items[rgPersona.ItemIndex];

  gaya := cbGaya.text;
  bahasa := cbLanguage.text;
  tambahan:= mTambahan.text;

  if sumber='Quran' then
     MainForm.CreateDakwahFromQuran(persona,gaya, tambahan,bahasa)
  else if sumber='Hadist' then
     MainForm.CreateDakwahFromHadist(persona,gaya,tambahan,bahasa)
  else if sumber='Tafsir' then
     MainForm.CreateDakwahFromTafsir(persona,gaya,tambahan,bahasa)
  else
     ShowCustomMsg('Tidak perlu Pembuatan Artikel');

end;

procedure TFrmPrompting.spTranslateClick(Sender: TObject);
var
    tipe:string;
begin

  if MainForm.Sanadset.Showing then
   tipe := 'sanadset'
   else
   tipe := 'tsaqalayn';


  if sumber='Tafsir' then
     MainForm.terjemahkanTafsir1(cbLanguage.text)
  else if sumber='Hadist' then
     MainForm.PrepareHadistForTranslate(cbLanguage.text,tipe)
  else
     ShowCustomMsg('Tidak perlu Buat Penerjemahan');


end;

procedure TFrmPrompting.FormShow(Sender: TObject);
begin
 // mTambahan.Clear;
end;
function TFrmPrompting.ShowCustomMsg(const AMessage: string):TModalResult;
var
  MyForm: TForm;
  lbl: TLabel;
  btn: TBitBtn;
  pnl: TPanel;
begin
  MyForm := TForm.Create(nil);
  with MyForm do
  begin
    try
      BorderStyle := bsDialog;
      Caption := 'Pesan';
      Position := poMainFormCenter;
      Width := 350;
      Height := 150;
      Color := clForm;

      // Panel untuk tombol di bagian bawah
      pnl := TPanel.Create(MyForm);
      pnl.Parent := MyForm;
      pnl.Align := alBottom;
      pnl.Height := 50;
      pnl.BevelOuter := bvNone;

      // Membuat Tombol OK
      btn := TBitBtn.Create(pnl);
      btn.Parent := pnl;
      btn.Caption := 'Mengerti';
      btn.Kind := bkOK; // Otomatis menutup form dengan mrOk
      btn.Left := (pnl.Width div 2) - (btn.Width div 2);
      btn.Top := 10;

      // Membuat Label Pesan
      lbl := TLabel.Create(MyForm);
      lbl.Parent := MyForm;
      lbl.Align := alClient;
      lbl.Layout := tlCenter;
      lbl.Alignment := taCenter;
      lbl.AutoSize := False;
      lbl.WordWrap := True;
      lbl.Caption := AMessage;
      lbl.Font.Size := 11;
      lbl.Font.Name:='Noto Sans';

      Result := ShowModal;
    finally
      Free;
    end;
  end;
end;

end.

