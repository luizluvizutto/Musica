unit Un_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls


  ,Un_Notas, Vcl.Grids, Vcl.Menus;


type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    MainMenu1: TMainMenu;
    Escalas1: TMenuItem;
    Maior1: TMenuItem;
    Menor1: TMenuItem;
    procedure MontaScala( Nota: TNota; escala: TEscala; linha: Integer );
    procedure Maior1Click(Sender: TObject);
    procedure Menor1Click(Sender: TObject);
  private
    { Private declarations }
    procedure EscalaMaior(var aNotas: array of TNota; Notas: TNotas );
    procedure EscalaMenor(var aNotas: array of TNota; Notas: TNotas );
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.EscalaMaior(var aNotas: array of TNota; Notas: TNotas);
begin
   aNotas[1] := Notas.Subir( aNotas[0], [tom] );
   aNotas[2] := Notas.Subir( aNotas[1], [tom] );
   aNotas[3] := Notas.Subir( aNotas[2], [meioTom] );
   aNotas[4] := Notas.Subir( aNotas[3], [tom] );
   aNotas[5] := Notas.Subir( aNotas[4], [tom] );
   aNotas[6] := Notas.Subir( aNotas[5], [tom] );
   aNotas[7] := Notas.Subir( aNotas[6], [meioTom] );
end;

procedure TForm1.EscalaMenor(var aNotas: array of TNota; Notas: TNotas);
begin
   // 1  /  1  1  /  1/  /
   aNotas[1] := Notas.Subir( aNotas[0], [tom] );
   aNotas[2] := Notas.Subir( aNotas[1], [meioTom] );
   aNotas[3] := Notas.Subir( aNotas[2], [tom] );
   aNotas[4] := Notas.Subir( aNotas[3], [tom] );
   aNotas[5] := Notas.Subir( aNotas[4], [meioTom] );
   aNotas[6] := Notas.Subir( aNotas[5], [tom,meioTom] );
   aNotas[7] := Notas.Subir( aNotas[6], [meioTom] );
end;

procedure TForm1.Maior1Click(Sender: TObject);
begin
   MontaScala(Dó, maior, 0);
   MontaScala(Ré, maior, 1);
   MontaScala(Mi, maior, 2);
   MontaScala(Fá, maior, 3);
   MontaScala(Sol,maior, 4);
   MontaScala(Lá, maior, 5);
   MontaScala(Si, maior, 6);
end;

procedure TForm1.Menor1Click(Sender: TObject);
begin
   MontaScala(Dó,  menor, 0);
   MontaScala(Ré,  menor, 1);
   MontaScala(Mi,  menor, 2);
   MontaScala(Fá,  menor, 3);
   MontaScala(Sol, menor, 4);
   MontaScala(Lá,  menor, 5);
   MontaScala(Si,  menor, 6);
end;

procedure TForm1.MontaScala( Nota: TNota; escala: TEscala; linha: Integer );
var Notas: TNotas;
    Representacao: TNotasRepresentacao;
    aNotas: array[0..7] of TNota;
    i: Integer;
begin
   Notas := TNotas.Create;
   Representacao := TNotasRepresentacao.Create;
   try
      Representacao.Cifra := false;
      aNotas[0] := Nota;

      if escala = maior then EscalaMaior( aNotas, Notas );

      if escala = menor then begin
         EscalaMenor( aNotas, Notas );
         Representacao.Menor := true;
      end;

      Notas.NotaSimilar( aNotas );
      for i := 0 to 7 do begin
         StringGrid1.Cells[i, linha] := Representacao.NotaToStr(aNotas[i]);
      end;
   finally
      Notas.Free;
      Representacao.Free;
   end;
end;

end.
