create database exercicio19;
use exercicio19;

create table feira (
id int auto_increment,
bairro varchar(45) not null,
dia_semana varchar(45) not null,
horario_inicio time not null,
horario_termino time not null,
primary key(id)
);
create table categoria (
id int auto_increment,
tipo_produto varchar(45) not null,
tamanho_barraca int not null,
primary key(id)
);
create table barraca(
id int auto_increment,
nome varchar(45) not null,
dono varchar(45) not null,
id_categoria int not null,
primary key(id),
foreign key (id_categoria) references categoria(id) 
);
create table funcionario (
id int auto_increment,
nome varchar(100) not null,
sexo varchar(1) not null,
funcao varchar(45) not null,
salario decimal(9,2) not null,
id_barraca int not null,
primary key(id),
foreign key (id_barraca) references barraca(id)
);
create table feira_barraca (
id_feira int,
id_barraca int,
posicao_barraca int not null,
primary key(id_feira, id_barraca),
foreign key (id_feira) references feira(id),
foreign key (id_barraca) references barraca(id)
);

insert into feira (bairro,dia_semana,horario_inicio,horario_termino)
values ('bandeirantes','sexta-feira','17:00','23:00'),('santa monica','sábado','14:00','20:00');

insert into categoria ( tipo_produto, tamanho_barraca)
values('comida','15'),('bebida','8'),('gelo','2');

insert into barraca(nome, dono, id_categoria)
values('big dog','toninho','1'),("le's beer",'leandro','2'),('pastel','ze maria','1'),('cachaça gabriela','gabriela','2');

insert into feira_barraca (id_feira, id_barraca, posicao_barraca)
values ('1','1','1'),('1','2','2'),('1','3','3'),('1','4','4'),('2','1','2'),('2','2','2');

insert into funcionario ( nome, sexo, funcao, salario, id_barraca)        
values('toninho','m','chapeiro','1500','1'),('joao','m','caixa','1200','1'),('leandro','m','vendedor','2000','2'),('Silva','f','caixa','1000','3'),('Mariana', 'f', 'vendedora', '2000', '4'),('Ricardo', 'm', 'chapeiro', '1500', '4'),('Beatriz', 'f', 'auxiliar', '1100', '2'),('Lucas', 'm', 'caixa', '1200', '4'),('Fernanda', 'f', 'gerente', '2500', '3'),('Roberto', 'm', 'vendedor', '2000', '1');                                                                                                                                                                                                                                                                                                                          

select * from feira
where dia_semana = 'sábado';

select * from feira
where dia_semana like '%feira';

select feira.bairro,feira_barraca.posicao_barraca, barraca.nome from feira
inner join feira_barraca on feira.id = feira_barraca.id_feira
inner join barraca on barraca.id = feira_barraca.id_barraca
where posicao_barraca between 1 and 5;

select dono as 'dono e funcionarios' from barraca
union all
select nome from funcionario;

select funcionario.*, categoria.tipo_produto from funcionario
inner join barraca on barraca.id = funcionario.id_barraca
inner join categoria on categoria.id = barraca.id_categoria;

select barraca.*, categoria.* from barraca 
left join categoria on categoria.id = barraca.id_categoria
union
select barraca.*, categoria.* from barraca 
right join categoria on categoria.id = barraca.id_categoria;

select * from funcionario
where funcao = 'caixa' or funcao = 'vendedor';

select * from funcionario
where nome = 'Silva';