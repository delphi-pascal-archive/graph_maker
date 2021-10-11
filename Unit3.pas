unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons;

type
  TForm3 = class(TForm)
    StringGrid1: TStringGrid;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.FormShow(Sender: TObject);
var
x,y:integer;
begin
StringGrid1.ColCount:=High(Map)+2;
StringGrid1.RowCount:=High(Map)+2;
for y:=0 to High(Map) do begin
 for x:=0 to High(Map) do begin
 StringGrid1.cells[x+1,0]:=inttostr(x+1);
 StringGrid1.cells[0,y+1]:=inttostr(y+1);
 StringGrid1.Cells[x+1,y+1]:=inttostr(Map[x,y]);
 end;
end;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
var
i,x,y:integer;
begin
for y:=0 to High(Map) do begin
 for x:=0 to High(Map) do begin
 if StringGrid1.Cells[x+1,y+1]='' then StringGrid1.Cells[x+1,y+1]:='0';
  Map[x,y]:=strtoint(StringGrid1.Cells[x+1,y+1]);
  if strtoint(StringGrid1.Cells[x+1,y+1])<>0 then form1.Draw(x+1,y+1);
  if x=y then  Map[x,y]:=0;
 end;
end;
form3.Close;
form1.DrawGraph;
end;

procedure TForm3.StringGrid1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
StringGrid1.Cells[ARow,ACol]:=StringGrid1.Cells[ACol,ARow];
end;

end.
