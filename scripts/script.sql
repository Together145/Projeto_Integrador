CREATE DATABASE together;

USE together;

CREATE TABLE ongs(
	id int not null auto_increment primary key,
    razao_social varchar(60) not null,
    cnpj varchar(14) not null,
    email varchar(50),
    dt_fundacao date not null,
    conselho_fiscal text,
    cep varchar(10), 
    logradouro varchar(255),
    numero int,
    complemento text,
    bairro varchar(255),
    foto_de_perfil text,
    status_validacao bool,
    ativo bool,
    id_cidade int,
    id_uf int,
    id_categoria int,
    foreign key(id_cidade) references cidades(id),
    foreign key(id_uf) references cidades(id_uf),
    foreign key(id_categoria) references categorias_ongs(id)
);

CREATE TABLE usuarios (
	id int not null auto_increment primary key,
    nome varchar(60) not null,
    cpf varchar(14) not null,
    data_nascimento date not null,
    foto_de_perfil text,
    telefone varchar(16) not null,
    email varchar(50) not null,
    senha varchar(8) not null,
    ativo bool,
    id_cidade int,
    id_uf int,
    foreign key(id_cidade) references cidades(id),
	foreign key(id_cidade) references cidades(id_uf)
);

CREATE TABLE categorias_ongs(
	id int not null auto_increment primary key,
    nome varchar(50),
    ativo bool
);

CREATE TABLE ufs(
	id int not null auto_increment primary key,
    nome varchar(50)
);

CREATE TABLE cidades(
	id int not null auto_increment primary key,
    nome varchar(50),
    id_uf int,
    foreign key(id_uf) references ufs(id)
);

CREATE TABLE doacoes(
	id int not null auto_increment primary key,
    valor float not null,
    anonimo bool not null, 
    id_usuario int,
    foreign key(id_usuario) references usuarios(id)
);

CREATE TABLE favoritos(
	id int not null auto_increment primary key,
    id_ong int,
    id_usuario int,
    foreign key(id_usuario) references usuarios(id)
);

CREATE TABLE voluntarios(
	id int not null auto_increment primary key,
    data_associacao date,
    status_validacao bool,
    ativo bool,
    id_usuario int,
    id_ong int,
    foreign key(id_usuario) references usuarios(id),
    foreign key(id_ong) references ongs(id)
);

CREATE TABLE postagens(
	id int not null auto_increment primary key,
    titulo varchar(50) not null,
    dt_postagem date,
    descricao text,
    imagem_1 text,
    imagem_2 text,
    imagem_3 text,
    id_ong int,
    foreign key(id_ong) references ongs(id)
);

CREATE TABLE patrocinios(
	id int not null auto_increment primary key,
    nome varchar(50),
    dt_validade date,
    rede_social text,
    img text,
    ativo bool
);