IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'BuyDirect')
	DROP DATABASE [BuyDirect]
GO

CREATE DATABASE [BuyDirect]  
GO


use [BuyDirect]
GO

CREATE TABLE [dbo].[Categories] (
	[CategoryId] [int] IDENTITY (1, 1) NOT NULL ,
	[Category] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[OrderDetails] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[OrderId] [float] NOT NULL ,
	[ProductId] [int] NOT NULL ,
	[Quantity] [smallint] NOT NULL ,
	[Price] [money] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Orders] (
	[OrderId] [float] NOT NULL ,
	[ContactName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DeliveryAddress] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CCName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CCNumber] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CCExpiryDate] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Products] (
	[ProductId] [int] IDENTITY (1, 1) NOT NULL ,
	[CategoryId] [int] NOT NULL ,
	[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Price] [money] NOT NULL 
) ON [PRIMARY]
GO

/* Populate the Customers table */
INSERT INTO Categories (Category) VALUES ('Digital Camera')
GO
INSERT INTO Categories (Category) VALUES ('DVD Player')
GO
INSERT INTO Categories (Category) VALUES ('TV')
GO
INSERT INTO Categories (Category) VALUES ('Camcorder')
GO

/* Populate the Products table */
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(1, 'Pelesonic ST2.6', '2 Mb, 6x zoom, compact digital camera (plus black leather case as a bonus)', 245.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(1, 'Pelesonic ST2.8', '2 Mb, 6x zoom, compact digital camera in white and black body.', 295.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(1, 'Pelesonic SX 8', '4 Mb, 8x zoom, reliable digital camera.', 428.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(1, 'Pelesonic SX 10', '4 Mb, 10x zoom, super zoom!!!', 586.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(1, 'Troid XT', 'Compact digital camera with 2 Mb memory and 4 x zoom.', 435.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(1, 'Troid XT2', 'Pocket digital camera with 4 Mb memory and 4x zoom.', 495.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(1, 'Troid XT3', 'Extended digital camera with 32 Mb memory and 16x zoom.', 999.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(1, 'Dooper LCD', '8x zoom with superbright flash. Limited edition', 435.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(1, 'Dooper XS', '8x zoom digital camera. Connect direct to PC. Limited edition.', 898.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(1, 'Pentex SLDB', 'Super sharp digital camera, for every condition. Limited time offer.', 456.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(1, 'Pentex A3', 'Digital camera with 3 years warranty. Reliable.', 347.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(2, 'Digisonic SD', 'DVD Player, in 3 colors.', 295.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(2, 'Digisonic 5X', 'Multisystem DVD player.', 256.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(3, 'Promptu 14"', 'Supersharp color tv. 5 years warranty', 199.95)
GO
INSERT INTO Products (CategoryId, Name, Description, Price) VALUES
(4, 'Pelesonic TT2.3', 'Camcorder. Limited edition.', 202.95)
GO
