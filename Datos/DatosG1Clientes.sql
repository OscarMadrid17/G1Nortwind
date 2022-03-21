USE [G1Northwind]
GO

INSERT INTO [dbo].[G1Clientes]
           ([ClientesID]
           ,[NombreCompa�ia]
           ,[NombreContacto]
           ,[TituloContacto]
           ,[Direccion]
           ,[Ciudad]
           ,[Region]
           ,[CodigoPostal]
           ,[Pais]
           ,[Telefono]
           ,[Fax])
     VALUES
('201','Supermercados Sabeco','Bruno Santos','Auditora ','Ps. de la Castellana, 95. ','Le�n','Madrid','28046','Espa�a','948368101','328325892'),
('1','Apple Inc','Angelino Grau','Vendedor','Calle agustin lara no. 69-b','Tuxtepec','Oaxaca','68370','M�xico','2875278152','5664919245'),
('2','Aramco','Amelia Marcos Flor','Guardia','Av. Independencia no. 241','Tuxtepec','Oaxaca','68300','M�xico','9287500172','2502771683'),
('3','Microsoft Corp','Agustina Marco Carbajo','Analista de sistema','Av. Independencia no. 779','Tuxtepec','Oaxaca','68300','M�xico','2569635896','2108627820'),
('4','Amazon.Com Inc','Claudia de Mateo','Concerje','Av. 20 de noviembre no.1024','Tuxtepec','Oaxaca','68300','M�xico','45896311566','8351569376'),
('5','Alphabet Inc','Calixta Vives Castilla','IT','Carretera a loma alta s/n.','Tuxtepec','Oaxaca','68360','M�xico','1589686952','6686637410'),
('6','Tencent','Ovidio Talavera Blanca','Supervisor de ventas','Av. 20 de noviembre no. 1060','Tuxtepec','Oaxaca','68300','M�xico','6587569625','7830970356'),
('7','Facebook Inc','Mauricio Ortu�o Campillo','Gerente de mercadeo','Calle zaragoza no. 1010','M�xico D.F.','M�xico D.F.','68380','M�xico','4568596325','8006301515'),
('8','Tesla Inc','W�lter Lobato Pav�n','Dise�ador','Calle matamoros no. 310','Tuxtepec','Oaxaca','68300','M�xico','1205997596','6917150516'),
('9','Alibaba','Marcelino Perera Amador','Gerente de ventas','Av. 20 de noviembre no.859-b','Tuxtepec','Oaxaca','68300','M�xico','2365654587','6399500115'),
('10','Berkshire Hath','Teresita Jord� Arranz','Gerente de producci�n','Av. 20 de noviembre no 1053','Tuxtepec','Oaxaca','68300','M�xico','9632587458','9871722783'),
('11','TSMC','Leocadio Verdugo L�pez','Gerente de recursos humanos','Blvd. Benito juarez no. 1466-a','Tuxtepec','Oaxaca','68335','M�xico','7896523698','4968429539'),
('12','Visa Inc','Iris Pino Abascal','Control de calidad','Calle matamoros no.280','Tuxtepec','Oaxaca','68300','M�xico','4589632059','9365748918'),
('13','JP Morgan Chase','Buenaventura Milla Pallar�s','Asistente de administraci�n','Av. Independencia no. 545','Tuxtepec','Oaxaca','68300','M�xico','1593578695','4968057576'),
('14','Samsung','Marta Iglesia Neira','Ingeniero en sistemas','Av. Independencia no. 1282-a','Tuxtepec','Oaxaca','68300','M�xico','4595859633','5090948327'),
('15','Johnson&Johnson','Maribel Rossell� Guardia','Asistente de mercadeo','Calle matamoros no. 127','Tuxtepec','Oaxaca','68300','M�xico','2236696993','3993808558'),
('16','Kweichow Mouta','Ger�nimo Parra Sans','Gerente administraci�n','Av.independencia no.1010','Tuxtepec','Oaxaca','68300','M�xico','5569698869','6980001959'),
('17','Walmart Inc','Dolores Carbajo-Paredes','Servicio al cliente','Av. 5 de mayo no. 1652','Tuxtepec','Oaxaca','68300','M�xico','9969586330','6689885693'),
('18','Mastercard Inc','Joan Zamora','Auxiliar de contadur�a','Av. 5 de mayo no. 1108','Tuxtepec','Oaxaca','68300','M�xico','8589636574','5474086035'),
('19','Walt Disney Co','Patricio de Carre�o','Dise�o de animaciones','Av. Independencia no. 748','Tuxtepec','Oaxaca','68300','M�xico','9965895636','1706085654'),
('20','Nvidia Corp','Juana M�nguez Go�i','Gerente de contadur�a','Av. Independencia no. 985-a','Tuxtepec','Oaxaca','68300','M�xico','9696325896','9305932018'),
('21','Lvmh Moet Henne','Tadeo Guerra C�rdenas','Vendedor','Av. Independencia no. 985-a','Tuxtepec','Oaxaca','68300','M�xico','9693259658','6535064620'),
('22','Unitedhealth Grp','Bernardo Sedano','Guardia','Blvd. Benito juarez s / n','Tuxtepec','Oaxaca','68300','M�xico','9695452563','1179102121'),
('23','Paypal Holdings','Natividad Navas Rosell�','Analista de sistema','Matamoros no 149','Tuxtepec','Oaxaca','68300','M�xico','7875896632','6418689325'),
('24','Procter & Gamble','Manu S�ez Araujo','Concerje','Av. 5 de mayo no 1100-a','Tuxtepec','Oaxaca','68300','M�xico','5568597458','7926197319'),
('25','Bank Of America','Eric Pascual Segarra','IT','Av. 20 de noviembre no 1540','M�xico D.F.','M�xico D.F.','68380','M�xico','3305698596','1208091248'),
('26','Nestl�','Paulina Exp�sito Gimenez','Supervisor de ventas','Av. 5 de mayo no 1253','Tuxtepec','Oaxaca','68300','M�xico','6965859632','4648710684'),
('27','Roche','Francisca Roura-Navarro','Gerente de mercadeo','Calle ocampo no 14','Tuxtepec','Oaxaca','68300','M�xico','5504849963','1691138048'),
('28','ICBC','Eulalia de Cabello','Dise�ador','Blvd. Benito juarez esq. 20 de noviembre s/n','Tuxtepec','Oaxaca','68300','M�xico','5128753777','4428709768'),
('29','Home Depot Inc','Concha Crespi Font','Gerente de ventas','Calle aldama no 156','Tuxtepec','Oaxaca','68300','M�xico','4458596526','1530210125'),
('30','Meituan','Blanca Palma Solana','Gerente de producci�n','Av. Independencia no 145','Tuxtepec','Oaxaca','68300','M�xico','4528753090','4679619596'),
('31','Intel Corp','Josefa �lvaro','Gerente de recursos humanos','Av. 20 de noviembre no 1046','Tuxtepec','Oaxaca','68300','M�xico','2875431255','2634754870'),
('32','Comcast Corp','Prudencia del Ayala','Control de calidad','Calle ignacio rayon no.949','Tuxtepec','Oaxaca','68340','M�xico','9128752569','5731692658'),
('33','Toyota Motor','Florinda Segura �lvaro','Asistente de administraci�n','Calle ignacio rayon no.934','Tuxtepec','Oaxaca','68340','M�xico','3928752569','3316794559'),
('34','Netflix Inc','Roxana J�dar','Ingeniero en sistemas','Av. 20 de nov. No. 881 esq. Aldama','Tuxtepec','Oaxaca','68300','M�xico','9279153219','1299206222'),
('35','ASML Holding','Cleto Samu Sol�s Rosa','Asistente de mercadeo','Av. 20 de noviembre no. 1178','Tuxtepec','Oaxaca','68300','M�xico','9128751547','8885542002'),
('36','Ping An','Susanita Patricia Mayo Belda','Gerente administraci�n','Av. 5 de mayo no. 1226','Tuxtepec','Oaxaca','68300','M�xico','5128751961','3971015248'),
('37','Exxon Mobil Corp','Vicenta Iborra','Servicio al cliente','Av. Independencia s/n ext. Del mercado central esq. Benito','Tuxtepec','Oaxaca','68300','M�xico','9628753656','1430839854'),
('38','Verizon Communic','Marina Cerezo','Auxiliar de contadur�a','Matamoros no 85 esq. 20 de noviembre','Tuxtepec','Oaxaca','68300','M�xico','2328753665','5103578468'),
('39','Adobe Inc','Laura Caparr�s Santamaria','Dise�o de animaciones','Av. 20 de noviembre no 1320','Tuxtepec','Oaxaca','68300','M�xico','5896584595','7906365906'),
('40','Nike Inc','Juan Luis Cabanillas','Gerente de contadur�a','Calle ocampo no. 254','Tuxtepec','Oaxaca','68300','M�xico','4596635698','8528302988'),
('41','Abbott Labs','Sebasti�n Ojeda Ramos','Vendedor','Av.independencia no. 678','Tuxtepec','Oaxaca','68300','M�xico','4847579658','4614374435'),
('42','Coca-Cola Co','Cecilia Murillo Salvador','Guardia','Av. Independencia n0.677','M�xico D.F.','M�xico D.F.','68380','M�xico','4859636589','6885479772'),
('43','Novartis','�urea Carballo Bernal','Analista de sistema','Calle morelos no. 72-b','Tuxtepec','Oaxaca','68300','M�xico','5965852569','3047790434'),
('44','Pinduoduo Inc','Rebeca Nidia Bustamante Su�rez','Concerje','Calle aldama no.50','Tuxtepec','Oaxaca','68300','M�xico','2154849658','7166903981'),
('45','L�Oreal','Toribio Nogueira Quiroga','IT','Calle ignacio matias no.6','Tuxtepec','Oaxaca','68320','M�xico','2569632569','4698534225'),
('46','Ccb-H','Paloma Porcel Jerez','Supervisor de ventas','Av. Independencia no. 670','Tuxtepec','Oaxaca','68300','M�xico','5899658595','3908902988'),
('47','AT&T Inc','Mar�a Del Carmen del Gimeno','Gerente de mercadeo','Prol.5 de mayo no.786','Tuxtepec','Oaxaca','68360','M�xico','6497585958','1504767190'),
('48','Salesforce.Com','Encarnaci�n Barrena-Ayll�n','Dise�ador','Av. Libertad no. 495','Tuxtepec','Oaxaca','68300','M�xico','9968596595','3886869771'),
('49','China Merch Bk','Florina Salda�a Bauz�','Gerente de ventas','Av. 5 no. 1186 a','Tuxtepec','Oaxaca','68310','M�xico','9366958965','6387955145'),
('50','Eli Lilly & Co','Susana Tejada','Gerente de producci�n','Av. 5 no.1186-a','Tuxtepec','Oaxaca','68310','M�xico','9699589659','6541128106'),
('51','Softbank Group C','Maura Mateu','Gerente de recursos humanos','Av. 20 de noviembre esq. Juarez','Tuxtepec','Oaxaca','68300','M�xico','6958962594','7448625681'),
('52','Chevron Corp','Nazaret Vendrell Collado','Control de calidad','Av. Independencia n0.670','Tuxtepec','Oaxaca','68300','M�xico','9663595498','7503182308'),
('53','Prosus Nv','Le�n Rossell�-Arce','Asistente de administraci�n','Calle benito juarez no.495','Tuxtepec','Oaxaca','68340','M�xico','9658494859','9424002670'),
('54','Broadcom Inc','Eduardo Carri�n Criado','Ingeniero en sistemas','20 de noviembre no. 955','Tuxtepec','Oaxaca','68300','M�xico','5859658547','9496510524'),
('55','Abbvie Inc','Merche Bello Casals','Asistente de mercadeo','Av. Independencia 918','Tuxtepec','Oaxaca','68300','M�xico','5848475255','5973684851'),
('56','Oracle Corp','Pastora Mir�-Arcos','Gerente administraci�n','Av independencia 565-a','Tuxtepec','Oaxaca','68300','M�xico','5958595686','2802719239'),
('57','Cisco Systems','Jose Carlos Buend�a Vera','Servicio al cliente','Calle matamoros no. 325','Tuxtepec','Oaxaca','68300','M�xico','4848596589','6058897273'),
('58','Reliance Inds','Alfredo de Rozas','Auxiliar de contadur�a','Calle riva palacios no. 465','Tuxtepec','Oaxaca','68300','M�xico','9696369589','9518937277'),
('59','Pfizer Inc','Mar�a Jes�s V�zquez Martorell','Dise�o de animaciones','Av. 20 de noviembre no. 1291','Tuxtepec','Oaxaca','68300','M�xico','2526539658','6974162045'),
('60','Merck & Co','Mar�a Teresa Mir Mari�o','Gerente de contadur�a','5 de mayo 1038','Tuxtepec','Oaxaca','68300','M�xico','9695356565','4403158185'),
('61','Bhp Group Ltd','Lilia Pel�ez Cuadrado','Vendedor','Independencia 748','Tuxtepec','Oaxaca','68300','M�xico','9594848525','4092335639'),
('62','Pepsico Inc','Jerem�as del Artigas','Guardia','Av. 20 de noviembre no. 963','Tuxtepec','Oaxaca','68300','M�xico','5655998585','1193494257'),
('63','Thermo Fisher','Angelina Zaragoza-B�rcena','Analista de sistema','Av. Independencia no. 748','Tuxtepec','Oaxaca','68300','M�xico','5437268906','3276196735'),
('64','ABC','Noelia Rold�n G�mez','Concerje','Av. 20 de noviembre no.1896','M�xico D.F.','M�xico D.F.','68380','M�xico','2089243815','4164468727'),
('65','Wuliangye Yibi','Natanael Lobato Barriga','IT','5 de mayo 1660','Tuxtepec','Oaxaca','68300','M�xico','8453519199','4401120704'),
('66','Novo Nordisk','Georgina Isaura Ricart Bl�zque','Supervisor de ventas','20 de noviembre esq juarez','Tuxtepec','Oaxaca','68300','M�xico','6399826117','1765353618'),
('67','Accenture Plc','Cebri�n Iglesias Ari�o','Gerente de mercadeo','Av. Jesus carranza no. 991','Tuxtepec','Oaxaca','68300','M�xico','6011830846','9310217297'),
('68','Kuaishou Technol','Rosal�a Cornejo Bosch','Dise�ador','Ocampo 254-b','Tuxtepec','Oaxaca','68300','M�xico','9514386457','7799754007'),
('69','Shopify Inc','Marc Jara Velasco','Gerente de ventas','Av. Independencia no. 240','Tuxtepec','Oaxaca','68300','M�xico','9349500809','5573303168'),
('70','Texas Instrument','Pepita Manzanares Belda','Gerente de producci�n','Av. Independencia no. 545-d','Tuxtepec','Oaxaca','68300','M�xico','4941189725','5655821232'),
('71','Medtronic Plc','Susanita Zabaleta Saura','Gerente de recursos humanos','Av. Jesus carranza no. 60','Tuxtepec','Oaxaca','68340','M�xico','3417323414','7460838278'),
('72','Danaher Corp','Paco Esteban Abascal','Control de calidad','Av. Robertyo colorado 1350','Tuxtepec','Oaxaca','68321','M�xico','3055623605','6737495708'),
('73','Qualcomm Inc','Lara Ochoa Gomis','Asistente de administraci�n','C. Aldama no. 153','Tuxtepec','Oaxaca','68300','M�xico','8415481806','2777573966'),
('74','Royal Dutch Sh','Pastora del Aranda','Ingeniero en sistemas','Av. Libertad no. 34','Tuxtepec','Oaxaca','68300','M�xico','1722255865','5164493074'),
('75','Mcdonalds Corp','Alondra Jover Santana','Asistente de mercadeo','Av. 20 de noviembre no. 1020','Tuxtepec','Oaxaca','68300','M�xico','9155637435','4590629286'),
('76','Sap Se','Serafina Benavente Pastor','Gerente administraci�n','Camino loma alta no. 1000','Tuxtepec','Oaxaca','68350','M�xico','2303664820','6621671978'),
('77','Aia','Florencio Hidalgo Carlos','Servicio al cliente','Av. Independencia no. 579','Tuxtepec','Oaxaca','68300','M�xico','4992487862','1486650280'),
('78','Wells Fargo & Co','Beatriz Salas Nieto','Auxiliar de contadur�a','Calle 21 de marzo no. 17','Tuxtepec','Oaxaca','68350','M�xico','1138277574','7859758855'),
('79','T-Mobile Us Inc','Guadalupe Feijoo Sureda','Dise�o de animaciones','Calle matamoros no. 2-b','Tuxtepec','Oaxaca','68300','M�xico','3426375051','6158260176'),
('80','Jd.Com Incdr','Carlito Belmonte Ferrando','Gerente de contadur�a','Independencia no. 717','Tuxtepec','Oaxaca','68300','M�xico','9210693369','7173906792'),
('81','Costco Wholesale','Amor Fern�ndez','Vendedor','18 de marzo no. 1111','Tuxtepec','Oaxaca','68300','M�xico','2165682968','3001843950'),
('82','Tata Consultancy','Dimas Segura Lastra','Guardia','Av. Independencia no. 1054','Tuxtepec','Oaxaca','68300','M�xico','2939660729','5362539468'),
('83','Rio Tinto Ltd','Martin Torrijos Castell','Analista de sistema','Aldama 19-13','Tuxtepec','Oaxaca','68300','M�xico','8791958887','9280597893'),
('84','Nextera Energy','Leandro Carbonell','Concerje','Av.libertad no. 33','Tuxtepec','Oaxaca','68300','M�xico','6716556154','9845609655'),
('85','Rio Tinto Plc','Martirio Mur Bad�a','IT','Av. Independencia no. 85','Tuxtepec','Oaxaca','68300','M�xico','6999095974','6676006895'),
('86','China Mobile','Jos� Manuel Carb� Salmer�n','Supervisor de ventas','Calle matamoros no. 237','Tuxtepec','Oaxaca','68300','M�xico','5965711437','1206452558'),
('87','Honeywell Intl','Raimundo Aguilera El�as','Gerente de mercadeo','Callejon de la noche triste no.23','Tuxtepec','Oaxaca','68300','M�xico','4908408595','7444002071'),
('88','Morgan Stanley','Petrona del Tejedor','Dise�ador','Calle ocampo no. 231','Tuxtepec','Oaxaca','68300','M�xico','1996734544','4869284449'),
('89','Charter Commun','Consuela Cayetana Villalonga J','Gerente de ventas','Ocampo no. 231','Tuxtepec','Oaxaca','68300','M�xico','7242263122','3577680757'),
('90','Union Pac Corp','Amado Juli�n Mendez','Gerente de producci�n','Calle morelos no. 44','Tuxtepec','Oaxaca','68300','M�xico','8958983529','4208421377'),
('91','Citigroup Inc','Gil Hoyos-Soler','Gerente de recursos humanos','Av daniel soto 738','Tuxtepec','Oaxaca','68321','M�xico','3509282923','8177503400'),
('92','Bristol-Myer Sqb','Leire Parejo Briones','Control de calidad','Av. Independencia no. 1231 a','Tuxtepec','Oaxaca','68320','M�xico','4174223069','8218029166'),
('93','United Parcel','Patricia Adelina Sarabia Gil','Asistente de administraci�n','Av. Independencia no. 562','Tuxtepec','Oaxaca','68300','M�xico','8804330253','2856060470'),
('94','Unilever Plc','Sim�n Soler Ripoll','Ingeniero en sistemas','Av. 5 de mayo no. 583','Tuxtepec','Oaxaca','68300','M�xico','4092212815','5779676350'),
('95','Bank Of China-H','Adoraci�n I�iguez Pi�a','Asistente de mercadeo','Av. Libertad no. 56','Tuxtepec','Oaxaca','68300','M�xico','5755835189','2384389197'),
('96','Sony Corp','Joel Donaire-Rozas','Gerente administraci�n','Av. Independencia no. 500','Tuxtepec','Oaxaca','68300','M�xico','4693156447','9836962726'),
('97','Siemens','Fito Espa�ol','Servicio al cliente','Av. Independencia n0.562','Tuxtepec','Oaxaca','68300','M�xico','9782728817','4817956967'),
('98','Philip Morris','Amaya Jimenez Jurado','Auxiliar de contadur�a','Av. 20 de noviembre 795','Tuxtepec','Oaxaca','68300','M�xico','4580436984','1724851124'),
('99','Amgen Inc','Maricela Amat Carpio','Dise�o de animaciones','Av. Principal s/n.','Tuxtepec','Oaxaca','68430','M�xico','1787179950','2814883348'),
('100','Linde Plc','Viviana Muro-Portero','Gerente de contadur�a','Av independencia no 219','Tuxtepec','Oaxaca','68300','M�xico','2535307996','8376304926'),
('101','Sap Se','Glauco Larra�aga Salom','Vendedor','Av. Independencia no. 545-d','Tuxtepec','Oaxaca','68300','M�xico','4047027978','6093295383'),
('102','Aia','Casemiro Jara Riba','Guardia','Av. Independencia no. 740','Tuxtepec','Oaxaca','68300','M�xico','3056905695','5623664627'),
('103','Wells Fargo & Co','Emperatriz Vives Bellido','Analista de sistema','Matamoros no. 327','Tuxtepec','Oaxaca','68300','M�xico','6175558246','3790186560'),
('104','T-Mobile Us Inc','Susanita Amaya Villar','Concerje','Km.13 carret. Cd. Aleman-tuxtepec','Tuxtepec','Oaxaca','68330','M�xico','3524241204','7327981618'),
('105','Jd.Com Incdr','Arsenio F�bregas Castrillo','IT','Av. Independencia no. 1639','Tuxtepec','Oaxaca','68300','M�xico','1370628975','2109903779'),
('106','Medtronic Plc','Joel Moliner Manj�n','Supervisor de ventas','Av.independ.no. 1065','M�xico D.F.','M�xico D.F.','68380','M�xico','5261096116','7386505667'),
('107','Danaher Corp','Jordi Palomo Mar�','Gerente de mercadeo','Boulevar benito juarez no. 197 -a','Tuxtepec','Oaxaca','60350','M�xico','1412184075','3031234915'),
('108','Qualcomm Inc','Diego Rosell Gras','Dise�ador','Independencia 1519','Tuxtepec','Oaxaca','68300','M�xico','6754536753','9432707863'),
('109','Royal Dutch Sh','Jorge Busquets Coll','Gerente de ventas','Calle morelos no. 24','Tuxtepec','Oaxaca','68300','M�xico','9465556382','5218313558'),
('110','Mcdonalds Corp','Encarnacion Aranda Carretero','Gerente de producci�n','Calle matamoros no. 225','Tuxtepec','Oaxaca','68300','M�xico','6514251004','2802273059'),
('111','Novo Nordisk','Dan Lu�s Cueto','Gerente de recursos humanos','Av. Independencia no. 720','Tuxtepec','Oaxaca','68300','M�xico','7815171634','5547851319'),
('112','Accenture Plc','Lola Samper Llobet','Control de calidad','Av.independencia no. 574','Tuxtepec','Oaxaca','68300','M�xico','4281432684','8566399129'),
('113','Kuaishou Technol','�lvaro Tejera','Asistente de administraci�n','Av. Independencia no. 565-a','Tuxtepec','Oaxaca','68300','M�xico','4874948144','7530077839'),
('114','Shopify Inc','Juanita Garc�a','Ingeniero en sistemas','Av. Libertad no. 956','Tuxtepec','Oaxaca','68300','M�xico','5959250465','1409465854'),
('115','Texas Instrument','Amador Caparr�s Ib��ez','Asistente de mercadeo','Av. Libertad no. 897','Tuxtepec','Oaxaca','68300','M�xico','8579519991','7539536320'),
('116','Sony Corp','Josefina Sol�s Terr�n','Gerente administraci�n','Principal s/n. Temazcal.','Tuxtepec','Oaxaca','68430','M�xico','5001936975','1505061556'),
('117','Siemens','D�bora Jimenez Vilaplana','Servicio al cliente','Hidalgo no. 96','Tuxtepec','Oaxaca','68300','M�xico','5287617227','4520595969'),
('118','Philip Morris','Cloe Gallego','Auxiliar de contadur�a','Calle hidalgo no.96','Tuxtepec','Oaxaca','68300','M�xico','6077373466','2324721887'),
('119','Amgen Inc','Jose Ignacio de Huerta','Dise�o de animaciones','Av. Independencia no. 1457','Tuxtepec','Oaxaca','68300','M�xico','5437619885','4777637233'),
('120','Linde Plc','Celso Landa-Duarte','Gerente de contadur�a','Av. 5 de mayo no. 551','Tuxtepec','Oaxaca','68300','M�xico','8776092439','3163511820'),
('121','Citigroup Inc','Isa�as Alberdi','Vendedor','Calle aldama no. 99','Tuxtepec','Oaxaca','68300','M�xico','7548756855','7371399936'),
('122','Bristol-Myer Sqb','Carina Pina Raya','Guardia','Av. 20 de noviembre no. 1121','Tuxtepec','Oaxaca','68300','M�xico','4122216607','1962368477'),
('123','United Parcel','Filomena Manj�n Valbuena','Analista de sistema','Av. 5 de mayo no. 1953','Tuxtepec','Oaxaca','68300','M�xico','3832085930','3210244238'),
('124','Unilever Plc','Lupita Tomas Ferrer','Concerje','Calle aldama no.720','Tuxtepec','Oaxaca','68300','M�xico','3860136107','5758959326'),
('125','Bank Of China-H','Adora Samper-Soler','IT','Av. 18 de marzo esq. Blvd.m. avila camacho no. 1372','Tuxtepec','Oaxaca','68340','M�xico','1204126157','4043845223'),
('126','China Mobile','Magdalena Dulce Noriega Jurado','Supervisor de ventas','Calle aldama no. 144-a','Tuxtepec','Oaxaca','68300','M�xico','5259162872','3922279595'),
('127','Honeywell Intl','Mario del Quesada','Gerente de mercadeo','Blvd. Benito juarez no. 1291','Tuxtepec','Oaxaca','68335','M�xico','3793143868','2699864097'),
('128','Morgan Stanley','Roxana Mart�','Dise�ador','Av. 20 de noviembre no. 970-b','Tuxtepec','Oaxaca','68300','M�xico','6560586764','9890996953'),
('129','Charter Commun','Reyes Casal Beltran','Gerente de ventas','Calle morelos no.426','Tuxtepec','Oaxaca','68300','M�xico','6779942700','4653515925'),
('130','Union Pac Corp','Cir�aco Paniagua Ar�valo','Gerente de producci�n','Prol. Av. 5 de mayo no. 270','Tuxtepec','Oaxaca','68350','M�xico','1858175939','2655535220'),
('131','Costco Wholesale','Edgardo Arenas Maza','Gerente de recursos humanos','Libertad no. 2005','Tuxtepec','Oaxaca','68300','M�xico','6554772785','6110616631'),
('132','Tata Consultancy','No� Vencesl�s Salmer�n Contrer','Control de calidad','Boulevar bgenito juarez 1291','Tuxtepec','Oaxaca','68335','M�xico','1576681175','1569322847'),
('133','Rio Tinto Ltd','Isidora Mar�a �ngeles Bad�a C�','Asistente de administraci�n','20 de noviembre no. 1081','Tuxtepec','Oaxaca','68300','M�xico','4611648826','4645464520'),
('134','Nextera Energy','Ana Bel�n Torrent-Madrigal','Ingeniero en sistemas','Av. 20 de noviembre no. 1081','Tuxtepec','Oaxaca','68300','M�xico','6519811986','5422253547'),
('135','Rio Tinto Plc','Evaristo Herrero','Asistente de mercadeo','Av. Independencia no. 574','Tuxtepec','Oaxaca','68300','M�xico','2239794684','4342063362'),
('136','Apple Inc','F�tima Gordillo Alsina','Gerente administraci�n','Independencia no. 605','Tuxtepec','Oaxaca','68300','M�xico','2688086195','1880455826'),
('137','Aramco','Gil �lamo Escobar','Servicio al cliente','Av. Independencia no 1021','Tuxtepec','Oaxaca','68300','M�xico','7356226020','6987651917'),
('138','Microsoft Corp','Valentina Go�i-Barrena','Auxiliar de contadur�a','Hidalgo no 689','Tuxtepec','Oaxaca','68340','M�xico','2829175937','2806300969'),
('139','Amazon.Com Inc','Roxana Mancebo-D�ez','Dise�o de animaciones','Av. Independencia no. 497','Tuxtepec','Oaxaca','68300','M�xico','4805361382','3999887538'),
('140','Alphabet Inc','Javier Tejero D�ez','Gerente de contadur�a','Av. Independencia no. 497','Tuxtepec','Oaxaca','68300','M�xico','1713488415','1746642053'),
('141','Tencent','Alberto Carnero Galindo','Vendedor','Avenida 5 de mayo no. 1226','Tuxtepec','Oaxaca','68300','M�xico','7585209822','6559558323'),
('142','Facebook Inc','Serafina Mateu','Guardia','Av independencia no. 545-b','Tuxtepec','Oaxaca','68300','M�xico','4487952746','2590466996'),
('143','Tesla Inc','Carolina Abella','Analista de sistema','Calle matamoros no. 40','Tuxtepec','Oaxaca','68300','M�xico','3611132024','7319174917'),
('144','Alibaba','�frica Arjona-Cerd�n','Concerje','Blvd. Manuel avila camacho 435','Tuxtepec','Oaxaca','68320','M�xico','7641684212','1414480377'),
('145','Berkshire Hath','Cipriano Ram�rez Villaverde','IT','Av. 20 de noviembre no. 1105 esq.ocampo','M�xico D.F.','M�xico D.F.','68380','M�xico','2938594707','5617378127'),
('146','TSMC','Carmelita N��ez Pe�as','Supervisor de ventas','Calle matamoros no. 147','Tuxtepec','Oaxaca','68300','M�xico','5602155274','9040494207'),
('147','Visa Inc','Fernanda Reyes Daza','Gerente de mercadeo','Av. Independencia no. 390 antes 396','Tuxtepec','Oaxaca','68300','M�xico','7260760240','9102836627'),
('148','JP Morgan Chase','Iker Roda Nevado','Dise�ador','Av. 20 de noviembre no. 1027','Tuxtepec','Oaxaca','68300','M�xico','6358809327','2802192512'),
('149','Samsung','Roberto Chaparro Navarro','Gerente de ventas','Av. Independencia no.745-bis','Tuxtepec','Oaxaca','68300','M�xico','9997700200','1866993274'),
('150','Johnson&Johnson','Maxi del Goicoechea','Gerente de producci�n','Av. Jesus carranza no. 123','Tuxtepec','Oaxaca','68340','M�xico','8133710653','1861453978'),
('151','Kweichow Mouta','Maribel Sola Sureda','Gerente de recursos humanos','Av. Jesus carranza no. 123','Tuxtepec','Oaxaca','68340','M�xico','6080960980','9650550878'),
('152','Walmart Inc','Zoraida Alc�ntara Puig','Control de calidad','Av. 20 de nov. No. 1372','M�xico D.F.','M�xico D.F.','68380','M�xico','9679701776','2894109406'),
('153','Mastercard Inc','Clara Pi�ol Ca�izares','Asistente de administraci�n','Av. 5 de mayo no.1380','Tuxtepec','Oaxaca','68300','M�xico','1931210819','3430366454'),
('154','Walt Disney Co','Nieves Laguna Gordillo','Ingeniero en sistemas','Av. Independencia no.117 esq.arista','M�xico D.F.','M�xico D.F.','68380','M�xico','8061322198','5775264214'),
('155','Nvidia Corp','Eloy Hierro-Garc�s','Asistente de mercadeo','20 de noviembre 1501','Tuxtepec','Oaxaca','68300','M�xico','4254553754','8024958491'),
('156','Lvmh Moet Henne','Loreto Maxi Pera Castrillo','Gerente administraci�n','Independencia 85','Tuxtepec','Oaxaca','68300','M�xico','8345487607','9017838228'),
('157','Unitedhealth Grp','Chus Mas Cazorla','Servicio al cliente','Daniel soto no.370','Tuxtepec','Oaxaca','68320','M�xico','1842297725','5823102593'),
('158','Paypal Holdings','Dorita del Moliner','Auxiliar de contadur�a','Av. Independencia no. 611','Tuxtepec','Oaxaca','68300','M�xico','7549964840','3374958780'),
('159','Procter & Gamble','Natalia Asenjo Almaz�n','Dise�o de animaciones','Av. Independencia no. 413','Tuxtepec','Oaxaca','68300','M�xico','8773505473','6824783709'),
('160','Bank Of America','Rosa Cardona-Bar�','Gerente de contadur�a','Calle ocampo no.420','Tuxtepec','Oaxaca','68300','M�xico','8842532270','5427668546'),
('161','Nestl�','Leonardo Caparr�s B�rcena','Vendedor','Prolong. Independencia no. 2237','Tuxtepec','Oaxaca','68350','M�xico','4961446401','3635192189'),
('162','Roche','Mireia Rico','Guardia','Av. Independencia no. 718','Tuxtepec','Oaxaca','68300','M�xico','6406049214','5677358824'),
('163','ICBC','Rosaura Mata Arias','Analista de sistema','Av. 1o. De mayo no. 29','Tuxtepec','Oaxaca','68320','M�xico','7857861291','3374596492'),
('164','Home Depot Inc','Bautista Martinez-Vidal','Concerje','Calle aldama no.233-a','Tuxtepec','Oaxaca','68300','M�xico','8420331282','7422587470'),
('165','Meituan','Anselmo Abad Montenegro','IT','Av. Independencia no.147','Tuxtepec','Oaxaca','68300','M�xico','5663580352','8704759724'),
('166','Intel Corp','Eric de Ure�a','Supervisor de ventas','Independencia no. 569 b','Tuxtepec','Oaxaca','68300','M�xico','1889620803','1023494241'),
('167','Comcast Corp','Eusebio Melero Tejada','Gerente de mercadeo','Libertad 56','Tuxtepec','Oaxaca','68300','M�xico','7244795730','8789651475'),
('168','Toyota Motor','Chuy Alcal� Vergara','Dise�ador','Calle melchor ocampo no. 635','Tuxtepec','Oaxaca','68320','M�xico','6493065146','8176788101'),
('169','Netflix Inc','Faustino Casas Pati�o','Gerente de ventas','Av. Independencia no.1004','Tuxtepec','Oaxaca','68300','M�xico','2478247721','9829941327'),
('170','ASML Holding','Aitor Manso-Ju�rez','Gerente de producci�n','Av. 5 de mayo no. 1637','Tuxtepec','Oaxaca','68300','M�xico','4520392457','9478357278'),
('171','Ping An','Lourdes Acosta Villaverde','Gerente de recursos humanos','Av. 5 de mayo 1634','Tuxtepec','Oaxaca','68300','M�xico','7313054837','5938363408'),
('172','Exxon Mobil Corp','V�ctor Garriga Vendrell','Control de calidad','Ponciano arriaga no. 43','Tuxtepec','Oaxaca','68360','M�xico','4155469035','1118024841'),
('173','Verizon Communic','Custodio Sanmiguel Mayoral','Asistente de administraci�n','Calle matamoros no.29-3','Tuxtepec','Oaxaca','68300','M�xico','4998944871','8553927428'),
('174','Adobe Inc','Encarnaci�n Salazar Rovira','Ingeniero en sistemas','Av. Jesus carranza no. 1067','Tuxtepec','Oaxaca','68300','M�xico','4894443488','3079662148'),
('175','Nike Inc','Jose Miguel Pineda Franco','Asistente de mercadeo','Av. Ferrocarril s/n.','Tuxtepec','Oaxaca','68441','M�xico','3832270085','7845064239'),
('176','Abbott Labs','Gabriela Sedano Castro','Gerente administraci�n','Av. 5 de mayo no.1544','Tuxtepec','Oaxaca','68300','M�xico','4233177511','3853579794'),
('177','Coca-Cola Co','Ang�lica de Mendiz�bal','Servicio al cliente','Matamoros no. 138','Tuxtepec','Oaxaca','68300','M�xico','8915285277','8235431965'),
('178','Novartis','Luciana Elena Rom�n Casas','Auxiliar de contadur�a','Av. 20 de noviembre no. 1037','Tuxtepec','Oaxaca','68300','M�xico','8302203815','3622767555'),
('179','Pinduoduo Inc','Fabio Busquets-Mac�as','Dise�o de animaciones','Av. 20 de noviembre no. 1037','M�xico D.F.','M�xico D.F.','68380','M�xico','2255603566','7568993434'),
('180','L�Oreal','Oriana Roma Carreras','Gerente de contadur�a','Av. 20 de noviembre no. 1139-b','Tuxtepec','Oaxaca','68300','M�xico','1117112365','2158970737'),
('181','Ccb-H','Odalis Arnau','Vendedor','Av. 20 de noviembre no50221','Tuxtepec','Oaxaca','2011','M�xico','9714750414','8055313317'),
('182','AT&T Inc','Marcelo del Gasc�n','Guardia','Av. 5 de mayo no. 1350','Tuxtepec','Oaxaca','68300','M�xico','3067079315','4265845647'),
('183','Salesforce.Com','Donato Estrada','Analista de sistema','Av. Independencia no. 393','Tuxtepec','Oaxaca','68300','M�xico','9653611125','6040905229'),
('184','China Merch Bk','Edmundo Pont Alcaraz','Concerje','Bulevar no810','Tuxtepec','Oaxaca','68300','M�xico','3699768074','2883169644'),
('185','Eli Lilly & Co','Eliseo Planas Mar�n','IT','Calle sebastian ortiz no.549','Tuxtepec','Oaxaca','68321','M�xico','8430096208','1127716768'),
('186','Softbank Group C','Francisco Javier Manzano Acost','Supervisor de ventas','Calle morelos no. 30','Tuxtepec','Oaxaca','68300','M�xico','6204893662','2720526591'),
('187','Chevron Corp','Rosa Mar�a Donaire Villalba','Gerente de mercadeo','Calle morelos no. 330 int.2','Tuxtepec','Oaxaca','68300','M�xico','6751012977','8391685262'),
('188','Prosus Nv','Juliana Esteban','Dise�ador','Av 5 de mayo 659','Tuxtepec','Oaxaca','68300','M�xico','6032331367','1334961452'),
('189','Broadcom Inc','Epifanio Jara-Balaguer','Gerente de ventas','Ocampo 38','Tuxtepec','Oaxaca','68305','M�xico','5001202400','1687276803'),
('190','Abbvie Inc','Anita Cadenas Alba','Gerente de producci�n','Av. 20 de noviembre no. 1070','Tuxtepec','Oaxaca','68300','M�xico','9720224547','7111553168'),
('191','Oracle Corp','Concepci�n Bastida Herrera','Gerente de recursos humanos','Av. 5 de mayo no. 1401','Tuxtepec','Oaxaca','68300','M�xico','6970782817','3128415318'),
('192','Cisco Systems','Edu Ari�o Juan','Control de calidad','Av. Independencia n0.1166','Tuxtepec','Oaxaca','68300','M�xico','9767682928','1064188246'),
('193','Reliance Inds','Eric Morales','Asistente de administraci�n','Av. 20 de noviembre no. 964','Tuxtepec','Oaxaca','68300','M�xico','2268768949','7155447979'),
('194','Pfizer Inc','Benita Boada','Ingeniero en sistemas','Av. 20 de noviembre no. 933','Tuxtepec','Oaxaca','68300','M�xico','9007736017','6462135065'),
('195','Merck & Co','Amada Candela Oliveras Muro','Asistente de mercadeo','Av. Independencia no. 1811','M�xico D.F.','M�xico D.F.','68380','M�xico','7493809703','7021500398'),
('196','Bhp Group Ltd','Nicanor Cal Ortega','Gerente administraci�n','Calle ocampo no.266','Tuxtepec','Oaxaca','68300','M�xico','2883806276','5124537044'),
('197','Pepsico Inc','Erasmo Catal� Roig','Servicio al cliente','Av. Independencia no. 1162','Tuxtepec','Oaxaca','68300','M�xico','4033282986','3643856906'),
('198','Thermo Fisher','Emilio Cueto Valle','Auxiliar de contadur�a','Av. Independencia n0.900','M�xico D.F.','M�xico D.F.','68380','M�xico','9150326593','8991665193'),
('199','ABC','Maite Mayoral Chaves','Dise�o de animaciones','Av. Independencia no.900','Tuxtepec','Oaxaca','68300','M�xico','1552871160','5810158618'),
('200','Wuliangye Yibi','Anunciaci�n Planas','Gerente de contadur�a','Calle aldama no.53','Tuxtepec','Oaxaca','68300','M�xico','4658291951','1470110762')

GO


