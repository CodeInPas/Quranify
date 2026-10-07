program quranify;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, indylaz, rxnew, uecontrols, FrameViewer09, zcomponent,
  uq_main, uq_surat, uq_tema, uq_splash, udr_waiting, ui_quiz, uq_prompt,
uq_kata, uabout;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  {$PUSH}{$WARN 5044 OFF}
  Application.MainFormOnTaskbar:=True;
  {$POP}
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFrmKata, FrmKata);
  Application.Run;
end.

