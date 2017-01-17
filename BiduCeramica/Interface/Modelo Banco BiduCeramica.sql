CREATE TABLE produto (
  idproduto INTEGER  NOT NULL   IDENTITY ,
  nome VARCHAR  NOT NULL  ,
  unidade VARCHAR  NOT NULL DEFAULT un ,
  valor DOUBLE  NOT NULL  ,
  saldo INTEGER  NOT NULL DEFAULT 0   ,
PRIMARY KEY(idproduto));
GO





CREATE TABLE pais (
  idpais INTEGER  NOT NULL   IDENTITY ,
  nome VARCHAR  NOT NULL  ,
  uf VARCHAR  NOT NULL    ,
PRIMARY KEY(idpais));
GO




CREATE TABLE Pessoa (
  id INTEGER  NOT NULL   IDENTITY   ,
PRIMARY KEY(id));
GO




CREATE TABLE Pessoa_Fisica (
  idPessoa_Fisica INTEGER  NOT NULL   IDENTITY ,
  Pessoa_id INTEGER  NOT NULL  ,
  cpf VARCHAR    ,
  nome VARCHAR    ,
  rg VARCHAR      ,
PRIMARY KEY(idPessoa_Fisica, Pessoa_id)  ,
  FOREIGN KEY(Pessoa_id)
    REFERENCES Pessoa(id));
GO


CREATE INDEX Pessoa_Fisica_FKIndex1 ON Pessoa_Fisica (Pessoa_id);
GO


CREATE INDEX IFK_Rel_21 ON Pessoa_Fisica (Pessoa_id);
GO


CREATE TABLE Pedido (
  idPedido INTEGER  NOT NULL   IDENTITY ,
  Pessoa_id INTEGER  NOT NULL  ,
  total DOUBLE  NOT NULL  ,
  dataPedido DATE  NOT NULL    ,
PRIMARY KEY(idPedido, Pessoa_id)  ,
  FOREIGN KEY(Pessoa_id)
    REFERENCES Pessoa(id));
GO


CREATE INDEX Pedido_FKIndex1 ON Pedido (Pessoa_id);
GO


CREATE INDEX IFK_Rel_15 ON Pedido (Pessoa_id);
GO


CREATE TABLE Pessoa_Juridica (
  id INTEGER  NOT NULL   IDENTITY ,
  Pessoa_id INTEGER  NOT NULL  ,
  cnpj INTEGER  NOT NULL  ,
  fantasia VARCHAR    ,
  insc_estadual INTEGER    ,
  insc_municipal INTEGER      ,
PRIMARY KEY(id, Pessoa_id)  ,
  FOREIGN KEY(Pessoa_id)
    REFERENCES Pessoa(id));
GO


CREATE INDEX Pessoa_Juridica_FKIndex1 ON Pessoa_Juridica (Pessoa_id);
GO


CREATE INDEX IFK_Rel_22 ON Pessoa_Juridica (Pessoa_id);
GO


CREATE TABLE fornecedor (
  idfornecedor INTEGER  NOT NULL   IDENTITY ,
  Pessoa_Juridica_Pessoa_id INTEGER  NOT NULL  ,
  Pessoa_Juridica_id INTEGER  NOT NULL    ,
PRIMARY KEY(idfornecedor, Pessoa_Juridica_Pessoa_id, Pessoa_Juridica_id)  ,
  FOREIGN KEY(Pessoa_Juridica_id, Pessoa_Juridica_Pessoa_id)
    REFERENCES Pessoa_Juridica(id, Pessoa_id));
GO


CREATE INDEX fornecedor_FKIndex1 ON fornecedor (Pessoa_Juridica_id, Pessoa_Juridica_Pessoa_id);
GO


CREATE INDEX IFK_Rel_25 ON fornecedor (Pessoa_Juridica_id, Pessoa_Juridica_Pessoa_id);
GO


CREATE TABLE estado (
  idestado INTEGER  NOT NULL   IDENTITY ,
  pais_idpais INTEGER  NOT NULL  ,
  nome VARCHAR  NOT NULL  ,
  uf VARCHAR  NOT NULL    ,
PRIMARY KEY(idestado, pais_idpais)  ,
  FOREIGN KEY(pais_idpais)
    REFERENCES pais(idpais));
GO


CREATE INDEX estado_FKIndex1 ON estado (pais_idpais);
GO


CREATE INDEX IFK_Rel_16 ON estado (pais_idpais);
GO


CREATE TABLE fornecedor_produto (
  fornecedor_Pessoa_Juridica_id INTEGER  NOT NULL  ,
  fornecedor_Pessoa_Juridica_Pessoa_id INTEGER  NOT NULL  ,
  fornecedor_idfornecedor INTEGER  NOT NULL  ,
  produto_idproduto INTEGER  NOT NULL    ,
PRIMARY KEY(fornecedor_Pessoa_Juridica_id, fornecedor_Pessoa_Juridica_Pessoa_id, fornecedor_idfornecedor, produto_idproduto)    ,
  FOREIGN KEY(fornecedor_idfornecedor, fornecedor_Pessoa_Juridica_Pessoa_id, fornecedor_Pessoa_Juridica_id)
    REFERENCES fornecedor(idfornecedor, Pessoa_Juridica_Pessoa_id, Pessoa_Juridica_id),
  FOREIGN KEY(produto_idproduto)
    REFERENCES produto(idproduto));
GO


CREATE INDEX fornecedor_has_produto_FKIndex1 ON fornecedor_produto (fornecedor_idfornecedor, fornecedor_Pessoa_Juridica_Pessoa_id, fornecedor_Pessoa_Juridica_id);
GO
CREATE INDEX fornecedor_has_produto_FKIndex2 ON fornecedor_produto (produto_idproduto);
GO


CREATE INDEX IFK_Rel_28 ON fornecedor_produto (fornecedor_idfornecedor, fornecedor_Pessoa_Juridica_Pessoa_id, fornecedor_Pessoa_Juridica_id);
GO
CREATE INDEX IFK_Rel_29 ON fornecedor_produto (produto_idproduto);
GO


CREATE TABLE item_pedido (
  iditem_pedido INTEGER  NOT NULL   IDENTITY ,
  Pedido_Pessoa_id INTEGER  NOT NULL  ,
  Pedido_idPedido INTEGER  NOT NULL  ,
  produto_idproduto INTEGER  NOT NULL  ,
  quantidadae INTEGER  NOT NULL  ,
  total DOUBLE      ,
PRIMARY KEY(iditem_pedido, Pedido_Pessoa_id, Pedido_idPedido, produto_idproduto)    ,
  FOREIGN KEY(Pedido_idPedido, Pedido_Pessoa_id)
    REFERENCES Pedido(idPedido, Pessoa_id),
  FOREIGN KEY(produto_idproduto)
    REFERENCES produto(idproduto));
GO


CREATE INDEX item_pedido_FKIndex2 ON item_pedido (Pedido_idPedido, Pedido_Pessoa_id);
GO
CREATE INDEX item_pedido_FKIndex2 ON item_pedido (produto_idproduto);
GO


CREATE INDEX IFK_Rel_23 ON item_pedido (Pedido_idPedido, Pedido_Pessoa_id);
GO
CREATE INDEX IFK_Rel_30 ON item_pedido (produto_idproduto);
GO


CREATE TABLE cidade (
  idcidade INTEGER  NOT NULL   IDENTITY ,
  estado_pais_idpais INTEGER  NOT NULL  ,
  estado_idestado INTEGER  NOT NULL  ,
  nome VARCHAR      ,
PRIMARY KEY(idcidade, estado_pais_idpais, estado_idestado)  ,
  FOREIGN KEY(estado_idestado, estado_pais_idpais)
    REFERENCES estado(idestado, pais_idpais));
GO


CREATE INDEX cidade_FKIndex1 ON cidade (estado_idestado, estado_pais_idpais);
GO


CREATE INDEX IFK_Rel_17 ON cidade (estado_idestado, estado_pais_idpais);
GO


CREATE TABLE bairro (
  idbairro INTEGER  NOT NULL   IDENTITY ,
  cidade_estado_idestado INTEGER  NOT NULL  ,
  cidade_estado_pais_idpais INTEGER  NOT NULL  ,
  cidade_idcidade INTEGER  NOT NULL  ,
  nome VARCHAR      ,
PRIMARY KEY(idbairro, cidade_estado_idestado, cidade_estado_pais_idpais, cidade_idcidade)  ,
  FOREIGN KEY(cidade_idcidade, cidade_estado_pais_idpais, cidade_estado_idestado)
    REFERENCES cidade(idcidade, estado_pais_idpais, estado_idestado));
GO


CREATE INDEX bairro_FKIndex1 ON bairro (cidade_idcidade, cidade_estado_pais_idpais, cidade_estado_idestado);
GO


CREATE INDEX IFK_Rel_18 ON bairro (cidade_idcidade, cidade_estado_pais_idpais, cidade_estado_idestado);
GO


CREATE TABLE endereco (
  idendereco INTEGER  NOT NULL   IDENTITY ,
  bairro_cidade_idcidade INTEGER  NOT NULL  ,
  bairro_cidade_estado_pais_idpais INTEGER  NOT NULL  ,
  bairro_cidade_estado_idestado INTEGER  NOT NULL  ,
  bairro_idbairro INTEGER  NOT NULL  ,
  Pessoa_id INTEGER  NOT NULL  ,
  rua VARCHAR    ,
  numero INTEGER    ,
  cep INTEGER    ,
  complemento VARCHAR      ,
PRIMARY KEY(idendereco, bairro_cidade_idcidade, bairro_cidade_estado_pais_idpais, bairro_cidade_estado_idestado, bairro_idbairro, Pessoa_id)    ,
  FOREIGN KEY(bairro_idbairro, bairro_cidade_estado_idestado, bairro_cidade_estado_pais_idpais, bairro_cidade_idcidade)
    REFERENCES bairro(idbairro, cidade_estado_idestado, cidade_estado_pais_idpais, cidade_idcidade),
  FOREIGN KEY(Pessoa_id)
    REFERENCES Pessoa(id));
GO


CREATE INDEX endereco_FKIndex1 ON endereco (bairro_idbairro, bairro_cidade_estado_idestado, bairro_cidade_estado_pais_idpais, bairro_cidade_idcidade);
GO
CREATE INDEX endereco_FKIndex2 ON endereco (Pessoa_id);
GO


CREATE INDEX IFK_Rel_19 ON endereco (bairro_idbairro, bairro_cidade_estado_idestado, bairro_cidade_estado_pais_idpais, bairro_cidade_idcidade);
GO
CREATE INDEX IFK_Rel_20 ON endereco (Pessoa_id);
GO