unit ui_quiz;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  StrUtils,
  DBCtrls,
  Math,
  DB,
  Clipbrd,
  ExtCtrls,
  StdCtrls,
  Buttons,
  ColorSpeedButton,
  DTAnalogGauge,
  ZDataset;

type

  { TfrmQuiz }

  TfrmQuiz = class(TForm)
    btA: TColorSpeedButton;
    btB: TColorSpeedButton;
    btC: TColorSpeedButton;
    btD: TColorSpeedButton;
    btE: TColorSpeedButton;
    btF: TColorSpeedButton;
    DGetAcak: TZQuery;
    DGetAyat: TZQuery;
    DGetPeriksa: TZQuery;
    DGetItem: TZQuery;
    DSGetPeriksa: TDataSource;
    DSGetKata: TDataSource;
    DSGetAyat: TDataSource;
    DGetKata: TZQuery;
    Image1: TImage;
    lbJudul: TLabel;
    lbJawaban: TLabel;
    mmShowAyat: TMemo;
    pnl_Bawah: TPanel;
    Panel6: TPanel;
    spbBenar: TSpeedButton;
    spbSalah: TSpeedButton;
    procedure btAClick(Sender: TObject);
    procedure btStartClick(Sender: TObject);
    procedure DBMemo1Click(Sender: TObject);
    procedure DBText1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure spbNextClick(Sender: TObject);
  private
    procedure SetKata;
    procedure SetAyat;
    procedure SetPeriksa;
    procedure BukaJawabanKata(ar:string;ind:string);
    procedure BukaJawabanAyat(ayat:string;jawaban:string);
    function AcakJawaban(ar:string;ind:string):string;
    procedure Tanya;
    function GetItem(sq:string):String;
  public
    KATA:string;
    AYAT:string;
    JAWABAN : string;
    SALAH:integer;
    BENAR:integer;
    POSISI:integer;
    IN_GAME : boolean;
  end;

var
  frmQuiz: TfrmQuiz;

implementation

{$R *.lfm}

{ TfrmQuiz }

uses uq_main;

procedure TfrmQuiz.FormShow(Sender: TObject);
begin

  BENAR := 0;
  SALAH := 0;
  POSISI := 0;
  IN_GAME:=True;
  Tanya;
end;

procedure TfrmQuiz.Tanya;
var
  i : integer;
begin

  if IN_GAME = false then exit;

    pnl_Bawah.Enabled:=true;
  randomize;
  i := Random(2) + 1  ;

  if i=1 then
    SetKata
  else if i=2 then
    SetAyat;
  //else if i=3 then
   // SetPeriksa;


  spbSalah.Visible:=False;
  spbBenar.Visible:=False;
  lbJawaban.Visible:=False;
  IN_GAME := false;

end;

procedure TfrmQuiz.Image1Click(Sender: TObject);
begin

  if POSISI>100 then
     begin
     POSISI:=0;
     MainForm.dtAnalog.Position:=0;
     end;
  Tanya;

end;

procedure TfrmQuiz.btAClick(Sender: TObject);
var
  ja : string;
begin

  IN_GAME := True;

  ja := TColorSpeedButton(Sender).Caption;

  if ja = JAWABAN then
     begin
        lbJawaban.Caption:='';
        spbSalah.Visible:=false;
        spbBenar.Visible:=True;
        inc(BENAR);
        MainForm.lbBenar.Caption:= inttostr( BENAR );
     end
  else
      begin
        spbSalah.Visible:=true;
        spbBenar.Visible:=false;
        lbJawaban.Visible:=True;
        lbJawaban.Caption:='Jawaban Yang Benar => ' + JAWABAN ;
        inc(SALAH);
        MainForm.lbSalah.Caption:= inttostr( SALAH );
     end;

  MainForm.lbSkor.Caption:= IntToSTr(BENAR-SALAH) ;
  MainForm.dtAnalog.Position:=POSISI;
  pnl_Bawah.Enabled:=false;
end;

procedure TfrmQuiz.btStartClick(Sender: TObject);
begin
  Tanya;
end;

procedure TfrmQuiz.DBMemo1Click(Sender: TObject);
begin
  Tanya
end;



procedure TfrmQuiz.DBText1Click(Sender: TObject);
begin

   if POSISI>100 then
     begin
     POSISI:=0;

     MainForm.dtAnalog.Position:=0;
     end;

  Tanya;
  spbSalah.Visible:=False;
  spbBenar.Visible:=False;
  lbJawaban.Visible:=False;
end;


procedure TfrmQuiz.spbNextClick(Sender: TObject);
begin
  Tanya;
  spbSalah.Visible:=False;
  spbBenar.Visible:=False;
  lbJawaban.Visible:=False;
end;

function TfrmQuiz.GetItem(sq:string):String;
var
  r:string;
begin

    With DGetItem do
    begin
      close;
      sql.Clear;
      sql.Add(sq);
      open;
      r := r + Fields[0].AsString ;
      Result := Trim(r) ;
    end;

End;

procedure TfrmQuiz.SetPeriksa;
var
  id : Integer;
  ij : integer;
  i : integer;
  k_salah : string='';
  ida : string='';
  ayat_dipilih : string;
  kata_ayat : Tstringlist;
  kata_pilih,kata_pengganti:string;
  sq_tem : string;
begin

   Randomize;
   DGetKata.close;
   lbJudul.Caption:='Tentukan Kata Yang Salah ( Bukan Bagian dari Ayat ) dalam Ayat ini ? ';

   mmShowAyat.Font.Size:=20;


   // DBText1.Font.Size:=20;

    id := RandomRange(1,6236);

    inc(POSISI);

    DGetPeriksa.close;
    DGetPeriksa.sql.Clear;
    DGetPeriksa.sql.Add(' select ayat, id_ayat from v_quiz_ayat where id='  + IntToStr(id) +
                        ' and length(ayat)>50');

    DGetPeriksa.open;
    Clipboard.AsText:=DGetPeriksa.SQL.text;
    ayat_dipilih := DGetPeriksa.Fields[0].AsString;

    ida :=  DGetPeriksa.Fields[1].AsString;


    kata_ayat := TStringList.Create;
    with DGetKata do
    begin
      close;
      sql.Clear;
      sql.Add('select utsmani from terjemah_kata where id_ayat=' +QuotedStr(ida));
      open;

      while not eof do
      begin
        kata_ayat.Add(DGetKata.FieldByName('utsmani').AsString) ;
        next;
      end;



      i := RandomRange(0,kata_ayat.Count-1);
        kata_pilih := kata_ayat.Strings[i];

    end;



    Randomize;
    id := RandomRange(1,28424);
    kata_pengganti:= GetItem( 'select  arab from quiz_kata where id=' + Inttostr( id ));


    JAWABAN :=  kata_pengganti;



    ayat_dipilih:= AnsiReplaceStr(ayat_dipilih,kata_pilih,kata_pengganti);

    mmShowAyat.Text:=ayat_dipilih;

    Randomize;
    id := RandomRange(1,28424);
    btA.Caption:= GetItem( 'select  arab from quiz_kata where id=' + Inttostr( id )) ;
    Randomize;
    id := RandomRange(1,28424);
    btB.Caption:= GetItem( 'select  arab from quiz_kata where id=' + Inttostr( id )) ;
    Randomize;
    id := RandomRange(1,28424);
    btC.Caption:= GetItem( 'select  arab from quiz_kata where id=' + Inttostr( id )) ;
    id := RandomRange(1,28424);
    Randomize;
    btD.Caption:= GetItem( 'select  arab from quiz_kata where id=' + Inttostr( id )) ;
    id := RandomRange(1,28424);
    Randomize;
    btE.Caption:= GetItem( 'select  arab from quiz_kata where id=' + Inttostr( id )) ;
    id := RandomRange(1,28424);
    Randomize;
    btF.Caption:=GetItem( 'select  arab from quiz_kata where id=' + Inttostr( id )) ;

    ij := RandomRange(1,6);

    if ij = 1 then
       btA.Caption:=JAWABAN
    else if ij=2 then
       btB.Caption:=JAWABAN
    else if ij=3 then
       btC.Caption:=JAWABAN
    else if ij=4 then
       btD.Caption:=JAWABAN
    else if ij=5 then
       btE.Caption:=JAWABAN
    else if ij=6 then
       btF.Caption:=JAWABAN

end;

procedure TfrmQuiz.SetAyat;
var
  id : Integer;
  ij : integer;
begin

   Randomize;
   DGetKata.close;
   lbJudul.Caption:='Apakah Nama Surat dan Nomor Ayat dari  Ayat Berikut ini ? ';

   mmShowAyat.Font.Size:=20;


   // DBText1.Font.Size:=20;

    id := RandomRange(1,6236);

    inc(POSISI);

    with DGetAyat do
    begin
      close;
      sql.Clear;
      sql.Add('select * from v_quiz_ayat where id='  + IntToStr(id));

      open;
      mmShowAyat.Text:= FieldByName('ayat').AsString;
      AYAT := FieldByName('ayat').AsString;
      JAWABAN :=  FieldByName('jawaban').AsString;
      BukaJawabanAyat(KATA,JAWABAN);


      Randomize;
      DGetAcak.RecNo :=  RandomRange(1,DGetAcak.RecordCount);
      btA.Caption:= DGetAcak.FieldByName('jawaban').AsString;
      DGetAcak.RecNo :=  RandomRange(1,DGetAcak.RecordCount);
      btB.Caption:= DGetAcak.FieldByName('jawaban').AsString;
      DGetAcak.RecNo :=  RandomRange(1,DGetAcak.RecordCount);
      btC.Caption:= DGetAcak.FieldByName('jawaban').AsString;
      DGetAcak.RecNo :=  RandomRange(1,DGetAcak.RecordCount);
      btD.Caption:=  DGetAcak.FieldByName('jawaban').AsString;
      DGetAcak.RecNo :=  RandomRange(1,DGetAcak.RecordCount);
      btE.Caption:= DGetAcak.FieldByName('jawaban').AsString;
      DGetAcak.RecNo :=  RandomRange(1,DGetAcak.RecordCount);
      btF.Caption:= DGetAcak.FieldByName('jawaban').AsString;

      ij := RandomRange(1,6);

      if ij = 1 then
         btA.Caption:=JAWABAN
      else if ij=2 then
         btB.Caption:=JAWABAN
      else if ij=3 then
         btC.Caption:=JAWABAN
      else if ij=4 then
         btD.Caption:=JAWABAN
      else if ij=5 then
         btE.Caption:=JAWABAN
      else if ij=6 then
         btF.Caption:=JAWABAN


    end;
end;

procedure TfrmQuiz.SetKata;
var
  id : Integer;
  ij : integer;
begin

    id := RandomRange(1,28424);
    inc(POSISI);
    DGetAyat.close;
    mmShowAyat.Font.Size:=40;

    lbJudul.Caption:='Terjemah Dari Kata Berikut ini adalah ?';

    with DGetKata do
    begin
      close;
      sql.Clear;
      sql.Add('select * from quiz_kata where id=' + inttostr(id));
      open;
      mmShowAyat.Text:= FieldByName('arab').AsString;
      KATA := FieldByName('arab').AsString;
      JAWABAN :=  FieldByName('kata').AsString;
      BukaJawabanKata(KATA,JAWABAN);


      Randomize;
      DGetAcak.RecNo :=  RandomRange(1,DGetAcak.RecordCount);
      btA.Caption:= DGetAcak.FieldByName('kata').AsString;
      DGetAcak.RecNo :=  RandomRange(1,DGetAcak.RecordCount);
      btB.Caption:= DGetAcak.FieldByName('kata').AsString;
      DGetAcak.RecNo :=  RandomRange(1,DGetAcak.RecordCount);
      btC.Caption:= DGetAcak.FieldByName('kata').AsString;
      DGetAcak.RecNo :=  RandomRange(1,DGetAcak.RecordCount);
      btD.Caption:=  DGetAcak.FieldByName('kata').AsString;
      DGetAcak.RecNo :=  RandomRange(1,DGetAcak.RecordCount);
      btE.Caption:= DGetAcak.FieldByName('kata').AsString;
      DGetAcak.RecNo :=  RandomRange(1,DGetAcak.RecordCount);
      btF.Caption:= DGetAcak.FieldByName('kata').AsString;

      ij := RandomRange(1,6);

      if ij = 1 then
         btA.Caption:=JAWABAN
      else if ij=2 then
         btB.Caption:=JAWABAN
      else if ij=3 then
         btC.Caption:=JAWABAN
      else if ij=4 then
         btD.Caption:=JAWABAN
      else if ij=5 then
         btE.Caption:=JAWABAN
      else if ij=6 then
         btF.Caption:=JAWABAN


    end;
end;


procedure TfrmQuiz.BukaJawabanAyat(ayat:string;jawaban:string);
var
  v_ar : string;
begin

  Randomize;


  v_ar := AnsimidStr(ayat,7,4);

   with DGetAcak do
    begin
      close;
      sql.Clear;
      sql.Add(' select distinct jawaban from v_quiz_ayat where ayat like' + QuotedStr('%' + v_ar + '%'));
      open;

    end;
end;

procedure TfrmQuiz.BukaJawabanKata(ar:string;ind:string);
var
  j : Integer;
  v_ind: string;
  v_ar : string;
begin

  Randomize;


  v_ind:= AnsiLeftStr(ind,2);
  v_ar := AnsiLeftStr(ar,2);

   with DGetAcak do
    begin
      close;
      sql.Clear;
      sql.Add('select distinct kata,arab from quiz_kata where arab like' + QuotedStr(v_ar + '%') +
      ' and kata!=' + QuotedStr(ind));
      open;

    end;
end;

function TfrmQuiz.AcakJawaban(ar:string;ind:string):string;
var
  j : Integer;
  v_ind: string;
  v_ar : string;
begin

  Randomize;


  v_ind:= AnsiLeftStr(ind,2);
  v_ar := AnsiLeftStr(ar,3);

   with DGetAcak do
    begin
      close;
      sql.Clear;
      sql.Add('select distinct kata,arab from quiz_kata where arab like' + QuotedStr(v_ar + '%') +
      ' and kata!=' + QuotedStr(ind));
      open;
      Randomize;
      j := RecordCount;
      RecNo:=RandomRange(1,j);
      Result:= FieldByName('kata').AsString;
    end;


end;

end.

