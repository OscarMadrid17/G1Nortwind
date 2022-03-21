use G1Northwind
go

Create View G1Clientes_y_Proveedores_por_Ciudad AS
SELECT TOP 100
        G1Clientes.Ciudad AS Ciudad,
        G1Clientes.NombreCompa�ia AS NombreCompa�ia,
        G1Clientes.NombreContacto AS NombreContacto,
        'G1Clientes' AS Rela
    FROM
       G1Clientes
		UNION SELECT TOP 100
        G1Proveedores.Ciudad AS Ciudad,
        G1Proveedores.NombreCompa�ia AS NombreCompa�ia,
        G1Proveedores.NombreContacto AS NombreContacto,
        'G1Proveedores' AS Proveedores
    FROM
		G1Proveedores
    ORDER BY Ciudad , NombreCompa�ia