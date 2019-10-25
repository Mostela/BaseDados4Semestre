create table genero( id numeric(5) not null, nome  varchar(100),    constraint genero_pkey primary key (id) )ENGINE 'InnoDb' ;

create table filme(   id   numeric(5) not null,   nome   varchar(100),   duracao  varchar(100),   sinopse  varchar(2000),   genero  numeric(5),   data   timestamp,   constraint pk_genero primary key (id),   constraint fk_genero_filme foreign key (genero) references genero (id)        on update no action on delete no action ) ENGINE 'InnoDb';

insert into genero values (1,'drama'); insert into genero values (2,'comedia'); insert into genero values (3,'terror'); insert into genero values (4,'romance'); insert into genero values (5,'suspense');

insert into filme  values (1,'os outros','90 min','aaaaaaaaaaaa',5,'2006/08/15'); insert into filme  values (2,'duplex','120 min','aaaaaaaaaaaa',2,'2001/08/15'); insert into filme  values (3,'click','100 min','aaaaaaaaaaaa',2,'2005/08/15'); insert into filme  values (4,'o piano','90 min','aaaaaaaaaaaa',1,'2005/06/12');