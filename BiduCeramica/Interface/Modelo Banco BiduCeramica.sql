/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V9.2.0                     */
/* Target DBMS:           MS SQL Server 2014                              */
/* Project file:          Project1.dez                                    */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database creation script                        */
/* Created on:            2017-01-15 21:34                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Add tables                                                             */
/* ---------------------------------------------------------------------- */

GO


/* ---------------------------------------------------------------------- */
/* Add table "Bairro"                                                     */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Bairro] (
    [Id] INTEGER IDENTITY (1, 1) NOT NULL,
    [Nome] VARCHAR(40) NOT NULL,
    CONSTRAINT [PK_Constraint_Bairro_ID] PRIMARY KEY ([Id]),
    CONSTRAINT [TUC_Unique_Name] UNIQUE ([Nome])
)
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Identificador bairro.', 'SCHEMA', N'dbo', 'TABLE', N'Bairro', 'COLUMN', N'Id'
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Nome do bairro.', 'SCHEMA', N'dbo', 'TABLE', N'Bairro', 'COLUMN', N'Nome'
GO


/* ---------------------------------------------------------------------- */
/* Add table "Endereco"                                                   */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Endereco] (
    [Id] INTEGER IDENTITY (1, 1) NOT NULL,
    [BairroId] INTEGER NOT NULL,
    [Rua] VARCHAR(50) NOT NULL,
    [NumeroCasa] INTEGER NOT NULL,
    [Observacao] VARCHAR(40),
    CONSTRAINT [PK_Constraint_Endereco_ID] PRIMARY KEY ([Id])
)
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Idenficador endereço.', 'SCHEMA', N'dbo', 'TABLE', N'Endereco', 'COLUMN', N'Id'
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Referência do bairro.', 'SCHEMA', N'dbo', 'TABLE', N'Endereco', 'COLUMN', N'BairroId'
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Nome da rua.', 'SCHEMA', N'dbo', 'TABLE', N'Endereco', 'COLUMN', N'Rua'
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Número da casa.', 'SCHEMA', N'dbo', 'TABLE', N'Endereco', 'COLUMN', N'NumeroCasa'
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Possível ponto de referência.', 'SCHEMA', N'dbo', 'TABLE', N'Endereco', 'COLUMN', N'Observacao'
GO


/* ---------------------------------------------------------------------- */
/* Add table "Fornecedor"                                                 */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Fornecedor] (
    [Id] INTEGER IDENTITY (1, 1) NOT NULL,
    [Nome] VARCHAR(40) NOT NULL,
    [CNPJ] VARCHAR(40),
    [EnderecoId] INTEGER NOT NULL,
    CONSTRAINT [PK_Constraint_Fornecedor_ID] PRIMARY KEY ([Id]),
    CONSTRAINT [TUC_Unique_CNPJ] UNIQUE ([CNPJ])
)
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Identificador fornecedor.', 'SCHEMA', N'dbo', 'TABLE', N'Fornecedor', 'COLUMN', N'Id'
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Nome fornecedor.', 'SCHEMA', N'dbo', 'TABLE', N'Fornecedor', 'COLUMN', N'Nome'
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'CPNJ do fornecedor.', 'SCHEMA', N'dbo', 'TABLE', N'Fornecedor', 'COLUMN', N'CNPJ'
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Referencia do endereço.', 'SCHEMA', N'dbo', 'TABLE', N'Fornecedor', 'COLUMN', N'EnderecoId'
GO


/* ---------------------------------------------------------------------- */
/* Add table "Produto"                                                    */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Produto] (
    [Id] INTEGER IDENTITY (1, 1) NOT NULL,
    [Nome] VARCHAR(50) NOT NULL,
    [ValorUnit] FLOAT NOT NULL,
    [Ativo] INTEGER NOT NULL,
    CONSTRAINT [PK_Constraint_Produto_ID] PRIMARY KEY ([Id])
)
GO


ALTER TABLE [Produto] ADD CONSTRAINT [TCC_Check_Ativo_Produto] 
    CHECK (Ativo IN(1,0))
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Identificador produto.', 'SCHEMA', N'dbo', 'TABLE', N'Produto', 'COLUMN', N'Id'
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Nome do produto.', 'SCHEMA', N'dbo', 'TABLE', N'Produto', 'COLUMN', N'Nome'
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Valor unitário.', 'SCHEMA', N'dbo', 'TABLE', N'Produto', 'COLUMN', N'ValorUnit'
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Produto ativo no sistema?', 'SCHEMA', N'dbo', 'TABLE', N'Produto', 'COLUMN', N'Ativo'
GO


/* ---------------------------------------------------------------------- */
/* Add table "Cliente"                                                    */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Cliente] (
    [Id] INTEGER NOT NULL,
    [Nome] VARCHAR(50) NOT NULL,
    [EnderecoId] INTEGER NOT NULL,
    [Observacao] VARCHAR(40),
    [Ativo] INTEGER NOT NULL,
    CONSTRAINT [PK_Constraint_Cliente_ID] PRIMARY KEY ([Id])
)
GO


CREATE  INDEX [IDX_Cliente_1] ON [Cliente] ([Id] ASC,[Nome] ASC)
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Identificador  cliente.', 'SCHEMA', N'dbo', 'TABLE', N'Cliente', 'COLUMN', N'Id'
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Nome completo.', 'SCHEMA', N'dbo', 'TABLE', N'Cliente', 'COLUMN', N'Nome'
GO


EXECUTE sp_addextendedproperty N'MS_Description', N'Referência do endereço.', 'SCHEMA', N'dbo', 'TABLE', N'Cliente', 'COLUMN', N'EnderecoId'
GO


/* ---------------------------------------------------------------------- */
/* Add foreign key constraints                                            */
/* ---------------------------------------------------------------------- */

GO


ALTER TABLE [Cliente] ADD CONSTRAINT [Endereco_Cliente] 
    FOREIGN KEY ([Id]) REFERENCES [Endereco] ([Id])
GO


ALTER TABLE [Endereco] ADD CONSTRAINT [Bairro_Endereco] 
    FOREIGN KEY ([Id]) REFERENCES [Bairro] ([Id])
GO


ALTER TABLE [Fornecedor] ADD CONSTRAINT [Endereco_Fornecedor] 
    FOREIGN KEY ([Id]) REFERENCES [Endereco] ([Id])
GO

