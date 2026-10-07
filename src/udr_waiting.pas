unit udr_waiting;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons,  TplGaugeUnit;

type

  { TfrmWait }

  TfrmWait = class(TForm)
    AG: TplGauge;
    Image1: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    spClose: TSpeedButton;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure spCloseClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  frmWait: TfrmWait;
    i : integer =0;

implementation

{$R *.lfm}

{ TfrmWait }
uses
  uq_main;

procedure TfrmWait.FormShow(Sender: TObject);
begin
    Timer1.Enabled:=true;
end;

procedure TfrmWait.spCloseClick(Sender: TObject);
begin
  MainForm.TrdAI.Terminate;
end;

procedure TfrmWait.Timer1Timer(Sender: TObject);
begin
   inc(i);
  if i=100 then i:=0;
  AG.Progress:=i;
end;

procedure TfrmWait.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Timer1.Enabled:=false;
  AG.Progress:=0;
  i:=0;
end;

end.

