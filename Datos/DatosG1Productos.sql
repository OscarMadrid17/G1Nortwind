USE [G1Northwind]
GO

INSERT INTO [dbo].[G1Productos]
           ([NombreProducto]
           ,[ProveedorID]
           ,[CategoriaID]
           ,[CantidadporUnidad]
           ,[PrecioUnitario]
           ,[UnidadesenStock]
           ,[UnidadesenOrden]
           ,[NiveldeReordenamiento]
           ,[Descontinuado])
     VALUES
('Ravioli', '1', '1', '10 cajas x 20 bolsas', '18.000', '39', '0', '15','0'),
('Cafe', '2', '2', '8 latas de 500 g', '35.0000', '17', '40', '20','0'),
('Jarabe de an�s', '3', '3', '5 botes', '18.000', '39', '60', '10','0'),
('Condimento caj�n del Chef Anton', '4', '4', '5 bolsas', '10.000', '30', '70', '25','0'),
('Mezcla de Gumbo', '5', '5', '5 botes', '12.000', '20', '0', '10','0'),
('Crema de Boysenberry de la abuela', '6', '6', '8 cajas', '17.000', '16', '0', '25','0'),
('Peras secas org�nicas', '7', '7', '10 cajas ', '25.000', '125', '0', '30','0'),
('Salsa de ar�ndanos', '8', '8', '15 bolsas', '7.000', '40', '0', '0','0'),
('Queso Cabrales', '9', '9', '8 libras', '50.075', '26', '0', '0','0'),
('Queso Manchego La Pastora', '10', '10', '15 libras', '55.000', '17', '0', '0','0'),
('Tigres de Carnarvon', '11', '11', '15 cajas', '100.000', '15', '40', '15','0'),
('Galletas De Chocolate', '12', '12', '5 paquetes', '25.0000', '35', '0', '10','1'),
('Galletas caramelo', '13', '13', '3 cajas', '15.000', '22', '0', '20','0'),
('Galletas grandes', '14', '14', '5 cajas', '25.650','30', '0', '30','0'),
('Ravioli', '15', '15', '10 cajas x 20 bolsas', '19.000', '39', '0', '20','0'),
('Croissants ', '16', '16', '1 caja', '55.000', '110', '0', '10','0'),
('Mascarpone Fabioli ', '17', '17', '15 bolsas', '60.000', '105', '0', '15','0'),
('Cerveza Sasquatch', '18', '18', '5 cajas', '80.000', '20', '0', '30','0'),
('Carne de cangrejo de Boston', '19', '19', '5 libras', '85.000', '32', '0', '20','0'),
('Sopa de almejas', '20', '20', '12 latas de 12 onzas', '100.600', '19', '50', '10','1'),
('Caf� ', '21', '21', '16 latas de 500 g', '35.000', '18', '0', '20','0'),
('chocolatada', '22', '22', '10 paquetes.', '60.6500', '11', '0', '20','0'),
('Empanadas', '23', '23', '40 ordenes', '62.600', '31', '0', '15','0'),
('Caracoles de Borgo�a', '24', '24', '24 piezas', '15.450', '8', '0', '25','0'),
('tarta de sucre', '25', '25', '48 unidades', '50.600', '9', '0', '15','0'),
('Crema de verduras', '26', '26', '15 tarros de 625 g', '46.407', '16', '0', '25','0'),
('Salsa picante de Luisiana', '27', '27', '32 botellas de 8 onz', '20.000', '19', '0', '30','0'),
('Quimbomb� especiado picante de Luisiana', '28', '28', '24 frascos de 8 onz', '21.000', '35', '30', '10','0'),
('Panes largos escoceses', '29', '29', '8 cajas x 8 piezas', '135.000', '4', '0', '30','1'),
('Cerveza', '30', '30', '24 botellas de 355ml', '35.000', '8', '0', '25','0'),
('Mozzarella', '31', '31', '24 paquetes de 200 g', '28.000', '3', '0', '25','0'),
('Kaviar', '32', '32', '24 botes de 150 g', '20.000', '10', '0', '30','0'),
('Huevos', '33', '33', '8 cajas', '100.000', '19', '0', '30','0'),
('Limones', '34', '34', '5 cajas', '85.000', '25', '0', '15','0'),
('Vodka', '35', '35', '6 cajas de 300ml', '90.800', '2', '0', '15','0'),
('Vino', '36', '36', '9 botellas', '500.000', '45', '0', '10','0'),
('Whisky Escoces', '37', '37', '15 botellas de 400ml', '450.0000', '50', '0', '20','0'),
('Pasta Italiana', '38', '38', '8 paquetes', '60.400', '56', '0', '25','0'),
('Paella Espa�ola', '39', '39', '5 cajas', '80.000', '40', '0', '15','0'),
('Sushi de Jap�n', '40', '40', '6 cajas', '60.000', '30', '0', '10','0'),
('Cerveza', '41', '41', '8 botellas de 200ml', '35.500', '3', '0', '30','1'),
('Mate Argentino', '42', '42', '6 botellas', '38.800', '31', '0', '20','0'),
('Empanadas', '43', '43', '5 piezas', '62.9000', '46', '0', '20','0'),
('Musaca de Grecia.', '44', '44', '10 cajas', '80.000', '15', '0', '10','0'),
('Tacos', '45', '45', '20 ordenes', '18.000', '38', '20', '15','0'),
('Baleadas', '46', '46', '16 ordenes', '15.000', '9', '0', '15','0'),
('Coca Cola', '47', '47', '10 paquetes', '150.000', '7', '0', '30','0'),
('Cerveza Hondure�a', '48', '48', '10 cajas', '100.000', '6', '0', '20','0'),
('Pasta Italiana', '49', '49', '10 paquetes', '80.000', '16', '0', '15','0'),
('Kaviar', '50', '50', '15 botes de 150 g', '20.000', '61', '70', '25','0'),
('Pasta de Curry', '51', '51', '1 Bolsa', '45.000', '61', '30', '25','0'),
('Salsa Limon', '52', '52', '10 botes ', '80.000', '61', '70', '25','0'),
('Salsa Picante', '53', '53', '5 botes de', '50.000', '62', '70', '15','0'),
('Wasabi', '54', '54', '2 botes', '10.000', '64', '70', '45','1'),
('Coca Cola', '55', '55', '8 paquetes ', '150.000', '65', '70', '55','0'),
('Salsa Chipotle', '56', '56', '8 botes ', '50.000', '67', '70', '65','0'),
('Vino', '57', '57', '11 botellas ', '500.000', '69', '70', '75','0'),
('Caf�', '58', '58', '9 latas de 500 g', '35.000', '62', '85', '85','0'),
('Mole Verde', '59', '59', '11 botes ', '80.000', '64', '70', '95','0'),
('Chile ancho', '60', '60', '4 bolsas', '70.000', '66', '70', '15','1'),
('Chile seco', '61', '61', '5 bolsas', '60.000', '51', '85', '25','0'),
('Chile serrano', '62', '62', '3 cajas', '40.000', '41', '60', '55','1'),
('Kaviar', '63', '63', '15 botes ', '50.000', '71', '70', '45','1'),
('Mozzarella', '64', '64', '15 botes ', '20.000', '81', '85', '25','0'),
('jarabe de agave', '65', '65', '15 botes', '95.000', '61', '65', '65','1'),
('Arina de Maiz', '66', '66', '2 kg', '80.000', '11', '70', '25','1'),
('Salsa valentina', '67', '67', '2 botes', '50.000', '59', '70', '25','1'),
('Whisky Escoces', '68', '68', '13 botellas de 400ml', '450.000', '57', '85', '45','0'),
('Huevos', '69', '69', '12 cajas ', '100.000', '51', '65', '55','1'),
('Salsa Chipotle', '70', '70', '5 botes ', '50.000', '81', '60', '15','1'),
('Cerveza Sasquatch', '71', '71', '5 cajas ', '80.000', '58', '75', '5','1'),
('Pasta de Curry', '72', '72', '15 botes ', '80.000', '55', '80', '5','0'),
('Panes largos escoceses', '73', '73', '5 cajas', '135.000', '52', '40', '51','1'),
('Galletas De Chocolate', '74', '74', '8 paquetes ', '25.000', '22', '100', '25','1'),
('Vino', '75', '75', '12 botellas ', '500.000', '23', '70', '15','0'),
('Salsa de ar�ndanos', '76', '76', '2 bolsas', '7.000', '41', '80', '85','0'),
('Kaviar', '77', '77', '4 botes de 160 g', '60.000', '51', '50', '85','0'),
('Vodka', '78', '78', '6 cajas de 300ml ', '90.000', '71', '40', '45','0'),
('Paella Espa�ola', '79', '79', '6 cajas', '80.000', '86', '60', '55','0'),
('Caf�', '80', '80', '6 latas de 500 g', '35.000', '6', '50', '25','1'),
('Queso Manchego La Pastora', '81', '81', '8 libras', '55.000', '71', '60', '25','0'),
('Kaviar', '82', '82', '6 botes ', '70.000', '71', '50', '15','0'),
('Empanadas', '83', '83', '15 botes ', '62.000', '81', '70', '15','0'),
('Jarabe de an�s', '84', '84', '15 botes', '18.000', '91', '60', '25','1'),
('Galletas caramelo', '85', '85', '7 cajas', '15.000', '41', '70', '24','1'),
('Mozzarella', '86', '86', '15 botes ', '250.000', '21', '60', '27','1'),
('Cerveza Hondure�a', '87', '87', '6 cajas', '100.000', '11', '60', '26','1'),
('Mozzarella', '88', '88', '12 paquetes', '28.000', '52', '50', '215','0'),
('Tacos', '89', '89', '6 ordenes ', '18.000', '71', '55', '21','1'),
('Chile ancho', '90', '90', '5 bolsas', '70.000', '31', '50', '1','1'),
('Chile serrano', '91', '91', '3 cajas', '40.000', '41', '50', '215','0'),
('Kaviar', '92', '92', '8 botes de 140 g', '40.000', '21', '60', '21','1'),
('Vodka', '93', '93', '7 cajas de 300ml', '90.000', '61', '80', '21','0'),
('Limones', '94', '94', '7 cajas', '85.000', '51', '75', '1','0'),
('Salsa Limon', '95', '95', '15 botes ', '80.000', '81', '75', '15','1'),
('Salsa valentina', '96', '96', '8 botes', '50.000', '21', '76', '15','0'),
('Ravioli', '97', '97', '5 cajas ', '19.000', '21', '78', '15','1'),
('Cerveza Sasquatch', '98', '98', '15 cajas ', '80.000', '41', '80', '25','0'),
('Vino', '99', '99', '10 botellas ', '500.000', '11', '70', '25','1'),
('Panes largos escoceses', '100', '100', '2 cajas', '135.000','11', '60','15','0'),
('Tacos', '101', '101', '13 ordenes ', '18.000', '31', '60', '15','0'),
('Salsa de ar�ndanos', '102', '102', '5 bolsas', '7.000', '81', '75', '25','1'),
('Mole Verde', '103', '103', '6 botes', '80.000', '71', '50', '23','0'),
('Pasta de Curry', '104', '104', '5 bolsas', '45.000', '41', '50', '2','1'),
('Galletas De Chocolate', '105', '105', '3 cajas', '25.000', '41', '50', '35','0'),
('Cerveza Hondure�a', '106', '106', '16 cajas', '100.000', '51', '50', '35','0'),
('Wasabi', '107', '107', '15 botes de 150 g', '50.000', '51', '50', '35','0'),
('jarabe de agave', '108', '108', '8 botes', '95.000', '61', '70', '35','1'),
('Queso Manchego La Pastora', '109', '109', '6 libras', '55.000', '61', '60', '35','0'),
('Kaviar', '110', '110', '8 botes de 150 g', '50.000', '71', '60', '35','0'),
('Kaviar', '111', '111', '6 botes de 160 g', '60.000', '81', '60', '25','0'),
('Empanadas', '112', '112', '15 botes de 150 g', '62.000', '81', '60', '55','1'),
('Galletas caramelo', '113', '113', '6 cajas', '15.000', '81', '50', '55','0'),
('Tacos', '114', '114', '15 botes de 150 g', '18.000', '11', '50', '45','0'),
('Chile seco', '115', '115', '11 bolsas', '60.000', '21', '20', '45','0'),
('Arina de Maiz', '116', '116', '5 kg', '80.000', '31', '20', '45','1'),
('Paella Espa�ola', '117', '117', '2 cajas', '80.000', '41', '50', '45','0'),
('Camarones', '118', '118', '3 libras', '95.000', '51', '40', '45','0'),
('Huevos', '119', '119', '5 cajas', '100.000', '61', '40', '45','0'),
('Chile ancho', '120', '120', '5 bolsas', '70.000', '71', '90', '95','1'),
('Jarabe de an�s', '121', '121', '3 botes', '18.000', '81', '90', '95','0'),
('Mozzarella', '122', '122', '6 paquetes', '28.000', '91', '90', '95','0'),
('Kaviar', '123', '123', '15 botes de 150 g', '80.000', '90', '90', '95','0'),
('Caf�', '124', '124', '2 latas de 500 g', '35.000', '41', '90', '95','0'),
('Mozzarella', '125', '125', '15 botes de 150 g', '70.000', '21', '90', '65','1'),
('Chile serrano', '126', '126', '9 cajas', '40.000', '21', '90', '75','0'),
('Whisky Escoces', '127', '127', '15 botellas de 400ml', '450.000', '41', '70', '85','0'),
('Panes largos escoceses', '128', '128', '4 cajas', '135.000', '51', '70', '85','0'),
('Kaviar', '129', '129', '15 botes de 150 g', '80.000', '41', '60', '55','0'),
('Cerveza Hondure�a', '130', '130', '4 cajas', '100.000', '41', '60', '55','1'),
('Kaviar', '131', '131', '10 botes de 150 g', '50.000', '41', '70', '65','0'),
('Kaviar', '132', '132', '11 botes de 150 g', '50.000', '41', '30', '5','0'),
('Salsa Chipotle', '133', '133', '8 botes ', '50.000', '61', '30', '42','0'),
('Vodka', '134', '134', '5 cajas de 300ml', '90.000', '41', '30', '15','0'),
('Paella Espa�ola', '135', '135', '6 cajas', '80.000', '41', '73', '35','1'),
('Limones', '136', '136', '3 cajas', '85.000', '21', '30', '55','0'),
('Yuca', '137', '137', '5 libras', '30.000', '21', '30', '15','0'),
('Kaviar', '138', '138', '15 botes de 140 g', '40.000', '21', '30', '55','0'),
('Cerveza Sasquatch', '139', '139', '9 cajas', '80.000', '21', '75', '65','0'),
('Salsa valentina', '140', '140', '12 botes', '50.000', '21', '35', '15','1'),
('Salsa de ar�ndanos', '141', '141', '6 bolsas', '7.000', '81', '70', '45','0'),
('Filete de Tilapia', '142', '142', '6 libras', '60.000', '81', '20', '55','0'),
('Camarones', '143', '143', '10 libras', '95.000', '81', '7', '21','1'),
('Aceite de palma', '144', '144', '10 botes', '70.000', '81', '50', '12','0'),
('Azucar', '145', '145', '2 bolsas', '50.000', '51', '15', '24','0'),
('Pepinillos', '146', '146', '9 botes', '35.000', '45', '85', '26','0'),
('Filete de Tilapia', '147', '147', '8 libras', '60.000', '62', '20', '28','1'),
('Camote', '148', '148', '20 libras', '40.000', '64', '25', '29','0'),
('Aceite de palma', '149', '149', '12 botes', '70.000', '65', '26', '22','0'),
('Empanadas', '150', '150', '15 botes de 150 g', '62.000', '66', '20', '21','1'),
('Pasta de Curry', '151', '151', '1 Bolsa ', '45.000', '61', '70', '26','0'),
('Filete de Tilapia', '152', '152', '9 libras', '60.000', '62', '70', '45','0'),
('Camarones', '153', '153', '11 libras', '95.000', '64', '20', '45','0'),
('Camote', '154', '154', '3 libras', '40.000', '65', '60', '25','1'),
('Arina de Maiz', '155', '155', '3 kg', '80.000', '67', '60', '15','0'),
('Caf�', '156', '156', '8 latas de 500 g', '35.000', '68', '20', '55','0'),
('Azucar', '157', '157', '5 bolsas', '50.000', '69', '60', '35','0'),
('Camote', '158', '158', '4 libras', '40.000', '69', '50', '45','0'),
('Kaviar', '159', '159', '15 botes de 140 g', '40.000', '64', '50', '24','0'),
('Salsa Limo', '160', '160', '15 botes de 150 g', '20.000', '65', '50', '23','1'),
('Aceite de palma', '161', '161', '8 botes', '70.000', '61', '50', '25','0'),
('Pepinillos', '162', '162', '7 botes', '35.000', '65', '40', '25','1'),
('Jalape�o', '163', '163', '3 botes', '20.000', '64', '75', '35','1'),
('Azucar', '164', '164', '5 bolsas', '50.000', '6', '75', '35','0'),
('Jalape�o', '165', '165', '3 botes', '20.000', '63', '65', '45','1'),
('Pepinillos', '166', '166', '6 botes', '35.000', '67', '45', '25','1'),
('Paella Espa�ola', '167', '167', '10 cajas', '80.000', '64', '50', '25','1'),
('jarabe de agave', '168', '168', '11 botes', '95.000', '65', '60', '15','0'),
('Mole Verde', '169', '169', '8', '80.000', '66', '60', '65','1'),
('Mozzarella', '170', '170', '15 botes de 150 g', '20.000', '62', '50', '15','1'),
('Galletas De Chocolate', '171', '171', '3 paquetes', '25.000', '64', '46', '45','1'),
('Jalape�o', '172', '172', '11 botes ', '20.000', '64', '78', '45','0'),
('Galletas caramelo', '173', '173', '4 cajas', '15.000', '61', '88', '55','1'),
('Yuca', '174', '174', '3 libras', '30.000', '612', '94', '26','1'),
('Chile seco', '175', '175', '3 bolsas', '60.000', '62', '20', '18','0'),
('Chile serrano', '176', '176', '7 cajas', '40.000', '61', '60', '17','0'),
('jarabe de agave', '177', '177', '11 botes', '95.000', '61', '30', '18','0'),
('Mole Verde', '178', '178', '6 botes', '80.000', '71', '30', '19','0'),
('Chile seco', '179', '179', '5 bolsas', '60.000', '81', '75', '17','0'),
('Camote', '180', '180', '4 libras', '40.000', '81', '65', '20','1'),
('Pepinillos', '181', '181', '7 botes', '35.000', '71', '40', '26','0'),
('Azucar', '182', '182', '6 bolsas', '50.000', '81', '50', '24','0'),
('Tacos', '183', '183', '13 ordenes', '18.000', '85', '60', '23','0'),
('Camarones', '184', '184', '6 libras', '95.000', '54', '70', '23','1'),
('Huevos', '185', '185', '6 cajas', '100.000', '54', '80', '24','1'),
('Ravioli', '186', '186', '6 cajas', '19.000', '55', '90', '35','1'),
('Whisky Escoces', '187', '187', '15 botellas de 400ml', '450.000', '55', '20', '15','1'),
('Arina de Maiz', '188', '188', '4 kg', '80.000', '55', '10', '45','0'),
('jarabe de agave', '189', '189', '14 botes', '95.000', '54', '50', '35','1'),
('Chile seco', '190', '190', '6 bolsas', '60.000', '62', '40', '60','1'),
('Chile ancho', '191', '191', '6 bolsas', '70.000', '64', '60', '14','0'),
('Pasta de Curry', '192', '192', '5 bolsas', '45.000', '41', '50', '13','1'),
('Vodka', '193', '193', '15 botes de 150 g', '20.000', '14', '70', '14','0'),
('Spaguetti chitarra', '194', '194', '6 cajas', '30.000', '4', '80', '34','0'),
('Spaguetti Grossi ', '195', '195', '6 cajas', '30.000', '14', '90', '55','1'),
('Spaguetti', '196', '196', '5 cajas', '28.000', '13', '60', '30','0'),
('Tomate', '197', '197', '5 botes', '20.000', '13', '30', '34','1'),
('Kaviar', '198', '198', '15 botes de 150 g', '20.000', '13', '40', '31','0'),
('Vino', '199', '199', '8 botellas', '500.000', '17', '50', '31','1'),
('Salsa Limon', '200', '200', '15 botes', '80.000', '54', '20', '30','0');

GO


