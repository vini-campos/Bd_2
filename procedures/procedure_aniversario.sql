-- Data Aniversário Clientes
create procedure DataAniversarioClientes
	@mes int
as
begin
	if exists(
		select DATANASCIMENTO from dbo.CLIENTES
		where month(DATANASCIMENTO) = @mes
	)
	-- o campo de cima é somente para o if verificar se o mes existe
	begin
		select nome,day(DATANASCIMENTO) as Dia from dbo.CLIENTES
		where month(DATANASCIMENTO) = @mes
	end
	-- esse é para verificar se existe algum aniversariante nesse mes
	else
	begin
		-- select pode ser usado para retornar uma mensagem em uma coluna
		select 'Não há aniversariantes nesse mês' as mensagem
	end
end;

exec DataAniversarioClientes '11';

--Procedure do resumo
create procedure resumoAniversario
as 
begin
	select mes as Mês , count(DATANASCIMENTO) as N_aniversariantes
	from (values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12) ) as Mês(mes) 
	left join clientes on Month(DATANASCIMENTO) = mes group BY mes;
end;

exec resumoAniversario;