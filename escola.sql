CREATE TABLE Diciplina(
    CodDiciplina int PRIMARY KEY,
    NomeDiciplina varchar(100) NOT NULL,
    CargaHoraria int NOT NULL,
    AnoSem int NOT NULL
);

CREATE TABLE Professor(
    CodProfessor int PRIMARY KEY,
    NomeProfessor varchar(50) NOT NULL,
    Titulo varchar(50) NOT NULL
);   

CREATE TABLE Aluno(
    RegAluno int PRIMARY KEY,
    NomeAlu varchar(50) NOT NULL,
    NotaFinal float NOT NULL,
    Freq int NOT NULL
);

CREATE TABLE Prof_Dici(
    fk_CodProfessor int NOT NULL,
    fk_CodDiciplina int NOT NULL,

    PRIMARY KEY (fk_CodProfessor, fk_CodDiciplina),
    FOREIGN KEY (fk_CodProfessor) REFERENCES Professor(CodProfessor) ON DELETE RESTRICT,
    FOREIGN KEY (fk_CodDiciplina) REFERENCES Diciplina(CodDiciplina) ON DELETE RESTRICT
);

CREATE TABLE Matricula(
    fk_RegAluno int NOT NULL,
    fk_CodDiciplina int NOT NULL,

    PRIMARY KEY (fk_RegAluno, fk_CodDiciplina),
    FOREIGN KEY (fk_RegAluno) REFERENCES Aluno(RegAluno) ON DELETE RESTRICT,
    FOREIGN KEY (fk_CodDiciplina) REFERENCES Diciplina(CodDiciplina) ON DELETE RESTRICT

);
