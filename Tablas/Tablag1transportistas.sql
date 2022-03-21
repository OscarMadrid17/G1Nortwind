USE g1northwind

  CREATE TABLE g1transportistas (
  ID_Transportistas int NOT NULL IDENTITY(1,1),
  Nombre_Compañia varchar(40) NOT NULL,
  Telefono varchar(24) DEFAULT NULL,
  PRIMARY KEY (ID_Transportistas))