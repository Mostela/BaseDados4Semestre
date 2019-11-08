/*
FUNCTIONS AND PROCEDURES
*/

create function fNovoFilme(
  varchar(60),
  numeric(5),
  varchar(200),
  int,
  int
  ) returns void as
  $BODY$
    begin
        insert into filme
            (id, titulo, duracao, sinopese, ano_lancamento, genero, tipo)
          values (nextval('seq_filme'), $1, $2, $3,$4,$5);
          return;
    end;
  $BODY$
LANGUAGE 'plpgsql';