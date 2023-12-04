create database escola;

USE escola;

create table aluno(
    id serial PRIMARY KEY,
    nome varchar(30) not null,
    matricula int NOT NULL,
    email VARCHAR(50) NOT NULL,
    endereco VARCHAR(60) NOT NULL,
    telefone INT NOT NULL
);

insert into aluno(nome,matrivula,email,endereco,telefone) 
values
	('João Carlos', 1234, 'Jcarlos@gmail.com', 'Rua 13 de maio', 1178254489), 
	('José Vitor', 2345, 'Jvitor@gmail.com', 'Rua da Saudade', 1178256589), 
    ('Paulo André', 3456, 'Pandr@gmail.com', 'Rua do Sol', 1178254495)
;

select*from aluno;