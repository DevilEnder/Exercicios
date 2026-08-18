create database exercicio18;
use exercicio18;

create table responsavel (
id int auto_increment,
nome varchar(50) not null,
telefone varchar(45) not null,
email varchar(100) not null,
primary key (id)
);

create table cachorro (
id int auto_increment,
nome varchar(45) not null,
raca varchar(30) not null,
temperamento varchar( 20) not null,
id_responsavel int not null,
primary key(id),
foreign key (id_responsavel) references responsavel(id)
);

create table agenda(
id int auto_increment,
data date not null,
horario time not null,
id_cachorro int not null,
primary key(id),
foreign key (id_cachorro) references cachorro(id)
);

insert into responsavel( nome, telefone , email)
values ('joao','81273483','uiadha@gmail.com'),('lais','1809344','lais@gmail.com'),('joaquim','9814579','joca@gmail.com');

insert into cachorro ( nome, raca, temperamento, id_responsavel)
values('mike','SRD','dócil','2'),('tiao','pitbull','raivoso','1'),('assasina','cane corso','dócil','3'),('javali','pinscher','atentado','2'),('noia','Pastor belga malinois','treinado','1');

insert into agenda(data, horario ,id_cachorro)
values('2025-03-12', '20:00' , '1'),('2025-03-12', '21:00', '2'),('2025-03-13', '08:30', '3'),('2025-03-13', '09:30', '4'),('2025-03-13', '10:30', '5'),('2025-03-14', '14:00', '1'),('2025-03-14', '15:00', '2'),('2025-03-15', '11:00', '3'),('2025-03-15', '16:00', '4'),('2025-03-16', '18:00', '5');

select * from responsavel
inner join cachorro on responsavel.id = cachorro.id_responsavel;

select responsavel.nome from responsavel
inner join cachorro on responsavel.id = cachorro.id_responsavel
where temperamento != 'dócil';

select cachorro.nome, agenda.data, agenda.horario from cachorro
inner join agenda on cachorro.id = agenda.id_cachorro;

select cachorro.nome, cachorro.raca from cachorro
inner join agenda on cachorro.id = agenda.id_cachorro
where data = '2025-03-12';

select responsavel.nome, responsavel.email
from agenda
inner join cachorro on agenda.id_cachorro = cachorro.id
inner join responsavel on cachorro.id_responsavel = responsavel.id
where agenda.data = '2025-03-12';









