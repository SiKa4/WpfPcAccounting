USE AccountingOfEquipment

CREATE TABLE Barcode
(
id_Barcode bigint IDENTITY PRIMARY KEY,
Barcode_Value bigint NOT NULL
);

CREATE TABLE Type_PC
(
id_Type_PC INT IDENTITY PRIMARY KEY,
Name_type NVARCHAR(50) NOT NULL
);

CREATE TABLE Type_Storage
(
id_Type_Storage INT IDENTITY PRIMARY KEY,
Name_type NVARCHAR(50) NOT NULL
);

CREATE TABLE Storage
(
id_Storage INT IDENTITY PRIMARY KEY,
Serial_name NVARCHAR(50) NOT NULL,
id_Type_Storage INT NOT NULL,
Amount INT NOT NULL
FOREIGN KEY ( id_Type_Storage ) 
REFERENCES Type_Storage (id_Type_Storage )
);

CREATE TABLE Socket
(
id_Socket INT IDENTITY PRIMARY KEY,
Socket_name NVARCHAR(50) NOT NULL
);

CREATE TABLE Cooler_CPU
(
id_Cooler_CPU INT IDENTITY PRIMARY KEY,
Serial_name NVARCHAR(50) NOT NULL,
id_Socket INT NOT NULL,
FOREIGN KEY ( id_Socket ) 
REFERENCES Socket ( id_Socket )
);

CREATE TABLE CPU
(
id_CPU INT IDENTITY PRIMARY KEY,
Serial_name NVARCHAR(50) NOT NULL,
Cores INT NOT NULL,
Frequency NVARCHAR(50) NOT NULL,
id_Socket INT NOT NULL,
FOREIGN KEY ( id_Socket ) 
REFERENCES Socket ( id_Socket )
);

CREATE TABLE Motherboard
(
id_Motherboard INT IDENTITY PRIMARY KEY,
Serial_name NVARCHAR(50) NOT NULL,
id_Socket INT NOT NULL,
FOREIGN KEY ( id_Socket ) 
REFERENCES Socket ( id_Socket )
);

CREATE TABLE Power_Supply
(
id_Power_Supply INT IDENTITY PRIMARY KEY,
Serial_name NVARCHAR(50) NOT NULL,
Power INT NOT NULL
);

CREATE TABLE Type_Video_Memory
(
id_Type_Video_Memory INT IDENTITY PRIMARY KEY,
Name_Type NVARCHAR(50) NOT NULL
);

CREATE TABLE GPU
(
id_GPU INT IDENTITY PRIMARY KEY,
Serial_name NVARCHAR(50) NOT NULL,
Video_memory INT NOT NULL,
id_Type_Video_Memory INT NOT NULL,
FOREIGN KEY ( id_Type_Video_Memory ) 
REFERENCES Type_Video_Memory ( id_Type_Video_Memory )
);

CREATE TABLE Type_RAM
(
id_Type_RAM INT IDENTITY PRIMARY KEY,
Name_Type NVARCHAR(50) NOT NULL
);

CREATE TABLE RAM
(
id_RAM INT IDENTITY PRIMARY KEY,
Serial_name NVARCHAR(50) NOT NULL,
id_Type_RAM INT NOT NULL,
Frequency NVARCHAR(50) NOT NULL
FOREIGN KEY ( id_Type_RAM ) 
REFERENCES Type_RAM ( id_Type_RAM )
);

CREATE TABLE PC
(
id_PC INT PRIMARY KEY,
id_Type_PC INT NOT NULL,
Serial_name NVARCHAR(50) NOT NULL,
id_Motherboard INT NOT NULL,
id_RAM INT NOT NULL,
id_GPU INT NOT NULL,
id_Power_Supply INT NOT NULL,
id_CPU INT NOT NULL,
id_Cooler_CPU INT NOT NULL,
Amount_RAM NVARCHAR(50) NOT NULL,
FOREIGN KEY ( id_PC ) 
REFERENCES Barcode ( id_barcode )
ON DELETE CASCADE ,
FOREIGN KEY ( id_Cooler_CPU ) 
REFERENCES Cooler_CPU ( id_Cooler_CPU ),
FOREIGN KEY ( id_CPU ) 
REFERENCES CPU ( id_CPU ),
FOREIGN KEY ( id_Type_PC ) 
REFERENCES Type_PC ( id_Type_PC ),
FOREIGN KEY ( id_Motherboard ) 
REFERENCES Motherboard ( id_Motherboard ),
FOREIGN KEY ( id_RAM ) 
REFERENCES RAM ( id_RAM ),
FOREIGN KEY ( id_GPU ) 
REFERENCES GPU ( id_GPU ),
FOREIGN KEY ( id_Power_Supply ) 
REFERENCES Power_Supply ( id_Power_Supply )
);

CREATE TABLE PC_Storage
(
id_PC_Storage INT IDENTITY PRIMARY KEY,
id_PC INT NOT NULL,
id_Storage INT NOT NULL,
FOREIGN KEY ( id_PC ) 
REFERENCES PC ( id_PC )
ON DELETE CASCADE,
FOREIGN KEY ( id_Storage ) 
REFERENCES Storage ( id_Storage )
ON DELETE CASCADE
);

CREATE TABLE Inventory
(
id_Inventory INT IDENTITY PRIMARY KEY,
Date DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Barcode_Inventory
(
id_Barcode_Inventory INT IDENTITY PRIMARY KEY,
id_Barcode INT NOT NULL,
id_Inventory INT NOT NULL,
Count INT NOT NULL,
FOREIGN KEY ( id_Barcode ) 
REFERENCES Barcode ( id_Barcode ),
FOREIGN KEY ( id_Inventory ) 
REFERENCES Inventory ( id_Inventory )
);

CREATE TABLE History
(
	id_History INT IDENTITY PRIMARY KEY,
	PC_id int not null,
	Operation NVARCHAR(200) NOT NULL,
	CreateAt DATETIME NOT NULL DEFAULT GETDATE()
	FOREIGN KEY (PC_id)
	REFERENCES PC (id_PC)
	ON DELETE CASCADE
);

--Тригеры на удаление, изменение, и добавление комрьютеров.
GO
CREATE TRIGGER PC_INSERT
ON PC
AFTER INSERT
AS
INSERT INTO History (PC_id, Operation)
SELECT id_PC, 'Добавлен новый компьютер - ' + Serial_name + '.'
FROM inserted

GO
CREATE TRIGGER PC_UPDATE
ON PC
AFTER UPDATE
AS
INSERT INTO History (PC_id, Operation)
SELECT id_PC, 'Характиеристики компьютера были изменены.'
FROM inserted

GO
CREATE TRIGGER PC_DELETE
ON PC
AFTER DELETE
AS
INSERT INTO History (PC_id, Operation)
SELECT NULL, 'Компютер с наименованием '+ Serial_name +' был удален.'
FROM inserted

--Создайте предсталение, в котором будут отражены полные технические характеристики комьютера с их названиями.
CREATE VIEW TechnicalSpecifications AS
SELECT PC.id_PC AS ID,
	   PC.Serial_name AS PCname,
	   Motherboard.Serial_name AS NameMotherboard,
	   RAM.Serial_name AS NameRAM,
	   GPU.Serial_name AS NameGPU,
	   Power_Supply.Serial_name AS NamePower,
	   CPU.Serial_name AS NameCPU,
	   Cooler_CPU.Serial_name AS NameCooler
FROM PC INNER JOIN Motherboard ON PC.id_Motherboard = Motherboard.id_Motherboard
INNER JOIN RAM ON PC.id_RAM = RAM.id_RAM 
INNER JOIN GPU ON PC.id_GPU = GPU.id_GPU
INNER JOIN Power_Supply ON PC.id_Power_Supply = Power_Supply.id_Power_Supply
INNER JOIN CPU ON PC.id_CPU = CPU.id_CPU
INNER JOIN Cooler_CPU ON PC.id_Cooler_CPU = Cooler_CPU.id_Cooler_CPU

SELECT * FROM TechnicalSpecifications
--Создайте представлние, в котором будет отражаться среднее фактическое кол-во каждого из компьютеров, из всех записей в таблице связке "Barcode_Inventory".
drop view ActualQuantity

CREATE VIEW ActualQuantity AS
SELECT AVG(Barcode_Inventory.Count) AS Count,
       PC.id_PC AS Id,
	   PC.Serial_name AS Name,
	   Barcode.Barcode_Value AS Barcode
FROM Barcode_Inventory INNER JOIN Barcode ON Barcode.id_Barcode = Barcode_Inventory.id_Barcode
INNER JOIN PC ON PC.id_PC = Barcode.id_Barcode
GROUP BY PC.id_PC, PC.Serial_name, Barcode.Barcode_Value

SELECT Id, Barcode, Name, Count FROM ActualQuantity
--Запросы:
--1. Выведите id компьютеров, которые построены на сокете AM4.
SELECT id_PC FROM PC
JOIN Motherboard ON Motherboard.id_Motherboard = PC.id_Motherboard
JOIN Socket ON Motherboard.id_Socket = Socket.id_Socket
WHERE Socket_name LIKE 'AM4'

--2. Выведите id компьютеров, в которых материнская палата стоит та же, что и в компьютере с наименованием 'ПК Игровой'.
SELECT id_PC FROM PC
WHERE id_Motherboard = (SELECT id_Motherboard FROM PC
						WHERE Serial_name LIKE 'ПК Игровой') AND PC.Serial_name != 'ПК Игровой'

--3. Выведите id компьютеров и наименования их процессоров, которые использую устаревший сокет AM3.
SELECT id_PC, CPU.Serial_name  FROM PC
INNER JOIN CPU ON CPU.id_CPU = PC.id_CPU
WHERE CPU.id_Socket = (SELECT id_Socket FROM Socket
				WHERE Socket_name LIKE 'AM3')

--4. Выведите id инвентаризации и ее дату, в которой не присунствует компьютера со штрихкодом '1231231222221'.

SELECT Inventory.id_Inventory, Inventory.CreateAt FROM Barcode_Inventory
INNER JOIN Inventory ON Barcode_Inventory.id_Inventory = Inventory.id_Inventory
WHERE Barcode_Inventory.id_Inventory != ALL(SELECT Barcode_Inventory.id_Inventory FROM Barcode
								INNER JOIN Barcode_Inventory 
								ON Barcode_Inventory.id_Barcode = Barcode.id_Barcode
								WHERE Barcode.Barcode_Value = 1231231222221
								GROUP BY Barcode_Inventory.id_Inventory)
GROUP BY Inventory.id_Inventory, Inventory.CreateAt

--5. Выведите id компьютеров, которые используют оперативную память ddr4 и ее кол-вом >= 32.
SELECT PC.id_PC FROM PC
INNER JOIN RAM ON RAM.id_RAM = PC.id_RAM
WHERE RAM.id_Type_RAM = (SELECT id_Type_RAM FROM Type_RAM
					WHERE Name_Type LIKE 'DDR4') AND PC.Quantity_RAM >= 32

--6. Выведите id компьютеров, которые используют только один системный накопитель.
SELECT PC.id_PC FROM PC
INNER JOIN PC_Storage ON PC.id_PC = PC_Storage.id_PC
WHERE PC.id_PC != ALL(SELECT id_PC FROM PC_Storage
			GROUP BY id_PC
			HAVING COUNT(*) > 1)
GROUP BY PC.id_PC

--7. Выведите id инвентаризаций, если в них присутствует компьютер с сокетом на 'AM4'
SELECT Inventory.id_Inventory, Inventory.CreateAt FROM Inventory
INNER JOIN Barcode_Inventory ON Inventory.id_Inventory = Barcode_Inventory.id_Inventory
WHERE Barcode_Inventory.id_Barcode = ANY(SELECT id_PC FROM PC
									JOIN Motherboard ON Motherboard.id_Motherboard = PC.id_Motherboard
									JOIN Socket ON Motherboard.id_Socket = Socket.id_Socket
									WHERE Socket_name LIKE 'AM4')
GROUP BY Inventory.id_Inventory, Inventory.CreateAt

--8. Выведите id и наименования системных носителей, котрые были использованы >= 3 раз.
SELECT Storage.id_Storage ,Storage.Serial_name FROM Storage 
INNER JOIN PC_Storage ON PC_Storage.id_Storage = Storage.id_Storage
GROUP BY Storage.id_Storage, Storage.Serial_name
HAVING COUNT(PC_Storage.id_Storage) >= 3

--9. Выведите процессоры в порядке их использования в различных компьютерах.
SELECT CPU.id_CPU, CPU.Serial_name, COUNT(PC.id_CPU) 'Count' FROM PC
INNER JOIN CPU ON CPU.id_CPU = PC.id_CPU
GROUP BY CPU.id_CPU, CPU.Serial_name
ORDER BY COUNT(PC.id_CPU) DESC

--10. Выведите компьютеры в порядке убывания по возрастанию видеопамяти в видеокарте.
SELECT PC.id_PC FROM PC
INNER JOIN GPU ON GPU.id_GPU = PC.id_GPU
ORDER BY GPU.Video_memory ASC


--Роли

CREATE LOGIN ELENA WITH PASSWORD='Elena1234'
CREATE USER MemberOfTheInventoryCommission FOR LOGIN ELENA
GRANT SELECT ON PC TO MemberOfTheInventoryCommission
GRANT SELECT ON Barcode TO MemberOfTheInventoryCommission
GRANT SELECT, INSERT ON Inventory TO MemberOfTheInventoryCommission
GRANT SELECT, INSERT ON Barcode_Inventory TO MemberOfTheInventoryCommission

CREATE LOGIN ARTYR WITH PASSWORD='Artyr1234'
CREATE USER Accountant FOR LOGIN ARTYR
GRANT SELECT ON CPU TO Accountant
GRANT SELECT, INSERT, UPDATE ON PC TO Accountant
GRANT SELECT ON GPU TO Accountant
GRANT SELECT ON RAM TO Accountant

