�
 TDMBAIXAUTCHEQ 0Z  TPF0TDMBaixAutCheqDMBaixAutCheqOldCreateOrder	Left#Top3Height�Width� TQuery
qReabreDocDatabaseNameCREDITOSQL.StringsDelete from CRECHMVPGWhere (CH_CCGC=:ccgc) AND             (CH_BANC=:banco) AND            (CH_NUME=:numero)  Left(Top	ParamDataDataTypeftStringNameccgc	ParamType	ptUnknown DataTypeftFloatNamebanco	ParamType	ptUnknown DataTypeftFloatNamenumero	ParamType	ptUnknown    TQuery	qBaixaDocDatabaseNameCREDITOSQL.StringsDelete from CRECHMOVWhere (CH_CCGC=:ccgc) AND      (CH_BANC=:banco) AND      (CH_NUME=:numero)  LeftxTop	ParamDataDataTypeftStringNameccgc	ParamType	ptUnknown DataTypeftFloatNamebanco	ParamType	ptUnknown DataTypeftFloatNamenumero	ParamType	ptUnknown    TQueryqBaixaChequeDatabaseNameCREDITOSQL.StringsDelete from CRECHMOVWhere (CH_CCGC=:ccgc) AND      (CH_BANC=:banco) AND      (CH_NUME=:numero)  Left(TopX	ParamDataDataTypeftStringNameccgc	ParamType	ptUnknown DataTypeftFloatNamebanco	ParamType	ptUnknown DataTypeftFloatNamenumero	ParamType	ptUnknown    TQueryqAltManContSPCCheqDevDatabaseNameCREDITOSQL.StringsUPDATE CHEQUES_DEV_SPCSET    DATASPC=:DATASPC,       DATAREG=:DATAREG,       VENCIMENTO=:VENCIMENTO,       DATA=:DATA,       VALOR=:VALOR,       LOJA=:LOJA,       STATUS=:STATUS,       ALINEA=:ALINEAWHERE (CCGC=:CCGC) AND      (BANCO=:BANCO) AND      (NUMERO=:NUMERO)      Left� Top`	ParamDataDataType
ftDateTimeNameDATASPC	ParamType	ptUnknown DataType
ftDateTimeNameDATAREG	ParamType	ptUnknown DataType
ftDateTimeName
VENCIMENTO	ParamType	ptUnknown DataType
ftDateTimeNameDATA	ParamType	ptUnknown DataTypeftFloatNameVALOR	ParamType	ptUnknown DataTypeftFloatNameLOJA	ParamType	ptUnknown DataTypeftStringNameSTATUS	ParamType	ptUnknown DataTypeftStringNameALINEA	ParamType	ptUnknown DataTypeftStringNameCCGC	ParamType	ptUnknown DataTypeftFloatNameBANCO	ParamType	ptUnknown DataTypeftFloatNameNUMERO	ParamType	ptUnknown     