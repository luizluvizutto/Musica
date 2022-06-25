unit Un_Notas;

interface

Uses Classes, Variants, TypInfo, StrUtils, SysUtils;

type

   TTom = ( Tom, MeioTom );

   TNota = ( L·,  L·Sustenido,
             Si,  { n„o tem }
             DÛ,  DÛSustenido,
             RÈ,  RÈSustenido,
             Mi,  { n„o tem }
             F·,  F·Sustenido,
             Sol, SolSustenido
           );

   function Subir( Nota: TNota; Tons: Array of TTom ): TNota;
   function NotaToStr( Nota: TNota ): String;


implementation

function Subir(Nota: TNota; Tons: Array of TTom ): TNota;
var i, nRes: Integer;

   function GetTomValor: Integer;
   begin
      if Tons[i] = meioTom then begin
         Result := 1;
      end else begin
         Result := 2;
      end;
   end;

begin
   Result := Nota;
   for i := 0 to High(Tons) do begin

      nRes := Integer(Result) + GetTomValor;
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

function NotaToStr( Nota: TNota ): String;
begin
   Result := GetEnumName(TypeInfo(TNota), integer(Nota));
   Result := StringReplace( Result, 'Sustenido', '#', [] );
end;


end.
