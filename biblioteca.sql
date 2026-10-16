CREATE TABLE Leitor(
    CodLeitor int PRIMARY KEY,
    NomeLeitor varchar(100) NOT NULL
);

CREATE TABLE Editora(
    CodEditora int PRIMARY KEY,
    NomeEditora varchar(100) NOT NULL,
    CidadeEditora varchar(50) NOT NULL
);

CREATE TABLE Livro(
    CodLivro int PRIMARY KEY,
    Titulo varchar(100) NOT NULL,
    AnoPubli date NOT NULL,
    CodEditora int NOT NULL,
    
    FOREIGN KEY (CodEditora) REFERENCES Editora(CodEditora) ON DELETE RESTRICT
);


CREATE TABLE Emprestimo (
    CodEmprestimo int PRIMARY KEY,
    DataEmprestimo date NOT NULL,
    DataDevolucao date,
    StatusDevo varchar(20) NOT NULL,
    fk_CodLeitor int NOT NULL,
    fk_CodLivro int NOT NULL,
    
    FOREIGN KEY (fk_CodLeitor) REFERENCES Leitor(CodLeitor) ON DELETE RESTRICT,
    FOREIGN KEY (fk_CodLivro) REFERENCES Livro(CodLivro) ON DELETE RESTRICT
);