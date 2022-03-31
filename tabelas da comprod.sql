CREATE DATABASE Comprod;
USE Comprod;

CREATE TABLE cliente (
	idEmpresa int primary key auto_increment,
    nome_da_Empresa varchar (40),
    CNPJ varchar (18),
    representante varchar (40),
    email varchar (40)
);

insert into cliente (nome_da_empresa, CNPJ, representante, email)
values ('Empresa A', '457823568920--92', 'leandro', 'ledro@gmail'),
	   ('Empresa B' , '785634760823--76', 'maicon', 'maico@gmail'),
       ('Empresa C', '23894556894--52', 'matheus', 'mat@gmail');

CREATE TABLE Endereços (
	idEndereço int primary key auto_increment,
    fk_idEmpresa int,
    foreign key (fk_idEmpresa) references cliente (idEmpresa),
    bairro varchar (30),
    estado varchar (40),
    cidade varchar (40)
);

insert into Endereços (fk_idEmpresa, bairro, estado, cidade)
values (1, 'limão', 'SP', 'São Paulo'),
	   (2, 'caxias', 'RJ', 'Rio de Janeiro'),
       (3, 'maringa', 'MR', 'Belo Horizonte');

CREATE TABLE sensor (
	idSensor int primary key auto_increment,
	fk_idEndereço int,
	foreign key (fk_idEndereço) references Endereços(idEndereço),
    nomeSensor varchar (40),
    tipo varchar(40),
    localidade varchar (50)
);

insert into sensor (fk_idEndereço, nomeSensor, tipo, localidade)
values (1, 'LM35', 'temperatura', 'sala4-andar2'),
	   (2, 'LDR', 'luminosidade', 'sala1-andar3'),
       (3, 'LM35 - LDR', 'temperatura-luminosidade', 'sala2-andar5');

CREATE TABLE registroSensor (
	idRegistro int primary key auto_increment,
    idSensor int,
    dataHora datetime,
    valorRegistro varchar (30)
);

CREATE TABLE produtividade (
	idProdutividade int primary key auto_increment,
    mes Varchar (30),
    resltAbsenteismo varchar (30),
    idEndereco int
);

CREATE TABLE telefonesEmpresas (
	idTelefone int primary key auto_increment,
    idEndereco int,
    telefone Varchar (30)
);