CREATE TABLE TB_IC_TESTE (
    id_teste            NUMERIC,
    cof_teste           VARCHAR2(50) NOT NULL,
    nome                VARCHAR2(150) NOT NULL,
    objetivo            VARCHAR2(250) NOT NULL,
    ind_funcional       NUMERIC NOT NULL,   -- 1 = Funcional; 2 - N�o funcional
    preparacao          VARCHAR2(250) NOT NULL,
    dados_input         VARCHAR2(250),
    dados_output        VARCHAR2(250),
    desc_procedimento   VARCHAR2(250) NOT NULL
);

ALTER TABLE TB_IC_TESTE
ADD CONSTRAINT PK_TB_IC_TESTE PRIMARY KEY (id_teste);

CREATE SEQUENCE  SEQ_TB_IC_TESTE  INCREMENT BY 1 START WITH 1;

CREATE TABLE TB_IC_TESTE_LOG (
    id_log          NUMERIC,
    id_teste        NUMERIC  NOT NULL,
    responsavel     VARCHAR2(100)  NOT NULL,
    dt_hora_exec    DATE  NOT NULL,
    resultado       VARCHAR2(50)  NOT NULL, -- REPENSAR EM DEIXAR COMO N�MERICO
    obs_falha       VARCHAR2(150),
    acao_realizada  VARCHAR2(250)  NOT NULL -- AVALIAR SE A ACAO REALIZADA � A DESC_PROCECEDIMENTO DO TESTE
);

ALTER TABLE TB_IC_TESTE_LOG
ADD CONSTRAINT PK_TB_IC_TESTE_LOG PRIMARY KEY (id_log);

CREATE SEQUENCE  SEQTB_IC_TESTE_LOG  INCREMENT BY 1 START WITH 1;

ALTER TABLE TB_IC_TESTE_LOG
ADD CONSTRAINT FK_TB_IC_TESTE_LOG
FOREIGN KEY (id_teste) REFERENCES TB_IC_TESTE(id_teste);