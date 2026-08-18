create database exercicio20;
use exercicio20;
SET SQL_SAFE_UPDATES = 0;

create table personagem (
id int auto_increment,
nome varchar(45) not null,
desenho varchar(45) not null,
especie varchar(45) not null,
primary key(id)
);

insert into personagem (nome, desenho, especie) 
values ('Raven','Teen Titans','Demoniaca'),('Naruto Uzumaki','Naruto','Humano'),('Kim Possible','Kim Possible','Humana'),('Homer Simpson','The Simpsons','Humano'),('Sailor Moon','Sailor Moon','Humana');

select * from personagem;

alter table personagem
add column ano_desenho int not null;

alter table personagem
add column sexo varchar(10) not null;

delete from personagem
where id between 1 and 5;

insert into personagem (nome, desenho, especie, ano_desenho, sexo) 
values ('Raven','Teen Titans','Demoniaca','2007','feminino'),('Naruto Uzumaki','Naruto','Humano','1998','masculino'),('Kim Possible','Kim Possible','Humana','2001','feminino'),('Homer Simpson','The Simpsons','Humano','2010','masculino'),('Sailor Moon','Sailor Moon','alienigena','1999','feminino');

select * from personagem
where ano_desenho between 2000 and 2009 and nome like '%r%';

select nome, especie, desenho from personagem
where sexo ='feminino';

update personagem
set sexo = 'f'
where sexo = 'feminino';

update personagem
set sexo = 'm'
where sexo ='masculino';

alter table personagem
modify column sexo varchar(1) not null;

alter table personagem
rename column ano_desenho to ano_lancamento_desenho;

select * from personagem 
where sexo = 'm' and ano_lancamento_desenho < '2000';

alter table personagem
drop column ano_lancamento_desenho;

create user 'exercicio20'@'localhost' identified by '123456';

grant insert, select on exercicio20.* to 'exercicio20'@'localhost';




