USE g1northwind
CREATE TABLE g1categorias (
  ID_Categorias INT NOT NULL IDENTITY (1,1),
  Nombre_Categoria VARCHAR(15) NOT NULL,
  Descripcion TEXT,
  Imagenes IMAGE,
  PRIMARY KEY (ID_Categorias))