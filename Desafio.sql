CREATE TABLE produto (
  cd_produto int,
  cd_linha_producao int ,
  aa_producao date,
  cd_tipo_produto int, 
  primary key (cd_produto, aa_producao, cd_linha_producao),
  foreign key(cd_linha_producao) references 
    Desafio.linha_producao(cd_linha_producao), 
  foreign key(cd_tipo_produto) references
    Desafio.tipo_produto(cd_tipo_produto) 
);


CREATE TABLE tipo_produto (
  cd_tipo_produto int primary key,
  nm_tipo_produto varchar(200)
);

CREATE TABLE inspecao (
  cd_inspecao int primary key identity(1,1),
  cd_ficha int,
  sg_avaliacao varchar(5),
  cd_produto int,
  hr_inspecao time,
  foreign key(cd_ficha) references
    Desafio.ficha(cd_ficha),
  foreign key(sg_avaliacao) references
    Desafio.avaliacao(sg_avaliacao),
  foreign key(cd_produto) references
    Desafio.produto(cd_produto)	
);

CREATE TABLE avaliacao (
  sg_avaliacao varchar(5) primary key,
  nm_avaliacao varchar(200)
);

CREATE TABLE inspetor (
  cd_matricula_inspetor int primary key identity(1,1),
  nm_inspetor varchar(200)
);


CREATE TABLE ficha (
  cd_ficha int primary key identity(1,1),
  dt_inspecao date,
  cd_matricula_inspetor int,
  foreign key(cd_matricula_inspetor) references
    Desafio.inspetor(cd_matricula_inspetor)
);