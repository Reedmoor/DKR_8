unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TSecond }

  TSecond = class(TForm)
    btnStart: TButton;
    btnStop: TButton;
    btnReset: TButton;
    Image: TImage;
    lblTimer: TLabel;
    memoLaps: TMemo;
    TimerTime: TTimer;

    procedure btnResetClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure TimerTimeTimer(Sender: TObject);
  private
    { private declarations }
    FStartTime: TDateTime;
    FLapStartTime: TDateTime;
    FTotalElapsed: TDateTime;
    elapsedTime: string;
  public
    { public declarations }
  end;

var
  Second: TSecond;

implementation

{$R *.lfm}

{ TSecond }

procedure TSecond.btnStartClick(Sender: TObject);
begin
  FStartTime := Now;
  FLapStartTime := FStartTime;
  FTotalElapsed := 0;
  TimerTime.Enabled := True;
  btnStart.Enabled := False;
  btnStop.Enabled := True;
  btnReset.Enabled := True;
end;

procedure TSecond.btnStopClick(Sender: TObject);
begin
  TimerTime.Enabled := False;
  btnStart.Enabled := True;
  btnStop.Enabled := False;
  memoLaps.Lines.Add(lblTimer.Caption);

end;

procedure TSecond.btnResetClick(Sender: TObject);
begin
  TimerTime.Enabled := False;
  FStartTime := 0;
  FLapStartTime := 0;
  FTotalElapsed := 0;
  lblTimer.Caption := '00:00:00.000';
  memoLaps.Clear;
  btnStart.Enabled := True;
  btnStop.Enabled := False;
  btnReset.Enabled := False;
end;

procedure TSecond.TimerTimeTimer(Sender: TObject);
var
  elapsed: TDateTime;
  lapElapsed: TDateTime;
  begin
    if TimerTime.Enabled then
    begin
      elapsed := Now - FStartTime;
      lapElapsed := Now - FLapStartTime;
      FTotalElapsed := FTotalElapsed + lapElapsed;
      lblTimer.Caption := FormatDateTime('hh:nn:ss.zzz', FTotalElapsed);
      FLapStartTime := Now;
    end;
  end;


end.
