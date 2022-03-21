use G1Northwind
Go

CREATE VIEW G1OrdenesQry AS
SELECT G1Orden.OrdenID,
		G1Orden.ClienteID,
		G1Orden.EmpleadoID,
		G1Orden.FechaOrden,
		G1Orden.FechaRequerida,
		G1Orden.FechadeEntrega,
		G1Orden.EnvioVia,
		G1Orden.Peso,
		G1Orden.Transporte,
		G1Orden.DireccionTransporte,
		G1Orden.CiudaddelTransporte,
		G1Orden.RegiondelTransporte,
		G1Orden.CodigoPostadelTransporte,
		G1Orden.PaisdelTransporte,
		G1Clientes.NombreCompañia,
		G1Clientes.Direccion,
		G1Clientes.Ciudad,
		G1Clientes.Region,
		G1Clientes.CodigoPostal,
		G1Clientes.Pais
FROM (G1Clientes JOIN G1Orden ON ((G1Clientes.ClientesID = G1Orden.ClienteID)));

