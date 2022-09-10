-- criação do banco de dados para o cenário de E-Commerce
create database ecommerce;
use ecommerce;

-- criar tabela cliente  
    create table clients(
			idClient int auto_increment primary key,
            Fname varchar(10),
            Minit char(3),
            Lname varchar(20),
            CPF char(11) not null,
            Address varchar(30),
            constraint unique_cpf_client unique (CPF)
	);	
    
    desc clients;
   -- criar tabela produto 
       
      create table product(
			idProduct int auto_increment primary key,
            Pname varchar(10) not null,
            classification_kids bool default false,
            category enum('Eletrônico', 'vestimenta', 'brinquedos', 'Alimentos'),
            valor varchar(45),
            avaliação float default 0,
            descrição varchar(45),
            size varchar(10)
    );
    
      create table orders(
			idOrder int auto_increment primary key,
            idOrderClient int,
            orderStatus enum('cancelado', 'confirmado','em processamento') default 'Em processamento',
            orderDescription varchar(255),
            sendValue float default 10,
            paymentCash boolean default false,
            constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
	);
    
    create table Storage(
		idStorage int auto_increment primary key,
		idLstorage int,
		location varchar(255) not null,
		primary key (idLproduct, idLstorage),
		constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
		constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
    );
    
    create table payments(
		idclient int,
        id_payment int,
        typePayment enum('Dinheiro', 'boleto', 'cartão', 'pix'),
        limitAvalilable float,
        primary key(idClient, id_payment)
    );
    
    create table productStorage(
		idProdStorage int auto_increment primary key,
		storageLocation varchar(255),
		quantity int default 0
    );
    
    create table supplier(
    idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supllier unique (CNPJ)
    );
      
    create table seller(
		idSeller int auto_increment primary key,
		SocialName varchar(255) not null,
		AbstractName varchar(255),
		CNPJ char(15) not null,
		CPF char(9),
		location varchar(255),
		contact char (11) not null,
		constraint unique_cnpj_seller unique (CNPJ),
		constraint unique_cpf_seller unique (CPF)
    );
    
    create table productSeller(
	idPSeller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
    );
    
    create table productOrder(
    idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    constraint fk_product_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_product_product foreign key (idPOorder) references orders(idOrder)
    );
    
    create table storageLocation(
    idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
    );
    
    use table clients;
    select * from employee order by Fname,
    
    select * from orders as payments
		where (idOrder and idpayment);
    
    
    show tables;
    
    show databases;
    use information_schema;
    show tables;
    desc table_constraints;
    
