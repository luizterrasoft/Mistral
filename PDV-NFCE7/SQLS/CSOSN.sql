/******************************************************************************/
/****              Generated by IBExpert 31/07/2015 02:43:24               ****/
/******************************************************************************/

USE VENDAS_AGM


/******************************************************************************/
/****                                Tables                                ****/
/******************************************************************************/



CREATE TABLE CSOSN (
    CODIGO     VARCHAR(3) NOT NULL,
    DESCRICAO  VARCHAR(1000)
);




/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/

ALTER TABLE CSOSN ADD CONSTRAINT PK_CSOSN PRIMARY KEY (CODIGO);


/******************************************************************************/
/****                              Privileges                              ****/
/******************************************************************************/
