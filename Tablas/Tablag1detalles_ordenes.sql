USE g1northwind

  CREATE TABLE g1detalles_ordenes (
  ID_Orden int NOT NULL,
  ID_Producto int NOT NULL,
  Precio_Unitario decimal(10,4) NOT NULL DEFAULT '0.0000',
  Cantidad smallint NOT NULL DEFAULT '1',
  Descuento decimal(8,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID_Orden,ID_Producto))