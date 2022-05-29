-- Create Tables
CREATE TABLE parametrogeral (
    id        INTEGER PRIMARY KEY AUTOINCREMENT
                      NOT NULL,
    descricao STRING  NOT NULL,
    valor     STRING,
    parametro STRING  NOT NULL
)

CREATE TABLE tipofilamento (
    id        INTEGER PRIMARY KEY AUTOINCREMENT
                      NOT NULL,
    descricao STRING  NOT NULL,
    valor     DOUBLE  NOT NULL,
    densidade DOUBLE  NOT NULL,
    diametro  DOUBLE  DEFAULT (1.75) 
)

CREATE TABLE categoria (
    id        INTEGER PRIMARY KEY AUTOINCREMENT
                      NOT NULL,
    descricao STRING  NOT NULL
)

CREATE TABLE impressao (
    id              INTEGER PRIMARY KEY AUTOINCREMENT
                            NOT NULL,
    descricao       STRING  NOT NULL,
    idcategoria     INTEGER,
    link            STRING,
    idtipofilamento INTEGER NOT NULL,
    customaterial   DOUBLE  NOT NULL
                            DEFAULT (0),
    custoenergia    DOUBLE  NOT NULL
                            DEFAULT (0)
)
-- End