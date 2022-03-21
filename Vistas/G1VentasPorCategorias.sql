use G1Northwind
go

create view G1VentasPorCategorias as

select G1Categorias.CategoriasID, 
G1Categorias.Nombre_Categoria, 
G1Productos.NombreProducto,
Sum(G1DetallesOrdenesExtendido.PrecioTotal) as VentaDeProducto
from G1Categorias
inner join G1Productos 
on G1Productos.CategoriaID = G1Categorias.CategoriasID
inner join G1DetallesOrdenesExtendido
on G1Productos.ProductoID = G1DetallesOrdenesExtendido.ProductoID
inner join G1Orden
on G1Orden.OrdenID = G1DetallesOrdenesExtendido.OrdenID
 WHERE
        (G1Orden.FechaOrden BETWEEN '1997-01-01' AND '1997-12-31')
GROUP BY G1Categorias.CategoriasID, G1Categorias.Nombre_Categoria, G1Productos.NombreProducto