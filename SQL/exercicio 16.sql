create database exercicio16;
use exercicio16;
SET SQL_SAFE_UPDATES = 0;

create table animal(
id int auto_increment,
nome varchar(250) not null,
especie varchar(250) not null,
raca varchar(45) not null,
data_nascimento date not null,
primary key(id)
);

insert into animal ( nome, especie, raca, data_nascimento)
values('Tobby','cachorro','golden','2017-07-22'),('pica-pau','ave','calopsita','2024-02-22'),('Rex','gato','bombado','2000-01-11'),('Stuart','rato','little','2020-01-01'),('lucas','foca','fofa','2020-08-19');

select * from animal;

select nome,raca from animal
where especie = 'cachorro';

select data_nascimento from animal
where especie = 'ave' and raca = 'calopsita';

select * from animal
where nome = 'Rex';

update animal
set raca = 'SRD'
where nome = 'Tobby';

update animal
set data_nascimento = '2020-01-01'
where id = 1;

select nome, especie, raca from animal
where especie = 'foca' or especie = 'gato';

select * from animal
where data_nascimento = '2020-01-01' and especie = 'cachorro'
or nome = 'Stuart' and especie = 'rato';

delete from animal
where id = 2;
