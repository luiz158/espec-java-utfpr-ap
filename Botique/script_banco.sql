/******************************************************************************/
/*            Generated by IBExpert 2011.04.03 25/9/2011 22:29:17             */
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES ISO8859_1;

CREATE DATABASE 'localhost:/firebird/botique.fdb'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 4096
DEFAULT CHARACTER SET ISO8859_1 COLLATION ISO8859_1;



/******************************************************************************/
/*                                 Generators                                 */
/******************************************************************************/

CREATE GENERATOR GEN_FORNECEDOR;
SET GENERATOR GEN_FORNECEDOR TO 4;

CREATE GENERATOR GEN_PEDIDO;
SET GENERATOR GEN_PEDIDO TO 12;

CREATE GENERATOR GEN_PRODFORN;
SET GENERATOR GEN_PRODFORN TO 14;

CREATE GENERATOR GEN_PRODUTO;
SET GENERATOR GEN_PRODUTO TO 11;

CREATE GENERATOR HIBERNATE_SEQUENCE;
SET GENERATOR HIBERNATE_SEQUENCE TO 2;



/******************************************************************************/
/*                                   Tables                                   */
/******************************************************************************/



CREATE TABLE FORNECEDOR (
    ID        INTEGER NOT NULL,
    EMAIL     VARCHAR(255),
    NOME      VARCHAR(255),
    TELEFONE  VARCHAR(255)
);


CREATE TABLE PEDIDO (
    ID             INTEGER NOT NULL,
    DTPEDIDO       DATE,
    NUMERO         INTEGER NOT NULL,
    FORNECEDOR_ID  INTEGER
);


CREATE TABLE PEDIDOITEM (
    ID          INTEGER NOT NULL,
    QUANTIDADE  DOUBLE PRECISION NOT NULL,
    PEDIDO_ID   INTEGER,
    PRODUTO_ID  INTEGER
);


CREATE TABLE PRODUTO (
    ID         INTEGER NOT NULL,
    DESCRICAO  VARCHAR(255)
);


CREATE TABLE PRODUTOFORNECEDOR (
    ID             INTEGER NOT NULL,
    QUANTIDADE     DOUBLE PRECISION NOT NULL,
    FORNECEDOR_ID  INTEGER,
    PRODUTO_ID     INTEGER
);




/******************************************************************************/
/*                                Primary Keys                                */
/******************************************************************************/

ALTER TABLE FORNECEDOR ADD PRIMARY KEY (ID);
ALTER TABLE PEDIDO ADD PRIMARY KEY (ID);
ALTER TABLE PEDIDOITEM ADD PRIMARY KEY (ID);
ALTER TABLE PRODUTO ADD PRIMARY KEY (ID);
ALTER TABLE PRODUTOFORNECEDOR ADD PRIMARY KEY (ID);


/******************************************************************************/
/*                                Foreign Keys                                */
/******************************************************************************/

ALTER TABLE PEDIDO ADD CONSTRAINT FK8E420365B69FF042 FOREIGN KEY (FORNECEDOR_ID) REFERENCES FORNECEDOR (ID);
ALTER TABLE PEDIDOITEM ADD CONSTRAINT FKCD3AB818132C2F72 FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTO (ID);
ALTER TABLE PEDIDOITEM ADD CONSTRAINT FKCD3AB81851DA3842 FOREIGN KEY (PEDIDO_ID) REFERENCES PEDIDO (ID);
ALTER TABLE PRODUTOFORNECEDOR ADD CONSTRAINT FKAB4AE91E132C2F72 FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTO (ID);
ALTER TABLE PRODUTOFORNECEDOR ADD CONSTRAINT FKAB4AE91EB69FF042 FOREIGN KEY (FORNECEDOR_ID) REFERENCES FORNECEDOR (ID);