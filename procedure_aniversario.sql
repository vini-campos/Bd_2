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