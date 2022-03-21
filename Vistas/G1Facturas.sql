Use G1Northwind
Go

CREATE VIEW G1Facturas AS 
SELECT G1Orden.Transporte,
       G1Orden.DireccionTransporte,
       G1Orden.CiudaddelTransporte,
       G1Orden.RegiondelTransporte, 
       G1Orden.CodigoPostadelTransporte,
       G1Orden.PaisdelTransporte,
       G1Orden.ClienteID,
       G1Clientes.NombreCompañia AS NombreCliente, 
       G1Clientes.Direccion,
       G1Clientes.Ciudad,
       G1Clientes.Region,
       G1Clientes.CodigoPostal,
       G1Clientes.Pais,
       (G1Empleados.Nombre + ' ' + G1Empleados.Apellido) AS Vendedor, 
       G1Orden.OrdenID,
       G1Orden.FechaOrden,
       G1Orden.FechaRequerida,
       G1Orden.FechadeEntrega, 
       G1Transportistas.NombreCompañia As NombreTransportista,
       G1DetallesOrdenes.ProductoID,
       G1Productos.NombreProducto, 
       G1DetallesOrdenes.PrecioUnitario,
       G1DetallesOrdenes.Cantidad,
       G1DetallesOrdenes.Descuento, 
       (((G1DetallesOrdenes.PrecioUnitario*Cantidad*(1-Descuento))/100)*100) AS PrecioTotal,
       G1Orden.Peso
FROM G1Clientes
  JOIN G1Orden ON G1Clientes.ClientesID = G1Orden.ClienteID  
    JOIN G1Empleados ON G1Empleados.EmpleadoID = G1Orden.EmpleadoID   
     JOIN G1DetallesOrdenes ON G1Orden.OrdenID = G1DetallesOrdenes.OrdenID   
      JOIN G1Productos ON G1Productos.ProductoID = G1DetallesOrdenes.ProductoID      
       JOIN G1Transportistas ON G1Transportistas.TransportistasID = G1Orden.EnvioVia;
