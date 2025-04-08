drop database hcode;

create database hcode; 
use hcode;
create table tb_funcionarios (
id bigint,
nome varchar(100),
salario decimal (10,2),
adimissao date,
sexo enum ('F','m'),
cadastro timestamp default current_timestamp()
);
insert into tb_funcionarios values(25114290130,'igor bruno',5022.43,'2018-09-05','m',null);
select * from tb_funcionarios; 