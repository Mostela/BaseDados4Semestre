/* 01/11/2019
JOÃO CARLOS CAMARGO
Twitter: [@Mostela_](https://twitter.com/mostela_)
[GitHub](https://mostela.github.io)
*/

/*1*/
create or replace function fTypeNota(varchar(60)) returns varchar(60) as
  'declare typeNota varchar(60);
   begin
      SELECT nta.nota FROM notas
        INNER JOIN tiponota tyn.codigo = nta.typeNota 
        WHERE tyn.nome LIKE '%$1%';

      return(typeNota);
end;
' language 'plpgsql';


/*2*/
create or replace function fTypeNotaExist(string) returns boolean as
  'declare typeNota boolean;
   begin
       SELECT tipo_nota 
        CASE
          WHEN tipo_nota = $1 THEN typeNota := true
          ELSE typeNota := false
        END AS typeNota
        FROM tiponota;
      return(typeNota);
    end;'
  language 'plpgsql';

/*3
 NÃO LEMBRO FAZER OS CODIGOS*/
CREATE OR REPLACE function fAddNota(numeric(6)) returns boolean as
    'DECLARE '
  language 'plpgsql';