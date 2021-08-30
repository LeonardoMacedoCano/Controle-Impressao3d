-- Versão 2
#
CREATE TABLE parametrogeral (
    id        INTEGER PRIMARY KEY AUTOINCREMENT
                      NOT NULL,
    descricao STRING  NOT NULL,
    valor     STRING,
    parametro STRING  NOT NULL
)
#
CREATE TABLE tipofilamento (
    id        INTEGER PRIMARY KEY AUTOINCREMENT
                      NOT NULL,
    descricao STRING  NOT NULL,
    valor     DOUBLE  NOT NULL,
    densidade DOUBLE  NOT NULL,
    diametro  DOUBLE  DEFAULT (1.75) 
)
#
CREATE TABLE categoria (
    id        INTEGER PRIMARY KEY AUTOINCREMENT
                      NOT NULL,
    descricao STRING  NOT NULL
)
#
-- Fim