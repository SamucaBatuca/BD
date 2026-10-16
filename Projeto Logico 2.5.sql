CREATE TABLE fabricante(
    cnpj char[15] PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
);

CREATE TABLE produto(
    numero INT PRIMARY KEY
);


CREATE TABLE medicamento (
    numero INT NOT NULL REFERENCES produto(numero) ON DELETE RESTRICT,
    cnpj CHAR[15] NOT NULL, --CHAVE ESTRANGEIRA DE FABRICANTE
    nm_comercial VARCHAR(80) NOT NULL,
    tipo_enbalagem VARCHAR(80),
    quantidade INT NOT NULL,
    preco FLOAT NOT NULL,
    tarja VARCHAR(16) NOT NULL,
    formula VARCHAR (80) NOT NULL,

    CONSTRAINT pk_produto PRIMARY KEY(numero, cnpj),
    CONSTRAINT fk_fabricante FOREIGN KEY fabricante(cnpj) ON DELETE RESTRICT,
);

CREATE TABLE perfumaria (
    numero INT NOT NULL REFERENCES produto(numero) ON DELETE RESTRICT,
    cnpj CHAR[15] NOT NULL, --CHAVE ESTRANGEIRA DE FABRICANTE
    nm_comercial VARCHAR(80) NOT NULL,
    tipo_enbalagem VARCHAR(80),
    quantidade INT NOT NULL,
    preco FLOAT NOT NULL,
    tipo VARCHAR(40) NOT NULL,

    CONSTRAINT pk_produto PRIMARY KEY(numero, cnpj),
    CONSTRAINT fk_fabricante FOREIGN KEY fabricante(cnpj) ON DELETE RESTRICT,
);


CREATE TABLE venda(
    num_nota INT PRIMARY KEY,
    data DATE NOT NULL,
    nm_cliente VARCHAR(80) NOT NULL,
    cid_cliente VARCHAR(80) NOT NULL,
);

CREATE TABLE perfumaria_venda(
    cnpj CHAR[15] REFERENCES perfumaria(cnpj) ON DELETE RESTRICT,
    numero INT REFERENCES perfumaria(numero) ON DELETE RESTRICT,
    num_nota INT REFERENCES venda(num_nota) ON DELETE RESTRICT,
    quantidade INT NOT NULL,
    imposto FLOAT NOT NULL,
    
    CONSTRAINT pk_perfumaria_venda PRIMARY KEY(cnpj, numero, num_nota)
);

CREATE TABLE receita(
    crm INT NOT NULL,
    numero INT NOT NULL,
    dat_receita DATE NOT NULL,
    
    CONSTRAINT pk_receita PRIMARY KEY(crm, numero)
);

CREATE TABLE medicamento_receita_venda(
    quantidade INT NOT NULL,
    imposto FLOAT NOT NULL,
    cnpj CHAR[15] REFERENCES perfumaria(cnpj) ON DELETE RESTRICT,
    numero INT REFERENCES perfumaria(numero) ON DELETE RESTRICT,
    num_nota INT REFERENCES venda(num_nota) ON DELETE RESTRICT,
    crm INT NOT NULL REFERENCES receita(crm) ON DELETE RESTRICT,
    numero INT NOT NULL REFERENCES receita(numero) ON DELETE RESTRICT,
    
    CONSTRAINT pk_perfumaria_venda PRIMARY KEY(cnpj, numero, num_nota)
);
