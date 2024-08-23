-- criação do banco de dados
create database Jogos;
use Jogos;

-- desenvolvedores
create table Desenvolvedores (
    DesenvolvedorID int auto_increment primary key,
    Nome varchar(255) not null,
    DataFundacao date,
    Nacionalidade varchar(100),
    Website varchar(255)  -- campo para o website do desenvolvedor
);

-- categorias
create table Categorias (
    CategoriaID int auto_increment primary key,
    Nome varchar(255) not null,
    Descricao varchar(500),
    Popularidade int,  -- campo para indicar popularidade ou relevância
    DataCriacao date   -- campo para a data de criação da categoria
);

-- plataformas
create table Plataformas (
    PlataformaID int auto_increment primary key,
    Nome varchar(255) not null,
    Tipo varchar(100),
    Fabricante varchar(255),  -- campo para o fabricante da plataforma
    DataLançamento date       -- campo para a data de lançamento da plataforma
);

-- Jogos
create table Jogos (
    JogoID int auto_increment primary key,
    Titulo varchar(255) not null,
    DesenvolvedorID int,
    CategoriaID int,
    PlataformaID int,
    DataLancamento date,
    Preco decimal(10, 2),     -- campo para o preço do jogo
    Avaliacao float,          -- campo para a avaliação do jogo
    foreign key (DesenvolvedorID) references Desenvolvedores(DesenvolvedorID),
    foreign key (CategoriaID) references Categorias(CategoriaID),
    foreign key (PlataformaID) references Plataformas(PlataformaID)
);

-- Jogadores
create table Jogadores (
    JogadorID int auto_increment primary key,
    Nome varchar(255) not null,
    DataNascimento date,
    Email varchar(255) unique,
    Pais varchar(100)  -- campo para o país do jogador
);

-- Jogadores_Jogos 
create table Jogadores_Jogos (
    JogadorID int,
    JogoID int,
    DataCompra date,
    HorasJogados int,   -- campo para registrar horas jogadas
    primary key (JogadorID, JogoID),
    foreign key (JogadorID) references Jogadores(JogadorID),
    foreign key (JogoID) references Jogos(JogoID)
);
-- Dados nas tabelas

-- Desenvolvedores
insert into Desenvolvedores (Nome, DataFundacao, Nacionalidade, Website) values
('Naughty Dog', '1984-09-01', 'EUA', 'https://www.naughtydog.com'),
('CD Projekt Red', '2002-05-01', 'Polônia', 'https://www.cdprojekt.com');

-- Categorias
insert into Categorias (Nome, Descricao, Popularidade, DataCriacao) values
('Ação', 'Jogos que envolvem ação intensa e combate', 5, '2000-01-01'),
('RPG', 'Jogos de Role-Playing Game', 4, '2000-01-01');

-- Plataformas
insert into Plataformas (Nome, Tipo, Fabricante, DataLançamento) values
('PlayStation 5', 'Console', 'Sony', '2020-11-12'),
('PC', 'Computador', 'Vários', '1981-08-12');

-- Jogos
insert into Jogos (Titulo, DesenvolvedorID, CategoriaID, PlataformaID, DataLancamento, Preco, Avaliacao) values
('The Last of Us', 1, 1, 1, '2020-06-19', 59.99, 9.5),
('Cyberpunk 2077', 2, 2, 2, '2020-12-10', 49.99, 7.5);

-- Jogadores
insert into Jogadores (Nome, DataNascimento, Email, Pais) values
('Lucas Silva', '1992-07-15', 'lucas.silva@example.com', 'Brasil'),
('Mariana Oliveira', '1988-11-30', 'mariana.oliveira@example.com', 'Portugal');

-- Jogadores_Jogos
insert into Jogadores_Jogos (JogadorID, JogoID, DataCompra, HorasJogados) values
(1, 1, '2024-01-10', 15),
(2, 2, '2024-01-15', 20);

-- funcionalidades de pesquisa

select * from Desenvolvedores;

select * from Jogos;

select * from Categorias;

select * from Plataformas;

select * from Jogadores;

select * from Jogadores_Jogos;

-- por data

select * from Jogos
where DataLancamento between '2020-01-01' and '2024-12-31';

-- maior valor

select * from Jogos
where Preco > 50;

-- total de horas por jogador

select JogadorID, SUM(HorasJogados) as TotalHorasJogados
from Jogadores_Jogos
group by JogadorID;

-- encontrar especificamente algo

select * from Jogos
where Titulo like '%Cyber%';
