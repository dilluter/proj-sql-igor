
use hcode;
drop table tb_funcionarios;
drop table tb_pessoas;

create table tb_pessoas (
idpessoa int auto_increment not null,
desnome varchar(256) not null,
dtcadastro timestamp not null default current_timestamp(),
constraint  pk_pessoas primary key (idpessoa)
) engine innoDB;

create table tb_funcionarios(
idfuncionario int auto_increment not null,
idpessoa int  not null,
vlsalario decimal (10,2) not null default 1000.00,
dtadmissao date not null,
constraint pk_funcionarios primary key (idfuncionario),
constraint pk_funcionarios_pessoas foreign key (idpessoa)
	references tb_pessoas (idpessoa)
);

INSERT INTO tb_pessoas (desnome) VALUES ('gabi');
insert into tb_funcionarios values(null, 1, 5000, current_date());
INSERT INTO tb_pessoas (desnome) VALUES ('igor');
insert into tb_funcionarios values(null, 2, 5000, current_date());
select * from tb_pessoas;
select * from tb_funcionarios;