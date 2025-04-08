use hcode;

select *
from tb_funcionarios a
inner join tb_pessoas b on a.idpessoa = b.idpessoa;

insert into tb_pessoas (desnome) values ('wend');
select * from tb_pessoas a
left join tb_funcionarios b on a.idpessoa = b.idpessoa;
