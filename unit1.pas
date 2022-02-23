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
  lpos : Integer = 0;

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  s: string;
begin
  s:='123456789$';
  for i:=0 to 3 do
    s:=s+s;
  log.LineLimit:=500;
  for i:=1 to 300 do begin
      log.AddLog(inttostr(i)+s+';');
      Application.ProcessMessages;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  log.Clear;
  lpos:=0;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  log.AddLog(IntToStr(lpos)+' ok ');
  Inc(lpos);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  log:=TLogListFPC.Create(Self);
  log.SetBounds(Panel1.Left,Panel1.Top,Panel1.Width,Panel1.Height);
  log.Anchors:=[akLeft,akTop,akRight,akBottom];
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
end;

end.

