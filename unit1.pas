unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

uses loglistfpc;

var
  log : TLogListFPC;

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
var
  i :Integer;
begin
  log.LineLimit:=500;
  for i:=1 to 300 do begin
      log.AddLog(inttostr(i)+StringOfChar('0',100)+StringOfChar('1',5)+';');
      Application.ProcessMessages;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  log.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i:integer;
begin
  for i:=1 to 9 do
  log.AddLog(IntToStr(i)+' ok ');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  log:=TLogListFPC.Create(self);
  log.SetBounds(Panel1.Left,Panel1.Top,Panel1.Width,Panel1.Height);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
end;

end.

