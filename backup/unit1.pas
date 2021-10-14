unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);

    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  DeskTopCanvas: TCanvas;
  jpg:TJpegImage;
  r, g, b, rgb, Gscale : byte;
  w, h,x,y:integer;
implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.MenuItem2Click(Sender: TObject);
begin
      if OpenDialog1.Execute then
   Image1.Picture.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
        if SaveDialog1.Execute then begin

            jpg:= TJPEGImage.Create;
            try
            jpg.Assign(Image2.Picture.Graphic);
            jpg.SaveToFile(SaveDialog1.FileName);
            finally
            jpg.Free;
  end;


        end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin


   w:=Image1.Picture.Width-1;
   h:=Image1.Picture.Height-1;
  for x:=1 to 434  do begin
      for y:=1 to 348 do begin

      rgb:=ColorToRgb(Image1.Canvas.Pixels[x,y]);
      RedGreenBlue(rgb, R, G, B);

      gscale:=2*round(0.2126*r+0.7152*g+0.0722*b);

      Image2.Canvas.Pixels[x,y]:=RgbToColor(gscale,gscale,gscale);

      end;
  end;
end;
end.

