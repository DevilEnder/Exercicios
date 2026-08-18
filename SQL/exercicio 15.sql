create database exercicio15;
use exercicio15;
SET SQL_SAFE_UPDATES = 0;

create table pessoa(
id int auto_increment,
nome varchar(250) not null,
data_nascimento date not null,
quantidade_irmaos int not null,
rua varchar(250) not null,
numero varchar(10) not null,
bairro varchar(45) not null,
cidade varchar(45) not null,
cep varchar(9) not null,
primary key(id)
);

insert into pessoa(nome , data_nascimento, quantidade_irmaos, rua, numero, bairro, cidade , cep)
values('joao pedro','1998-08-20','5','barbosa pedrosa','117','torees','mogi guaçu','12345-123');
insert into pessoa(nome , data_nascimento, quantidade_irmaos, rua, numero, bairro, cidade , cep)
values('joao paulo','2007-03-28','2','barbacoa','91','tucura','Campinas','12345-897');
insert into pessoa(nome , data_nascimento, quantidade_irmaos, rua, numero, bairro, cidade , cep)
values('joao','2007-07-12','3','jucelino kubchec','118','holanda','Jaguariúna','12345-678');
insert into pessoa(nome , data_nascimento, quantidade_irmaos, rua, numero, bairro, cidade , cep)
values('Afonso','1999-12-31','1','albertina','20','silveira','Jaguariúna','12345-987');
insert into pessoa(nome , data_nascimento, quantidade_irmaos, rua, numero, bairro, cidade , cep)
values('Alex','2002-02-2','1','barbosa afonsa','12','bandeirante','Mogi mirim','12345-312');

select * from pessoa;

select nome from pessoa
where quantidade_irmaos > 2;

select * from pessoa
where numero % 2 = 0 and cidade = 'Jaguariúna';

select rua, numero, bairro, cidade , cep from pessoa
where nome = 'Afonso';

update pessoa
set bairro = 'Bairro das flores'
where id= 4;

update pessoa
set quantidade_irmaos = 20
where nome = 'Alex';

select nome, quantidade_irmaos from pessoa
where quantidade_irmaos > 4 or cidade = 'Campinas';

select * from pessoa
where cep = '12345-678' or data_nascimento = '1999-12-31';

delete from pessoa
where id = 3;





