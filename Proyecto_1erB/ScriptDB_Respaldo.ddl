-- Generado por Oracle SQL Developer Data Modeler 17.3.0.261.1529
--   en:        2018-05-26 17:59:26 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE aggressor (
    idaggressor              NUMBER(10) NOT NULL,
    name                     VARCHAR2(50),
    lastname                 VARCHAR2(50),
    age                      NUMBER(10),
    profession               VARCHAR2(25),
    inmediateevent           VARCHAR2(25) NOT NULL,
    nacionalidad             VARCHAR2(25),
    sentencia                VARCHAR2(25),
    relationshipvictima      VARCHAR2(25),
    timerelationshipvictim   VARCHAR2(15)
);

ALTER TABLE aggressor ADD CONSTRAINT aggressor_pk PRIMARY KEY ( idaggressor );

CREATE TABLE city (
    idcity          NUMBER(10) NOT NULL,
    namecity        VARCHAR2(50) NOT NULL,
    state_idstate   NUMBER(10) NOT NULL
);

ALTER TABLE city ADD CONSTRAINT city_pk PRIMARY KEY ( idcity );

CREATE TABLE country (
    idcountry     NUMBER(10) NOT NULL,
    namecountry   VARCHAR2(25) NOT NULL
);

ALTER TABLE country ADD CONSTRAINT country_pk PRIMARY KEY ( idcountry );

CREATE TABLE feminicide (
    idfeminicide     NUMBER(10) NOT NULL,
    address          VARCHAR2(150) NOT NULL,
    weapon           VARCHAR2(25),
    "date"           DATE NOT NULL,
    hour             DATE,
    circunstancias   VARCHAR2(390) NOT NULL,
    statecase        VARCHAR2(50),
    city_idcity      NUMBER(10) NOT NULL
);

ALTER TABLE feminicide ADD CONSTRAINT feminicide_pk PRIMARY KEY ( idfeminicide );

CREATE TABLE feminicide_aggresor (
    feminicide_idfeminicide   NUMBER(10) NOT NULL,
    aggressor_idaggressor     NUMBER(10) NOT NULL
);

ALTER TABLE feminicide_aggresor ADD CONSTRAINT feminicide_aggresor_pk PRIMARY KEY ( feminicide_idfeminicide,
aggressor_idaggressor );

CREATE TABLE feminicide_source (
    feminicide_idfeminicide   NUMBER(10) NOT NULL,
    source_idsource           NUMBER(10) NOT NULL
);

ALTER TABLE feminicide_source ADD CONSTRAINT feminicide_source_pk PRIMARY KEY ( feminicide_idfeminicide,
source_idsource );

CREATE TABLE feminicide_witness (
    feminicide_idfeminicide   NUMBER(10) NOT NULL,
    witness_idwitness         NUMBER(10) NOT NULL
);

ALTER TABLE feminicide_witness ADD CONSTRAINT feminicide_witness_pk PRIMARY KEY ( feminicide_idfeminicide,
witness_idwitness );

CREATE TABLE source (
    idsource   NUMBER(10) NOT NULL,
    url        VARCHAR2(200) NOT NULL,
    autor      VARCHAR2(60),
    "date"     DATE NOT NULL,
    text       VARCHAR2(3000) NOT NULL,
    keywords   VARCHAR2(100),
    section    VARCHAR2(25)
);

ALTER TABLE source ADD CONSTRAINT source_pk PRIMARY KEY ( idsource );

CREATE TABLE state (
    idstate             NUMBER(10) NOT NULL,
    namestate           VARCHAR2(25) NOT NULL,
    country_idcountry   NUMBER(10) NOT NULL
);

ALTER TABLE state ADD CONSTRAINT state_pk PRIMARY KEY ( idstate );

CREATE TABLE victim (
    idvictim           NUMBER(10) NOT NULL,
    name               VARCHAR2(50),
    lastname           VARCHAR2(50),
    age                NUMBER(10),
    profession         VARCHAR2(25),
    nacionalidad       VARCHAR2(25),
    causamuerte        VARCHAR2(25) NOT NULL,
    aggressionprevia   VARCHAR2(50)
);

COMMENT ON COLUMN victim.idvictim IS
    'Identificador ùnico de la entidad Victim';

COMMENT ON COLUMN victim.name IS
    'nombre o nombres de la victima';

COMMENT ON COLUMN victim.lastname IS
    'apellidos de la victima';

COMMENT ON COLUMN victim.age IS
    'Edad de la victimma, valores enteros';

COMMENT ON COLUMN victim.profession IS
    'Ùltima profesiòn en la que se desempeñaba la victima';

ALTER TABLE victim ADD CONSTRAINT victim_pk PRIMARY KEY ( idvictim );

CREATE TABLE victim_feminicide (
    victim_idvictim           NUMBER(10) NOT NULL,
    feminicide_idfeminicide   NUMBER(10) NOT NULL
);

ALTER TABLE victim_feminicide ADD CONSTRAINT victim_feminicide_pk PRIMARY KEY ( victim_idvictim,
feminicide_idfeminicide );

CREATE TABLE witness (
    idwitness   NUMBER(10) NOT NULL,
    testimony   VARCHAR2(360)
);

ALTER TABLE witness ADD CONSTRAINT witness_pk PRIMARY KEY ( idwitness );

ALTER TABLE city
    ADD CONSTRAINT city_state_fk FOREIGN KEY ( state_idstate )
        REFERENCES state ( idstate );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE feminicide_aggresor
    ADD CONSTRAINT feminicide_aggresor_aggressor_fk FOREIGN KEY ( aggressor_idaggressor )
        REFERENCES aggressor ( idaggressor );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE feminicide_aggresor
    ADD CONSTRAINT feminicide_aggresor_feminicide_fk FOREIGN KEY ( feminicide_idfeminicide )
        REFERENCES feminicide ( idfeminicide );

ALTER TABLE feminicide
    ADD CONSTRAINT feminicide_city_fk FOREIGN KEY ( city_idcity )
        REFERENCES city ( idcity );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE feminicide_source
    ADD CONSTRAINT feminicide_source_feminicide_fk FOREIGN KEY ( feminicide_idfeminicide )
        REFERENCES feminicide ( idfeminicide );

ALTER TABLE feminicide_source
    ADD CONSTRAINT feminicide_source_source_fk FOREIGN KEY ( source_idsource )
        REFERENCES source ( idsource );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE feminicide_witness
    ADD CONSTRAINT feminicide_witness_feminicide_fk FOREIGN KEY ( feminicide_idfeminicide )
        REFERENCES feminicide ( idfeminicide );

ALTER TABLE feminicide_witness
    ADD CONSTRAINT feminicide_witness_witness_fk FOREIGN KEY ( witness_idwitness )
        REFERENCES witness ( idwitness );

ALTER TABLE state
    ADD CONSTRAINT state_country_fk FOREIGN KEY ( country_idcountry )
        REFERENCES country ( idcountry );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE victim_feminicide
    ADD CONSTRAINT victim_feminicide_feminicide_fk FOREIGN KEY ( feminicide_idfeminicide )
        REFERENCES feminicide ( idfeminicide );

ALTER TABLE victim_feminicide
    ADD CONSTRAINT victim_feminicide_victim_fk FOREIGN KEY ( victim_idvictim )
        REFERENCES victim ( idvictim );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             23
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
