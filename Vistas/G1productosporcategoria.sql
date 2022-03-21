USE G1Northwind
GO

CREATE VIEW G1productosporcategoria
AS 
   SELECT 
      G1Categorias.Nombre_Categoria AS Nombre_Categoria, 
      G1Productos.NombreProducto AS NombreProducto, 
      G1Productos.CantidadporUnidad AS CantidadporUnidad, 
      G1Productos.UnidadesenStock AS UnidadesenStock, 
      G1Productos.Descontinuado AS Descontinuado
   FROM G1Categorias
      INNER JOIN G1Productos 
      ON categoriasID = G1Productos.categoriaID
   WHERE Descontinuado  <> 1;