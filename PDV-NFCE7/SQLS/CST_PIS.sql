/******************************************************************************/
/****              Generated by IBExpert 31/07/2015 02:45:07               ****/
/******************************************************************************/
Use VENDAS_AGM;


/******************************************************************************/
/****                                Tables                                ****/
/******************************************************************************/



CREATE TABLE CST_PIS (
    CODIGO     VARCHAR(2) NOT NULL,
    DESCRICAO  VARCHAR(200)
);




/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/

ALTER TABLE CST_PIS ADD CONSTRAINT PK_CST_PIS PRIMARY KEY (CODIGO);


/******************************************************************************/
/****                              Privileges                              ****/
/******************************************************************************/

