USE [master]
GO
/****** Object:  Database [Sales_Stock_Reporting_System]    Script Date: 5/5/2025 6:57:47 PM ******/
CREATE DATABASE [Sales_Stock_Reporting_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sales_Stock_Reporting_System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Sales_Stock_Reporting_System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sales_Stock_Reporting_System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Sales_Stock_Reporting_System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sales_Stock_Reporting_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET  MULTI_USER 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET QUERY_STORE = OFF
GO
USE [Sales_Stock_Reporting_System]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/5/2025 6:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[SKU] [nvarchar](100) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[StockQty] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 5/5/2025 6:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[QuantitySold] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/5/2025 6:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [SKU], [Price], [StockQty], [Description], [IsDeleted], [CreatedAt]) VALUES (1, N'Wireless Mouse', N'WM123', CAST(25.99 AS Decimal(18, 2)), 150, N'Ergonomic wireless mouse with USB receiver', 0, CAST(N'2025-05-05T18:39:43.237' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [SKU], [Price], [StockQty], [Description], [IsDeleted], [CreatedAt]) VALUES (2, N'Gaming Keyboard', N'GK456', CAST(79.50 AS Decimal(18, 2)), 75, N'Mechanical keyboard with RGB lighting', 0, CAST(N'2025-05-05T18:39:43.237' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [SKU], [Price], [StockQty], [Description], [IsDeleted], [CreatedAt]) VALUES (3, N'HD Monitor 24"', N'HDM2401', CAST(149.99 AS Decimal(18, 2)), 40, N'24-inch Full HD LED monitor', 0, CAST(N'2025-05-05T18:39:43.237' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [SKU], [Price], [StockQty], [Description], [IsDeleted], [CreatedAt]) VALUES (4, N'USB-C Charger 65W', N'UC65W', CAST(29.99 AS Decimal(18, 2)), 200, N'Fast charging USB-C power adapter', 0, CAST(N'2025-05-05T18:39:43.237' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [SKU], [Price], [StockQty], [Description], [IsDeleted], [CreatedAt]) VALUES (5, N'Bluetooth Headphones', N'BH789', CAST(59.00 AS Decimal(18, 2)), 120, N'Wireless over-ear headphones with noise cancellation', 0, CAST(N'2025-05-05T18:39:43.237' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [SKU], [Price], [StockQty], [Description], [IsDeleted], [CreatedAt]) VALUES (6, N'Laptop Stand', N'LS001', CAST(32.49 AS Decimal(18, 2)), 60, N'Adjustable aluminum laptop stand', 0, CAST(N'2025-05-05T18:39:43.237' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [SKU], [Price], [StockQty], [Description], [IsDeleted], [CreatedAt]) VALUES (7, N'External SSD 1TB', N'SSD1TBEX', CAST(119.99 AS Decimal(18, 2)), 30, N'High-speed external SSD drive with USB 3.1', 0, CAST(N'2025-05-05T18:39:43.237' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [SKU], [Price], [StockQty], [Description], [IsDeleted], [CreatedAt]) VALUES (8, N'Office Chair Deluxe', N'OFC100D', CAST(189.95 AS Decimal(18, 2)), 20, N'Ergonomic office chair with lumbar support', 0, CAST(N'2025-05-05T18:39:43.237' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [SKU], [Price], [StockQty], [Description], [IsDeleted], [CreatedAt]) VALUES (9, N'Smartwatch Series 5', N'SW5GEN', CAST(199.99 AS Decimal(18, 2)), 55, N'Fitness tracking smartwatch with GPS', 0, CAST(N'2025-05-05T18:39:43.237' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [SKU], [Price], [StockQty], [Description], [IsDeleted], [CreatedAt]) VALUES (10, N'Webcam 1080p', N'WC1080', CAST(45.75 AS Decimal(18, 2)), 90, N'Full HD USB webcam with built-in microphone', 0, CAST(N'2025-05-05T18:39:43.237' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [CreatedAt]) VALUES (1, N'Admin', N'$2a$11$o8QzZmrrGo4QfwiuRhEHge8uJZAKOn4TUz4UIlkfg8tygvPsJs3c.', CAST(N'2025-05-05T12:55:14.867' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E41C73887B]    Script Date: 5/5/2025 6:57:48 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Sales] ADD  DEFAULT (getdate()) FOR [SaleDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Products]
GO
USE [master]
GO
ALTER DATABASE [Sales_Stock_Reporting_System] SET  READ_WRITE 
GO
