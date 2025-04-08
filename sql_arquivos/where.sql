use hcode;

select * from tb_funcionarios where sexo = 'm' and salario > 1600;
update tb_funcionarios set salario = salario * 1.5 where id = 7;
select * from tb_funcionarios where sexo = 'm' or salario > 1600;
