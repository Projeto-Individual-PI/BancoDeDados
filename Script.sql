create database Projeto_Pessoal_Pi;
use Projeto_Pessoal_Pi;

create table usuario (
id int primary key auto_increment,
usuario varchar(45),
email varchar(105),
senha varchar(105)
);

create table inventario (
fkusuario int primary key,
constraint fkusuario foreign key (fkusuario) 
references Usuario(id),
creditos int
);

create table itens_inventario (
iditem int,
fkinventario int,
fkitem int,
constraint fkitem foreign key (fkitem) references estoque_itens(iditem),
constraint pkcomposta primary key (iditem, fkinventario, fkitem),
constraint fkinventario foreign key (fkinventario) references
inventario(fkusuario)
);


create table baus_inventario(
idbau int,
fkbau int,
fkinventario int,
constraint pkcomposta primary key (idbau, fkinventario, fkbau),
constraint fkbau foreign key (fkbau) references loja_baus(idbau),
constraint fkinventario_baus foreign key (fkinventario) references inventario(fkusuario),
nome varchar(45)
);

create table quiz(
id int primary key auto_increment,
genero varchar(45)
);

create table perguntas(
idPergunta int,
fkQuiz int,
constraint pk_perguntas primary key(idPergunta, fkQuiz),
constraint fkQuiz_Perguntas foreign key (fkQuiz) references Quiz(id),
Pergunta TEXT,
Resposta_correta TEXT,
Resposta_falsa TEXT
);

Select* from quiz 
join Perguntas on quiz.id = Perguntas.fkQuiz;

create table pontuacao_usuario(
id int,
fkusuario int,
fkquiz int,
constraint pk_resposta_usuario primary key(id, fkusuario, fkquiz),
constraint fk_usuario_resposta_usuario foreign key(fkusuario) references Usuario(id),
constraint fk_quiz_resposta_usuario foreign key(fkquiz) references Quiz(id),
Pontuacao int
);


create table loja_baus(
idBau int primary key auto_increment,
preco int,
nome varchar(45),
porcent_comum int,
porcent_incomum int,
porcent_raro int,
porcent_epico int,
porcent_lendario int
);

create table estoque_itens(
iditem int primary key auto_increment,
nome varchar(45),
raridade varchar(45),
preco int
);

create table url_img_itens(
fkitem int primary key,
constraint fkitem_url_img foreign key(fkitem) references estoque_itens(iditem),
url text
);


insert into quiz (genero) values
('Ação'),
('Esportes'),
('Aventura'),
('Battle_royale'),
('MOBA'),
('RPG'),
('MMORPG'),
('FPS'),
('Simulação'),
('Corrida')
;

insert into Perguntas values
(1, 1, 'Qual é o personagem principal de "Call of Duty"?', 'Captain Price', 'Lara Croft'),
(2, 1, 'Em que ano foi lançado "Fortnite"?', '2017', '2015'),
(3, 1, 'Qual é o objetivo principal em "Fortnite"?', 'Ser o último sobrevivente', 'Completar missões'),
(1, 2, 'Qual é o jogo de futebol mais popular?', 'FIFA', 'PES'),
(2, 2, 'Qual equipe venceu a NBA em 2020?', 'Los Angeles Lakers', 'Miami Heat'),
(3, 2, 'Qual jogador é capa do FIFA 21?', 'Kylian Mbappé', 'Lionel Messi'),
(1, 3, 'Quem é o protagonista de "The Legend of Zelda"?', 'Link', 'Zelda'),
(2, 3, 'Qual desenvolvedora criou "Uncharted"?', 'Naughty Dog', 'Ubisoft'),
(3, 3, 'Em qual continente se passa "The Legend of Zelda: Breath of the Wild"?', 'Hyrule', 'Tamriel'),
(1, 4, 'Qual foi o primeiro Battle Royale popular?', 'PUBG', 'Apex Legends'),
(2, 4, 'Quantos jogadores participam de uma partida de "Apex Legends"?', '60', '100'),
(3, 4, 'Qual é o objetivo principal em um jogo Battle Royale?', 'Ser o último sobrevivente', 'Capturar a bandeira'),
(1, 5, 'Qual é o MOBA mais jogado no mundo?', 'League of Legends', 'Smite'),
(2, 5, 'Qual é a principal função dos "minions" em MOBAs?', 'Ajudar a destruir torres inimigas', 'Atacar diretamente os heróis inimigos'),
(3, 5, 'Quantas lanes (faixas) geralmente existem em um mapa de MOBA?', '3', '4'),
(1, 6, 'Quem é o protagonista de "The Witcher"?', 'Geralt de Rivia', 'Arthur Morgan'),
(2, 6, 'Qual RPG é conhecido por sua dificuldade extrema?', 'Dark Souls', 'Final Fantasy'),
(3, 6, 'Em qual RPG você pode encontrar a cidade de Midgar?', 'Final Fantasy VII', 'The Elder Scrolls V: Skyrim'),
(1, 7, 'Qual é o MMORPG mais famoso da Blizzard?', 'World of Warcraft', 'Diablo III'),
(2, 7, 'Em qual MMORPG você pode jogar como uma classe chamada "Necromancer"?', 'Guild Wars 2', 'World of Warcraft'),
(3, 7, 'Qual é a principal moeda de troca em "World of Warcraft"?', 'Gold', 'Silver'),
(1, 8, 'Qual é o objetivo principal em "Valorant"?', 'Plantar/desarmar a spike', 'Capturar a bandeira'),
(2, 8, 'Qual personagem de "Overwatch" é um gorila cientista?', 'Winston', 'Reinhardt'),
(3, 8, 'Qual jogo é famoso pelo modo "Zombies"?', 'Call of Duty', 'Battlefield'),
(1, 9, 'Qual é o simulador de vida mais popular?', 'The Sims', 'Second Life'),
(2, 9, 'Qual jogo de simulação permite gerenciar uma cidade?', 'SimCity', 'RollerCoaster Tycoon'),
(3, 9, 'Em "The Sims", como se chama a moeda do jogo?', 'Simoleons', 'Gold'),
(1, 10, 'Qual é o mascote do jogo "Mario Kart"?', 'Mario', 'Sonic'),
(2, 10, 'Qual série de jogos de corrida é conhecida por seu realismo?', 'Gran Turismo', 'Need for Speed'),
(3, 10, 'Em "Mario Kart", qual item faz os outros jogadores perderem o controle?', 'Casco Azul', 'Banana');

insert into loja_baus (preco, nome, porcent_comum, porcent_incomum, porcent_raro, porcent_epico, porcent_lendario) values
(10, 'Baú Comum', 60, 25, 10, 4, 1),
(50, 'Baú Raro', 25, 25, 35, 10, 5),
(100, 'Baú Lendário', 10, 10, 35, 25, 20); 

insert into estoque_itens (iditem, nome, raridade, preco) values
(1,'Winters Approach', 'lendário', 2600),
(2,'Steraks Gage', 'lendário', 3100),
(3,'Seraphs Embrace', 'lendário', 3200),
(4,'Liandrys Anguish', 'lendário', 3200),
(5,'Guinsoos Rageblade', 'lendário', 2600),
(6,'Infinity Edge', 'lendário', 3400),
(7,'Stormrazor', 'lendário', 3000),
(8,'Blade of the Ruined King', 'lendário', 3300),
(9,'Zhonyas Hourglass', 'lendário', 2600),
(10,'Trinity Force', 'lendário', 3333),
(11,'Hextech Alternator', 'épico', 1050),
(12,'Seekers Armguard', 'épico', 1000),
(13,'Oblivion Orb', 'épico', 800),
(14,'Vampiric Scepter', 'épico', 900),
(15,'Verdant Barrier', 'épico', 1100),
(16,'Tiamat', 'raro', 600),
(17,'Punhal Serrilhado', 'raro', 560),
(18,'Cajado do Vazio', 'raro', 670),
(19,'Armadura de Espinhos', 'raro', 700),
(20,'Anjo Guardião', 'raro', 570),
(21,'Arco Recurvo', 'incomum', 300),
(22,'Armadura de Pano', 'incomum', 300),
(23,'Cristal de Rubi', 'incomum', 400),
(24,'Capa de Agilidade', 'incomum', 400),
(25,'Hexdrinker', 'incomum', 350),
(26,'Tomo Amplificador', 'comum', 135),
(27,'Espada Longa', 'comum', 150),
(28,'Poção de Vida', 'comum', 50),
(29,'Anel de Doran', 'comum', 100),
(30,'Escudo de Doran', 'comum', 150);

insert into url_img_itens values
(1,'"./assets/img-icons/lol-icons/Winters_Approach_item_HD.webp"'),
(2,'"./assets/img-icons/lol-icons/Steraks_Gage_item_HD.webp"'),
(3,'"./assets/img-icons/lol-icons/Seraphs_Embrace_item_HD.webp"'),
(4,'"./assets/img-icons/lol-icons/Liandrys_Torment_item.webp"'),
(5,'"./assets/img-icons/lol-icons/Guinsoos_Rageblade_item_HD.webp"'),
(6,'"./assets/img-icons/lol-icons/Infinity_Edge_item_HD.webp"'),
(7,'"./assets/img-icons/lol-icons/Stormrazor_item_HD.webp"'),
(8,'"./assets/img-icons/lol-icons/Blade_of_the_Ruined_King_item_HD.webp"'),
(9,'"./assets/img-icons/lol-icons/Zhonyas_Hourglass_item_HD.webp"'),
(10,'"./assets/img-icons/lol-icons/Trinity_Force_item_HD.webp"'),
(11,'"./assets/img-icons/lol-icons/Hextech_Alternator_item_HD.webp"'),
(12,'"./assets/img-icons/lol-icons/Seekers_Armguard_item_HD.webp"'),
(13,'"./assets/img-icons/lol-icons/Oblivion_Orb_item_HD.webp"'),
(14,'"./assets/img-icons/lol-icons/Vampiric_Scepter_item.webp"'),
(15,'"./assets/img-icons/lol-icons/Verdant_Barrier_item_HD.webp"'),
(16,'"./assets/img-icons/lol-icons/Tiamat_item_HD.webp"'),
(17,'"./assets/img-icons/lol-icons/Serrated_Dirk_item_HD.webp"'),
(18,'"./assets/img-icons/lol-icons/Void_Staff_item_HD.webp"'),
(19,'"./assets/img-icons/lol-icons/Thornmail_item_HD.webp"'),
(20,'"./assets/img-icons/lol-icons/Guardian_Angel_item_HD.webp"'),
(21,'"./assets/img-icons/lol-icons/Recurve_Bow_item.webp"'),
(22,'"./assets/img-icons/lol-icons/Cloth_Armor_item_HD.webp"'),
(23,'"./assets/img-icons/lol-icons/Ruby_Crystal_item_HD.webp"'),
(24,'"./assets/img-icons/lol-icons/Cloak_of_Agility_item_HD.webp"'),
(25,'"./assets/img-icons/lol-icons/Hexdrinker_item_HD.webp"'),
(26,'"./assets/img-icons/lol-icons/Amplifying_Tome_item_HD.webp"'),
(27,'"./assets/img-icons/lol-icons/Long_Sword_item_HD.webp"'),
(28,'"./assets/img-icons/lol-icons/Health_Potion_item_HD.webp"'),
(29,'"./assets/img-icons/lol-icons/Dorans_Ring_item_HD.webp"'),
(30,'"./assets/img-icons/lol-icons/Dorans_Shield_item.webp"');


select *
from itens_inventario
join estoque_itens on fkitem = estoque_itens.iditem
join usuario on usuario.id = itens_inventario.fkinventario 
where Raridade = 'lendario';

select usuario as 'Nome', count(fkinventario)as 'Qtd_itens'
from itens_inventario
join estoque_itens on fkitem = estoque_itens.iditem
join usuario on usuario.id = itens_inventario.fkinventario 
where Raridade = 'lendario' group by fkinventario, usuario order by Qtd_itens desc limit 5;



select fkinventario, raridade as 'Raridade', count(raridade) as 'Qtd_itens' from itens_inventario
join estoque_itens on estoque_itens.iditem = fkitem  where fkinventario = 12
group by raridade, fkinventario order by field(Raridade, 'comum', 'incomum', 'raro', 'épico', 'lendário');

select * from itens_inventario
join estoque_itens on estoque_itens.iditem = fkitem  order by fkinventario;

select * from estoque_itens left join url_img_itens on fkitem = iditem;
select * from baus_inventario where fkinventario = 10;
select * from inventario where fkusuario = 10;




