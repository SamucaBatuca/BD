CREATE TABLE Aluno(
    CodAluno varchar(10) PRIMARY KEY,
    NomeAluno varchar(100) NOT NULL,
    Emails varchar(100) NOT NULL
);

CREATE TABLE Curso(
    CodCurso varchar(10) PRIMARY KEY,
    NomeCurso varchar(100) NOT NULL,
    CargaHora int NOT NULL,
    ValCurso float NOT NULL
);

CREATE TABLE Intrutor(
    CodInstru varchar(20) PRIMARY KEY,
    NomeInstru varchar(100) NOT NULL,
    Titulo varchar(50) NOT NULL
);

CREATE TABLE Curso_Instrutor(
    fk_CodInstru varchar(20) NOT NULL,
    fk_CodCurso varchar(10) NOT NULL,

    PRIMARY KEY (fk_CodInstru, fk_CodCurso),
    FOREIGN KEY (fk_CodIntru) REFERENCES Intrutor(CodInstru) ON DELETE RESTRICT,
    FOREIGN KEY (fk_CodCurso) REFERENCES Curso(CodCurso) ON DELETE RESTRICT,
);

CREATE TABLE Incricao(
    fk_CodAluno varchar(10) NOT NULL,
    fk_CodCurso varchar(10) NOT NULL,
    DataInscri date NOT NULL,
    Nota float NOT NULL,
    Prog int NOT NULL,

    PRIMARY KEY (fk_CodAluno, fk_CodCurso),
    FOREIGN KEY (fk_CodAluno) REFERENCES Aluno(CodAluno) ON DELETE RESTRICT,
    FOREIGN KEY (fk_CodCurso) REFERENCES Curso(CodCurso) ON DELETE RESTRICT,
);

