create table pessoa(
    documento varchar[20] primary key,
    fone varchar[13] NOT null,
    endereco varchar[100] not null,
    nome varchar[30] not null,
);

create table Aparelho(
    num_serie int primary key,
    marca varchar[20] not null,
);

create table Ordem (
    num_seq int primary key,
    dt_entrada date not null,
    desc_problema varchar[120] not null,
    nm_cliente varchar[30] not null,
    num_serie int not null,
    nm_profissional varchar[30] not null,
    
    --valores do termo de garantia
    prazo_term int not null, 
    condicao varchar[120] not null,
    
    constraint fk_nm_profissional foreign key (nm_profissional) references profissional(nome)
    constraint fk_num_serie foreign key (num_serie) references Aparelho(num_serie)
    constraint fk_nm_cliente foreign key (nm_cliente) references pessoa(nome)
);


create table profissional(
    nome varchar[30] primary key,
    formacao varchar[30] not null,
    tipo char[30] not null
);

create table ordem_peça(
    valor int not null,
    qtd int not null,
    num_seq int not null,
    
    constraint fk_num_seq foreign key (num_seq) references Ordem(num_seq)
);




