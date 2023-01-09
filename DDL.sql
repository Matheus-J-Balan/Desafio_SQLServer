CREATE DATABASE desafioSQL;
USE desafioSQL;

CREATE SCHEMA producao;


CREATE TABLE producao.linha_producao(
	cd_linha_producao       INT           PRIMARY KEY       IDENTITY(1,1)
);

CREATE TABLE producao.tipo_produto(
	cd_tipo_produto         INT           PRIMARY KEY       IDENTITY(1,1),
	nm_tipo_produto         VARCHAR(50)   NOT NULL
);

CREATE TABLE producao.avaliacao(
	sg_avaliacao            VARCHAR(2)    PRIMARY KEY,
	nm_avaliacao            VARCHAR(50)   NOT NULL
);

CREATE TABLE producao.inspetor(
	cd_matricula_inspetor   INT           PRIMARY KEY       IDENTITY(1,1),
	nm_inspetor             VARCHAR(50)   NOT NULL
);

CREATE TABLE producao.ficha(
	cd_ficha                INT           PRIMARY KEY       IDENTITY(1,1),
	dt_inspecao             DATE          NOT NULL,
	cd_matricula_inspetor   INT           NOT NULL,
	    
      FOREIGN KEY (cd_matricula_inspetor) REFERENCES
                        producao.inspetor(cd_matricula_inspetor)
);

CREATE TABLE producao.produto(
	cd_produto              INT           NOT NULL          IDENTITY(1,1),
	cd_linha_producao       INT           NOT NULL,
	aa_producao             INT           NOT NULL,
	cd_tipo_produto         INT           NOT NULL,
	    
	    PRIMARY KEY(cd_produto, cd_linha_producao, aa_producao)
      
      	    FOREIGN KEY (cd_linha_producao) REFERENCES
                        producao.linha_producao(cd_linha_producao),
	    FOREIGN KEY (cd_tipo_produto) REFERENCES
                        producao.tipo_produto(cd_tipo_produto),
);


CREATE TABLE producao.inspecao(
	cd_inspecao             INT           PRIMARY KEY       IDENTITY(1,1),
	cd_ficha                INT           NOT NULL,
	cd_produto              INT           NOT NULL,
	linha_produto           INT           NOT NULL,
	aa_produto              INT           NOT NULL,
	sg_avaliacao            VARCHAR(2)    NOT NULL,
	hr_inspecao             TIME,
	    
      	    FOREIGN KEY (cd_ficha) REFERENCES
                        producao.ficha(cd_ficha),
	    FOREIGN KEY (cd_produto, linha_produto, aa_produto) REFERENCES
                        producao.produto(cd_produto, cd_linha_producao, aa_producao),
	    FOREIGN KEY (cd_avaliacao) REFERENCES
                        producao.avaliacao(cd_avaliacao)
);
