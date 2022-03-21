USE g1northwind

CREATE TABLE g1demos_clientes (
  ID_Clientes varchar(5) NOT NULL,
  ID_TipoCliente varchar(10) NOT NULL,
  PRIMARY KEY (ID_Clientes,ID_TipoCliente))