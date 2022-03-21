use G1Northwind
go 

CREATE VIEW G1Ventas1997 AS
    SELECT G1Categorias.Nombre_Categoria AS NombreCategoria,
        G1Productos.NombreProducto AS NombreProducto,
        SUM(((((G1DetallesOrdenes.PrecioUnitario * G1DetallesOrdenes.Cantidad) * (1 - G1DetallesOrdenes.Descuento)) / 100) * 100)) AS Ventas
    FROM G1Categorias
        INNER JOIN G1Productos ON G1Categorias.CategoriasID = G1Productos.CategoriaID
        INNER JOIN G1DetallesOrdenes ON G1Productos.ProductoID = G1DetallesOrdenes.ProductoID
        INNER JOIN G1Orden ON G1Orden.OrdenID = G1DetallesOrdenes.OrdenID
    WHERE
        (G1Orden.FechadeEntrega BETWEEN '1997-01-01' AND '1997-12-31')
    GROUP BY G1Categorias.Nombre_Categoria , G1Productos.NombreProducto