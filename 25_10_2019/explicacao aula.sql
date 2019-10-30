/*
JOÃO CARLOS CAMARGO ANDRADE
11181502906
25/10/2019
---------------
PL/PgSQL
 */

create function f1(int, int) returns int as
  'declare soma int;
   begin
      soma = $1 + $2;

      return(soma);
end;
' language 'plpgsql';


/*
AULA 10 - Fazer atividades com os dados lá presente
 */