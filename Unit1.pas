unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, Buttons, XPMan,shellapi;

type
  TForm1 = class(TForm)
    Area: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    XPManifest1: TXPManifest;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Label1: TLabel;
    N6: TMenuItem;
    N8: TMenuItem;
    Bevel1: TBevel;
    SpeedButton2: TSpeedButton;
    ComboBox1: TComboBox;
    SpeedButton3: TSpeedButton;
    ComboBox2: TComboBox;
    SpeedButton4: TSpeedButton;
    ComboBox3: TComboBox;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    procedure CreatePoint(x,y:integer);
    procedure ClickPoint(Sender: TObject);
    procedure ShowPointNum(Number:integer);
    procedure ShowRebro(Point1,Point2:integer);
    procedure MoveImage(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure AreaClick(Sender: TObject);
    procedure Draw(Point1,Point2:integer);
    procedure NewGraph;
    procedure DrawGraph;
    procedure SaveGraph;
    procedure SavePos;
    procedure SaveBitmap(FileName:string);
    procedure LoadGraph;
    procedure ShowNamesPoints(Show:boolean);
    procedure ShowWidthEdjes(Show:boolean);
    function GetPos(num:integer):Tpoint;
    function Enter(symbol:string):boolean;
    function Max(box:TCombobox):integer;
    function Min(box:TCombobox):integer;
    function DoubleNum(Num:integer; Box: TCombobox):boolean;

    procedure DblClickPoint(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure N8Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox3DropDown(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ShowNames, ShowWidth:boolean;
  Map: array of array of integer;
  n,c,last:integer;
implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.ShowPointNum(Number:integer);
var
image:Timage;
i:integer;
begin
Image:=Timage(FindComponent('Point'+inttostr(Number)));
Area.Canvas.Pen.Color:=clBlue;
Area.Canvas.Pen.Width:=3;
area.Canvas.Ellipse(image.Left-5,image.Top-33,image.Left+15,image.Top-13);
Area.Canvas.Pen.Color:=clblack;
Area.Canvas.Pen.Width:=1;
end;

procedure TForm1.CreatePoint(x,y:integer);
begin
n:=n+1;
with TImage.Create(self) do begin
TransParent:=true; AutoSize:=true; showhint:=true;
picture.LoadFromFile('Вершина.bmp');
left:=x; top:=y;
name:='Point'+inttostr(n);
parent:=form1;
OnDblClick:=DblClickPoint;
OnMouseMove:=MoveImage;
Onclick:=clickPoint;
end;
SetLength(Map,n,n);
ShowNamesPoints(ShowNames);
ShowWidthEdjes(ShowWidth);
end;

procedure TForm1.ClickPoint(Sender: TObject);
var
i:integer;
begin
if c=0 then last:=strtoint(copy((Sender as Timage).Name,6,20));
c:=1;
end;

procedure TForm1.MoveImage(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
(sender as Timage).Hint:=(sender as Timage).Name;
if Shift=[ssLeft] then begin
(sender as Timage).Left:=(sender as Timage).Left+x-5;
(sender as Timage).top:=(sender as Timage).top+y-5;
  if (sender as Timage).Left>500 then (sender as Timage).Left:=485;
  if (sender as Timage).Left<0 then (sender as Timage).Left:=0;
  if (sender as Timage).top>328 then (sender as Timage).top:=313;
  if (sender as Timage).top<28 then (sender as Timage).top:=28;
DrawGraph;
end;
end;

procedure TForm1.AreaClick(Sender: TObject);
var
i:integer;
begin
c:=0;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
i,q:integer;
x,y:integer;
begin
q:=0;
Randomize;
while q<>strtoint(form2.Edit1.text) do begin
q:=q+1;
 if form2.CheckBox1.Checked=true then begin
 x:=random(Area.Width-28);
 y:=random(Area.Height-28)+28;
 end else begin
 x:=strtoint(form2.Edit2.text);
 y:=strtoint(form2.Edit3.text)+28;
 end;
 CreatePoint(x,y);
end;
label1.Caption:=inttostr(n);
combobox1.Text:=inttostr(n);
end;
//-------------------------------------------
procedure TForm1.DrawGraph;
var
x,y:integer;
begin
Area.Canvas.FillRect(area.Canvas.ClipRect);
for y:=0 to High(Map) do begin
 for x:=0 to High(Map) do begin
  if Map[x,y]<>0 then begin
  Draw(x+1,y+1);
  end;
 end;
end;
ShowNamesPoints(ShowNames);
ShowWidthEdjes(ShowWidth);
end;
//------------------------------------------
procedure TForm1.Draw(Point1,Point2:integer);
var
Image1,Image2:TImage;
begin
Image1:=Timage(FindComponent('Point'+inttostr(Point1)));
Image2:=Timage(FindComponent('Point'+inttostr(Point2)));
Area.Canvas.MoveTo(image1.Left+5,image1.Top+5-28);
Area.Canvas.LineTo(image2.Left+5,image2.Top+5-28);
end;

procedure TForm1.SaveGraph;
var
x,y:integer;
begin
if MessageBox(Handle, PChar('Сохранить этот граф? '), PChar('Сохранение'), MB_YESNO)=IDYES then begin
AssignFile(output,'Graph.txt');
Rewrite(output);
writeln(High(Map)+1);
for y:=0 to High(Map) do begin
 for x:=0 to High(Map) do begin
 write(Map[x,y],' ');
 end;
writeln;
end;
closefile(output);
SavePos;
SaveBitmap('Graph.bmp');
ShowMessage('Граф сохранен');
end;
end;

procedure TForm1.SavePos;
var
i:integer;
image:Timage;
begin
AssignFile(output,'Pos.txt');
Rewrite(output);
for i:=0 to ComponentCount-1 do begin
 if (Components[i] is TImage) and (Timage(Components[i]).Name<>'Area')  then begin
  image:=Timage(Components[i]);
  writeln(image.left,' ',image.top);
 end;
end;
closefile(output);
end;

function TForm1.GetPos(num:integer):Tpoint;
var
i,x,y:integer;
begin
AssignFile(input,'Pos.txt');
Reset(input);
i:=0;
while i<num do begin
i:=i+1;
Readln(x,y);
end;
Result.x:=x;
Result.y:=y;
CloseFile(input);


end;

procedure TForm1.LoadGraph;
var
x,y,s,i,a:integer;
p:Tpoint;
begin
Randomize;
n:=0; c:=0;
AssignFile(input,'Graph.txt');
Reset(input);
Read(s);
CloseFile(input);
for i:=1 to s do begin
p:=GetPos(i);
CreatePoint(p.X,p.y);
end;
AssignFile(input,'Graph.txt');
Reset(input);
Read(s);
for y:=0 to s-1 do begin
 for x:=0 to s-1 do begin
 read(Map[x,y]);
 end;
end;
n:=s;
label1.Caption:=inttostr(n);
closefile(input);
DrawGraph;
showmessage('Граф загружен');
end;

procedure TForm1.DblClickPoint(Sender: TObject);
var
new:integer;
begin
if c=1 then begin
new:=strtoint(copy((Sender as Timage).Name,6,20));
if new<>Last then begin
if (Map[last-1,new-1]=0) and (Map[new-1,last-1]=0) then begin
Map[last-1,new-1]:=strtoint(form2.Edit4.Text);
Map[new-1,last-1]:=strtoint(form2.Edit4.Text);
Draw(last,new);
end else begin
Map[last-1,new-1]:=0;
Map[new-1,last-1]:=0;
DrawGraph;
end;
end;
end;
c:=0;
end;

procedure TForm1.NewGraph;
var
i:integer;
label Return;
begin
SetLength(Map,0,0);
Area.Canvas.FillRect(Area.Canvas.ClipRect);
label1.Caption:='0';
Combobox1.Text:='0';
Combobox2.Text:='';
c:=0; n:=0;
Return:
for i:=0 to ComponentCount-1 do begin
 if (Components[i] is TImage) and (Timage(Components[i]).Name<>'Area')  then begin
 Timage(Components[i]).Destroy;
 Goto Return;
 end;
end;
end;

procedure TForm1.SaveBitmap(FileName:string);
var
i:integer;
begin
for i:=0 to ComponentCount-1 do begin
 if (Components[i] is TImage) and (Timage(Components[i]).Name<>'Area')  then begin
 Area.Canvas.Draw(Timage(Components[i]).Left,Timage(Components[i]).Top-28,Timage(Components[i]).Picture.Graphic);
 end;
end;
Area.Picture.SaveToFile(FileName);
end;

procedure TForm1.N3Click(Sender: TObject);
begin
SaveGraph;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
NewGraph;
LoadGraph;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
form2.Show;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
NewGraph;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f1 then NewGraph;
if key=vk_f2 then begin
SaveGraph;
end;
if key=vk_f3 then begin
NewGraph;
LoadGraph;
end;
if key=vk_f4 then form2.Show;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
ShowMessage('Автор программы Бышин Артем [Art]'+#13#10+
            'Версия программы 1.4');
end;

procedure TForm1.N6Click(Sender: TObject);
begin
ShellExecute(0,nil,'Help.txt',nil,nil,SW_SHOWNORMAL);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.ComboBox1DropDown(Sender: TObject);
var
i:integer;
begin
Combobox1.Clear;
Combobox1.Text:=inttostr(high(Map)+1);
for i:=1 to n do begin
Combobox1.Items.Add(inttostr(i));
end;
end;

function TForm1.Max(box:TCombobox):integer;
var
i,best:integer;
begin
best:=strtoint(Box.Items[0]);
for i:=0 to Box.Items.Count-1 do begin
if best<strtoint(Box.Items[i]) then best:=strtoint(Box.Items[i]);
end;
result:=best;
end;

function TForm1.Min(box:TCombobox):integer;
var
i,best:integer;
begin
best:=strtoint(Box.Items[0]);
for i:=0 to Box.Items.Count-1 do begin
if best>strtoint(Box.Items[i]) then best:=strtoint(Box.Items[i]);
end;
result:=best;
end;

procedure TForm1.ShowRebro(Point1,Point2:integer);
var
img1,img2:Timage;
begin
img1:=Timage(FindComponent('Point'+inttostr(point1)));
img2:=Timage(FindComponent('Point'+inttostr(point2)));
Area.Canvas.Pen.Color:=clBlue;
Area.Canvas.Pen.Width:=2;
Area.Canvas.MoveTo(img1.Left+5,img1.Top-23);
Area.Canvas.LineTo(img2.Left+5,img2.Top-23);
Area.Canvas.Pen.Width:=1;
Area.Canvas.Pen.Color:=clBlack;
end;

function TForm1.DoubleNum(Num:integer; Box: TCombobox):boolean;
var
i:integer;
begin
for i:=0 to Box.items.Count-1 do begin
 if Num=strtoint(Box.items[i]) then begin
 Result:=true;
 exit;
 end;
end;
Result:=false;
end;

procedure TForm1.ComboBox2DropDown(Sender: TObject);
var
x,y,k,j:integer;
begin
k:=0;
Combobox2.Clear;
for y:=0 to High(Map) do begin
 for x:=0 to High(Map) do begin
  if Map[x,y]<>0 then k:=k+1;
 end;
 if DoubleNum(k, Combobox2)=false then Combobox2.Items.Add(inttostr(k));
 k:=0;
end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
Area.Canvas.FillRect(area.Canvas.ClipRect);
DrawGraph;
if (Enter(Combobox1.Text)=true) and (strtoint(Combobox1.Text)<=High(Map)+1) and (strtoint(Combobox1.Text)>0) then begin
ShowPointNum(strtoint(combobox1.text));
end;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var
x,y,k:integer;
image:TImage;
begin
k:=0;
Area.Canvas.FillRect(area.Canvas.ClipRect);
DrawGraph;
if (Enter(Combobox2.Text)=true) and (strtoint(Combobox2.Text)<=High(Map)+1) and (strtoint(Combobox2.Text)>0) then begin
for y:=0 to High(Map) do begin
 for x:=0 to High(Map) do begin
  if (x<>y) and (Map[x,y]<>0) then k:=k+1;
 end;
 if k=strtoint(Combobox2.Text) then begin
 ShowPointNum(y+1);
 end;
 k:=0;
end;
end;
end;

function TForm1.Enter(symbol:string):boolean;
var
a:integer;
begin
if TryStrToInt(symbol,a)=false then result:=false else result:=true;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
var
x,y:integer;
begin
Area.Canvas.FillRect(area.Canvas.ClipRect);
DrawGraph;
if (Enter(Combobox3.Text)=true) and (Combobox3.Items.count<=High(Map)+1) then begin
 for y:=0 to High(Map) do begin
  for x:=0 to High(Map) do begin
   if Map[x,y]<>0 then if Map[x,y]=strtoint(Combobox3.Text) then showrebro(x+1,y+1);
  end;
 end;
end;
end;

procedure TForm1.ComboBox3DropDown(Sender: TObject);
var
x,y,j:integer;
begin
Combobox3.Clear;
for y:=0 to High(Map) do begin
 for x:=0 to High(Map) do begin
 if Map[x,y]<>0 then if DoubleNum(Map[x,y], Combobox3)=false then Combobox3.Items.Add(inttostr(Map[x,y]));
 end;
end;
end;

procedure TForm1.ShowNamesPoints(Show:boolean);
var
image:Timage;
i:integer;
begin
if Show=true then
for i:=0 to ComponentCount-1 do begin
 if (Components[i] is TImage) and (Timage(Components[i]).Name<>'Area')  then begin
 image:=Timage(Components[i]);
 Area.canvas.TextOut(image.Left-10,image.Top-40,Copy(image.Name,6,length(image.Name)-5));
 end;
end;
end;

procedure TForm1.ShowWidthEdjes(Show:boolean);
var
x,y:integer;
v1,v2:Timage;
begin
if Show=true then begin
Area.Canvas.Font.Color:=clblue;
for y:=0 to High(Map) do begin
 for x:=0 to High(Map) do begin
  if Map[x,y]>0 then begin
   v1:=Timage(FindComponent('Point'+inttostr(x+1)));
   v2:=Timage(FindComponent('Point'+inttostr(y+1)));
   Area.Canvas.TextOut((v1.Left+v2.left) div 2, ((v1.top+v2.top) div 2)-20, inttostr(Map[x,y]));
  end;
 end;
end;
Area.Canvas.Font.Color:=clblack;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
form1.DoubleBuffered:=true;
ShowNames:=true;
ShowWidth:=false;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
form2.Show;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
NewGraph;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
SaveGraph;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
NewGraph;
LoadGraph;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
SaveBitmap('Snap.bmp');
application.ProcessMessages;
ShowMessage('Рисунок сохранен');
end;

end.
