unit uq_main;

{$MODE Delphi}

interface

uses
  LCLIntf,
  WinINet,
  LCLType,
  Messages,
  SysUtils,
  Variants,
  openssl,
  opensslsockets,
  Classes,
  DB,
  Math,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  ComCtrls,
  StdCtrls,
  Buttons,
  JvNavigationPane,
  HtmlView,
  IdThreadComponent,
  ZConnection,
  ZDataset,
  uWVBrowser,
  uWVWindowParent,
  uWVLoader,
  uWVBrowserBase,
  uWVTypes,
  uWVEvents,
  fphttpclient,
  fpjson,
  uWVTypeLibrary,
  //
  uq_tema,
  udr_waiting,
  uq_surat,
  Clipbrd, Menus,
  IpHtml,
  IpFileBroker,
  TplColorPanelUnit,
  cyPageControl,
  BCPanel,
  ColorSpeedButton,
  DTAnalogGauge,  atshapeline,
  RxDBGrid,
  StrUtils,
  ui_quiz,
  uq_prompt,
  mvMapViewer,
  uq_kata,
  uabout,
  uq_splash, DBGrids;

type

  { TMainForm }

  TMainForm = class(TForm)
    btStart: TColorSpeedButton;
    cbGaya: TComboBox;
    cbLanguage: TComboBox;
    cbNomorAyat: TComboBox;
    cbQori: TComboBox;
    cbNomorHadist: TComboBox;
    DSDaftarKitabHadistTsaq: TDataSource;
    DSDaftarKitab: TDataSource;
    dtAnalog: TDTAnalogGauge;
    DTDaftarKitabHadistTsaq: TZTable;
    DTDaftarKitab: TZTable;
    EDHadist: TWVBrowser;
    EdtCariSurat: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    gKitab: TRxDBGrid;
    Image5: TImage;
    Koneksitsaqalayn: TZConnection;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbAyat2Bedah: TLabel;
    lbBenar: TLabel;
    lbNamaSurat: TLabel;
    lbSalah: TLabel;
    lbSkor: TLabel;
    mTambahan: TMemo;
    pnJudulTafsir6: TJvNavPanelHeader;
    pnlDasboardQuiz: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    pgHadist: TcyPageControl;
    DTDaftarKataBybasic: TZQuery;
    ECariKitab: TEdit;
    ECariKitab1: TEdit;
    GDaftarKitabHadist: TRxDBGrid;
    GDaftarKitabHadistTsaq: TRxDBGrid;
    HTInformasiSurat: THtmlViewer;
    Image3: TImage;
    Image4: TImage;
    Panel12: TPanel;
    Panel7: TPanel;
    pgRight: TcyPageControl;
    pnGenerateAi: TPanel;
    pnJudulTafsir3: TJvNavPanelHeader;
    pnJudulTafsir4: TJvNavPanelHeader;
    pnJudulTafsir5: TJvNavPanelHeader;
    pnKata: TPanel;
    QDataInformasiSurat: TZQuery;
    QShowTsaqalaynByKitab: TZQuery;
    rbInsight: TRadioGroup;
    rbDoa: TRadioGroup;
    rgPersona: TRadioGroup;
    Sanadset: TTabSheet;
    ScAyat: TScrollBar;
    ShapeLine1: TShapeLine;
    spBack: TSpeedButton;
    spBackAyat4: TSpeedButton;
    spBuatArtikel: TSpeedButton;
    spWriteBedahAyat: TSpeedButton;
    spWriteDoa: TSpeedButton;
    spFTsaq: TSpeedButton;
    spAyatNext: TSpeedButton;
    spAyatPrior: TSpeedButton;
    spQuiz1: TSpeedButton;
    spTranslate: TSpeedButton;
    tbsInsight: TTabSheet;
    tbsQuiz: TTabSheet;
    Tsaqalayn: TTabSheet;
    tbsDaftarKata: TTabSheet;
    tbsGenerateAI: TTabSheet;
    tbsSurahInfo: TTabSheet;
    TrdAI: TIdThreadComponent;
    pgLeft: TcyPageControl;
    DSDaftarKitabHadist: TDataSource;
    DTDaftarKitabHadist: TZTable;
    Koneksihadist: TZConnection;
    Label1: TLabel;
    Label2: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    plColorPanel5: TplColorPanel;
    pnDaftarSurat: TPanel;
    pnDaftarTema: TPanel;
    pnQuiz: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel8: TPanel;
    plColorPanel3: TplColorPanel;
    plColorPanel4: TplColorPanel;
    pnJudulTafsir2: TJvNavPanelHeader;
    QShowHadistByKitab: TZQuery;
    QTDaftarSuratAyatByID: TZQuery;
    ScHadist: TScrollBar;
    spBackAyat3: TSpeedButton;
    spQuiz: TSpeedButton;
    spTranslateHadith: TSpeedButton;
    spHadistNext: TSpeedButton;
    spHadistPrior: TSpeedButton;
    spFQuran: TSpeedButton;
    spFHadist: TSpeedButton;
    tabHadist: TTabSheet;
    pgMain: TcyPageControl;
    DSDaftarSurat: TDataSource;
    DSDaftarTema: TDataSource;
    DTDaftarTema: TZTable;
    edCariKata: TEdit;
    Image1: TImage;
    Image2: TImage;
    pnJudulTafsir1: TJvNavPanelHeader;
    koneksitafsir1: TZConnection;
    Label5: TLabel;
    Label6: TLabel;
    mnTafsirArabic1: TJvNavPanelButton;
    mnTafsirIndonesia1: TJvNavPanelButton;
    pnUtama: TPanel;
    Panel2: TPanel;
    pnTafsir1: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel9: TPanel;
    QTTafsirByAyah1: TZQuery;
    QTTafsirByAyah2: TZQuery;
    tabMain: TTabSheet;
    tabQuiz: TTabSheet;
    tbsTema: TTabSheet;
    tbsSurat: TTabSheet;
    tabTafsirLuas: TTabSheet;
    Timer1: TTimer;
    EdgeBrowser: TWVBrowser;
    AddressPnl: TPanel;
    Koneksi: TZConnection;
    DTDaftarSurat: TZTable;
    QTDaftarAyatBySurat: TZQuery;
    Timer2: TTimer;
    EDTafsir: TWVBrowser;
    WVWindowParent1: TWVWindowParent;
    DTGetData: TZQuery;
    WVWindowParent2: TWVWindowParent;
    WVWindowParent3: TWVWindowParent;
    procedure cbNomorAyatChange(Sender: TObject);
    procedure cbNomorHadistChange(Sender: TObject);
    procedure cbQoriChange(Sender: TObject);
    procedure cbQoriClick(Sender: TObject);
    procedure ECariKitabChange(Sender: TObject);
    procedure edCariKataKeyPress(Sender: TObject; var Key: char);
    procedure EdgeBrowserContextMenuRequested(Sender: TObject;
      const aWebView: ICoreWebView2;
      const aArgs: ICoreWebView2ContextMenuRequestedEventArgs);
    procedure EdgeBrowserNavigationStarting(Sender: TObject;
      const aWebView: ICoreWebView2;
      const aArgs: ICoreWebView2NavigationStartingEventArgs);
    procedure EDHadistAfterCreated(Sender: TObject);
    procedure EDHadistContextMenuRequested(Sender: TObject;
      const aWebView: ICoreWebView2;
      const aArgs: ICoreWebView2ContextMenuRequestedEventArgs);
    procedure EDTafsirAfterCreated(Sender: TObject);
    procedure EDTafsirContextMenuRequested(Sender: TObject;
      const aWebView: ICoreWebView2;
      const aArgs: ICoreWebView2ContextMenuRequestedEventArgs);
    procedure EdtCariSuratChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GDaftarKitabHadistDblClick(Sender: TObject);
    procedure GDaftarKitabHadistTsaqCellClick(Column: TColumn);
    procedure GDaftarKitabHadistTsaqDblClick(Sender: TObject);
    procedure gKitabCellClick(Column: TColumn);
    procedure gKitabDblClick(Sender: TObject);
    procedure GroupBox2Click(Sender: TObject);
    procedure KoneksitsaqalaynAfterConnect(Sender: TObject);
    procedure pgMainChange(Sender: TObject);
    procedure rbInsightClick(Sender: TObject);
    procedure ScAyatChange(Sender: TObject);
    procedure spAyatNextClick(Sender: TObject);
    procedure spAyatPriorClick(Sender: TObject);
    procedure spBuatArtikelClick(Sender: TObject);
    procedure spWriteBedahAyatClick(Sender: TObject);
    procedure spFTsaqClick(Sender: TObject);
    procedure spQuiz1Click(Sender: TObject);
    procedure spTranslateClick(Sender: TObject);
    procedure spWriteDoaClick(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure TrdAIRun(Sender: TIdThreadComponent);
    procedure TrdAITerminate(Sender: TIdThreadComponent);
    procedure KoneksiAfterConnect(Sender: TObject);
    procedure KoneksihadistAfterConnect(Sender: TObject);
    procedure LSDaftarKitabDblClick(Sender: TObject);
    procedure mnDaftarSuratClick(Sender: TObject);
    procedure mnDaftarTemaClick(Sender: TObject);
    procedure mnTafsirArabic1Click(Sender: TObject);
    procedure mnTafsirArabic2Click(Sender: TObject);
    procedure mnTafsirIndonesia1Click(Sender: TObject);
    procedure mnTafsirIndonesia2Click(Sender: TObject);
    procedure mnTranslate1Click(Sender: TObject);
    procedure mnTranslate2Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure ScHadistChange(Sender: TObject);
    procedure spBackAyat2Click(Sender: TObject);
    procedure spBackAyatClick(Sender: TObject);
    procedure spBackClick(Sender: TObject);
    procedure spCreateDakwahFromHadistClick(Sender: TObject);
    procedure spCreateDakwahFromQuranClick(Sender: TObject);
    procedure spQuizClick(Sender: TObject);
    procedure spFHadistClick(Sender: TObject);
    procedure spFQuranClick(Sender: TObject);
    procedure spHadistNextClick(Sender: TObject);
    procedure spHadistPriorClick(Sender: TObject);
    procedure spTranslateHadithClick(Sender: TObject);
    procedure tabHadistShow(Sender: TObject);
    procedure tabMainShow(Sender: TObject);
    procedure tabTafsirLuasShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GoBtnClick(Sender: TObject);
    procedure EdgeBrowserAfterCreated(Sender: TObject);
    procedure EdgeBrowserDocumentTitleChanged(Sender: TObject);
    procedure EdgeBrowserInitializationError(Sender: TObject;
      aErrorCode: HRESULT; const aErrorMessage: wvstring);
    procedure Timer2Timer(Sender: TObject);
    procedure TrdWait1Run(Sender: TIdThreadComponent);
    procedure TrdWait1Terminate(Sender: TIdThreadComponent);
    procedure TrdWait2Run(Sender: TIdThreadComponent);
    procedure TrdWait2Terminate(Sender: TIdThreadComponent);
  protected                  
    // It's necessary to handle these messages to call NotifyParentWindowPositionChanged or some page elements will be misaligned.
    procedure WMMove(var aMessage : TWMMove); message WM_MOVE;
    procedure WMMoving(var aMessage : TMessage); message WM_MOVING;
  public
    procedure LoadAyatByNomorSurat(idsa:string);
    procedure LoadAyatByNomorTema(idsa:string;tema:string);
    procedure CreateDakwahFromQuran(persona:string;gaya:string;tambahan:string;bahasa:string);
    procedure CreateDakwahFromHadist(persona:string;gaya:string;tambahan:string;bahasa:string);
    procedure PrepareHadistForTranslate(language:string;tipe:string);
    procedure terjemahkanTafsir1(language:string);
    procedure CreateDakwahFromTafsir(persona:string;gaya:string;tambahan:string;bahasa:string);
    procedure BahasKata(kata:UTF8String;idayat:string);
    procedure LoadAyatByKata(kata:UTF8String);
  private

    FrmSurat : TFormSurat;
    FrmTema  : TFormTema;
    FrmWaiting : TfrmWait;
    FrmSplash : TFormSplash;
    FrmQuiz : TfrmQuiz;
    FrmPrompt : TFrmPrompting;
    FrmKata   : TFrmKata;
    FrmAbout : TFAbout;
    procedure OpenMainDB;

    //procedure LoadAyatByNomorSurat(idsa:string);
    procedure LoadDBTafsir(kitab:string);
    procedure LoadDBTafsir2(kitab:string);
    procedure LoadTafsirBySuratAyatArabic(idsa:string);
    function TranslateTafsirWithAPI(s:string):string;
    procedure LoadTafsirBySuratAyatIndonesia(idsa:string);
    procedure TranslateTafsir(kitab:integer;language:string) ;
    procedure terjemahkanTafsir2;

    procedure OpenCorpus(idsa:string);
    function SetAudio(imam:string):string;
    procedure LoadAyatByID(idsa:string);
    procedure LoadAyatByCariKata(kata:string);
    procedure LoadHadistByNomor(nomor:string;tipe:string);
    procedure terjemahkanHadist(hadist:UTF8String;language:string;tipe:string);
    procedure OpenInformasiSurat(surat:string);
    function EscapeJSON(const S: string): string;
    function IsConnectedToInternet: Boolean;
    function getTadzkirul(ida:string):string;
    function GetBedahAyat(tipe:string;ayat:string;nomor_ayat:string) :string;
  end;

var
  MainForm: TMainForm;
  lokasi_support : string;
  AK : TStringList;
  idayatnow : string;
  promptnow : string;
  DoThread : string;
  katanow :UTF8String;
  sumber : string;
  analisisnow:string;
  FBrowserCreated : boolean;
  FBrowserCreated1 : boolean;
  FBrowserCreated2 : boolean;
implementation

{$R *.lfm}

// This is a demo with the simplest web browser you can build using WebView4Delphi and
// it doesn't show any sign of progress like other web browsers do.

// Remember that it may take a few seconds to load if Windows update, your antivirus or
// any other windows service is using your hard drive.

// Depending on your internet connection it may take longer than expected.

// Please check that your firewall or antivirus are not blocking this application
// or the domain "bing.com".

// The "initialization" section in this unit loads GlobalWebView2Loader which will create
// the global environment asynchronously.

// The browser needs the global environment but the form might be created before that so we
// use a simple timer to create the browser in case the environment is not ready when
// TForm.OnShow is triggered.

// GlobalWebView2Loader will be destroyed automatically in the "finalization" section of
// uWVLoader.pas. All browsers should be already destroyed before GlobalWebView2Loader
// is destroyed.

procedure TMainForm.FormShow(Sender: TObject);
begin

  if GlobalWebView2Loader.InitializationError then
    showmessage(UTF8Encode(GlobalWebView2Loader.ErrorMessage))
   else
    if GlobalWebView2Loader.Initialized then
      begin
      EdgeBrowser.CreateBrowser(WVWindowParent1.Handle);

      end
     else
      Timer1.Enabled := True;

  WindowState:= wsMaximized;
  OpenMainDB;

  FrmSurat := TFormSurat.create(self);
  FrmSurat.Parent := pnDaftarSurat;
  FrmSurat.BorderStyle:=bsNone;
  FrmSurat.Align:=alClient;
  FrmSurat.Show;

  FrmTema  := TFormTema.Create(self);
  FrmTema.Parent := pnDaftarTema;
  FrmTema.BorderStyle:=bsNone;
  FrmTema.Align:=alClient;
  FrmTema.Show;

  FrmQuiz := TfrmQuiz.Create(self);
  FrmQuiz.Parent := pnQuiz ;
  FrmQuiz.BorderStyle:=bsNone;
  FrmQuiz.Align:=alClient;
  FrmQuiz.Show;

  FrmWaiting := TfrmWait.Create(self);
  FrmSplash := TFormSplash.Create(self);
  FrmSplash.ShowModal;


  LoadAyatByNomorSurat('1');

  {
  FrmPrompt := TFrmPrompting.Create(self);
  FrmPrompt.Parent := pnGenerateAi ;
  FrmPrompt.BorderStyle:=bsNone;
  FrmPrompt.Align:=alClient;
  FrmPrompt.spTranslate.Enabled:=false;
  FrmPrompt.spBuatArtikel.Enabled:=false;
  FrmPrompt.Show;
 }
  FrmWaiting := TfrmWait.Create(self);

  FrmKata   := TFrmKata.Create(self);
  FrmKata.Parent := pnKata ;
  FrmKata.BorderStyle:=bsNone;
  FrmKata.Align:=alClient;
  FrmKata.show;
  tabMain.show;

  FrmAbout := TFAbout.Create(self);

  DTDaftarSurat.open;
  DTDaftarKitab.open;
  DTDaftarTema.open;
  //DTDaftarKitabHadistTsaq.open;
  //DTDaftarKitabHadist.open;
end;

procedure TMainForm.GoBtnClick(Sender: TObject);
begin

end;

procedure TMainForm.EdgeBrowserAfterCreated(Sender: TObject);
begin
  WVWindowParent1.UpdateSize;
end;

procedure TMainForm.EdgeBrowserDocumentTitleChanged(Sender: TObject);
begin
end;

procedure TMainForm.EdgeBrowserInitializationError(Sender: TObject;
  aErrorCode: HRESULT; const aErrorMessage: wvstring);
begin
  showmessage(UTF8Encode(aErrorMessage));
end;

procedure TMainForm.Timer2Timer(Sender: TObject);
begin
  Randomize;
  Caption:= inttostr(RandomRange(1,100)  )
end;

procedure TMainForm.TrdAIRun(Sender: TIdThreadComponent);
var
  output:TStringList;
  hasil : string;
  tipe:string;
begin

  if not IsConnectedToInternet  then
    begin
    ShowMessage('Tidak Ada Koneksi Internet');
    TrdAI.Terminate;
    exit;
    end;

  if Sanadset.Showing then
    tipe := 'sanadset'
    else
    tipe := 'tsaqalayn';


  if DoThread = 'Buat Artikel' then
    begin
        try

              output := TStringList.Create;
              output.Text:= TranslateTafsirWithAPI(promptnow);
              output.SaveToFile(lokasi_support + 'materi.html' );
              OpenDocument(lokasi_support + 'materi.html' );
        finally
              output.free;
        end;

    end;

  if DoThread = 'Terjemahkan Hadist' then
    begin
        hasil := TranslateTafsirWithAPI(promptnow);
        hasil := AnsiReplaceStr(hasil,'''','`');
        hasil := AnsiReplaceStr(hasil,'```','');

        Koneksihadist.ExecuteDirect( 'Update kitab set translate = ' +
                                     QuotedStr(hasil) +  ' where id = '+ QShowHadistByKitab.FieldByName('id').AsString );


      //  ShowMessage('Sukses Diterjemahkan');
        LoadHadistByNomor(cbNomorHadist.text,tipe);

    end;

   if DoThread = 'Terjemahkan Tsaqalayn' then
    begin
        hasil := TranslateTafsirWithAPI(promptnow);
        hasil := AnsiReplaceStr(hasil,'''','`');
        hasil := AnsiReplaceStr(hasil,'```','');
        Koneksitsaqalayn.ExecuteDirect( 'Update thaqalayn set translate = ' +
                                     QuotedStr(hasil) +  ' where id = '+ QShowTsaqalaynByKitab.FieldByName('id').AsString );

      //  ShowMessage('Sukses Diterjemahkan');
        LoadHadistByNomor(cbNomorHadist.text,tipe);

    end;

   if DoThread = 'Terjemahkan Tafsir' then
    begin
      hasil := TranslateTafsirWithAPI(promptnow);
      hasil := AnsiReplaceStr(hasil,'''','`');
      hasil := AnsiReplaceStr(hasil,'```','');

     koneksitafsir1.ExecuteDirect( 'Update tafsir set translate = ' +
                                   QuotedStr(hasil) +  ' where ayah_keys2 like ' + QuotedStr('%-' + idayatnow + '-%'));


   //  ShowMessage('Sukses Diterjemahkan');
     LoadTafsirBySuratAyatIndonesia(idayatnow);
          end;

   if DoThread = 'Resume Kata' then
    begin

        try

              output := TStringList.Create;
              output.Text:= TranslateTafsirWithAPI(promptnow);
              hasil :=output.Text;
               output.SaveToFile(lokasi_support + 'resume.html' );
              OpenDocument(lokasi_support + 'resume.html' );

              Koneksi.ExecuteDirect('DELETE From ANALISIS_KATA Where kata=' + QuotedStr(katanow) );
              Koneksi.ExecuteDirect('INSERT INTO ANALISIS_KATA (kata, penjelasan) VALUES ('+
                                     QuotedStr(katanow) + ',' +
                                     QuotedStr(hasil) + ')');

        finally
              output.free;
        end;

    end;

    if DoThread = 'Analisis Ayat' then
    begin
      try
              output := TStringList.Create;
              output.Text:= TranslateTafsirWithAPI(promptnow);
              hasil :=output.Text;
                Koneksi.ExecuteDirect('UPDATE analisis_ayat set ' + analisisnow + '='+
                                     QuotedStr(hasil) + ' where id_ayat =' + QuotedStr(idayatnow));

              output.SaveToFile(lokasi_support + 'analisis.html' );
              OpenDocument(lokasi_support + 'analisis.html' );


        finally
              output.free;
        end;

    end;

   if DoThread = 'Doa' then
    begin
      try
              output := TStringList.Create;
              output.Text:= TranslateTafsirWithAPI(promptnow);
              hasil :=output.Text;
                Koneksi.ExecuteDirect('UPDATE analisis_ayat set ' + analisisnow + '='+
                                     QuotedStr(hasil) + ' where id_ayat =' + QuotedStr(idayatnow));

              output.SaveToFile(lokasi_support + 'doa.html' );
              OpenDocument(lokasi_support + 'doa.html' );


        finally
              output.free;
        end;

    end;



end;

procedure TMainForm.TrdAITerminate(Sender: TIdThreadComponent);
begin

  FrmWaiting.close;
end;

procedure TMainForm.TrdWait1Run(Sender: TIdThreadComponent);
begin
   //TranslateTafsir(1);

end;

procedure TMainForm.TrdWait1Terminate(Sender: TIdThreadComponent);
begin
end;

procedure TMainForm.TrdWait2Run(Sender: TIdThreadComponent);
begin
  // TranslateTafsir(2);
end;

procedure TMainForm.TrdWait2Terminate(Sender: TIdThreadComponent);
begin
  FrmWaiting.Close;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin


  if GlobalWebView2Loader.Initialized then
   begin
    EdgeBrowser.CreateBrowser(WVWindowParent1.Handle)  ;
   end
   else
    Timer1.Enabled := True;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin

  lokasi_support:= ExtractFilePath(Application.ExeName) + 'support/';
  //WindowState:=wsMaximized;

end;

procedure TMainForm.GDaftarKitabHadistDblClick(Sender: TObject);
var
  kitab : string;
  matan,sanad : string;
  F: TStringList;
  j,i: integer;
begin

  try
  F := TStringList.Create;
  F.LoadFromFile(lokasi_support + 'style/hadist.css');

  kitab := DTDaftarKitabHadist.FieldByName('indonesia').AsString;

  with QShowHadistByKitab do
   begin
     close;
     sql.Clear;
     sql.Add('select * from v_hadist where indonesia=' + QuotedStr(kitab));
     open;
     first;

     j := RecordCount;
     cbNomorHadist.Clear;

     for i := 1 to j do
       cbNomorHadist.Items.Add(inttostr(i));
     cbNomorHadist.ItemIndex:=0;

     ScHadist.Min:=1;
     ScHadist.max:= j;
     ScHadist.Position:=1;


      Matan := F.text +
      '<div class="judul-arab"> Kitab Hadist <br> '+
         FieldByName('indonesia').AsString   +  '<br>'+
         'Hadist Nomor : ' + FieldByName('Num_hadith').AsString+
         '</div>'+

     '<div class="teks-arab"> '+ FieldByName('Sanad').AsString + '<br>' +
         FieldByName('Matn').AsUTF8String   +
         '</div>'+
     '<div class="judul-arab""> '+
         'Terjemahan Hadist'   +
         '</div>'+
     '<div class="teks-terjemahan"> '+
         FieldByName('translate').AsString   +
         '</div>';


     EDHadist.NavigateToString(Matan);

   end;

  finally
  f.free ;
  end;
end;

procedure TMainForm.GDaftarKitabHadistTsaqCellClick(Column: TColumn);
var
  kitab : string;
  matan: string;
  F: TStringList;
  j,i: integer;
begin



  try
  F := TStringList.Create;
  F.LoadFromFile(lokasi_support + 'style/hadist.css');

  kitab := DTDaftarKitabHadistTsaq.FieldByName('nama_kitab').AsString;

  with QShowTsaqalaynByKitab do
   begin
     close;
     sql.Clear;
     sql.Add('select id,title,hadees_arabic as Matn,translate,hadees_english from thaqalayn where title=' + QuotedStr(kitab)  );
     open;
     first;

     j := RecordCount;
     cbNomorHadist.Clear;

     for i := 1 to j do
       cbNomorHadist.Items.Add(inttostr(i));
     cbNomorHadist.ItemIndex:=0;

     ScHadist.Min:=1;
     ScHadist.max:= j;
     ScHadist.Position:=1;


      Matan := F.text +
      '<div class="judul-arab"> Kitab Hadist <br> '+
         FieldByName('title').AsString   +  '<br>'+
         'Hadist Nomor : ' + IntToStr(RecNo) +
         '</div>'+

     '<div class="teks-arab"> ' +
         FieldByName('Matn').AsUTF8String   +
         '</div>'+
     '<div class="judul-arab""> '+
         'Terjemahan Hadist'   +
         '</div>'+
     '<div class="teks-terjemahan"> '+
         FieldByName('translate').AsString   +
         '</div>';


     EDHadist.NavigateToString(Matan);


   end;

  finally
  f.free ;
  end;


end;

procedure TMainForm.GDaftarKitabHadistTsaqDblClick(Sender: TObject);
var
  kitab : string;
  matan: string;
  F: TStringList;
  j,i: integer;
begin

   {
  try
  F := TStringList.Create;
  F.LoadFromFile(lokasi_support + 'style/hadist.css');

  kitab := DTDaftarKitabHadistTsaq.FieldByName('nama_kitab').AsString;

  with QShowTsaqalaynByKitab do
   begin
     close;
     sql.Clear;
     sql.Add('select id,title,hadees_arabic as Matn,translate,hadees_english from thaqalayn where title=' + QuotedStr(kitab)  );
     open;
     first;

     j := RecordCount;
     cbNomorHadist.Clear;

     for i := 1 to j do
       cbNomorHadist.Items.Add(inttostr(i));
     cbNomorHadist.ItemIndex:=0;

     ScHadist.Min:=1;
     ScHadist.max:= j;
     ScHadist.Position:=1;


      Matan := F.text +
      '<div class="judul-arab"> Kitab Hadist <br> '+
         FieldByName('title').AsString   +  '<br>'+
         'Hadist Nomor : ' + IntToStr(RecNo) +
         '</div>'+

     '<div class="teks-arab"> ' +
         FieldByName('Matn').AsUTF8String   +
         '</div>'+
     '<div class="judul-arab""> '+
         'Terjemahan Hadist'   +
         '</div>'+
     '<div class="teks-terjemahan"> '+
         FieldByName('translate').AsString   +
         '</div>';


     EDHadist.NavigateToString(Matan);


   end;

  finally
  f.free ;
  end;
    }
end;

procedure TMainForm.gKitabCellClick(Column: TColumn);
begin

  try
   LoadTafsirBySuratAyatArabic(idayatnow);
  except
    on e:exception do
    OpenDocument(lokasi_support + 'data/tafsirs/' + DTDaftarKitab.FieldByName('FileDB').AsString  );
  end;
end;

procedure TMainForm.gKitabDblClick(Sender: TObject);
begin
  {
  try
   LoadTafsirBySuratAyatArabic(idayatnow);
  except
    on e:exception do
    OpenDocument(lokasi_support + 'data/tafsirs/' + DTDaftarKitab.FieldByName('FileDB').AsString  );
  end;
  }

end;

procedure TMainForm.GroupBox2Click(Sender: TObject);
begin
    end;

procedure TMainForm.KoneksitsaqalaynAfterConnect(Sender: TObject);
begin
  //DTDaftarKitabHadistTsaq.Open;
end;

procedure TMainForm.pgMainChange(Sender: TObject);
begin


end;

procedure TMainForm.rbInsightClick(Sender: TObject);
begin

end;

procedure TMainForm.ScAyatChange(Sender: TObject);
var
    suray:string;
begin

  suray := QTDaftarAyatBySurat.FieldByName('surah').AsString +':' +
           Inttostr(ScAyat.Position);
  LoadAyatByID(suray);
end;

procedure TMainForm.spAyatNextClick(Sender: TObject);
var
  suray:string;
  nomor : integer;
begin

   nomor := StrToint( cbNomorAyat.text );
   if nomor = QTDaftarAyatBySurat.RecNo then exit;

  cbNomorAyat.text := Inttostr(StrToint(cbNomorAyat.text) + 1);
  suray := QTDaftarAyatBySurat.FieldByName('surah').AsString +':' +
           cbNomorAyat.text;

  LoadAyatByID(suray);
 end;

procedure TMainForm.spAyatPriorClick(Sender: TObject);
var
  suray:string;
  nomor : integer;
begin

   nomor := StrToint( cbNomorAyat.text );
   if nomor =1 then exit;

  cbNomorAyat.text := Inttostr( StrToint(cbNomorAyat.text)-1);
  suray := QTDaftarAyatBySurat.FieldByName('surah').AsString +':' +
           cbNomorAyat.text;

  LoadAyatByID(suray);

end;

procedure TMainForm.spBuatArtikelClick(Sender: TObject);
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
     ShowMessage('Tidak perlu Pembuatan Artikel');

end;

procedure TMainForm.spWriteBedahAyatClick(Sender: TObject);
var
  analisis : string;
  prompt : string;
  ayat  : UTF8String;
  nomor_ayat : string ;
  sq:string;
begin

    if rbInsight.ItemIndex <> -1 then
       analisis := trim(rbInsight.Items[rbInsight.ItemIndex]);

    //cek ketersediaan data


    if analisis='Analisis Linguistik' then
      sq := 'select linguistik from analisis_ayat where id_ayat=' + QuotedStr(idayatnow)
    else if analisis='Penelusuran Tafsir' then
      sq := 'select tafsir from analisis_ayat where id_ayat=' + QuotedStr(idayatnow)
    else if analisis='Analisis Etimologi' then
      sq := 'select Etimologi from analisis_ayat where id_ayat=' + QuotedStr(idayatnow)
    else if analisis='Korelasi Intertekstual' then
      sq := 'select intertekstual from analisis_ayat where id_ayat=' + QuotedStr(idayatnow)
    else if analisis='Identifikasi Hukum Tajwid' then
      sq := 'select tajwid from analisis_ayat where id_ayat=' + QuotedStr(idayatnow)
    else if analisis='Sintesis Makna' then
      sq := 'select sintesis from analisis_ayat where id_ayat=' + QuotedStr(idayatnow)
    else if analisis='Isyari dan Sufistik' then
      sq := 'select isyari from analisis_ayat where id_ayat=' + QuotedStr(idayatnow);

   with DTGetData do
   begin
      close;
      sql.Clear;
      sql.Add(sq);
      open;

      if trim(Fields[0].AsString)<>'' then
      begin
       if Dialogs.MessageDlg('Sudah pernah dianalisis , Apakah akan membuat  analisis ulang ?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrNo then
       begin
         EdgeBrowser.NavigateToString(Fields[0].AsString);
         exit;
       end;
      end ;

      nomor_ayat := lbAyat2Bedah.Caption;
      ayat := QTDaftarSuratAyatByID.FieldByName('text').AsUTF8String;
      nomor_ayat:= lbAyat2Bedah.Caption;

      prompt := GetBedahAyat(analisis,ayat,nomor_ayat);
      promptnow:=prompt;
      DoThread:='Analisis Ayat';
      TrdAI.Active:=true;
      FrmWaiting.ShowModal;

   end;

end;

procedure TMainForm.spFTsaqClick(Sender: TObject);
begin

  Koneksitsaqalayn.Connected:=false;
  Koneksitsaqalayn.Protocol:='sqlite';
  Koneksitsaqalayn.LibraryLocation:=lokasi_support + 'SQLite3.dll';
  Koneksitsaqalayn.Database:=lokasi_support + 'data/hadists/imamiyah.db';
  Koneksitsaqalayn.Connect;



  sumber:='Hadist';
  tabHadist.show;
  Tsaqalayn.show;
  DTDaftarKitabHadistTsaq.open;
  GDaftarKitabHadistTsaqDblClick(sender);
  tbsGenerateAI.Show;

end;

procedure TMainForm.spQuiz1Click(Sender: TObject);
begin
  FrmAbout.ShowModal;
end;

procedure TMainForm.spTranslateClick(Sender: TObject);
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
     ShowMessage('Tidak perlu Buat Penerjemahan');



end;

procedure TMainForm.spWriteDoaClick(Sender: TObject);
var
    gaya : string;
    prompt : string;
    ayat ,nomor_ayat: UTF8String;
    sq : string;
begin

  if rbDoa.ItemIndex <> -1 then
       gaya := trim(rbDoa.Items[rbDoa.ItemIndex]);


 if gaya='Imam Ali Bin Abi Thalib' then
    sq := 'select ali from analisis_ayat where id_ayat=' + QuotedStr(idayatnow)
  else if gaya='Imam Ali Zainal Abidin' then
    sq := 'select sajjad from analisis_ayat where id_ayat=' + QuotedStr(idayatnow)
  else if gaya='Ibnu Athaillah' then
    sq := 'select athaillah from analisis_ayat where id_ayat=' + QuotedStr(idayatnow) ;


  with DTGetData do
   begin
      close;
      sql.Clear;
      sql.Add(sq);
      open;

      if trim(Fields[0].AsString)<>'' then
      begin
       if Dialogs.MessageDlg('Sudah pernah dianalisis , Apakah akan membuat  analisis ulang ?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrNo then
       begin
         EdgeBrowser.NavigateToString(Fields[0].AsString);
         exit;
       end;
      end ;


    ayat := QTDaftarSuratAyatByID.FieldByName('text').AsUTF8String;
    nomor_ayat:= lbAyat2Bedah.Caption;


   if gaya='Imam Ali Bin Abi Thalib' then
   begin
        prompt := 'Role: Bertindaklah sebagai seorang ahli sastra Arab klasik dan teologi ' +
            'Islam yang mendalami kitab Nahjul Balaghah.' + sLineBreak +
            'Task: Susunlah sebuah doa puitis dan mendalam yang dipanjatkan setelah ' +
            'membaca Surah [' + nomor_ayat + '] yang berbunyi ["' + ayat  + '"],' + sLineBreak +
            'Style & Tone: Gunakan gaya bahasa Imam Ali bin Abi Thalib. ' +
            'Karakteristik doa harus mencakup:' + sLineBreak + sLineBreak +
            '1. Metafora yang Kuat: Gunakan perumpamaan tentang cahaya, kegelapan, ' +
            'samudera, atau badai jiwa.' + sLineBreak +
            '2. Kontras (Thibaq): Pertentangkan antara keagungan Allah yang tak ' +
            'terbatas dengan kefanaan dan kelemahan hamba.' + sLineBreak +
            '3. Retorika Balaghah: Kalimat yang berima alami (Saja''), filosofis, ' +
            'dan emosional namun tetap berwibawa.' + sLineBreak +
            '4. Isi Doa: Fokus pada permohonan keteguhan hati (istikamah), ' +
            'perlindungan dari tipu daya diri sendiri (nafsu), dan permohonan agar ' +
            'hidayah bukan sekadar tahu jalan, tapi mampu melangkah di jalan tersebut.' + sLineBreak +
            '5. Output Language: Bahasa Indonesia yang baku, puitis, dan menyentuh kalbu.';
        analisisnow:='Ali';
    end
    else if gaya='Imam Ali Zainal Abidin' then
    begin
       prompt := 'Role: Bertindaklah sebagai seorang ahli sastra Islam klasik yang sangat ' +
            'mendalami Ash-Shahifah as-Sajjadiyyah (Zabur Al-Muhammad).' + sLineBreak +
            'Task: Susunlah sebuah doa atau munajat sebagai bentuk tadabur dari '+ sLineBreak +
            'Surat [' + nomor_ayat + '] yang berbunyi ["' + ayat  + '"],' + sLineBreak +
            'Style & Persona (Imam Zainal Abidin):' + sLineBreak + sLineBreak +
            '1. Nada Bicara: Sangat rendah hati, penuh rintihan, dan merasa diri kecil ' +
            '(fakir) di hadapan kebesaran Allah.' + sLineBreak +
            '2. Detail Spiritual: Jangan hanya meminta petunjuk, tapi gambarkan ketakutan ' +
            'hamba jika tersesat dan betapa butuhnya hamba pada bimbingan setiap detiknya.' + sLineBreak +
            '3. Penggunaan Sapaan: Gunakan sapaan yang mesra namun penuh adab seperti ' +
            '"Ilahi...", "Tuhanku...", atau "Wahai Harapan bagi orang yang tak punya harapan...".' + sLineBreak +
            '4. Isi Doa: Fokuskan pada permohonan agar Allah tidak menyerahkan urusan ' +
            'hamba kepada diri hamba sendiri meski sekejap mata pun. Gambarkan "jalan lurus" ' +
            'sebagai satu-satunya tali penyelamat dari jurang kebinasaan.' + sLineBreak +
            '5. Output Language: Bahasa Indonesia yang sangat halus, puitis, dan menyentuh ' +
            'sisi emosional terdalam (melankolis yang spiritual).';
       analisisnow:='sajjad';
    end
    else if gaya='Ibnu Athaillah' then
    begin
       prompt := 'Role: Bertindaklah sebagai seorang guru sufi dan ahli makrifat yang sangat ' +
            'mendalami pemikiran Ibnu Athaillah as-Sakandari dalam kitab Al-Hikam.' + sLineBreak +
            'Task: Susunlah sebuah doa/munajat yang merupakan tadabur mendalam  ' +
            'Surat [' + nomor_ayat + '] yang berbunyi ["' + ayat  + '"],' + sLineBreak +
            'Style & Linguistic Constraints:' + sLineBreak + sLineBreak +
            '1. Paradoks Spiritual: Gunakan kalimat yang menunjukkan bahwa apa yang ' +
            'terlihat oleh mata seringkali berbeda dengan hakikat di sisi Allah.' + sLineBreak +
            '2. Fokus pada Hati (Qalb): Doa harus berfokus pada perjalanan batin, ' +
            'bukan sekadar permintaan materi.' + sLineBreak +
            '3. Logika Makrifat: Gunakan pola kalimat tanya retoris seperti "Tuhanku, ' +
            'bagaimana mungkin aku..." atau "Bagaimana bisa aku mencari-Mu, padahal ' +
            'Engkaulah yang menampakkan segala sesuatu...".' + sLineBreak +
            '4. Ringkas & Padat (Aphoristic): Kalimatnya tidak perlu terlalu panjang, ' +
            'namun setiap kata memiliki bobot filosofis yang berat.' + sLineBreak +
            '5. Dekonstruksi Ego: Doa harus menunjukkan bahwa hamba tidak memiliki daya ' +
            'apa pun, dan bahkan permintaan hamba pun adalah pemberian-Mu.' + sLineBreak +
            '6. Tone: Bijak, tenang, mendalam, dan menembus ruang-ruang kesadaran batin.' + sLineBreak +
            '7. Output Language: Bahasa Indonesia yang intelek dan puitis-sufistik.';
        analisisnow:='Athaillah';
       end;

    prompt := prompt + sLineBreak +
            'Catatan : ' + sLineBreak +
            '1. Jawab Tidak tahu jika Anda tidak mengetahui ( untuk menghindari bias ),' + sLineBreak +
            '2. Output Jawaban yang diharapkan :' + sLineBreak +
            'jawaban anda dalam bentuk html rapi ( lebar 90% ) dan tanpa penjelasan , Jangan gunakan Markdown,' +
            'Font latin menggunakan Google Sans , Arabic dengan Amiri.';


    promptnow:=prompt;
    DoThread:='Doa';
    TrdAI.Active:=true;
    FrmWaiting.ShowModal;

   end;


end;

procedure TMainForm.Timer3Timer(Sender: TObject);
begin

  if GlobalWebView2Loader.Initialized then
    EDTafsir.CreateBrowser(WVWindowParent2.Handle)
   else
end;

procedure TMainForm.LoadHadistByNomor(nomor:string;tipe:string);
var
  kitab : string;
  Matan : string;
  sanad:string;
  F: TStringList;
begin

  try
  F := TStringList.Create;
  F.LoadFromFile(lokasi_support + 'style/hadist.css');





  if tipe ='sanadset' then
  begin
      kitab := DTDaftarKitabHadist.FieldByName('indonesia').AsString;
      with QShowHadistByKitab do
       begin
         close;
         open;
         Locate('Num_Hadith',nomor,[loCaseInsensitive]);
         Matan := F.text +
          '<div class="judul-arab"> Kitab Hadist <br> '+
             FieldByName('indonesia').AsString   +  '<br>'+
             'Hadist Nomor : ' + FieldByName('Num_hadith').AsString+
             '</div>'+

         '<div class="teks-arab"> '+ FieldByName('Sanad').AsString + '<br>' +
             FieldByName('Matn').AsUTF8String   +
             '</div>'+
         '<div class="judul-arab""> '+
             'Terjemahan Hadist'   +
             '</div>'+
         '<div class="teks-terjemahan"> '+
             FieldByName('translate').AsString   +
             '</div>';
         EDHadist.NavigateToString(Matan);
       end;
  end
  else
  begin
    kitab := DTDaftarKitabHadistTsaq.FieldByName('nama_kitab').AsString;
     with QShowTsaqalaynByKitab do
       begin
         close;
         open;
        // Locate('Num_Hadith',nomor,[loCaseInsensitive]);
         Recno := StrToInt(nomor);
         Matan := F.text +
          '<div class="judul-arab"> Kitab Hadist <br> '+
             FieldByName('title').AsString   +  '<br>'+
             'Hadist Nomor : ' + Inttostr(RecNo) +
             '</div>'+

         '<div class="teks-arab"> '+
             FieldByName('Matn').AsUTF8String   +
             '</div>'+
         '<div class="judul-arab""> '+
             'Terjemahan Hadist'   +
             '</div>'+
         '<div class="teks-terjemahan"> '+
             FieldByName('translate').AsString   +
             '</div>';
         EDHadist.NavigateToString(Matan);
       end;
  end;

  finally
  f.free ;
  end;

end;

procedure TMainForm.EdgeBrowserNavigationStarting(Sender: TObject;
  const aWebView: ICoreWebView2;
  const aArgs: ICoreWebView2NavigationStartingEventArgs);

var
    vURL: PWideChar;
    url : string;
    id_ayat : string;

begin

  aArgs.Get_Uri(vURL);
  url := vURL;

  if AnsiContainsStr(url,'tafsir-luas') then
    begin
      aArgs.Set_Cancel(1);
      id_ayat := AnsiReplaceStr(url,'https://ayat/','');
      id_ayat := AnsiReplaceStr(id_ayat,'/tafsir-luas','');

      idayatnow:=id_ayat;

      LoadTafsirBySuratAyatArabic(idayatnow);
      sumber:='Tafsir';
      tabTafsirLuas.show;
      tbsGenerateAI.show;

    end
  else if AnsiContainsStr(url,'corpus') then
    begin
      aArgs.Set_Cancel(1);
      id_ayat := AnsiReplaceStr(url,'https://ayat/','');
      id_ayat := AnsiReplaceStr(id_ayat,'/corpus','');
      spBack.Show ;
      idayatnow:=id_ayat;
      OpenCorpus(idayatnow);
    end
  else if AnsiContainsStr(url,'audio') then
    begin
      aArgs.Set_Cancel(1);
    end
  else if AnsiContainsStr(url,'Detil') then
    begin
      aArgs.Set_Cancel(1);
      id_ayat := AnsiReplaceStr(url,'https://ayat/','');
      id_ayat := AnsiReplaceStr(id_ayat,'/Detil','');
      spBack.Show ;
      idayatnow:=id_ayat;
      sumber:= 'Quran' ;
      spTranslate.Enabled:=true;
      spBuatArtikel.Enabled:=true;
      LoadAyatByID(idayatnow);
      tbsGenerateAI.show;
    end

   else if AnsiContainsStr(url,'Kata') then
    begin
      aArgs.Set_Cancel(1);
      id_ayat := AnsiReplaceStr(url,'https://ayat/','');
      id_ayat := AnsiReplaceStr(id_ayat,'/Kata','');
      idayatnow:=id_ayat;
      FrmKata.ida:=idayatnow;
      FrmKata.LoadDaftarKata;
      FrmKata.show;
      tbsDaftarKata.show;

    end

    else if AnsiContainsStr(url,'Insight') then
    begin
      aArgs.Set_Cancel(1);
      id_ayat := AnsiReplaceStr(url,'https://ayat/','');
      id_ayat := AnsiReplaceStr(id_ayat,'/Insight','');
      idayatnow:=id_ayat;
      tbsInsight.show;
      lbAyat2Bedah.Caption:= 'Surat ' + sLineBreak +
                             QTDaftarSuratAyatByID.FieldByName('name_simple').AsString + sLineBreak +
                             'Ayat ke - ' + QTDaftarSuratAyatByID.FieldByName('ayah').AsString ;
    end;



end;

procedure TMainForm.EDHadistAfterCreated(Sender: TObject);
begin
   WVWindowParent3.UpdateSize;
end;

procedure TMainForm.EDHadistContextMenuRequested(Sender: TObject;
  const aWebView: ICoreWebView2;
  const aArgs: ICoreWebView2ContextMenuRequestedEventArgs);
begin
      if aArgs <> nil then
    aArgs.Set_Handled(1);
end;

procedure TMainForm.EDTafsirAfterCreated(Sender: TObject);
begin
  WVWindowParent2.UpdateSize;
end;

procedure TMainForm.EDTafsirContextMenuRequested(Sender: TObject;
  const aWebView: ICoreWebView2;
  const aArgs: ICoreWebView2ContextMenuRequestedEventArgs);
begin
    if aArgs <> nil then
    aArgs.Set_Handled(1);
end;

procedure TMainForm.EdtCariSuratChange(Sender: TObject);
begin
   DTDaftarKitab.Filtered:=false;
   DTDaftarKitab.Filter:='kitab like' + QuotedStr('*'+ EdtCariSurat.text +'*');
   DTDaftarKitab.Filtered:=true;
end;

procedure TMainForm.cbQoriClick(Sender: TObject);
begin
  LoadAyatByNomorSurat(idayatnow);
end;

procedure TMainForm.ECariKitabChange(Sender: TObject);
begin



end;

procedure TMainForm.cbNomorHadistChange(Sender: TObject);
var
    tipe:string;
begin
  if Sanadset.Showing then
   tipe := 'sanadset'
   else
   tipe := 'tsaqalayn';

  LoadHadistByNomor(cbNomorHadist.text,tipe);
  ScHadist.Position:=StrToInt(cbNomorHadist.text);
end;

procedure TMainForm.cbNomorAyatChange(Sender: TObject);
var
    suray:string;
begin

  suray := QTDaftarAyatBySurat.FieldByName('surah').AsString +':' +
           cbNomorAyat.text;

  LoadAyatByID(suray);
end;

procedure TMainForm.cbQoriChange(Sender: TObject);
begin
 SetAudio(cbQori.Text);
end;

procedure TMainForm.edCariKataKeyPress(Sender: TObject; var Key: char);
begin

  if key=#13 then
     if length(edCariKata.text) > 3  then
       begin
       LoadAyatByCariKata(edCariKata.text);
       tabMain.show;
       end;
end;

procedure TMainForm.EdgeBrowserContextMenuRequested(Sender: TObject;
  const aWebView: ICoreWebView2;
  const aArgs: ICoreWebView2ContextMenuRequestedEventArgs);
begin
    if aArgs <> nil then
         aArgs.Set_Handled(1);
end;

procedure TMainForm.KoneksiAfterConnect(Sender: TObject);
begin

end;

procedure TMainForm.KoneksihadistAfterConnect(Sender: TObject);
begin
  DTDaftarKitabHadist.open;
end;

procedure TMainForm.LSDaftarKitabDblClick(Sender: TObject);
begin
  LoadTafsirBySuratAyatArabic(idayatnow);
end;


procedure TMainForm.mnDaftarSuratClick(Sender: TObject);
begin
  FrmSurat.ShowModal;
end;

procedure TMainForm.mnDaftarTemaClick(Sender: TObject);
begin

FrmTema.ShowModal;
end;

procedure TMainForm.mnTafsirArabic1Click(Sender: TObject);
begin
  LoadTafsirBySuratAyatArabic(idayatnow);
end;

procedure TMainForm.mnTafsirArabic2Click(Sender: TObject);
begin
  LoadTafsirBySuratAyatArabic(idayatnow);
end;

procedure TMainForm.mnTafsirIndonesia1Click(Sender: TObject);
begin
  LoadTafsirBySuratAyatIndonesia(idayatnow);
end;

procedure TMainForm.mnTafsirIndonesia2Click(Sender: TObject);
begin
  LoadTafsirBySuratAyatIndonesia(idayatnow);
end;

procedure TMainForm.mnTranslate1Click(Sender: TObject);
begin
// terjemahkanTafsir1;

end;

procedure TMainForm.mnTranslate2Click(Sender: TObject);
begin
 // terjemahkanTafsir2;

end;

procedure TMainForm.Panel7Click(Sender: TObject);
begin

end;

procedure TMainForm.ScHadistChange(Sender: TObject);
var
    tipe:string;
begin
  if Sanadset.Showing then
   tipe := 'sanadset'
   else
   tipe := 'tsaqalayn';

  LoadHadistByNomor(IntToStr(ScHadist.Position),tipe);
  cbNomorHadist.Text:=IntTostr(ScHadist.Position);
end;

procedure TMainForm.terjemahkanTafsir1(language:string);
var
  terjemah:string;
begin

  terjemah := QTTafsirByAyah1.FieldByName('translate').AsString;

  if trim(terjemah)<>'' then
    begin
    if Dialogs.MessageDlg('Sudah pernah diterjemahkan , Apakah akan menerjemahkan ulang ?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
         begin
         ShowMessage('Harap Bersabar selama Proses ini , Klik OK ');
         TranslateTafsir(1,language);
         end;
    end
  else
  begin
    ShowMessage('Harap Bersabar selama Proses ini , Klik OK ');
    TranslateTafsir(1,language );

  end;

end;

procedure TMainForm.terjemahkanTafsir2;
var
    terjemah:string;
begin

  terjemah := QTTafsirByAyah2.FieldByName('translate').AsString;

  if trim(terjemah)<>'' then
    begin
    if Dialogs.MessageDlg('Sudah pernah diterjemahkan , Apakah akan menerjemahkan ulang ?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
         begin
         ShowMessage('Harap Bersabar selama Proses ini , Klik OK ');
         end;
    end
  else
  begin

    ShowMessage('Harap Bersabar selama Proses ini , Klik OK ');

  end;
end;

procedure TMainForm.spBackAyat2Click(Sender: TObject);
begin
    tabMain.show;
end;

procedure TMainForm.spBackAyatClick(Sender: TObject);
begin
  tabMain.show;
end;

procedure TMainForm.spBackClick(Sender: TObject);
begin

  EdgeBrowser.GoBack;
  spBack.hide;
  spTranslate.Enabled:=false;
  spBuatArtikel.Enabled:=false;
  tbsSurahInfo.show;

end;

procedure TMainForm.spCreateDakwahFromHadistClick(Sender: TObject);
begin
  sumber:='Hadist';
  showmodal;
end;

procedure TMainForm.CreateDakwahFromHadist(persona:string;gaya:string;tambahan:string;bahasa:string);
var
    terjemah : string;
    prompt : string;
    kitab : string;
    nomor : string;
    output: TStringList;
    tipe : string;
begin

  if Sanadset.Showing then
   begin
      tipe := 'sanadset';
      terjemah := QShowHadistByKitab.FieldByName('translate').AsString ;
      kitab := QShowHadistByKitab.FieldByName('indonesia').AsString;
      nomor := QShowHadistByKitab.FieldByName('Num_Hadith').AsString;
    end

   else
   begin
    tipe := 'tsaqalayn';
    terjemah := QShowTsaqalaynByKitab.FieldByName('translate').AsString ;
    kitab := QShowTsaqalaynByKitab.FieldByName('title').AsString;
    nomor := Inttostr(QShowTsaqalaynByKitab.RecNo);
    end;


    if terjemah='' then
      begin
      ShowMessage('Hadist Belum Diterjemahkan');
      exit;
      end;

    if Dialogs.MessageDlg('Apakah Anda akan membuat artikel dari hadist ini dengan gaya ' + persona +  ' ' +
        ' yang ditujukan untuk ' + gaya + ' ?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
         begin

           prompt := '#role '+ sLineBreak +
                     persona + sLineBreak +
                     '#context' + sLineBreak +
                     'Teks Berikut adalah Terjemah dan penjelasan Ayat Al-quran yang terakait dengan hadist ini. ' + sLineBreak +
                     'hadist dari diambil dari kitab "' + kitab + '. Nomor Hadist ke-' + nomor + '"' + sLineBreak +
                     '#task'+ sLineBreak +
                     'Susun materi dalam bahasa ' + bahasa + ' untuk [' + gaya + '] + yang dikembangkan dari materi [' + terjemah + ']. ' + sLineBreak +
                     'Catatan Output Jawaban :' + sLineBreak +
                     '1. jawaban anda dalam bentuk html rapi ( lebar 90% ) dan tanpa penjelasan .  ' + sLineBreak +
                     '2. Target pembaca sesuai dengan role anda yaitu [' +persona   + '].' +
                     '3. Tambahkan pada jawaban : [ ' + tambahan + ']'+
                     '4. Jangan Gunakan MarkDown ';

           promptnow:=prompt;
           DoThread:='Buat Artikel';
           TrdAI.Active:=true;
           FrmWaiting.ShowModal;

         end;
   end;




procedure TMainForm.spCreateDakwahFromQuranClick(Sender: TObject);
begin
  sumber:='Quran';
end;

procedure TMainForm.CreateDakwahFromQuran(persona:string;gaya:string;tambahan:string;bahasa:string);
var
    terjemah : string;
    tahlili : string;
    prompt : string;
    surat : string;
    nomor : string;
    output: TStringList;
begin

    terjemah := QTDaftarSuratAyatByID.FieldByName('terjemah').AsString ;
    tahlili := QTDaftarSuratAyatByID.FieldByName('isi').AsString ;
    surat := QTDaftarSuratAyatByID.FieldByName('name_simple').AsString;
    nomor := QTDaftarSuratAyatByID.FieldByName('ayah').AsUTF8String;

    if terjemah='' then
      begin
      ShowMessage('Hadist Belum Diterjemahkan');
      exit;
      end;

   if Dialogs.MessageDlg('Apakah Anda akan membuat artikel dari ayat ini dengan penulis ' + persona +' ' +
      ' yang ditujukan untuk ' + gaya + ' ?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
         begin
           prompt := '#role '+ sLineBreak +
                     persona + sLineBreak +
                     '#context' + sLineBreak +
                     'Teks Berikut adalah Terjemah dan penjelasan Ayat Al-quran ini , ' + sLineBreak +
                     'Ayat ini disebutkan dalam Surat  "' + surat + 'ayat ke-' + nomor + '"' + sLineBreak +
                     '#task'+ sLineBreak +
                     'Susun materi dalam bahasa ' + bahasa + ' untuk [' + gaya + '] + yang dikembangkan dari materi [' + terjemah + ']  ' + sLineBreak +
                     'dan penjelasannya [' + tahlili + '].' + sLineBreak  +
                     'Catatan Output Jawaban :' + sLineBreak +
                     '1. jawaban anda dalam bentuk html  rapi ( lebar 80% ) dan tanpa penjelasan  . Jangan Gunakan Markdown' + sLineBreak +
                     '2. Target pembaca sesuai dengan role anda yaitu [' +persona  + '].'+
                     '3. Tambahkan pada jawaban : [ ' + tambahan + ']';

           DoThread:='Buat Artikel';
           promptnow:=prompt;
           TrdAI.Active:=true;
           FrmWaiting.ShowModal;

         end;


end;

procedure TMainForm.CreateDakwahFromTafsir(persona:string;gaya:string;tambahan:string;bahasa:string);
var
    terjemah : string;
    prompt : string;
    surat : string;
    nomor : string;
    output: TStringList;
    kitab : string;
begin

    terjemah := QTTafsirByAyah1.FieldByName('translate').AsString ;

    With DTGetData do
     begin
       close;
       sql.Clear;
       sql.Add('select * from v_show_ayat where id_ayat=' + QuotedStr(idayatnow));
       open;
       surat := FieldByName('name_simple').AsString;
       nomor := FieldByName('ayah').AsString;
     end;



    kitab := DTDaftarKitab.FieldByName('FileDB').AsString ;

    if terjemah='' then
      begin
      ShowMessage('Tafsir Belum Diterjemahkan');
      exit;
      end;

   if Dialogs.MessageDlg('Apakah Anda akan membuat artikel dari ayat ini dengan penulis ' + persona +' ' +
      ' yang ditujukan untuk ' + gaya + ' ?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
         begin
           prompt := '#role '+ sLineBreak +
                     persona + sLineBreak +
                     '#context' + sLineBreak +
                     'Teks Berikut adalah Tafsir Ayat Al-quran ini berdasarkan kitab tafsir  ' + kitab + '. '+ sLineBreak +
                     'Ayat ini disebutkan dalam Surat  "' + surat + 'ayat ke-' + nomor + '"' + sLineBreak +
                     '#task'+ sLineBreak +
                     'Susun materi dalam bahasa ' + bahasa + ' untuk [' + gaya + '] + yang dikembangkan dari materi tafsir [' + terjemah + ']. ' + sLineBreak +
                     'Catatan Output Jawaban :' + sLineBreak +
                     '1. jawaban anda dalam bentuk html  rapi ( lebar 80% ) dan tanpa penjelasan  . Jangan Gunakan Markdown.' + sLineBreak +
                     '2. Target pembaca sesuai dengan role anda yaitu [' +persona  + '].'+
                     '3. Tambahkan pada jawaban : [ ' + tambahan + ']';

           promptnow:=prompt;
           DoThread:='Buat Artikel';
           TrdAI.Active:=true;
           FrmWaiting.ShowModal;

         end;


end;



procedure TMainForm.spQuizClick(Sender: TObject);
begin
  tabQuiz.show ;
  tbsQuiz.show;
end;

procedure TMainForm.spFHadistClick(Sender: TObject);
begin


  Koneksihadist.Connected:=false;
  Koneksihadist.Protocol:='sqlite';
  Koneksihadist.LibraryLocation:=lokasi_support + 'SQLite3.dll';
  Koneksihadist.Database:=lokasi_support + 'data/hadists/sanadset.db';
  Koneksihadist.Connect;


  tabHadist.show;
  sumber:='Hadist';
  tabHadist.show;
  Sanadset.show;
  GDaftarKitabHadistDblClick(sender);
  tbsGenerateAI.Show;


end;

procedure TMainForm.spFQuranClick(Sender: TObject);
begin
  tabMain.show;
  tbsSurahInfo.show;
end;

procedure TMainForm.spHadistNextClick(Sender: TObject);
var
    tipe:string;
begin

   if Sanadset.Showing then
   begin
     tipe := 'sanadset';
     if not QShowHadistByKitab.eof then
      begin
      QShowHadistByKitab.Next;
      LoadHadistByNomor(IntToStr(QShowHadistByKitab.RecNo),tipe);
      cbNomorHadist.text:=IntToStr(QShowHadistByKitab.RecNo);
      end;
   end
   else
   begin
   tipe := 'tsaqalayn';
   if not QShowTsaqalaynByKitab.eof then
    begin
    QShowTsaqalaynByKitab.Next;
    LoadHadistByNomor(IntToStr(QShowTsaqalaynByKitab.RecNo),tipe);
    cbNomorHadist.text:=IntToStr(QShowTsaqalaynByKitab.RecNo);
    end;
   end;

  end;

procedure TMainForm.spHadistPriorClick(Sender: TObject);
var
    tipe:string;
begin

   if Sanadset.Showing then
   begin
     tipe := 'sanadset';
     if not QShowHadistByKitab.eof then
      begin
      QShowHadistByKitab.Prior;
      LoadHadistByNomor(IntToStr(QShowHadistByKitab.RecNo),tipe);
      cbNomorHadist.text:=IntToStr(QShowHadistByKitab.RecNo);
      end;
   end
   else
   begin
   tipe := 'tsaqalayn';
   if not QShowTsaqalaynByKitab.eof then
    begin
    QShowTsaqalaynByKitab.Prior;
    LoadHadistByNomor(IntToStr(QShowTsaqalaynByKitab.RecNo),tipe);
    cbNomorHadist.text:=IntToStr(QShowTsaqalaynByKitab.RecNo);
    end;
   end;


end;

procedure TMainForm.spTranslateHadithClick(Sender: TObject);
begin

end;

procedure TMainForm.PrepareHadistForTranslate(language:string;tipe:string);
var
    ter:string;
begin

  if tipe = 'sanadset' then
  begin
      ter :=  QShowHadistByKitab.FieldByName('translate').AsString ;

      if trim(ter)<>'' then
        begin
        if Dialogs.MessageDlg('Sudah pernah diterjemahkan , Apakah akan menerjemahkan ulang ?',
           mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
             begin
             ShowMessage('Harap Bersabar selama Proses ini , Klik OK ');

              terjemahkanHadist(QShowHadistByKitab.FieldByName('Matn').AsUTF8String,language,tipe);
             end;
        end
      else
      begin
        ShowMessage('Harap Bersabar selama Proses ini , Klik OK ');

        terjemahkanHadist(QShowHadistByKitab.FieldByName('Matn').AsUTF8String,language,tipe);
      end;

  end
  else
  begin
    ter :=  QShowTsaqalaynByKitab.FieldByName('translate').AsString ;

      if trim(ter)<>'' then
        begin
        if Dialogs.MessageDlg('Sudah pernah diterjemahkan , Apakah akan menerjemahkan ulang ?',
           mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
             begin
             ShowMessage('Harap Bersabar selama Proses ini , Klik OK ');

              terjemahkanHadist(QShowTsaqalaynByKitab.FieldByName('Matn').AsUTF8String,language,tipe);
             end;
        end
      else
      begin
        ShowMessage('Harap Bersabar selama Proses ini , Klik OK ');

        terjemahkanHadist(QShowTsaqalaynByKitab.FieldByName('Matn').AsUTF8String,language,tipe);
      end;

  end;



end;

procedure TMainForm.tabHadistShow(Sender: TObject);
begin

  spTranslate.Enabled:=true;
  spBuatArtikel.Enabled:=true;

  if pgMain.ActivePageIndex = 2 then
  begin

    if not FBrowserCreated2 then
    begin
      EDHadist.CreateBrowser(WVWindowParent3.Handle);
      FBrowserCreated2 := True;
    end
    else
      WVWindowParent3.UpdateSize;
  end;


end;

procedure TMainForm.tabMainShow(Sender: TObject);
begin

end;

procedure TMainForm.tabTafsirLuasShow(Sender: TObject);
begin


  pnTafsir1.Width:=Round(pgMain.Width/2);
  spTranslate.Enabled:=true;
  spBuatArtikel.Enabled:=true;


 if pgMain.ActivePageIndex = 1 then
  begin

    if not FBrowserCreated1  then
    begin
      EDTafsir.CreateBrowser(WVWindowParent2.Handle);
      FBrowserCreated1 := True;
    end
    else
      WVWindowParent2.UpdateSize;
  end;



end;

procedure TMainForm.TranslateTafsir(kitab:integer;language:string) ;
var
    h : string;
    s : string;
    idsa : string;
begin


   s := 'Terjemahkan Teks Tafsir Quran berikut dari bahasa Arab ke ' + language + ' : ' + sLineBreak +
       '[ '+ QTTafsirByAyah1.FieldByName('text').AsUTF8String + '] ' +   sLineBreak +
       'Catatan : ' +
       '1. Jawaban dalam hanya format HTML ( container luas 100% , font "Noto Sans" , '+
       'background trasparan,perataan teks adalah justify ) .Jangan gunakan MarkDown. ' +
       '2. Tidak Perlu Menulis Ulang teks arabicnya . ';



  DoThread := 'Terjemahkan Tafsir';
  promptnow:=s;
  TrdAI.Active:=true;
  FrmWaiting.show;


end;


procedure TMainForm.WMMove(var aMessage : TWMMove);
begin
  inherited;

  if (EdgeBrowser <> nil) then
    EdgeBrowser.NotifyParentWindowPositionChanged;
end;

procedure TMainForm.WMMoving(var aMessage : TMessage);
begin
  inherited;

  if (EdgeBrowser <> nil) then
    EdgeBrowser.NotifyParentWindowPositionChanged;
end;

procedure TMainForm.OpenMainDB;
begin


  Koneksi.Protocol:='sqlite';
  koneksi.LibraryLocation:=lokasi_support + 'SQLite3.dll';
  Koneksi.Database:=lokasi_support + 'data/utsmani.db';
  koneksi.Connect;




end;

procedure TMainForm.LoadAyatByKata(kata:UTF8String);
var
  h_ayat : string='';
  F : TStringList;
  css : string;
  id_ayat : string;
  nama_ayat:string;
begin

  spBack.Hide;
  edCariKata.Clear;
  try
  F := TStringList.Create;
  F.LoadFromFile(lokasi_support + 'style/ayat.css');


   with DTDaftarKataBybasic do
    begin
      close;
      sql.Clear;
      sql.Add('select * from v_show_ayat where id_ayat in ( select id_ayat from terjemah_kata where ' +
              'arab_harokat = ' + QuotedStr(kata) + ' )') ;
      open;


     css := F.Text;
     h_ayat:= css ;
     idayatnow:=FieldByName('id_ayat').AsString;   ;

     while not eof do
     begin
       id_ayat := FieldByName('id_ayat').AsString;
       nama_ayat := FieldByName('name_simple').AsString;
       h_ayat := h_ayat +
       '<a style="text-decoration:none" href="https://ayat/' + id_ayat + '/Detil">' +
              '<div class="quran-container">' + #13#10 +
              '    <div class="ayah-number">'+ nama_ayat + ' (' + id_ayat +' )</div>' + #13#10 +
              '    <div class="ayah">' + #13#10 +
              '      ' + FieldByName('text').AsUTF8String + #13#10 +
              '    </div>' + #13#10 +
              '    <div class="translation">' + #13#10 +
              '      '+ FieldByName('terjemah').AsString + #13#10 +
              '    </div>' + #13#10 +
               '</div></a>';

      next;
      end;
      lbNamaSurat.Caption:= 'Surat Ayat yang mengandung kata "' + kata + '"';
      end;
      h_ayat := AnsiReplaceText(h_ayat, kata,'<span style="background-color: #FAFC83;">'+kata+'</span>');
      EdgeBrowser.NavigateToString(h_ayat);
      //spBack.Show;

  finally
  F.Free;
  end;

end;

procedure TMainForm.LoadAyatByNomorSurat(idsa:string);
var
  h_ayat : string='';
  F : TStringList;
  css : string;
  id_ayat : string;
  nama_ayat:string;
  i,j:integer;
begin

  spBack.Hide;
  edCariKata.Clear;
  try
  F := TStringList.Create;
  F.LoadFromFile(lokasi_support + 'style/ayat.css');


   with QTDaftarAyatBySurat do
   begin
     close;
     sql.Clear;
     sql.Add('select * from v_show_ayat where surah = ' + idsa);
     open;

     j := FieldByName('ja').AsInteger;

     cbNomorAyat.clear;

     for i := 1 to j do
       cbNomorAyat.Items.Add(inttostr(i));

     cbNomorAyat.ItemIndex:=0;
     ScAyat.Min:=1;
   //  ScAyat.Max:=j;

     css := F.Text;
     h_ayat:= css ;
     idayatnow:=FieldByName('id_ayat').AsString;   ;

     while not eof do
     begin
       id_ayat := FieldByName('id_ayat').AsString;
       nama_ayat := FieldByName('name_simple').AsString;
       h_ayat := h_ayat +
       '<a style="text-decoration:none" href="https://ayat/' + id_ayat + '/Detil">' +
              '<div class="quran-container">' + #13#10 +
              '    <div class="ayah-number">'+ nama_ayat + ' (' + id_ayat +' )</div>' + #13#10 +
              '    <div class="ayah">' + #13#10 +
              '      ' + FieldByName('text').AsUTF8String + #13#10 +
              '    </div>' + #13#10 +
              '    <div class="translation">' + #13#10 +
              '      '+ FieldByName('terjemah').AsString + #13#10 +
              '    </div>' + #13#10 +
               '</div>';
      next;
      end;
      lbNamaSurat.Caption:= FieldByName('name_simple').AsString;
      end;

      EdgeBrowser.NavigateToString(h_ayat);

      OpenInformasiSurat(idsa);
      tbsSurahInfo.show;

  finally
  F.Free;
  end;

end;

procedure TMainForm.LoadAyatByID(idsa:string);
var
  h_ayat : string='';
  F : TStringList;
  css : string;
  id_ayat : string;
  nama_ayat : string;
  tafsir1: string;
begin

  spBack.show;
  try
  F := TStringList.Create;
  F.LoadFromFile(lokasi_support + 'style/ayat.css');




   with QTDaftarSuratAyatByID do
   begin
     close;
     sql.Clear;
     sql.Add('select * from v_show_ayat_detil where id_ayat = ' + QuotedStr(idsa));
     open;

     css := F.Text;
     h_ayat:= css ;
     idayatnow:=FieldByName('id_ayat').AsString;   ;


     id_ayat := FieldByName('id_ayat').AsString;
     tafsir1:= FieldByName('isi').AsString;
     nama_ayat := FieldByName('name_simple').AsString;
     h_ayat := h_ayat +
        '<div class="quran-container">' + #13#10 +
        '    <div class="ayah-number">'+ nama_ayat + ' (' + id_ayat +' )</div><br><br>' + #13#10 +
        '    <div class="ayah">' + #13#10 +
        '      ' + FieldByName('text').AsUTF8String + #13#10 +
        '    </div>' + #13#10 +
        '    <div class="translation">' + #13#10 +
        '      '+ FieldByName('terjemah').AsString + #13#10 +
        '    </div>' + #13#10 +
        '    <div class="btn-group"> '+ #13#10 +
        '<a href="https://ayat/' + id_ayat + '/tafsir-luas"><span class="btn btn-tafsir-luas">  Tafsir </span></a>' +
        '<a href="https://ayat/' + id_ayat + '/audio"><span class="btn btn-audio" data-audio="' + SetAudio(cbQori.text) +
            FieldByName('everyayat').AsString  + '" style="cursor: pointer; color: blue;">  Audio</span></a>' +
        '<a href="https://ayat/' + id_ayat + '/Kata"><span class="btn btn-corpus"> Kata </span></a>' +
        '<a href="https://ayat/' + id_ayat + '/Insight"><span class="btn btn-morfologi"> Insight</span></a>' + #13#10 +
        '</div><br></div>' +
       '<div class="tafsir-container"><b>Penjelasan ( Metode Tahlili ) </b><br><br> ' + QTDaftarSuratAyatByID.FieldByName('isi').AsString +'</div>' +
       '<div class="tafsir-container"><b>Tafsir Jalalain</b><br><br> ' + getTadzkirul(id_ayat) +'</div>' ;

      lbNamaSurat.Caption:= 'Surat ' + FieldByName('name_simple').AsString + ' (' +idayatnow +')';

      end;
      h_ayat := AnsiReplaceText(h_ayat,'```html','');
      h_ayat := AnsiReplaceText(h_ayat,'```','');

      EdgeBrowser.NavigateToString(h_ayat);

      tbsGenerateAI.show;

  finally
  F.Free;
  end;

end;


procedure TMainForm.LoadAyatByNomorTema(idsa:string;tema:string);
var
  h_ayat : string='';
  F : TStringList;
  css : string;
  id_ayat : string;
  nama_ayat : string;
begin

  spBack.Hide;
  try
  F := TStringList.Create;
  F.LoadFromFile(lokasi_support + 'style/ayat.css');
  edCariKata.Clear;

   with QTDaftarAyatBySurat do
   begin
     close;
     sql.Clear;
     sql.Add('select * from v_show_ayat where id_ayat in (' + idsa + ')');
     open;

     css := F.Text;
     h_ayat:= css ;
     idayatnow:=FieldByName('id_ayat').AsString;

           while not eof do
     begin
       id_ayat := FieldByName('id_ayat').AsString;
       nama_ayat := FieldByName('name_simple').AsString;
       h_ayat := h_ayat +
       '<a style="text-decoration:none" href="https://ayat/' + id_ayat + '/Detil">' +
              '<div class="quran-container">' + #13#10 +
              '    <div class="ayah-number">'+ nama_ayat + ' (' + id_ayat +' )</div>' + #13#10 +
              '    <div class="ayah">' + #13#10 +
              '      ' + FieldByName('text').AsString + #13#10 +
              '    </div>' + #13#10 +
              '    <div class="translation">' + #13#10 +
              '      '+ FieldByName('terjemah').AsString + #13#10 +
              '    </div>' + #13#10 +
              '</div></a>';
      next;
      end;
     lbNamaSurat.Caption:=tema;
   end;

   LoadTafsirBySuratAyatArabic(idayatnow);

   EdgeBrowser.NavigateToString(h_ayat);

  finally
  F.Free;
  end;

end;

procedure TMainForm.LoadAyatByCariKata(kata:string);
var
  h_ayat : string='';
  F : TStringList;
  css : string;
  id_ayat : string;
  nama_ayat : string;
begin

  spBack.Hide;
  try
  F := TStringList.Create;
  F.LoadFromFile(lokasi_support + 'style/ayat.css');


   with QTDaftarAyatBySurat do
   begin
     close;
     sql.Clear;
     sql.Add('select * from v_show_ayat_detil where terjemah like (' + QuotedStr('%' + kata + '%' ) + ') limit 100');
     open;

     css := F.Text;
     h_ayat:= css ;
     idayatnow:=FieldByName('id_ayat').AsString;


     while not eof do
     begin
       id_ayat := FieldByName('id_ayat').AsString;
       nama_ayat := FieldByName('name_simple').AsString;
       h_ayat := h_ayat +
       '<a style="text-decoration:none" href="https://ayat/' + id_ayat + '/Detil">' +
              '<div class="quran-container">' + #13#10 +
              '    <div class="ayah-number">'+ nama_ayat + ' (' + id_ayat +' )</div>' + #13#10 +
              '    <div class="ayah">' + #13#10 +
              '      ' + FieldByName('text').AsString + #13#10 +
              '    </div>' + #13#10 +
              '    <div class="translation">' + #13#10 +
              '      '+ AnsiReplacetext(FieldByName('terjemah').AsString,kata,'<span style="color:red">'+ kata + '</span>') + #13#10 +
              '    </div>' + #13#10 +
            '</div></a>';
      next;
      end;
     lbNamaSurat.Caption:='Daftar Ayat Mengandung Terjemah dengan kata "' + kata + '"';
   end;

   LoadTafsirBySuratAyatArabic(idayatnow);

   EdgeBrowser.NavigateToString(h_ayat);

  finally
  F.Free;
  end;

end;


procedure TMainForm.LoadDBTafsir(kitab:string);
begin


  if  FileExists(lokasi_support + 'data/Tafsirs/' + kitab  ) then
    begin
      koneksitafsir1.Connected:=false;
      koneksitafsir1.Protocol:='sqlite';
      koneksitafsir1.LibraryLocation:=lokasi_support + 'SQLite3.dll';
      koneksitafsir1.Database:= lokasi_support + 'data/Tafsirs/' + kitab ;
      koneksitafsir1.Connect;

    end
  else
  ShowMessage('Database ' + kitab + ' Tidak ditemukan ');



end;

procedure TMainForm.LoadDBTafsir2(kitab:string);
begin


end;


procedure TMainForm.LoadTafsirBySuratAyatArabic(idsa:string);
var
  arabic:string;
  F : TStringList;
  kitab : string;
  surat,nomor:string;
begin



  kitab := DTDaftarKitab.FieldByName('FileDB').AsString ;

  LoadDBTafsir(kitab);


  With DTGetData do
     begin
       close;
       sql.Clear;
       sql.Add('select * from v_show_ayat where id_ayat=' + QuotedStr(idayatnow));
       open;
       surat := FieldByName('name_simple').AsString;
       nomor := FieldByName('ayah').AsString;
     end;

  pnJudulTafsir1.Caption:='Kitab Tafsir : ' + kitab + ' Surat ' + surat + ' ayat ' + nomor ;

  try
  F := TStringList.Create;
  F.LoadFromFile(lokasi_support + 'style/tafsir.css');

  arabic := F.Text;

  with QTTafsirByAyah1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from tafsir where ayah_keys2 like ' + QuotedStr('%-' + idsa + '-%'));
    open;
    arabic := arabic + '<div style="text-align:right;font-size:20px">' +
           FieldByName('text').AsString  + '</div>';

    EDTafsir.NavigateToString(arabic);


  end;

  finally
  F.free;
  end;
end;

procedure TMainForm.LoadTafsirBySuratAyatIndonesia(idsa:string);
var
  indo:string;
  F : TStringList;
  kitab : string;
begin


  kitab := DTDaftarKitab.FieldByName('FileDB').AsString ;


  LoadDBTafsir(kitab);


  try
  F := TStringList.Create;
  F.LoadFromFile(lokasi_support + 'style/tafsirindo.css');

  indo := '';
  indo := F.text;
  with QTTafsirByAyah1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from tafsir where ayah_keys2 like ' + QuotedStr('%-' + idsa + '-%'));
    open;
    indo := indo + '<div class="smooth-box">' +
           FieldByName('translate').AsString  + '</div>';
    indo := AnsiReplaceStr(indo,'```html','');

    indo := AnsiReplaceStr(indo,'<html lang="id">','');
    indo := AnsiReplaceStr(indo,'html','');
    EDTafsir.NavigateToString(indo);


  end;




  finally
  F.free;
  end;
end;

function TMainForm.EscapeJSON(const S: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(S) do
  begin
    case S[i] of
      '/': Result := Result + '\/';
      '\': Result := Result + '\\';
      '"': Result := Result + '\"';
      #8:  Result := Result + '\b';
      #9:  Result := Result + '\t';
      #10: Result := Result + '\n';
      #13: Result := Result + '\r';
      #12: Result := Result + '\f';
    else
      Result := Result + S[i];
    end;
  end;
end;


function TMainForm.TranslateTafsirWithAPI(s:string):string;
var

    json: TJSONData;
    content: string;
    Client: TFPHTTPClient;
    RequestBody: TMemoryStream;
    Response: TStringStream;
    QueryJSON: string;
    gemini_ac : string;
    t : TStringList;
    j : integer;
    apkey : string;
    ind : integer;

begin



    if s='' then
      begin
      katanow:='';
      promptnow:='';
      ShowMessage('Tidak Ada Permintaan/Prompt');
      TrdAI.Terminate;
      exit;
      end;


    randomize;
    ind := RandomRange(0,3);
    try
    AK := TStringList.Create;

    AK.LoadFromFile(ExtractFilePath(Application.ExeName) + 'support/key.inf');

    apkey := AK.Strings[ind];


     // Persiapkan klien HTTP
    Client := TFPHTTPClient.Create(nil);
    Client.IOTimeout := 90000; // 60 detik
    Client.ConnectTimeout := 20000;

    Response := TStringStream.Create('');
    RequestBody := TMemoryStream.Create;


 //   gemini_ac:= 'https://generativelanguage.googleapis.com/v1beta/models/'+
 //               'gemini-3-flash-preview:generateContent?key='+trim(apkey) ;



    gemini_ac:= 'https://generativelanguage.googleapis.com/v1beta/models/'+
                'gemini-3.1-flash-lite:generateContent?key='+trim(apkey) ;

    s  := AnsiReplaceStr(s,':','\:');
    s  := AnsiReplaceStr(s,'''','\''');
    s  := AnsiReplaceStr(s,'"','\"');
    s  := AnsiReplaceStr(s,'{','\{');
    s  := AnsiReplaceStr(s,'}','\}');
    s  := AnsiReplaceStr(s,'[','\[');
    s  := AnsiReplaceStr(s,']','\]');
    s  := AnsiReplaceStr(s,'-','\-');
    s  := AnsiReplaceStr(s,',','\,');
    s  := AnsiReplaceStr(s,';','\;');

    try
      // Persiapkan kueri dalam format JSON
      QueryJSON :=
        '{ '+
        '"contents": [{ '+
        '"parts": [{'+
        '"text": "'+ s + '" '+
        '}]'+
        '}] '+
        '}';
      RequestBody.Write(QueryJSON[1], Length(QueryJSON));
      RequestBody.Position := 0;


      Client.AddHeader('Content-Type', 'application/json');

      Client.RequestBody := RequestBody;
      Client.Post(gemini_ac, Response);
      // Tampilkan hasil respons
      json := GetJSON(Response.DataString) ;
      content := json.FindPath('candidates[0].content.parts[0].text').AsString;
      content := Trim(content);

      Result  := content;
    except
      on E: Exception do
      begin

        ShowMessage( 'Terdapat Error Koneksi , Silahkan Ulang atau Tunggu Beberapa saat kembali');
        if TrdAI.Active then TrdAI.Terminate;
        Result := '';
      end;
    end;

      Client.Free;
      Response.Free;
      RequestBody.Free;
      if TrdAI.Active then TrdAI.Terminate;
     promptnow:='';

     finally
     AK.Free;

    end;

end;

procedure TMainForm.OpenCorpus(idsa:string);
begin

  with QTDaftarSuratAyatByID do
   begin
     close;
     sql.Clear;
     sql.Add('select * from corpus where ayah_key = ' + QuotedStr(idsa));
     open;

     if FieldByName('text').AsString='' then
       ShowMessage('Corpus untuk ayat ini belum tersedia ')
     else
     EdgeBrowser.NavigateToString(QTDaftarSuratAyatByID.FieldByName('text').AsString);

   end;



end;

function TMainForm.SetAudio(imam:string):string;
begin

  if imam = 'Abdullah Bashfar' then
    result := 'https://everyayah.com/data/Abdullah_Basfar_192kbps/'
  else if imam = 'Abu Bakar Shatiri' then
    result := 'https://everyayah.com/data/Abu_Bakr_Ash-Shaatree_128kbps/'
  else if imam = 'Ayman Suwaid' then
    result := 'https://everyayah.com/data/Ayman_Sowaid_64kbps/'
  else if imam = 'Akram Al Aqimi' then
    result := 'https://everyayah.com/data/Akram_AlAlaqimy_128kbps/'
  else if imam = 'Karim Manshuri' then
    result := 'https://everyayah.com/data/Karim_Mansoori_40kbps/';



end;

procedure TMainForm.terjemahkanHadist(hadist:UTF8String;language:string;tipe:string);
var
    h : string='';
    s : string='';
begin

    if tipe = 'sanadset' then
      begin
        s := 'Terjemahkan Teks hadist berikut ini  dari bahasa Arab ke Bahasa Indonesia : ' + sLineBreak +
             '[ '+ QShowHadistByKitab.FieldByName('Matn').AsUTF8String + '] ' +   sLineBreak +
             'Catatan : ' +
             '1. Jawaban dalam hanya format HTML ( body 100% , font "Noto Sans" , background none, Tidak ada garis , '+
                 'perataan teks adalah justify, Jangan Gunakan markdwon) . ' +
             '2. Tidak Perlu Menulis Ulang teks arabicnya . '+
             '3. beri informasi tambahan ayat quran yang terkait dengan tema hadist ini';

        DoThread := 'Terjemahkan Hadist';
        promptnow:= s;
        TrdAI.Active:=true;
        FrmWaiting.ShowModal;


    end
    else if tipe='tsaqalayn' then
    begin
        s := 'Terjemahkan Teks hadist berikut ini dari bahasa Arab ke Bahasa Indonesia : ' + sLineBreak +
             '" '+ QShowTsaqalaynByKitab.FieldByName('Matn').AsUTF8String + '"' +   sLineBreak +
             'Catatan : ' +
             '1. Jawaban dalam hanya format HTML ( body 100% , font "Noto Sans" , background none, Tidak ada garis , '+
                 'perataan teks adalah justify, Jangan Gunakan markdwon) . ' +
             '2. Tidak Perlu Menulis Ulang teks arabicnya . '+
             '3. beri informasi tambahan ayat quran yang terkait dengan tema hadist ini';

        DoThread := 'Terjemahkan Tsaqalayn';
        promptnow:= s;
        TrdAI.Active:=true;
        FrmWaiting.ShowModal;


        End;

end;

procedure TMainForm.OpenInformasiSurat(surat:string);
begin
  with QDataInformasiSurat do
   begin
     close;
     sql.Clear;;
     sql.Add('select informasi from surah_infos where surah_number=' + surat);
     open;
     HTInformasiSurat.LoadFromString(FieldByName('informasi').AsString);
   end;
end;

procedure TMainForm.BahasKata(kata:UTF8String;idayat:string);
var
    h:string;
    prompt:string;
    surahayah: string;
begin

   with DTGetData do
    begin
      close;
      sql.Clear;
      sql.Add('select "Surat "||name_simple||" ayat ke-"||ayah as suratayat from v_show_ayat where id_ayat=' + QuotedStr(idayat) );
      open;
      surahayah := FieldByName('suratayat').AsString ;
    end;
    prompt :=  ' Bertindaklah sebagai ahli filologi bahasa Arab Klasik dan pakar tafsir. ' +
                'Analisis kata ''['+ kata +']'' yang terdapat dalam ['+ surahayah +'] ' +
                'ayat [Nomor Ayat]. Tolong sajikan informasi berikut: ' +
                '1. Akar Kata (Triliteral Root): Huruf aslinya. ' +
                '2. Etimologi: Makna asli akar kata tersebut dalam budaya Arab kuno. ' +
                '3. Derivasi: Daftar kata lain dari akar yang sama yang muncul di Al-Qur''an. ' +
                '4. Nuansa Makna: Apa perbedaan kata ini dengan sinonimnya (jika ada)? ' +
                '5. Signifikansi Teologis: Mengapa kata ini yang dipilih dalam konteks ayat tersebut?';

    prompt := prompt + sLineBreak +
              'Catatan: ' + sLineBreak +
              '-Gunakan referensi dari kamus Lisan al-Arab atau Mu''jam Maqayis al-Lughah'+ sLineBreak+
              'Jawaban dalam bentuk HTML yang rapi dengan luas 95% , '+ sLineBreak +
              'tanpa shadow pada kontainer, tema warna adalah Hijau mudah , biru muda, dan orange muda.' + sLineBreak +
              'gunakan Google Sans Font untuk tulisan latin, dan Font Amiri untuk arabic,' + sLineBreak +
              'tanpa tambahan non HTML,jangan Gunakan MarkDown';

    promptnow:=prompt;

    katanow:=kata;
    DoThread:= 'Resume Kata';
    TrdAI.Active:=true;
    FrmWaiting.ShowModal;

end;





function TMainForm.IsConnectedToInternet: Boolean;
var
  Flags: DWORD;
begin
  Result := InternetGetConnectedState(@Flags, 0);
end;

function TMainForm.getTadzkirul(ida:string):string;
var
  css: string;

begin
  css :=
    '/* Container Utama */' + sLineBreak +
    'body {' + sLineBreak +
    '    font-family: ''Segoe UI'', Tahoma, Geneva, Verdana, sans-serif;' + sLineBreak +
    '    line-height: 1.8;' + sLineBreak +
    '    color: #333;' + sLineBreak +
    '    background-color: #f9f9f9;' + sLineBreak +
    '    padding: 20px;' + sLineBreak +
    '    max-width: 800px;' + sLineBreak +
    '    margin: 0 auto;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '/* Paragraph dan Div Styling */' + sLineBreak +
    'p, div {' + sLineBreak +
    '    margin-bottom: 1.5rem;' + sLineBreak +
    '    text-align: justify;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '/* Styling Khusus untuk Teks Arab */' + sLineBreak +
    'div[lang="ms"], div[lang="id"], p[lang="id"] {' + sLineBreak +
    '    background: #ffffff;' + sLineBreak +
    '    padding: 15px 20px;' + sLineBreak +
    '    border-radius: 8px;' + sLineBreak +
    '    box-shadow: 0 2px 5px rgba(0,0,0,0.05);' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '/* Indikator Makkiyah */' + sLineBreak +
    'p.jv {' + sLineBreak +
    '    text-align: center;' + sLineBreak +
    '    font-weight: bold;' + sLineBreak +
    '    font-style: italic;' + sLineBreak +
    '    color: #7f8c8d;' + sLineBreak +
    '    background: #eee;' + sLineBreak +
    '    padding: 5px;' + sLineBreak +
    '    border-radius: 4px;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '/* Pewarnaan Berdasarkan Class HTML */' + sLineBreak +
    '.green {' + sLineBreak +
    '    color: #2e7d32;' + sLineBreak +
    '    font-weight: 600;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.blue {' + sLineBreak +
    '    color: #1565c0;' + sLineBreak +
    '    font-weight: bold;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.brown {' + sLineBreak +
    '    color: #795548;' + sLineBreak +
    '    font-weight: bold;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '/* Styling Nomor Ayat (Span Green) */' + sLineBreak +
    'span.green {' + sLineBreak +
    '    display: inline-block;' + sLineBreak +
    '    margin-right: 5px;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +

    '}';

  with DTGetData do
   begin
     close;
     sql.Clear;
     sql.Add('select text from id_jalalain where ayah_keys2 like ' + QuotedStr('%-' + idayatnow + '-%'));
     open;
     first;
     Result := '<head><style>' + css + '</style></head>' + FieldByName('text').AsString ;
   end;

end;

function TMainForm.GetBedahAyat(tipe:string;ayat:string;nomor_ayat:string) :string;
var
  prompt:string;
begin

  analisisnow := '';
  if tipe = 'Analisis Linguistik' then
  begin
  prompt := 'Bertindaklah sebagai pakar Linguistik Arab dan Ahli I''rab Al-Quran. ' +
            'Tugas Anda adalah melakukan analisis morfologi dan sintaksis mendalam pada ayat berikut: '+ sLineBreak+
            'Surat  [' + nomor_ayat + '] yang berbunyi  ["' +ayat+ '"].' + #13#10 +
            '' + #13#10 +
            'Mohon berikan output dalam format tabel dan poin-poin yang mencakup:' + #13#10 +
            '1. Word-by-Word Breakdown: Pecah setiap kata (mufradat) dalam ayat tersebut.' + #13#10 +
            '2. Klasifikasi Kata: Tentukan apakah kata tersebut termasuk Isim, Fi''il, atau Harf.' + #13#10 +
            '3. Analisis Morfologi (Saraf): Identifikasi akar kata (root), wazan, dan bentuk tasrif-nya.' + #13#10 +
            '4. Kedudukan Gramatikal (I''rab): Jelaskan statusnya (Marfu'', Manshub, Majrur, atau Majzum) beserta tanda i''rab-nya (alamah al-i''rab).' + #13#10 +
            '5. Fungsi Sintaksis: Jelaskan peran kata dalam kalimat (sebagai Fa''il, Ma''ful bih, Mubtada'', Khabar, Mudhaf Ilaih, dll).' + #13#10 +
            '' + #13#10 +
            'Gunakan terminologi standar ilmu Nahwu dan Saraf yang presisi namun tetap mudah dipahami.';
  analisisnow := 'linguistik';
  end
  else if tipe='Penelusuran Tafsir' then
  begin
  prompt := 'Bertindaklah sebagai Pakar Tafsir Al-Quran yang menguasai khazanah literatur Islam klasik dan pemikiran kontemporer. Tugas Anda adalah melakukan penelusuran tafsir mendalam untuk '+
            'Surat [' + nomor_ayat + ']  yang berbunyi  ["' + ayat + '"].' +
             #13#10 +
            'Mohon susun output dalam struktur berikut:' + #13#10 +
            '1. Asbabun Nuzul: Jelaskan latar belakang atau alasan turunnya ayat ini jika terdapat riwayat yang sahih atau konteks sejarah yang relevan.' + #13#10 +
            '2. Perspektif Tafsir Klasik (Bi al-Ma''tsur): Sajikan ringkasan penafsiran dari otoritas utama seperti Tafsir Ibnu Katsir atau At-Thabari yang berfokus pada riwayat dan makna tekstual.' + #13#10 +
            '3. Perspektif Tafsir Kontemporer (Modern): Sajikan pandangan dari mufassir modern (seperti Buya Hamka dalam Al-Azhar atau Quraish Shihab dalam Al-Misbah) yang mengaitkan ayat dengan realitas sosial atau spiritual masa kini.' + #13#10 +
            '4. Analisis Corak Penafsiran: Jelaskan apakah ayat ini cenderung dibahas dari sisi hukum (Fikih), tasawuf (Isyari), atau bahasa (Lughawi) oleh para ulama.' + #13#10 +
            '5. Kontekstualisasi & Ibrah: Simpulkan 3 pelajaran utama (hikmah) dari ayat ini yang dapat diterapkan dalam kehidupan sehari-hari di zaman modern.' + #13#10 +
            '' + #13#10 +
            'Pastikan penyajiannya objektif, mendalam, dan menggunakan rujukan yang diakui oleh mayoritas ulama (Jumhur).';
   analisisnow := 'tafsir';
  end
  else if tipe='Analisis Etimologi' then
    begin
    prompt := 'Bertindaklah sebagai Ahli Etimologi (Ilmu Isytiqaq) dan Filologi Bahasa Arab Klasik yang menguasai kamus otoritatif seperti Lisan al-Arab dan Mu''jam Maqayis al-Lughah.'+
              'Tugas Anda adalah membedah akar kata dari Surat  [' + nomor_ayat + ']  yang berbunyi  ["' + ayat + '"].' +
               #13#10 +
              'Mohon sajikan analisis mendalam dengan struktur sebagai berikut:' + #13#10 +
              '1. Identifikasi Akar Kata (Al-Jidhr): Sebutkan akar kata (biasanya 3 huruf/Tsulatsi) dari setiap kosakata utama dalam ayat tersebut.' + #13#10 +
              '2. Makna Dasar Semantik: Jelaskan makna asli dan primitif dari akar kata tersebut dalam konteks budaya Arab kuno (misalnya hubungan dengan alam atau aktivitas fisik).' + #13#10 +
              '3. Derivasi Kata (Isytiqaq): Sebutkan beberapa kata turunan lain dari akar yang sama yang muncul dalam Al-Quran untuk menunjukkan konsistensi dan perluasan makna.' + #13#10 +
              '4. Analisis Pilihan Kata (Leksikal): Jelaskan mengapa Al-Quran menggunakan akar kata spesifik ini dibandingkan dengan sinonimnya (misal: mengapa menggunakan ''Khalaqa'' bukan ''Ja''ala'').' + #13#10 +
              '5. Hubungan Akar Kata dengan Pesan Ayat: Jelaskan bagaimana pemahaman akar kata ini memperdalam pemahaman teologis terhadap keseluruhan ayat.' + #13#10 +
              '' + #13#10 +
              'Gunakan pendekatan linguistik yang ilmiah, presisi, dan berbasis pada literatur leksikografi klasik.'   ;
     analisisnow := 'etimologi';
    end
  else if tipe='Korelasi Intertekstual' then
    begin
    prompt := 'Bertindaklah sebagai Ahli Ilmu Munasabah (Ilmu Korelasi Al-Quran) yang mendalam. Tugas Anda adalah menganalisis hubungan intertekstual dari Surat  '+
               '[' + nomor_ayat + ']  yang berbunyi  ["' + ayat + '"].'+
                #13#10 +
              'Mohon berikan analisis terstruktur yang mencakup:' + #13#10 +
              '1. Munasabah Baina al-Ayat (Konteks Internal): Jelaskan hubungan logis dan tematis antara ayat ini dengan ayat-ayat sebelum (Sabaq) dan sesudahnya (Siyaq) dalam satu rangkaian.' + #13#10 +
              '2. Korelasi dengan Tema Surah: Bagaimana ayat ini mendukung pesan utama atau tujuan besar (Maqashid) dari surah tempat ayat ini berada?' + #13#10 +
              '3. Referensi Silang (Thematic Cross-Reference): Identifikasi 1-2 ayat lain dari surah berbeda yang membahas topik serupa. Jelaskan apakah hubungannya bersifat memperjelas (Tafshil), memperkuat (Ta''kid), atau memberikan pengecualian (Takhshish).' + #13#10 +
              '4. Logika Penempatan (Structural Logic): Jelaskan hikmah atau alasan di balik penempatan ayat ini dalam urutan spesifiknya di dalam Mushaf.' + #13#10 +
              '5. Kesimpulan Makro: Apa pesan besar yang muncul ketika ayat ini dibaca sebagai bagian dari satu kesatuan utuh Al-Quran (Al-Wahdah al-Maudhu''iyyah)?' + #13#10 +
              '' + #13#10 +
              'Gunakan pendekatan analisis struktur teks yang sistematis dan berbasis pada metodologi ulama klasik seperti Al-Biqa''i atau As-Suyuthi.';
    analisisnow := 'intertekstual';
    end
  else if tipe='Identifikasi Hukum Tajwid' then
    begin
    prompt := 'Bertindaklah sebagai Ahli Tajwid dan Pakar Fonetik Al-Quran (Ilmu Qira''at). Tugas Anda adalah melakukan analisis teknis pelafalan pada Surat '+
              '[' + nomor_ayat + ']  yang berbunyi  ["' + ayat + '"].' +
              'Mohon berikan panduan teknis yang mencakup:' + #13#10 +
              '1. Identifikasi Hukum Tajwid: Bedah setiap hukum tajwid yang ada (seperti hukum Nun/Mim Sakinah, hukum Mad, Alif Lam Ta''rif, dll.) secara mendetail per potongan kata.' + #13#10 +
              '2. Analisis Makharijul Huruf: Jelaskan titik artikulasi (tempat keluarnya suara) untuk huruf-huruf yang dominan atau memerlukan perhatian khusus dalam ayat ini.' + #13#10 +
              '3. Sifatul Huruf: Jelaskan karakteristik suara yang harus muncul (seperti Qalqalah, Hams, Jahar, atau Isti''la) agar pelafalan sesuai dengan kaidah fasahah.' + #13#10 +
              '4. Panduan Durasi dan Tekanan (Phonetics): Berikan instruksi mengenai panjang pendek (harakat) dan penekanan suara (nabr) yang tepat pada setiap bagian ayat.' + #13#10 +
              '5. Peringatan Kesalahan Umum (Lahn): Sebutkan potensi kesalahan pelafalan (baik Lahn Jali maupun Lahn Khafi) yang sering terjadi pada ayat ini agar dapat dihindari.' + #13#10 +
              '' + #13#10 +
              'Berikan jawaban yang sangat teknis namun praktis untuk dipraktikkan langsung oleh seorang pembaca Al-Quran.';
     analisisnow := 'tajwid';

    end
  else if tipe='Sintesis Makna'  then
    begin
     prompt := 'Bertindaklah sebagai Filosof Muslim, Pakar Teologi (Mutakallim), dan Pemikir Metafisika. '+
               'Tugas Anda adalah melakukan analisis sintesis mendalam terhadap Surat [' + nomor_ayat + ']  yang berbunyi  ["' + ayat + '"].' +
                #13#10 +
                'Mohon sajikan diskursus intelektual yang mencakup:' + #13#10 +
                '1. Dimensi Teologis (Aqidah): Jelaskan bagaimana ayat ini menggambarkan sifat-sifat Tuhan (Asma wa Sifat) atau pola hubungan antara Al-Khaliq (Pencipta) dengan Al-Makhluk (Ciptaan).' + #13#10 +
                '2. Aspek Metafisika dan Ontologi: Apa yang ayat ini sampaikan mengenai hakikat realitas, keberadaan dunia, dan posisi manusia dalam hierarki wujud?' + #13#10 +
                '3. Dimensi Aksiologi (Etika Filosofis): Bedah nilai-nilai moral universal yang terkandung dalam ayat ini dan bagaimana ia membentuk standar etika bagi kesadaran manusia.' + #13#10 +
                '4. Perspektif Eksistensial: Bagaimana ayat ini menjawab pertanyaan-pertanyaan besar manusia mengenai tujuan hidup, penderitaan, kebahagiaan, atau kebebasan berkehendak (Free Will).' + #13#10 +
                '5. Sintesis Kebijaksanaan (Universal Wisdom): Hubungkan pesan ayat ini dengan konsep-konsep filsafat besar (seperti Stoikisme, Etika Aristotelian, atau Eksistensialisme modern) untuk menunjukkan relevansi abadi wahyu tersebut.' + #13#10 +
                '' + #13#10 +
                'Gunakan bahasa yang reflektif, kontemplatif, dan berbobot intelektual tinggi.' ;
          analisisnow := 'sintesis';
    end
  else if tipe='Isyari dan Sufistik'  then
    begin
     prompt := 'Bertindaklah sebagai Ahli Tafsir Isyari dan Teosofi Islam (Tasawuf) yang menguasai pemikiran tokoh-tokoh seperti Ibnu Arabi, Al-Ghazali, atau Imam Al-Qushayri. Tugas Anda adalah menggali makna batin dari ayat: '+
               'Surat [' + nomor_ayat + ']  yang berbunyi  ["' + ayat + '"].' +
               #13#10 +
              'Mohon sajikan analisis spiritual yang mencakup:' + #13#10 +
              '1. Isyarat Lathifah: Jelaskan isyarat lembut atau makna tersembunyi yang muncul dari pemilihan kata dalam ayat ini bagi pejalan spiritual (Salik).' + #13#10 +
              '2. Dimensi Nafs (Jiwa): Bagaimana ayat ini berbicara tentang proses penyucian jiwa (Tazkiyatun Nafs) atau tingkatan-tingkatan kesadaran manusia?' + #13#10 +
              '3. Simbolisme Sufistik: Identifikasi simbol-simbol dalam ayat ini (misalnya cahaya, kegelapan, jalan, atau pertemuan) dan jelaskan maknanya dalam tradisi irfan/tasawuf.' + #13#10 +
              '4. Maqamat dan Ahwal: Hubungkan pesan ayat ini dengan maqam (kedudukan) tertentu seperti Syukur, Sabar, Ridha, Fana, atau Mahabbah (Cinta Ilahi).' + #13#10 +
              '5. Pesan untuk Transformasi Batin: Berikan renungan akhir tentang bagaimana ayat ini dapat menjadi sarana pendekatan diri (Taqarrub) kepada Allah secara personal dan mendalam.' + #13#10 +
              '' + #13#10 +
              'Gunakan bahasa yang puitis, kontemplatif, penuh adab, dan tetap berpegang pada koridor syariat.';
     analisisnow := 'isyari';
    end;
  prompt := prompt + sLineBreak +
            'Catatan : ' + sLineBreak +
            '1. Jawab Tidak tahu jika Anda tidak mengetahui ( untuk menghindari bias ),' + sLineBreak +
            '2. Output Jawaban yang diharapkan :' + sLineBreak +
            '- Saya ingin palet warna pastel lavender dan biru muda. '+
               'Sertakan bagian header dengan warna solid pastel, konten utama dengan latar belakang putih tulang,'+
               'dan gunakan warna teks abu-abu tua agar tetap mudah dibaca.  '+
            '- Hanya HTML saja dan Jangan gunakan Markdown';


  Result:=prompt;

end;
initialization
  GlobalWebView2Loader                := TWVLoader.Create(nil);
  GlobalWebView2Loader.UserDataFolder := UTF8Decode(ExtractFileDir(Application.ExeName) + '\CustomCache');
  GlobalWebView2Loader.StartWebView2;

end.
