create table pessoa(
    doc char[20] primary key,
    nome varchar[50] not null,
);

create table ingresso (
    tipo char[16] not null,
    doc_pessoa char[20] not null,
    
    constraint pk_doc_pessoa foreign key (doc_pessoa) references pessoa(doc)
);

create table sitio (
    nm_sitio char[20] not null
);

create table arena (
    nm_arena varchar[30] not null,
    capacidade int not null,
    tipo char[20] not null,
    nm_sitio char[20] not null,
    
    constraint pk_nm_sitio foreign key (nm_sitio) references sitio(nm_sitio)
    
);

create table operacao(
    tipo_op char[20] not null
);

create table artista(
    nm_artista varchar[30] not null,
    pais char[16] not null,
    cache int not null,
    contato varchar[13] not null,
    tipo char[12] not null
);

create table apresentacao (
    data date primary key,
    ordem int primary key,
    nm_arena varchar[30],
    tipo_op cha[20],    
    nm_artista varchar[30]
    
    constraint pk_nm_artista foreign key (nm_artista) references artista(nm_artista)
    constraint pk_tipo_op foreign key (tipo_op) references operacao(tipo_op)
    constraint pk_nm_arena foreign key (nm_arena) references arena(nm_arena)
);


