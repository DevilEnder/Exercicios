create database exercicio3;
use exercicio3;

create table aluno(
id int auto_increment,
nome varchar(250) not null,
data_nascimento date not null,
sexo varchar(1) not null,
formado varchar(1) not null,
primary key(id)
);
    
create table disciplina(
id int auto_increment,
nome varchar(50) not null,
semestre int not null,
primary key(id)
);

create table aluno_disciplina(
id_aluno int not null,
id_disciplina int not null,
primary key(id_aluno,id_disciplina),
foreign key (id_aluno) references aluno(id),
foreign key(id_disciplina) references disciplina(id)
);

-- comando para inserir informaçoes nas tabelas
insert into aluno (nome, data_nascimento, sexo, formado)
values ('João Pedro', '2001-03-15', 'M', 'N'),
('Marina Silva', '2000-07-22', 'F', 'N'),
('Rafael Souza', '1999-11-05', 'M', 'S'),
('Camila Santos', '2002-01-30', 'F', 'N'),
('Bruno Costa', '2000-09-18', 'M', 'N');

insert into disciplina (nome, semestre)
values ('Banco de Dados', 3),
('Programação Orientada a Objetos', 2),
('Estrutura de Dados', 2),
('Redes de Computadores', 4),
('Engenharia de Software', 5),
('Matemática Discreta', 1);

insert into aluno_disciplina (id_aluno, id_disciplina)
values (1, 1),(1, 2),(1, 6),(2, 1),(2, 3),(3, 4),(3, 5),(4, 2),(4, 6);

select * from aluno;

select * from aluno
where sexo = 'M';

select nome, formado from aluno
where sexo = 'F';

update aluno
set nome = 'Nome alterado'
where id = 3;

insert into aluno (nome, data_nascimento, sexo, formado)
values ('Gabriel Ferreira', '2001-05-10', 'M', 'N');

select aluno.nome as nome_aluno, disciplina.nome as nome_disciplina from aluno_disciplina
inner join aluno on aluno.id = aluno_disciplina.id_aluno
inner join disciplina on disciplina.id = aluno_disciplina.id_disciplina;

select aluno.id as id_aluno, aluno.nome as nome_aluno, aluno.data_nascimento, disciplina.id as id_disciplina, disciplina.nome as nome_disciplina from aluno
left join aluno_disciplina on aluno_disciplina.id_aluno = aluno.id
left join disciplina on disciplina.id = aluno_disciplina.id_disciplina;

insert into disciplina (nome, semestre)
values ('Inteligência Artificial', 7);

select aluno.id as id_aluno, aluno.nome as nome_aluno, disciplina.id as id_disciplina, disciplina.nome as nome_disciplina from aluno
left join aluno_disciplina on aluno_disciplina.id_aluno = aluno.id
left join disciplina on disciplina.id = aluno_disciplina.id_disciplina
union
select aluno.id as id_aluno, aluno.nome as nome_aluno, disciplina.id as id_disciplina, disciplina.nome as nome_disciplina from disciplina
left join aluno_disciplina on aluno_disciplina.id_disciplina = disciplina.id
left join aluno on aluno.id = aluno_disciplina.id_aluno;

select nome from disciplina
where semestre % 2 != 0;

select id, nome from disciplina
where nome like '%de%';

select aluno.nome from aluno
inner join aluno_disciplina on aluno_disciplina.id_aluno = aluno.id
inner join disciplina on disciplina.id = aluno_disciplina.id_disciplina
where disciplina.semestre in (1, 3, 5, 7)
group by aluno.nome;
