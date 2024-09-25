create database Biblioteca_Uni;

GRANT ALL PRIVILEGES ON biblioteca.* TO 'root'@'localhost';
FLUSH PRIVILEGES; /*permissoes*/

Use Biblioteca_Uni;

-- criando a tabela Usuario --
create table usuario(
CPF varchar(13) primary key not null,
nome varchar(40),
email varchar(30),
data_nascimento date not null,
endereco varchar(60)
);

-- criando a tabela Autor --
create table autor(
id_autor int primary key not null auto_increment,
nome varchar(20),
nacionalidade varchar(20),
sexo varchar(1)
);

-- criando a tabela Editora --
create table editora(
id_editora int primary key not null auto_increment,
nome_editora varchar(40) not null unique,
endereco varchar(60),
contato varchar(10)
);

-- criando a tabela Categoria --
create table categoria(
cod_categoria int primary key not null,
nome_categoria varchar(40) not null unique,
descricao text
);

-- criando a tabela Livro --
create table livro(
ISBN int primary key not null,
titulo varchar(40),
ano varchar(4),
cod_categoria int,
id_editora int,
foreign key (cod_categoria) references categoria(cod_categoria),
foreign key (id_editora) references editora(id_editora)
);

-- criando a tabela Emprestimo --
create table emprestimo(
cod_emprestimo integer primary key not null,
data_emprestimo date not null,
data_devolucao date not null,
ISBN int,
CPF varchar(13),
foreign key (ISBN) references livro(ISBN),
foreign key (CPF) references usuario(CPF)
);

-- criando a tabela associativa Livro_Autor --
create table livro_autor(
ISBN int,
id_autor int,
foreign key (ISBN) references livro(ISBN),
foreign key (id_autor) references autor(id_autor)
);

-- preenchendo as tabelas --
insert into usuario(cpf, nome, email, data_nascimento, endereco) values (12342343698, 'ana', 'anamaria@gmail.com', '1998-09-12', 'rua flor');
