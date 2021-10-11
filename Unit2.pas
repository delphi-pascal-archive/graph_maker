unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Edit4: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit3, Unit1;

{$R *.dfm}

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
if checkbox1.Checked=true then begin
edit2.Enabled:=false;
edit3.Enabled:=false;
end else begin
edit2.Enabled:=true;
edit3.Enabled:=true;
end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
form2.Close;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
if High(Map)+1<2 then showmessage('Нарисуй граф!') else form3.show;
end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin
if checkbox2.Checked=true then ShowNames:=true else ShowNames:=false;
Form1.DrawGraph;
end;

procedure TForm2.CheckBox3Click(Sender: TObject);
begin
 if checkbox3.Checked=true then ShowWidth:=true else ShowWidth:=false;
Form1.DrawGraph;
end;

end.
