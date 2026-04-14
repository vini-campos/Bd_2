create procedure DevolverFilme
	@IDCliente int,
	@IDFilme int
as 
begin
	update locacoes
	set data_devolucao = getdate()
	where cod_cliente = @IDCliente and cod_filme = @IDFilme and data_devolucao is null;

	--devolver
	update filmes
	set status = 'Disponivel'
	where @IDFilme = cod_filme;
end

exec DevolverFilme @IDCliente = 3, @IDFilme = 3