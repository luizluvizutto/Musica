unit Un_Notas;

interface

Uses Classes, Variants, TypInfo, StrUtils, SysUtils;

type

   TTom = ( Tom, MeioTom );

   TNota = ( Lá,  LáSustenido,
             Si,  { não tem }
             Dó,  DóSustenido,
             Ré,  RéSustenido,
             Mi,  { não tem }
             Fá,  FáSustenido,
             Sol, SolSustenido,


             { Notas de Equivalência }

             SiBemol,   { LáSustenido }
             RéBemol,   { DóSustenido }
             MiBemol,   { RéSustenido }
             SolBemol,  { FáSustenido }
             LáBemol,   { SólSustenido }


             FáBemol,   {Mi}
             DóBemol    {Si}

           );

   TEscala = (maior,menor);

   TNotas = class
   private
      FRepresentarComCifra: Boolean;
      // function Peso( Nota: TNota ): Integer;
      function GetValorTom(tom: TTom): Integer;
      function NotaCheia( Nota: TNota ): TNota;
      function Similar( Nota: TNota ): TNota;
   public
      function Subir( Nota: TNota; Tons: Array of TTom ): TNota;
      function Descer( Nota: TNota; Tons: Array of TTom ): TNota;
      procedure NotaSimilar( var Notas: array of TNota );
   end;

   TNotasRepresentacao = class
   private
      FCifra: Boolean;
      FMenor: Boolean;
   public
      property Cifra: Boolean read FCifra write FCifra;
      property Menor: Boolean read FMenor write FMenor;
      function NotaToStr( Nota: TNota ): String;
      Constructor Create;
   end;

   {
   if Nota = LáSustenido then begin
      Result := 'Si♭';
   end else if Nota = DóSustenido then begin
      Result := 'Ré♭';
   end else if Nota = RéSustenido then begin
      Result := 'Mi♭';
   end else if Nota = FáSustenido then begin
      Result := 'Sol♭';
   end else if Nota = SolSustenido then begin
      Result := 'Lá♭';
   end;
   }

implementation

{ TNotas }

function TNotas.Descer(Nota: TNota; Tons: array of TTom): TNota;
begin

end;

function TNotas.GetValorTom(tom: TTom): Integer;
begin
   if tom = meioTom then begin
      Result := 1;
   end else begin
      Result := 2;
   end;
end;

function TNotas.NotaCheia(Nota: TNota): TNota;
begin

   case Nota of
     LáSustenido: Result  := Lá;
     DóSustenido: Result  := Dó;
     RéSustenido: Result  := Ré;
     FáSustenido: Result  := Fá;
     SolSustenido: Result := Sol;
   else
     Result := Nota;
   end;
end;

procedure TNotas.NotaSimilar(var Notas: array of TNota );
var i: integer;
    A: Array of TNota;
  j: Integer;
begin
   SetLength(A, 6 );

   for i := 0 to 6 do
      A[i] := NotaCheia( Notas[i] );

   for i := 1 to 5 do
      for j := i+1 to 5 do
         if i <> j then begin
            if A[i] = A[j] then begin
               Notas[j] := Similar( Notas[j] );
            end;
         end;
end;

function TNotas.Similar(Nota: TNota): TNota;
begin
   case Nota of
      LáSustenido: Result  := SiBemol;
      DóSustenido: Result  := RéBemol;
      RéSustenido: Result  := MiBemol;
      FáSustenido: Result  := SolBemol;
      SolSustenido: Result := LáBemol;
   else
      Result := Nota;
   end;
 end;

function TNotas.Subir(Nota: TNota; Tons: array of TTom): TNota;
var i, nRes: Integer;
begin
   Result := Nota;
   for i := 0 to High(Tons) do begin

      nRes := Integer(Result) + GetValorTom( Tons[i] );
      if nRes = 12 then begin
         Result := Low( TNota );
      end else if nRes = 13 then begin
         Result := Low( TNota );
         Result := Subir( Result, [meioTom] );
      end else begin
         Result := TNota( nRes );
      end;
   end;
end;

{ TNotasRepresentacao }

constructor TNotasRepresentacao.Create;
begin
   FMenor := false;
   FCifra := false;
end;

function TNotasRepresentacao.NotaToStr(Nota: TNota): String;
var cMenor: String;
begin
   Result := GetEnumName(TypeInfo(TNota), integer(Nota));

   cMenor := '';
   if FCifra then begin

      if FMenor then cMenor := 'm';

      Result := StringReplace( Result, 'Lá',  'A', [] );
      Result := StringReplace( Result, 'Si',  'B', [] );
      Result := StringReplace( Result, 'Dó',  'C', [] );
      Result := StringReplace( Result, 'Ré',  'D', [] );
      Result := StringReplace( Result, 'Mi',  'E', [] );
      Result := StringReplace( Result, 'Fá',  'F', [] );
      Result := StringReplace( Result, 'Sol', 'G', [] );
   end;

   Result := StringReplace( Result, 'Sustenido', '#', [] );
   Result := StringReplace( Result, 'Bemol', '♭', [] );

   if FCifra then
      Result := Result + cMenor;

end;

end.
