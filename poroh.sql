USE AccountingOfEquipment

CREATE TABLE Barcode
(
id_Barcode INT IDENTITY PRIMARY KEY,
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
Frequency NVARCHAR(50) NOT NULL,
Amount_RAM NVARCHAR(50) NOT NULL,
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
REFERENCES PC ( id_PC ),
FOREIGN KEY ( id_Storage ) 
REFERENCES Storage ( id_Storage )
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