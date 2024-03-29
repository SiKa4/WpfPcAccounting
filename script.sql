USE [AccountingOfEquipment]
GO
/****** Object:  Table [dbo].[Barcode]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barcode](
	[id_Barcode] [int] IDENTITY(1,1) NOT NULL,
	[Barcode_Value] [bigint] NOT NULL,
 CONSTRAINT [PK__Barcode__D1A2086FCB02BEE6] PRIMARY KEY CLUSTERED 
(
	[id_Barcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Barcode_Inventory]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barcode_Inventory](
	[id_Barcode_Inventory] [int] IDENTITY(1,1) NOT NULL,
	[id_Barcode] [int] NOT NULL,
	[id_Inventory] [int] NOT NULL,
	[Count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Barcode_Inventory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cooler_CPU]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cooler_CPU](
	[id_Cooler_CPU] [int] IDENTITY(1,1) NOT NULL,
	[Serial_name] [nvarchar](50) NOT NULL,
	[id_Socket] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Cooler_CPU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CPU]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CPU](
	[id_CPU] [int] IDENTITY(1,1) NOT NULL,
	[Serial_name] [nvarchar](50) NOT NULL,
	[Cores] [int] NOT NULL,
	[Frequency] [nvarchar](50) NOT NULL,
	[id_Socket] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_CPU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GPU]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPU](
	[id_GPU] [int] IDENTITY(1,1) NOT NULL,
	[Serial_name] [nvarchar](50) NOT NULL,
	[Video_memory] [int] NOT NULL,
	[id_Type_Video_Memory] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_GPU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[id_Inventory] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Inventory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Motherboard]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Motherboard](
	[id_Motherboard] [int] IDENTITY(1,1) NOT NULL,
	[Serial_name] [nvarchar](50) NOT NULL,
	[id_Socket] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Motherboard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PC]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PC](
	[id_PC] [int] NOT NULL,
	[id_Type_PC] [int] NOT NULL,
	[Serial_name] [nvarchar](50) NOT NULL,
	[id_Motherboard] [int] NOT NULL,
	[id_RAM] [int] NOT NULL,
	[id_GPU] [int] NOT NULL,
	[id_Power_Supply] [int] NOT NULL,
	[id_CPU] [int] NOT NULL,
	[id_Cooler_CPU] [int] NOT NULL,
	[Quantity_RAM] [int] NOT NULL,
 CONSTRAINT [PK__PC__0149BFB1B4683398] PRIMARY KEY CLUSTERED 
(
	[id_PC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PC_Storage]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PC_Storage](
	[id_PC_Storage] [int] IDENTITY(1,1) NOT NULL,
	[id_PC] [int] NOT NULL,
	[id_Storage] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_PC_Storage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Power_Supply]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Power_Supply](
	[id_Power_Supply] [int] IDENTITY(1,1) NOT NULL,
	[Serial_name] [nvarchar](50) NOT NULL,
	[Power] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Power_Supply] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RAM]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAM](
	[id_RAM] [int] IDENTITY(1,1) NOT NULL,
	[Serial_name] [nvarchar](50) NOT NULL,
	[id_Type_RAM] [int] NOT NULL,
	[Frequency] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_RAM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Socket]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Socket](
	[id_Socket] [int] IDENTITY(1,1) NOT NULL,
	[Socket_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Socket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storage]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage](
	[id_Storage] [int] IDENTITY(1,1) NOT NULL,
	[Serial_name] [nvarchar](50) NOT NULL,
	[id_Type_Storage] [int] NOT NULL,
	[Amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Storage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_PC]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_PC](
	[id_Type_PC] [int] IDENTITY(1,1) NOT NULL,
	[Name_type] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Type_PC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_RAM]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_RAM](
	[id_Type_RAM] [int] IDENTITY(1,1) NOT NULL,
	[Name_Type] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Type_RAM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_Storage]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_Storage](
	[id_Type_Storage] [int] IDENTITY(1,1) NOT NULL,
	[Name_type] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Type_Storage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_Video_Memory]    Script Date: 11.12.2022 21:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_Video_Memory](
	[id_Type_Video_Memory] [int] IDENTITY(1,1) NOT NULL,
	[Name_Type] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Type_Video_Memory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Barcode] ON 

INSERT [dbo].[Barcode] ([id_Barcode], [Barcode_Value]) VALUES (10, 1000000000000)
INSERT [dbo].[Barcode] ([id_Barcode], [Barcode_Value]) VALUES (11, 2000000000000)
SET IDENTITY_INSERT [dbo].[Barcode] OFF
GO
SET IDENTITY_INSERT [dbo].[Cooler_CPU] ON 

INSERT [dbo].[Cooler_CPU] ([id_Cooler_CPU], [Serial_name], [id_Socket]) VALUES (3, N'Noctua NH-L9a-AM4', 1)
INSERT [dbo].[Cooler_CPU] ([id_Cooler_CPU], [Serial_name], [id_Socket]) VALUES (4, N'Noctua NH-L9a', 1)
SET IDENTITY_INSERT [dbo].[Cooler_CPU] OFF
GO
SET IDENTITY_INSERT [dbo].[CPU] ON 

INSERT [dbo].[CPU] ([id_CPU], [Serial_name], [Cores], [Frequency], [id_Socket]) VALUES (3, N'AMD Ryzen 9 5950X', 16, N'3.4 - 4.9ГГц', 1)
INSERT [dbo].[CPU] ([id_CPU], [Serial_name], [Cores], [Frequency], [id_Socket]) VALUES (4, N'AMD Ryzen 7 5700G', 8, N'3.8 -4.6ГГц', 1)
SET IDENTITY_INSERT [dbo].[CPU] OFF
GO
SET IDENTITY_INSERT [dbo].[GPU] ON 

INSERT [dbo].[GPU] ([id_GPU], [Serial_name], [Video_memory], [id_Type_Video_Memory]) VALUES (1, N'GIGABYTE GeForce RTX 3070 GAMING OC', 8, 2)
INSERT [dbo].[GPU] ([id_GPU], [Serial_name], [Video_memory], [id_Type_Video_Memory]) VALUES (2, N'MSI GeForce RTX 3090 Ti SUPRIM X', 24, 1)
INSERT [dbo].[GPU] ([id_GPU], [Serial_name], [Video_memory], [id_Type_Video_Memory]) VALUES (5, N'Palit GeForce RTX 3060 StormX', 8, 2)
SET IDENTITY_INSERT [dbo].[GPU] OFF
GO
SET IDENTITY_INSERT [dbo].[Motherboard] ON 

INSERT [dbo].[Motherboard] ([id_Motherboard], [Serial_name], [id_Socket]) VALUES (3, N'GIGABYTE B550 AORUS ELITE V2', 1)
INSERT [dbo].[Motherboard] ([id_Motherboard], [Serial_name], [id_Socket]) VALUES (4, N'MSI MPG B550 GAMING PLUS', 1)
SET IDENTITY_INSERT [dbo].[Motherboard] OFF
GO
INSERT [dbo].[PC] ([id_PC], [id_Type_PC], [Serial_name], [id_Motherboard], [id_RAM], [id_GPU], [id_Power_Supply], [id_CPU], [id_Cooler_CPU], [Quantity_RAM]) VALUES (10, 7, N'GAME PC', 3, 3, 2, 1, 3, 3, 64)
INSERT [dbo].[PC] ([id_PC], [id_Type_PC], [Serial_name], [id_Motherboard], [id_RAM], [id_GPU], [id_Power_Supply], [id_CPU], [id_Cooler_CPU], [Quantity_RAM]) VALUES (11, 1, N'LOW PC GAME', 4, 1, 2, 2, 4, 3, 32)
GO
SET IDENTITY_INSERT [dbo].[PC_Storage] ON 

INSERT [dbo].[PC_Storage] ([id_PC_Storage], [id_PC], [id_Storage]) VALUES (37, 11, 1)
INSERT [dbo].[PC_Storage] ([id_PC_Storage], [id_PC], [id_Storage]) VALUES (38, 11, 3)
INSERT [dbo].[PC_Storage] ([id_PC_Storage], [id_PC], [id_Storage]) VALUES (39, 10, 1)
INSERT [dbo].[PC_Storage] ([id_PC_Storage], [id_PC], [id_Storage]) VALUES (40, 10, 3)
SET IDENTITY_INSERT [dbo].[PC_Storage] OFF
GO
SET IDENTITY_INSERT [dbo].[Power_Supply] ON 

INSERT [dbo].[Power_Supply] ([id_Power_Supply], [Serial_name], [Power]) VALUES (1, N'Cougar VTE600', 600)
INSERT [dbo].[Power_Supply] ([id_Power_Supply], [Serial_name], [Power]) VALUES (2, N'DEEPCOOL DQ750', 750)
INSERT [dbo].[Power_Supply] ([id_Power_Supply], [Serial_name], [Power]) VALUES (3, N'Cougar VTE600', 600)
INSERT [dbo].[Power_Supply] ([id_Power_Supply], [Serial_name], [Power]) VALUES (4, N'DEEPCOOL DQ750', 750)
SET IDENTITY_INSERT [dbo].[Power_Supply] OFF
GO
SET IDENTITY_INSERT [dbo].[RAM] ON 

INSERT [dbo].[RAM] ([id_RAM], [Serial_name], [id_Type_RAM], [Frequency]) VALUES (1, N'AMD Radeon R9 Gamer Series', 2, N'3200МГц')
INSERT [dbo].[RAM] ([id_RAM], [Serial_name], [id_Type_RAM], [Frequency]) VALUES (3, N'Kingston FURY Beast Black', 2, N'3200МГц')
INSERT [dbo].[RAM] ([id_RAM], [Serial_name], [id_Type_RAM], [Frequency]) VALUES (6, N'Kingston DDR2', 4, N'800Mhz')
SET IDENTITY_INSERT [dbo].[RAM] OFF
GO
SET IDENTITY_INSERT [dbo].[Socket] ON 

INSERT [dbo].[Socket] ([id_Socket], [Socket_name]) VALUES (1, N'AM4')
INSERT [dbo].[Socket] ([id_Socket], [Socket_name]) VALUES (2, N'AM3')
SET IDENTITY_INSERT [dbo].[Socket] OFF
GO
SET IDENTITY_INSERT [dbo].[Storage] ON 

INSERT [dbo].[Storage] ([id_Storage], [Serial_name], [id_Type_Storage], [Amount]) VALUES (1, N'WB Blue', 1, 1000)
INSERT [dbo].[Storage] ([id_Storage], [Serial_name], [id_Type_Storage], [Amount]) VALUES (3, N'WD Blue V2', 2, 1500)
SET IDENTITY_INSERT [dbo].[Storage] OFF
GO
SET IDENTITY_INSERT [dbo].[Type_PC] ON 

INSERT [dbo].[Type_PC] ([id_Type_PC], [Name_type]) VALUES (1, N'Настольный ПК')
INSERT [dbo].[Type_PC] ([id_Type_PC], [Name_type]) VALUES (2, N'Моноблок')
INSERT [dbo].[Type_PC] ([id_Type_PC], [Name_type]) VALUES (3, N'Ноутбук')
INSERT [dbo].[Type_PC] ([id_Type_PC], [Name_type]) VALUES (7, N'Игровой ПК')
INSERT [dbo].[Type_PC] ([id_Type_PC], [Name_type]) VALUES (8, N'Новый ПК')
SET IDENTITY_INSERT [dbo].[Type_PC] OFF
GO
SET IDENTITY_INSERT [dbo].[Type_RAM] ON 

INSERT [dbo].[Type_RAM] ([id_Type_RAM], [Name_Type]) VALUES (1, N'DDR5')
INSERT [dbo].[Type_RAM] ([id_Type_RAM], [Name_Type]) VALUES (2, N'DDR4')
INSERT [dbo].[Type_RAM] ([id_Type_RAM], [Name_Type]) VALUES (3, N'DDR3')
INSERT [dbo].[Type_RAM] ([id_Type_RAM], [Name_Type]) VALUES (4, N'DDR2')
SET IDENTITY_INSERT [dbo].[Type_RAM] OFF
GO
SET IDENTITY_INSERT [dbo].[Type_Storage] ON 

INSERT [dbo].[Type_Storage] ([id_Type_Storage], [Name_type]) VALUES (1, N'Жесткий диск')
INSERT [dbo].[Type_Storage] ([id_Type_Storage], [Name_type]) VALUES (2, N'SSD')
SET IDENTITY_INSERT [dbo].[Type_Storage] OFF
GO
SET IDENTITY_INSERT [dbo].[Type_Video_Memory] ON 

INSERT [dbo].[Type_Video_Memory] ([id_Type_Video_Memory], [Name_Type]) VALUES (1, N'GDDR6X')
INSERT [dbo].[Type_Video_Memory] ([id_Type_Video_Memory], [Name_Type]) VALUES (2, N'GDDR6')
INSERT [dbo].[Type_Video_Memory] ([id_Type_Video_Memory], [Name_Type]) VALUES (3, N'GDDR5')
SET IDENTITY_INSERT [dbo].[Type_Video_Memory] OFF
GO
ALTER TABLE [dbo].[Inventory] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Barcode_Inventory]  WITH CHECK ADD  CONSTRAINT [FK__Barcode_I__id_Ba__534D60F1] FOREIGN KEY([id_Barcode])
REFERENCES [dbo].[Barcode] ([id_Barcode])
GO
ALTER TABLE [dbo].[Barcode_Inventory] CHECK CONSTRAINT [FK__Barcode_I__id_Ba__534D60F1]
GO
ALTER TABLE [dbo].[Barcode_Inventory]  WITH CHECK ADD FOREIGN KEY([id_Inventory])
REFERENCES [dbo].[Inventory] ([id_Inventory])
GO
ALTER TABLE [dbo].[Cooler_CPU]  WITH CHECK ADD FOREIGN KEY([id_Socket])
REFERENCES [dbo].[Socket] ([id_Socket])
GO
ALTER TABLE [dbo].[CPU]  WITH CHECK ADD FOREIGN KEY([id_Socket])
REFERENCES [dbo].[Socket] ([id_Socket])
GO
ALTER TABLE [dbo].[GPU]  WITH CHECK ADD FOREIGN KEY([id_Type_Video_Memory])
REFERENCES [dbo].[Type_Video_Memory] ([id_Type_Video_Memory])
GO
ALTER TABLE [dbo].[Motherboard]  WITH CHECK ADD FOREIGN KEY([id_Socket])
REFERENCES [dbo].[Socket] ([id_Socket])
GO
ALTER TABLE [dbo].[PC]  WITH CHECK ADD  CONSTRAINT [FK__PC__id_Cooler_CP__440B1D61] FOREIGN KEY([id_Cooler_CPU])
REFERENCES [dbo].[Cooler_CPU] ([id_Cooler_CPU])
GO
ALTER TABLE [dbo].[PC] CHECK CONSTRAINT [FK__PC__id_Cooler_CP__440B1D61]
GO
ALTER TABLE [dbo].[PC]  WITH CHECK ADD  CONSTRAINT [FK__PC__id_CPU__44FF419A] FOREIGN KEY([id_CPU])
REFERENCES [dbo].[CPU] ([id_CPU])
GO
ALTER TABLE [dbo].[PC] CHECK CONSTRAINT [FK__PC__id_CPU__44FF419A]
GO
ALTER TABLE [dbo].[PC]  WITH CHECK ADD  CONSTRAINT [FK__PC__id_GPU__48CFD27E] FOREIGN KEY([id_GPU])
REFERENCES [dbo].[GPU] ([id_GPU])
GO
ALTER TABLE [dbo].[PC] CHECK CONSTRAINT [FK__PC__id_GPU__48CFD27E]
GO
ALTER TABLE [dbo].[PC]  WITH CHECK ADD  CONSTRAINT [FK__PC__id_Motherboa__46E78A0C] FOREIGN KEY([id_Motherboard])
REFERENCES [dbo].[Motherboard] ([id_Motherboard])
GO
ALTER TABLE [dbo].[PC] CHECK CONSTRAINT [FK__PC__id_Motherboa__46E78A0C]
GO
ALTER TABLE [dbo].[PC]  WITH CHECK ADD  CONSTRAINT [FK__PC__id_PC__4316F928] FOREIGN KEY([id_PC])
REFERENCES [dbo].[Barcode] ([id_Barcode])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PC] CHECK CONSTRAINT [FK__PC__id_PC__4316F928]
GO
ALTER TABLE [dbo].[PC]  WITH CHECK ADD  CONSTRAINT [FK__PC__id_Power_Sup__49C3F6B7] FOREIGN KEY([id_Power_Supply])
REFERENCES [dbo].[Power_Supply] ([id_Power_Supply])
GO
ALTER TABLE [dbo].[PC] CHECK CONSTRAINT [FK__PC__id_Power_Sup__49C3F6B7]
GO
ALTER TABLE [dbo].[PC]  WITH CHECK ADD  CONSTRAINT [FK__PC__id_RAM__47DBAE45] FOREIGN KEY([id_RAM])
REFERENCES [dbo].[RAM] ([id_RAM])
GO
ALTER TABLE [dbo].[PC] CHECK CONSTRAINT [FK__PC__id_RAM__47DBAE45]
GO
ALTER TABLE [dbo].[PC]  WITH CHECK ADD  CONSTRAINT [FK__PC__id_Type_PC__45F365D3] FOREIGN KEY([id_Type_PC])
REFERENCES [dbo].[Type_PC] ([id_Type_PC])
GO
ALTER TABLE [dbo].[PC] CHECK CONSTRAINT [FK__PC__id_Type_PC__45F365D3]
GO
ALTER TABLE [dbo].[PC_Storage]  WITH CHECK ADD FOREIGN KEY([id_Storage])
REFERENCES [dbo].[Storage] ([id_Storage])
GO
ALTER TABLE [dbo].[PC_Storage]  WITH CHECK ADD  CONSTRAINT [FK_PC_Storage_PC] FOREIGN KEY([id_PC])
REFERENCES [dbo].[PC] ([id_PC])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PC_Storage] CHECK CONSTRAINT [FK_PC_Storage_PC]
GO
ALTER TABLE [dbo].[RAM]  WITH CHECK ADD FOREIGN KEY([id_Type_RAM])
REFERENCES [dbo].[Type_RAM] ([id_Type_RAM])
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD FOREIGN KEY([id_Type_Storage])
REFERENCES [dbo].[Type_Storage] ([id_Type_Storage])
GO
