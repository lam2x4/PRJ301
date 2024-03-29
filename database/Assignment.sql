USE [master]
GO
/****** Object:  Database [projectprj]    Script Date: 3/21/2024 1:53:29 PM ******/
CREATE DATABASE [projectprj]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'projectprj', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\projectprj.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'projectprj_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\projectprj_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [projectprj] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [projectprj].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [projectprj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [projectprj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [projectprj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [projectprj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [projectprj] SET ARITHABORT OFF 
GO
ALTER DATABASE [projectprj] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [projectprj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [projectprj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [projectprj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [projectprj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [projectprj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [projectprj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [projectprj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [projectprj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [projectprj] SET  ENABLE_BROKER 
GO
ALTER DATABASE [projectprj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [projectprj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [projectprj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [projectprj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [projectprj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [projectprj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [projectprj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [projectprj] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [projectprj] SET  MULTI_USER 
GO
ALTER DATABASE [projectprj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [projectprj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [projectprj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [projectprj] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [projectprj] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [projectprj] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [projectprj] SET QUERY_STORE = ON
GO
ALTER DATABASE [projectprj] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [projectprj]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 3/21/2024 1:53:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NULL,
	[content] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 3/21/2024 1:53:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/21/2024 1:53:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/21/2024 1:53:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
	[phone] [varchar](20) NULL,
	[address] [nvarchar](max) NULL,
	[email] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 3/21/2024 1:53:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](max) NULL,
	[productId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/21/2024 1:53:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[cusId] [int] NULL,
	[totalmoney] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/21/2024 1:53:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NULL,
	[productId] [int] NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/21/2024 1:53:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[categoryId] [int] NULL,
	[brandId] [int] NULL,
	[image] [nvarchar](max) NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[releaseDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 3/21/2024 1:53:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[size] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/21/2024 1:53:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](20) NULL,
	[password] [varchar](30) NULL,
	[name] [nvarchar](30) NULL,
	[gender] [nvarchar](10) NULL,
	[dob] [date] NULL,
	[phone] [varchar](20) NULL,
	[address] [nvarchar](max) NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([id], [name]) VALUES (1, N'COACH')
INSERT [dbo].[Brand] ([id], [name]) VALUES (2, N'DSQUARED')
INSERT [dbo].[Brand] ([id], [name]) VALUES (3, N'GIGI')
INSERT [dbo].[Brand] ([id], [name]) VALUES (4, N'MLB')
INSERT [dbo].[Brand] ([id], [name]) VALUES (5, N'PUMA')
INSERT [dbo].[Brand] ([id], [name]) VALUES (6, N'SKECHERS')
INSERT [dbo].[Brand] ([id], [name]) VALUES (7, N'TED BAKER')
INSERT [dbo].[Brand] ([id], [name]) VALUES (8, N'THE KOOPLES')
INSERT [dbo].[Brand] ([id], [name]) VALUES (9, N'TOPMAN')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Trang Phục')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Giày Dép')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Túi')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Ví')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Balo')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Mũ')
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'Mắt Kính')
INSERT [dbo].[Category] ([id], [name]) VALUES (8, N'Mũ')
INSERT [dbo].[Category] ([id], [name]) VALUES (9, N'Thắt Lưng')
INSERT [dbo].[Category] ([id], [name]) VALUES (10, N'Phụ kiện khác')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (1, N'huy', N'1234567890', N'Thái Nguyên', N'')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (2, N'huy', N'1234567890', N'Thái Nguyên', N'huynq@gmail.com')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (3, N'huy', N'1234567890', N'Thái Nguyên', N'huynq@gmail.com')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (4, N'huy', N'1234567890', N'Thái Nguyên', N'huynq@gmail.com')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (5, N'huy', N'1234567890', N'Thái Nguyên', N'huynq@gmail.com')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (6, N'hyy', N'012345', N'aaa', N'1234')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (7, N'huy', N'123', N'123', N'123')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (8, N'123', N'123', N'123', N'123')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (9, N'jk', N'0999', N'123', N'caigithe1@gmail.com')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (10, N'huy', N'22', N'123', N'22')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (11, N'huy', N'1234567890', N'Thái Nguyên', N'huynq@gmail.com')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (12, N'huy', N'1234567890', N'Thái Nguyên', N'huynq@gmail.com')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (18, N'huu hung', N'1234567890', N'Thái Nguyên', N'hkt@gmail.com')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (19, N'huu hung', N'1234567890', N'Thái Nguyên', N'hkt@gmail.com')
INSERT [dbo].[Customer] ([id], [name], [phone], [address], [email]) VALUES (20, N'email', N'email', N'email', N'hkt@gmail.com')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (1, N'img/product/anh1_1.webp', 1)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (2, N'img/product/anh1_2.webp', 1)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (3, N'img/product/anh1_3.webp', 1)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (4, N'img/product/anh2_1.webp', 2)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (5, N'img/product/anh2_2.webp', 2)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (6, N'img/product/anh2_3.webp', 2)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (7, N'img/product/anh3_1.webp', 3)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (8, N'img/product/anh3_2.webp', 3)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (9, N'img/product/anh3_3.webp', 3)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (10, N'img/product/anh4_1.webp', 4)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (11, N'img/product/anh4_2.webp', 4)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (12, N'img/product/anh4_3.webp', 4)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (13, N'img/product/anh5_1.webp', 5)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (14, N'img/product/anh5_2.webp', 5)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (15, N'img/product/anh5_3.webp', 5)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (16, N'img/product/anh6_1.webp', 6)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (17, N'img/product/anh6_2.webp', 6)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (18, N'img/product/anh6_3.webp', 6)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (19, N'img/product/anh7_1.webp', 7)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (20, N'img/product/anh7_2.webp', 7)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (21, N'img/product/anh7_3.webp', 7)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (22, N'img/product/anh8_1.webp', 8)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (23, N'img/product/anh8_2.webp', 8)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (24, N'img/product/anh8_3.webp', 8)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (25, N'img/product/anh9_1.webp', 9)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (26, N'img/product/anh9_2.webp', 9)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (27, N'img/product/anh9_3.webp', 9)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (28, N'img/product/anh10_1.webp', 10)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (29, N'img/product/anh10_2.webp', 10)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (30, N'img/product/anh10_3.webp', 10)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (31, N'img/product/anh11_1.webp', 11)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (32, N'img/product/anh11_2.webp', 11)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (33, N'img/product/anh11_3.webp', 11)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (34, N'img/product/anh12_1.webp', 12)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (35, N'img/product/anh12_2.webp', 12)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (36, N'img/product/anh12_3.webp', 12)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (37, N'img/product/anh13_1.webp', 13)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (38, N'img/product/anh13_2.webp', 13)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (39, N'img/product/anh13_3.webp', 13)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (40, N'img/product/anh14_1.webp', 14)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (41, N'img/product/anh14_2.webp', 14)
INSERT [dbo].[Image] ([id], [image], [productId]) VALUES (42, N'img/product/anh14_3.webp', 14)
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [date], [cusId], [totalmoney]) VALUES (10, CAST(N'2022-07-13' AS Date), 10, 798000)
INSERT [dbo].[Order] ([id], [date], [cusId], [totalmoney]) VALUES (11, CAST(N'2022-07-14' AS Date), 11, 4392000)
INSERT [dbo].[Order] ([id], [date], [cusId], [totalmoney]) VALUES (12, CAST(N'2022-07-19' AS Date), 12, 2394000)
INSERT [dbo].[Order] ([id], [date], [cusId], [totalmoney]) VALUES (18, CAST(N'2024-03-20' AS Date), 18, 1398000)
INSERT [dbo].[Order] ([id], [date], [cusId], [totalmoney]) VALUES (19, CAST(N'2024-03-20' AS Date), 19, 1398000)
INSERT [dbo].[Order] ([id], [date], [cusId], [totalmoney]) VALUES (20, CAST(N'2024-03-21' AS Date), 20, 6240000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [quantity], [price]) VALUES (1, 12, 2, 3, 798000)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [quantity], [price]) VALUES (11, 18, 1, 1, 1398000)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [quantity], [price]) VALUES (12, 19, 1, 1, 1398000)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [quantity], [price]) VALUES (13, 20, 14, 1, 6240000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (1, N'Áo ba lỗ sát nách cổ tròn Seamball Aero Cool', 1, 4, N'img/product/anh1_1.webp', 699000, 0, CAST(N'2023-03-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (2, N'Áo thun nam tay ngắn cổ tròn Photo', 1, 5, N'img/product/anh2_1.webp', 399000, 2, CAST(N'2023-03-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (3, N'Quần shorts lưng thun Basic Big Logo', 1, 4, N'img/product/anh3_1.webp', 1690000, 2, CAST(N'2023-03-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (4, N'Áo thun thể thao nam tay ngắn năng động', 1, 6, N'img/product/anh4_1.webp', 590000, 1, CAST(N'2023-03-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (5, N'Áo sơ mi nam tay dài Remark', 1, 7, N'img/product/anh5_1.webp', 3340000, 3, CAST(N'2024-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (6, N'Áo thun thể thao nam ngắn tay Fran Side Seam', 1, 5, N'img/product/anh6_1.webp', 599000, 3, CAST(N'2024-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (7, N'Áo thun cổ tròn ngắn tay Monogram All Over', 1, 4, N'img/product/anh7_1.webp', 1990000, 1, CAST(N'2024-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (8, N'Áo khoác lông cừu cổ bẻ tay dài thời trang', 1, 4, N'img/product/anh8_1.webp', 5190000, 1, CAST(N'2024-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (9, N'Áo sơ mi ngắn tay hiện đại Paisley', 1, 4, N'img/product/anh9_1.webp', 2990000, 1, CAST(N'2024-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (10, N'Quần jogger nam Iconic T7 Sportstyle', 1, 5, N'img/product/anh10_1.webp', 1799000, 1, CAST(N'2024-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (11, N'Áo thun nam ngắn tay Graphic Regular Fit', 1, 5, N'', 599000, 5, CAST(N'2024-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (12, N'Áo thun nam cổ tròn tay ngắn Sportstyle International', 1, 5, N'img/product/anh12_1.webp', 499000, 1, CAST(N'2024-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (13, N'Áo thun thể thao nam ngắn tay Renaissance Cat', 1, 5, N'img/product/anh13_1.webp', 399000, 1, CAST(N'2024-03-16' AS Date))
INSERT [dbo].[Product] ([id], [name], [categoryId], [brandId], [image], [price], [quantity], [releaseDate]) VALUES (14, N'Dép nam quai ngang bản rộng Rainbow Signature Canvas', 2, 1, N'img/product/anh14_1.webp', 3120000, 0, CAST(N'2024-03-18' AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (1, 1, N'XS')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (2, 1, N'S')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (3, 1, N'M')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (4, 2, N'L')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (5, 2, N'XL')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (6, 2, N'XXL')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (7, 3, N'XS')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (8, 3, N'S')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (9, 3, N'M')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (10, 4, N'L')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (11, 5, N'XL')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (12, 6, N'XXL')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (13, 7, N'L')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (14, 8, N'XL')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (15, 9, N'XXL')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (16, 10, N'L')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (17, 11, N'XL')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (18, 12, N'XXL')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (19, 13, N'L')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (20, 14, N'L')
INSERT [dbo].[Size] ([id], [productId], [size]) VALUES (21, 5, N'20')
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [email], [password], [name], [gender], [dob], [phone], [address], [isAdmin]) VALUES (2, N'huynq@gmail.com', N'123', N'huy', N'nam', CAST(N'2002-06-20' AS Date), N'1234567890', N'Thái Nguyên', NULL)
INSERT [dbo].[Users] ([id], [email], [password], [name], [gender], [dob], [phone], [address], [isAdmin]) VALUES (3, N'hkt@gmail.com', N'email', N'email', N'email', CAST(N'2002-02-01' AS Date), N'email', N'email', 0)
INSERT [dbo].[Users] ([id], [email], [password], [name], [gender], [dob], [phone], [address], [isAdmin]) VALUES (5, N'huyday@gmail.com', N'1234', N'duong', NULL, NULL, N'0987654321', N'Thái Nguyên', NULL)
INSERT [dbo].[Users] ([id], [email], [password], [name], [gender], [dob], [phone], [address], [isAdmin]) VALUES (21, N'baolam@gmail.com', N'123', N'Bao Lam', N'nu', CAST(N'2004-02-01' AS Date), N'9829328381', N'Thái Nguyên', 1)
INSERT [dbo].[Users] ([id], [email], [password], [name], [gender], [dob], [phone], [address], [isAdmin]) VALUES (22, N'hehe@gmail.com', N'123', N'Tran Quan', N'Nam', CAST(N'1900-01-01' AS Date), N'0346402985', N'Dong Tien', 0)
INSERT [dbo].[Users] ([id], [email], [password], [name], [gender], [dob], [phone], [address], [isAdmin]) VALUES (23, N'hehe2@gmail.com', N'123', N'nam', N'nam', CAST(N'2024-03-20' AS Date), N'010232', N'nam', 0)
INSERT [dbo].[Users] ([id], [email], [password], [name], [gender], [dob], [phone], [address], [isAdmin]) VALUES (26, N'hoang@gmail.com', N'123', N'nam', N'nam', CAST(N'2002-12-12' AS Date), N'123', N'hehehe', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([cusId])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([cusId])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([cusId])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([brandId])
REFERENCES [dbo].[Brand] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([brandId])
REFERENCES [dbo].[Brand] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([brandId])
REFERENCES [dbo].[Brand] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Size]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Size]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Size]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
USE [master]
GO
ALTER DATABASE [projectprj] SET  READ_WRITE 
GO
