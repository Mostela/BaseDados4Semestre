/*
FUNCTIONS AND PROCEDURES
*/

create or replace function fNovoFilme(
  varchar(60),
  numeric(5),
  varchar(200),
  int,
  int,
  int
  ) returns void as
  $BODY$
    begin
        insert into filme
            (id, titulo, duracao, sinopese, ano_lancamento, genero, tipo)
          values (nextval('seq_filme'), $1, $2, $3,$4,$5,$6);
          return;
    end;
  $BODY$
LANGUAGE 'plpgsql';
select fNovoFilme('Batman',120,'I am Batman',2019,1,1);

--- 6
create or replace function fQuantiaDias(
  varchar(60)
) returns numeric(5) as
  $BODY$
    begin
      return (SELECT qtd_dias FROM filme LEFT JOIN tipo t on filme.tipo = t.id WHERE titulo = $1);
    end;
  $BODY$
LANGUAGE 'plpgsql';

select fQuantiaDias('Batman');

--- 7
create or replace function fNovaLocalcao(
  varchar(60),
  varchar(60)
  ) returns void as
  $BODY$
    begin
        IF (SELECT titulo FROM filme where titulo LIKE  $2) IS NOT null then
          IF (SELECT nome FROM cliente WHERE nome LIKE $1) IS NOT NULL THEN
            insert into locacao (id, cliente, filme, dt_localao, dt_prev_entrega, dt_entrega, total)
            VALUES (nextval('seq_filme'),
                    (SELECT ID FROM cliente WHERE nome = $1 LIMIT 1),
                    (SELECT ID FROM filme WHERE titulo = $2 LIMIT 1),
                    current_date,
                    (select current_date +  CAST(fQuantiaDias($2) AS INTEGER) as dias),
                    NULL,
                    (SELECT (select valor from filme LEFT JOIN tipo t on filme.tipo = t.id and filme.titulo = $2) * fQuantiaDias($2) LIMIT 1)
                    );
          end if;
        ELSE
          raise notice 'Não existe';
        END IF;
        RETURN;
    end;
  $BODY$
LANGUAGE 'plpgsql';

SELECT fNovaLocalcao('Dry','Batman');


create or replace function fVoltaFilme(int) returns void as
  $BODY$
    BEGIN
      DECLARE vnMulta;
      if(select ID from filme WHERE id = $1) != 0 THEN
        vnMulta := select dt_localao - dt_entrega FROM locacao WHERE (dt_localao - dt_entrega) < 0 and id = $1;
        if vnMulta > 0 then
          vnMulta := vnMulta * 1;
          UPDATE locacao SET total = vbMulta AND id = $1;
        end if;
      end if;
      return;
    end;
  $BODY$
LANGUAGE 'plpgsql';