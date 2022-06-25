unit Un_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls


  ,Un_Notas, Vcl.Grids;


type
  TForm1 = class(TForm)
    Button1: TButton;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure MontaScala( Nota: TNota; linha: Integer );
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var nota: TNota;
begin
   MontaScala(Dó,  0);
   MontaScala(Ré,  1);
   MontaScala(Mi,  2);
   MontaScala(Fá,  3);
   MontaScala(Sol, 4);
   MontaScala(Lá,  5);
   MontaScala(Si,  6);
end;

procedure TForm1.MontaScala( Nota: TNota; linha: Integer );
begin
   StringGrid1.Cells[0, linha] := NotaToStr(nota);

   nota := Subir(nota, [tom]);
   StringGrid1.Cells[1, linha] := NotaToStr(nota);

   nota := Subir(nota, [tom]);
   StringGrid1.Cells[2, linha] := NotaToStr(nota);

   nota := Subir(nota, [meiotom]);
   StringGrid1.Cells[3, linha] := NotaToStr(nota);

   nota := Subir(nota, [tom]);
   StringGrid1.Cells[4, linha] := NotaToStr(nota);

   nota := Subir(nota, [tom]);
   StringGrid1.Cells[5, linha] := NotaToStr(nota);

   nota := Subir(nota, [tom]);
   StringGrid1.Cells[6, linha] := NotaToStr(nota);

   nota := Subir(nota, [meiotom]);
   StringGrid1.Cells[7, linha] := NotaToStr(nota);
end;

end.
