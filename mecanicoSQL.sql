-- criação de banco de dados para o cenário da Mecânica.
create database Mecanica;
use Mecanica;

-- criar tabela cliente
	create table clients(
			idClient int auto_increment primary key,
			Fname varchar(10),
            Minit char(3),
            Lname varchar(20),
            CPF char(11) not null,
            Address varchar(30),
            contact varchar(11),
            constraint unique_cpf_client unique (CPF)
    );

-- criar tabela serviço
	create table service(
		idMecAvaliador int auto_increment primary key,
		serviço enum('Revisão','Manutenção') default 'Revisão',
		orderDescription varchar(255)
    );

-- criar tabela ordem de serviço
	create table OS(
		idOS int auto_increment primary key,
        numOS varchar(255),
        emissao date,
        entrega date,
        adesão enum('pago', 'não pago')
    );

-- criar tabela Solicitação de peças
	create table SolicParts(
		idOS int,
        idParts int,
        primary key(idOS, idParts)
    );

-- criar tabela Peças
	create table Parts(
    idParts int auto_increment primary key,
    parts enum('Disponivel', 'Encomenda') default 'Disponivel'
    );

-- criar tabela Adesão 
	create table Accession(
		idAcces int,
        idOS int,
        primary key (idOS),
        Payment enum('Accession', 'No accession') default 'No accession',
		typePayment enum('Dinheiro', 'boleto', 'cartão', 'pix') 
        );

-- criar tabela mecanicos
	create table mechanical(
		idMechanical int auto_increment primary key,
		FName varchar(255) not null,
        specialty varchar(100) not null,
		AbstractName varchar(255),
		CNPJ char(15) not null,
		CPF char(9),
		contact char (11) not null,
        adress varchar(30),
		constraint unique_cnpj_Mechanical unique (CNPJ),
		constraint unique_cpf_Mechanical unique (CPF)
    );

-- criar tabela finalização
	create table finalization(
		idDelivery int auto_increment primary key,
        finalizationStatus enum('cancelado', 'Pronto','em processamento') default 'Em processamento'
    );
    
    show tables;