use G1Northwind
go

Create View G1Clientes_y_Proveedores_por_Ciudad AS
SELECT TOP 100
        G1Clientes.Ciudad AS Ciudad,
        G1Clientes.NombreCompaņia AS NombreCompaņia,
        G1Clientes.NombreContacto AS NombreContacto,
        'G1Clientes' AS Rela
    FROM
       G1Clientes
		UNION SELECT TOP 100
        G1Proveedores.Ciudad AS Ciudad,
        G1Proveedores.NombreCompaņia AS NombreCompaņia,
        G1Proveedores.NombreContacto AS NombreContacto,
        'G1Proveedores' AS Proveedores
    FROM
		G1Proveedores
    ORDER BY Ciudad , NombreCompaņia