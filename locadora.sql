CREATE TABLE Cliente(
    CodCliente varchar(10) PRIMARY KEY,
    NomeCliente varchar(100) NOT NULL
);

CREATE TABLE Categoria(
    CodCateg varchar(5) PRIMARY KEY,
    NomeCateg varchar(50) NOT NULL,
    DiariaCateg float NOT NULL
);

CREATE TABLE Opcionais(
    CodOpci int PRIMARY KEY,
    DescOpci varchar(50) NOT NULL,
    ValorOpci float NOT NULL
);

CREATE TABLE Veículo(
    CodVeic varchar(10) PRIMARY KEY,
    Placa varchar(10) NOT NULL,
    Modelo varchar(20) NOT NULL,
    Ano int NOT NULL,
    fk_CodCateg varchar(5) NOT NULL,
    fk_CodOpci varchar(5) NOT NULL,

    FOREIGN KEY (fk_CodCateg) REFERENCES Categoria(CodCateg) ON DELETE RESTRICT
    FOREIGN KEY (fk_CodOpci) REFERENCES Opcionais(CodOpci) ON DELETE RESTRICT
);

CREATE TABLE Locação(
    CodLoc int PRIMARY KEY,
    DataLoc date NOT NULL,
    QtdDias int NOT NULL,
    fk_CodCliente varchar(10) NOT NULL,
    fk_CodVeic varchar(10) NOT NULL,
    
    FOREIGN KEY (fk_CodCliente) REFERENCES Cliente(CodCliente) ON DELETE RESTRICT,
    FOREIGN KEY (fk_CodVeic) REFERENCES Veiculo(CodVeic) ON DELETE RESTRICT
);