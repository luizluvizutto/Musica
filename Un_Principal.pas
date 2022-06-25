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
var ObjNotas: TNotas;
    Notas: array[0..7] of TNota;
    i: Integer;
begin

   ObjNotas := TNotas.Create;
   try
      Notas[0] := Nota;
      Notas[1] := ObjNotas.Subir( Notas[0], [tom] );
      Notas[2] := ObjNotas.Subir( Notas[1], [tom] );
      Notas[3] := ObjNotas.Subir( Notas[2], [meioTom] );
      Notas[4] := ObjNotas.Subir( Notas[3], [tom] );
      Notas[5] := ObjNotas.Subir( Notas[4], [tom] );
      Notas[6] := ObjNotas.Subir( Notas[5], [tom] );
      Notas[7] := ObjNotas.Subir( Notas[6], [meioTom] );

      ObjNotas.NotaSimilar( Notas );

      for i := 0 to 7 do begin
         StringGrid1.Cells[i, linha] := ObjNotas.NotaToStr(Notas[i]);
      end;

   finally
      ObjNotas.Free;
   end;

end;

end.
