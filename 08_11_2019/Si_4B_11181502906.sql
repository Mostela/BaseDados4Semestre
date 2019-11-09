/*
Nome: João Carlos Camargo Andrade
RGM: 11181502906
Data: 09/11/2019
*/

-- 1
create table autor(
  id int not null,
  nome varchar(60),
  constraint pk_autor primary key (id)
);

create table livraria(
  id int not null,
  nome varchar(50),
  constraint pk_livraria primary key (id)
);

create table livro (
  id int not null,
  titulo varchar(60),
  numero_livraria int not null,
  id_autor int not null,
  constraint pk_livro primary key (id),
  constraint fk_autor foreign key (id_autor) references autor (id)
);

create table oferta (
  id int not null,
  preco numeric(5),
  fk_livro int not null,
  fk_livraria int not null,
  constraint pk_oferta primary key (id),
  constraint fk_livro foreign key (fk_livro) references livro (id),
  constraint fk_livraria foreign key (fk_livraria) references livraria (id)
);

--2
create sequence seq_autor INCREMENT 1 START 1;
create sequence seq_livraria INCREMENT 1 START 1;
create sequence seq_livro INCREMENT 1 START 1;
create sequence seq_oferta INCREMENT 1 START 1;
--3
INSERT INTO autor VALUES (nextval('seq_autor'), 'Joao'),(nextval('seq_autor'), 'Jere'),(nextval('seq_autor'), 'Lucas');
INSERT INTO livraria VALUES (nextval('seq_livraria'), 'Saraiva'),(nextval('seq_livraria'), 'Cultura'), (nextval('seq_livraria'), 'SEBO');
INSERT INTO livro VALUES (nextval('seq_livro'), 'Inutil', 50,2), (nextval('seq_livro'), 'Mais Inutil Ainda', 100,1),(nextval('seq_livro'), 'NoSQL', 5,2);
INSERT INTO oferta VALUES (nextval('seq_oferta'), 5,1,2),(nextval('seq_oferta'), 5,2,1),(nextval('seq_oferta'), 5,3,2);

--4
CREATE VIEW vw_livaria AS SELECT * FROM livraria RIGHT JOIN livro l on livraria.id = l.numero_livraria ORDER BY livraria.nome;

--5
create or replace FUNCTION fAtualizaLivraria() returns trigger as
  $BODY$
     BEGIN
        UPDATE livro SET numero_livraria = (select count(*) from oferta WHERE fk_livro = OLD:id group by fk_livraria) WHERE id = OLD:id;
        return old;
     end;
  $BODY$
LANGUAGE 'plpgsql';

CREATE TRIGGER contaLivro AFTER INSERT ON oferta FOR EACH ROW EXECUTE PROCEDURE fAtualizaLivraria();
CREATE TRIGGER contaLivroDelete AFTER DELETE ON oferta FOR EACH ROW EXECUTE PROCEDURE fAtualizaLivraria();

--6
CREATE OR REPLACE FUNCTION fBuscaLivroMenorPreco(varchar(60)) returns varchar(60) as
  $BODY$
    BEGIN
      RETURN(SELECT lvr.nome FROM oferta ofe LEFT JOIN livraria lvr on ofe.fk_livraria = lvr.id  left join livro l on ofe.fk_livro = l.id
WHERE l.titulo = $1 ORDER BY preco);
    end;
  $BODY$
LANGUAGE 'plpgsql';

SELECT fBuscaLivroMenorPreco('Inutil');