USE g1northwind

  CREATE TABLE g1territorios (
  ID varchar(20) NOT NULL,
  Descripcion_Territorio varchar(50) NOT NULL,
  ID_Region int NOT NULL,
  PRIMARY KEY (ID))