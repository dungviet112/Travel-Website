USE [master]
GO
/****** Object:  Database [DuLich]    Script Date: 4/3/2022 12:09:26 PM ******/
CREATE DATABASE [DuLich]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DuLich', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DuLich.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DuLich_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DuLich_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DuLich] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DuLich].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DuLich] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DuLich] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DuLich] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DuLich] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DuLich] SET ARITHABORT OFF 
GO
ALTER DATABASE [DuLich] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DuLich] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DuLich] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DuLich] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DuLich] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DuLich] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DuLich] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DuLich] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DuLich] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DuLich] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DuLich] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DuLich] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DuLich] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DuLich] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DuLich] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DuLich] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DuLich] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DuLich] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DuLich] SET  MULTI_USER 
GO
ALTER DATABASE [DuLich] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DuLich] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DuLich] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DuLich] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DuLich] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DuLich] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DuLich] SET QUERY_STORE = OFF
GO
USE [DuLich]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 4/3/2022 12:09:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] NOT NULL,
	[CountryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/3/2022 12:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Roles] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info]    Script Date: 4/3/2022 12:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Info] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/3/2022 12:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] NOT NULL,
	[InfoId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (1, N'VIET NAM')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (2, N'CHINA')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (3, N'GERMANY')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (4, N'ENGLAND')
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [FullName], [Email], [Password], [Roles]) VALUES (4, N'Dung', N'123', N'202cb962ac59075b964b07152d234b70', N'admin')
INSERT [dbo].[Customers] ([Id], [FullName], [Email], [Password], [Roles]) VALUES (5, N'Duc', N'Duc123@gmail.com', N'26af36874cf996693f910fdf53ecbae8', N'user')
INSERT [dbo].[Customers] ([Id], [FullName], [Email], [Password], [Roles]) VALUES (6, N'Dai', N'Dai304@gmail.com', N'802484fcb413a9200440fff01ff27018', N'user')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[Info] ([Id], [Name], [CountryId], [UnitPrice], [Image], [Description]) VALUES (1, N'5 days in Fenghuang Country, Zhangjiajie,...', 2, 5000, N'/Content/image/pk1.png', NULL)
INSERT [dbo].[Info] ([Id], [Name], [CountryId], [UnitPrice], [Image], [Description]) VALUES (5, N'5 days in Nanjing, Wuxi, Suzhou,Beijing,...', 2, 10000, N'/Content/image/pk2.png', NULL)
INSERT [dbo].[Info] ([Id], [Name], [CountryId], [UnitPrice], [Image], [Description]) VALUES (6, N'5 days in Dali, Lijiang, Shangri-La City, and...', 2, 500, N'/Content/image/pk3.png', NULL)
INSERT [dbo].[Info] ([Id], [Name], [CountryId], [UnitPrice], [Image], [Description]) VALUES (7, N'7 days in Beijing, Xian, Guilin and Shanghai...', 2, 500, N'/Content/image/pk4.png', NULL)
INSERT [dbo].[Info] ([Id], [Name], [CountryId], [UnitPrice], [Image], [Description]) VALUES (8, N'5 days in Ngawa Tibetan and Qiang....', 1, 10000, N'/Content/image/pk5.png', NULL)
INSERT [dbo].[Info] ([Id], [Name], [CountryId], [UnitPrice], [Image], [Description]) VALUES (10, N'6 days in Chengdu, Nyingchi, Lhasa, and ', 2, 10000, N'/Content/image/pk6.png', NULL)
INSERT [dbo].[Info] ([Id], [Name], [CountryId], [UnitPrice], [Image], [Description]) VALUES (12, N'5 days in Ngawa Tibetan and Qiang ...', 1, 10000, N'/Content/image/pk7.png', NULL)
INSERT [dbo].[Info] ([Id], [Name], [CountryId], [UnitPrice], [Image], [Description]) VALUES (13, N'6 days in Ürümqi, Dunhuang, Zhangye, Lanzhou', 1, 988, N'/Content/image/pk8.png', NULL)
INSERT [dbo].[Info] ([Id], [Name], [CountryId], [UnitPrice], [Image], [Description]) VALUES (14, N'5 days in Ngawa Tibetan and Qiang', 1, 1200, N'/Content/image/pk9.png', NULL)
INSERT [dbo].[Info] ([Id], [Name], [CountryId], [UnitPrice], [Image], [Description]) VALUES (15, N'5 days in Fenghuang County, Zhangjiajie', 2, 500, N'/Content/image/pk11.png', NULL)
INSERT [dbo].[Info] ([Id], [Name], [CountryId], [UnitPrice], [Image], [Description]) VALUES (16, N'6 days in Ürümqi, Dunhuang, Zhangye, Lanzhou', 1, 10000, N'/Content/image/pk12.png', NULL)
INSERT [dbo].[Info] ([Id], [Name], [CountryId], [UnitPrice], [Image], [Description]) VALUES (17, N'5 days in Dali, Lijiang, Shangri-La City', 1, 9000, N'/Content/image/pk10.png', NULL)
GO
INSERT [dbo].[Orders] ([Id], [InfoId], [CustomerId], [OrderDate], [Address], [Description]) VALUES (1, 1, 5, CAST(N'2026-03-29T00:00:00.000' AS DateTime), N'Dong anh', N'dasdasda')
GO
ALTER TABLE [dbo].[Info]  WITH CHECK ADD  CONSTRAINT [FK_Info_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Info] CHECK CONSTRAINT [FK_Info_Country]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Info] FOREIGN KEY([InfoId])
REFERENCES [dbo].[Info] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Info]
GO
USE [master]
GO
ALTER DATABASE [DuLich] SET  READ_WRITE 
GO
