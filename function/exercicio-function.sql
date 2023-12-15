create table clientes(
	id serial PRIMARY key,
  nome_cliente varchar(8) not null,
  data_cadastro date not null
);

insert into clientes (nome_cliente, data_cadastro)
VALUES	('Alberto', '2022-01-04'), ('Robson', '2022-01-04'), ('Felipe', '2022-01-04'), ('Jonas', '2022-01-04'), ('Caio', '2022-01-04'),
		('Pedro', '2022-01-05'), ('Julio', '2022-01-05'), ('Dennis', '2022-01-06'), ('Elio', '2022-01-07'), ('Anderson', '2022-01-07'),
        ('Albert', '2022-01-07'), ('Robin', '2022-01-08'), ('Fernando', '2022-01-08'), ('João', '2022-01-08'), ('Ítalo', '2022-01-08');



CREATE OR REPLACE FUNCTION contar_clientes_cadastrados(cadastro DATE)
RETURNS INTEGER AS $$
DECLARE
    total_cadastrados INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_cadastrados
    FROM clientes
    WHERE data_cadastro = cadastro;

    RETURN total_cadastrados;
END;
$$ LANGUAGE plpgsql;

SELECT contar_clientes_cadastrados('2022-01-06') AS total_cadastrados;