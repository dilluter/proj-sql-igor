create database universidade;
use universidade;
create table tb_alunos(
idpessoa int ,
Nome varchar(50),
dt_nascimento date
);
insert into tb_alunos(idpessoa, nome, dt_nascimento)values(1, 'bruna', '2007-04-17');
insert into tb_alunos(idpessoa, nome, dt_nascimento)values(2, 'bruno', '2007-04-17');
select * from tb_alunos;
select * from tb_alunos where idpessoa=1;
update tb_alunos set dt_nascimento = '2025-07-04' where idpessoa=1;
delete from tb_alunos where idpessoa=1;
drop table tb_alunos;
drop database universidade;