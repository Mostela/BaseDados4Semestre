/*
JOÃO CARLOS CAMARGO ANDRADE
11181502906
24/10/2019
 */

CREATE FUNCTION numGenero (nom_genero varchar(100)) RETURNS numeric(5) RETURN
  (select id from genero where nome = nom_genero);

CREATE FUNCTION addGenero (id numeric(5),nom_genero varchar(100)) RETURNS bool
  BEGIN
    insert into genero (id,nome) VALUES (id, nom_genero);
    RETURN (True);
  END;

select addGenero(6,'acao');

create sequence pkGenero = 0;

CREATE FUNCTION addGenero (nom_genero varchar(100)) RETURNS bool
  BEGIN
    insert into genero (id,nome) VALUES (pkGenero.nextval, nom_genero);
    RETURN (True);
  END;

create or replace function dropGenero(idGenero int) returns bool
  begin
      delete from genero WHERE id = idGenero;
      return (True);
  end;

create or replace function dropGenero(nom_genero varchar(100)) returns bool
  begin
      delete from genero WHERE nome = nom_genero;
      return (True);
  end;


select dropGenero('drama');