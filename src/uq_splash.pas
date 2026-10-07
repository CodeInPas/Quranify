unit uq_splash;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls;

type

  { TFormSplash }

  TFormSplash = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  FormSplash: TFormSplash;
  i : integer = 0;

implementation

{$R *.lfm}

uses uq_main;

{ TFormSplash }

procedure TFormSplash.FormShow(Sender: TObject);
begin
  Timer1.Enabled:=true;
end;

procedure TFormSplash.Timer1Timer(Sender: TObject);
begin
  inc(i);
  ProgressBar1.Position:= i;
  caption := 'Assalamualaikum';
  if i = 10 then
   MainForm.LoadAyatByNomorSurat('1')
  else if i = 100 then
    begin
      Timer1.Enabled:=false ;
      i := 0 ;
      self.close;
      self.hide;

    end;

end;

end.

