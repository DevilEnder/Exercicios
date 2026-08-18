use exercicio20;

-- sucesso devido a ter a permissao insert
insert into personagem (nome, desenho, especie, sexo) 
values ('goku', 'dragon ball','saiyajin','m');

-- sucesso tem a permissao de select
select * from personagem
where especie = 'alienigena';

-- erro. nao tem a permissao de update
update personagem
set nome = 'usuario novo'
where id = 11;

-- erro, nao tem permissao de delete
delete from personagem
where id = 11;




