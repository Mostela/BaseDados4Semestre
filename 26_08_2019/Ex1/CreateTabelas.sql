create table funcionario(
	id		integer,
	nome		varchar(100) not null,
	cpf		numeric(11,0) not null,
	telefone	varchar(11),
	sexo		varchar(1) not null,
	gerente		integer,
	constraint pk_func primary key (id),
	constraint fk_gerente foreign key (gerente) references funcionario (id)
);

create table projeto(
	id		integer,
	nome		varchar(100) not null,
	dt_inicio	date not null,
	custo		numeric(10,2) not null,
	constraint pk_proj primary key (id)
);

create table computador(
	id		integer,
	nome		varchar(100),
	obs		varchar(200),
	constraint pk_comp primary key (id)
);

create table alocacao(
	id		integer,
	funcionario	integer,
	projeto		integer,
	computador	integer,
	dt_inicio	date,
	constraint pk_alocacao primary key (id),
	constraint fk_alo_func foreign key (funcionario) references funcionario (id),
	constraint fk_alo_proj foreign key (projeto) references projeto (id),
	constraint fk_alo_comp foreign key (computador) references computador (id)
);

alter table funcionario
	add constraint uk_func unique (cpf);

insert into funcionario values  (1,'João',12345678956,'47474747','M',null),
			        (2,'Maria',32645678956,'47479876','F',null),
			        (3,'Cláudio',98745678956,'98724747','M',1),
			        (4,'Ricardo',26545678956,'47298647','M',2),
			        (5,'Helena',19645678956,'26454747','F',2);

insert into projeto values  (1,'Proj A','2012-08-01',200000.00),
			    (2,'Proj B','2013-06-01',10000.00),
			    (3,'Proj C','2013-08-10',55000.00);



insert into computador values 	(1,'Micro A','obs'),
				(2,'Micro B','obs'),
				(3,'Micro C','obs'),
				(4,'Micro D','obs'),
				(5,'Micro E','obs');

insert into alocacao values (1,1,1,1,'2019-08-19'),
			    (2,4,1,2,'2019-08-19'),
			    (3,5,2,3,'2019-08-19'),
			    (4,3,3,5,'2019-08-19'),
			    (5,2,3,4,'2019-08-19');