create table produtos(
	id serial primary key,
  	nome varchar(60) not NULL
);

create table estoque(
	id_estoque serial PRIMARY KEY,
  	produtos_id int NOT NULL,
  	qtde_comprada int not null,
  	data_compra DATE not null
);

create table relatorio_produtos_comprados(
  	data_da_compra date NOT NULL PRIMARY KEY,
  	qtde_total_comprada int not null
);

drop table estoque, relatorio_produtos_comprados, produtos

ALTER TABLE estoque
add FOREIGN KEY (produtos_id) REFERENCES produtos(id);
ALTER TABLE relatorio_produtos_comprados
add FOREIGN KEY (estoque_id) REFERENCES estoque(id_estoque);

insert into produtos (nome)
values ('Geladeira'), ('Fogão'), ('Batedeira'), ('Freezer'), ('Ventilador'),
	('Ar condicionado'), ('Cama box casal'), ('Cama box solteiro'), ('conjunto panelas'), ('Microondas');
    
insert into estoque (produtos_id, qtde_comprada, data_compra)
values
	(5, 100, '2022-04-02'), (8, 10, '2022-04-02'), (1, 10, '2022-04-02'), 
    (3, 96, '2022-05-03'), (2, 10, '2022-05-03'), (6, 37, '2022-05-03'),
    (7, 12, '2022-06-04'), (4, 4, '2022-06-04'), (9, 137, '2022-06-04'), (10, 200, '2022-06-04');
    

-- teste procedure 

create or replace procedure soma_estoque_do_dia(compra_data DATE)
as $$
BEGIN 
    	if EXISTS (SELECT 1 FROM estoque WHERE data_compra = compra_data) THEN
        
        	if not EXISTS (SELECT data_da_compra from relatorio_produtos_comprados WHERE data_da_compra = compra_data) then
            
        		insert into relatorio_produtos_comprados (data_da_compra, qtde_total_comprada)
            	VALUES 
            		(compra_data,
                	(select sum(qtde_comprada) from estoque WHERE data_compra = compra_data));
                    
            ELSE
            
            	UPDATE relatorio_produtos_comprados
                Set qtde_total_comprada = (select sum(qtde_comprada) from estoque WHERE data_compra = compra_data)
                WHERE data_da_compra = compra_data;
                
            end if ;
            
       end if;
       
       return ;
end ;
$$ language 'plpgsql';

-- drop procedure soma_estoque_do_dia(data_da_compra date)


CALL soma_estoque_do_dia('2022-06-04');

select * from relatorio_produtos_comprados
ORDER by data_da_compra;