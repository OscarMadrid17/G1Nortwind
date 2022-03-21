USE g1northwind

  CREATE TABLE g1territorioempleados (
  ID_Empleado INTEGER NOT NULL,
  ID_Territorio VARCHAR (20) NOT NULL,
  PRIMARY KEY (ID_Empleado,ID_Territorio))
