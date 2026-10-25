create table Item (
    codItem int PRIMARY KEY,
    descIntem varchar[100] NOT NULL,
    categItem char[50] NOT NULL
);

create table Local (
    codCidade int PRIMARY KEY,
    UF char[2] NOT NULL,
    cidade char[50] NOT NULL
);

create table Cliente (
    codCliente int PRIMARY KEY,
    nomeCliente varchar[50] NOT NULL,
    telefone char[15] NOT NULL,
    codCidade int NOT NULL,

    FOREIGN KEY (cidCliente) REFERENCES Cidade(codCidade) ON DELETE RESTRICT
);

create table Pedido (
    NumPedido int PRIMARY KEY,
    dataPedido date NOT NULL,
    fk_codCliente int NOT NULL,
    fk_codItem int NOT NULL,

    FOREIGN KEY (fk_NumPedido) REFERENCES Pedido(NumPedido) ON DELETE RESTRICT,
    FOREIGN KEY (fk_CodItem) REFERENCES Item(codItem) ON DELETE RESTRICT
);
