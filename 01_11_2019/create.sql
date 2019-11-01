create table curso(   id    numeric(5),   nome   varchar(100) not null,   constraint curso_pkey primary key (id) );  
 
create table aluno(   rgm    numeric(6),   nome    varchar(60) not null,   curso    numeric(5) not null,   constraint pk_aluno_rgm primary key (rgm),   constraint aluno_curso_fkey foreign key (curso) references curso (id)   on update no action on delete no action );  
 
create table disciplina(   codigo   numeric(6),   nome    varchar(60) not null,   constraint pk_disciplina_codigo primary key (codigo) );  
 
create table tiponota(   codigo   numeric(6),   nome    varchar(60) not null check (nome in(‘p1’, ‘p2’, ‘exame’)),   constraint tiponota_pkey primary key (codigo) );  
 
create table notas(   id    numeric(5),   rgm_aluno   numeric(6),   codigo_disciplina  numeric(6),   tipo_nota   numeric(6),   nota    numeric(4,2),   constraint notas_pkey primary key (id),   constraint notas_codigo_disc_fkey foreign key (codigo_disciplina)   references disciplina (codigo) on update no action on delete no action,   constraint notas_rgm_aluno_fkey foreign key (rgm_aluno)  references aluno (rgm) on update no action on delete no action,   constraint notas_tipo_nota_fkey foreign key (tipo_nota)  references tiponota (codigo) on update no action on delete no action );  
 
create table situacao(   aluno   numeric(5),   situacao  varchar(100) check (situacao in(‘aprovado’, ‘reprovado’, ‘cursando’, ‘dp’)),   disciplina  numeric(6) not null,   id   serial not null,   constraint id primary key (id),   constraint disc foreign key (disciplina) references disciplina (codigo)   on update restrict on delete restrict, 
constraint pessoa foreign key (aluno) references aluno (rgm)  on update restrict on delete restrict );