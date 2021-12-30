USE [master]
GO
/****** Object:  Database [FlipkartAPIDB]    Script Date: 25-12-2021 17:14:58 ******/
CREATE DATABASE [FlipkartAPIDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FlipkartAPIDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FlipkartAPIDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FlipkartAPIDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FlipkartAPIDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FlipkartAPIDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlipkartAPIDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlipkartAPIDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FlipkartAPIDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlipkartAPIDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlipkartAPIDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FlipkartAPIDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlipkartAPIDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FlipkartAPIDB] SET  MULTI_USER 
GO
ALTER DATABASE [FlipkartAPIDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlipkartAPIDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlipkartAPIDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlipkartAPIDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlipkartAPIDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FlipkartAPIDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FlipkartAPIDB] SET QUERY_STORE = OFF
GO
USE [FlipkartAPIDB]
GO
/****** Object:  Schema [Address]    Script Date: 25-12-2021 17:14:58 ******/
CREATE SCHEMA [Address]
GO
/****** Object:  Schema [Admin]    Script Date: 25-12-2021 17:14:58 ******/
CREATE SCHEMA [Admin]
GO
/****** Object:  Schema [Authentication]    Script Date: 25-12-2021 17:14:58 ******/
CREATE SCHEMA [Authentication]
GO
/****** Object:  Schema [Cart]    Script Date: 25-12-2021 17:14:58 ******/
CREATE SCHEMA [Cart]
GO
/****** Object:  Schema [Customer]    Script Date: 25-12-2021 17:14:58 ******/
CREATE SCHEMA [Customer]
GO
/****** Object:  Schema [Product]    Script Date: 25-12-2021 17:14:58 ******/
CREATE SCHEMA [Product]
GO
/****** Object:  Schema [Sales]    Script Date: 25-12-2021 17:14:58 ******/
CREATE SCHEMA [Sales]
GO
/****** Object:  Table [Product].[Category]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Product].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryTitle] [varchar](64) NOT NULL,
	[CategoryMetaTitle] [varchar](128) NOT NULL,
	[CategoryDescription] [varchar](1024) NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Product].[Brand]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Product].[Brand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandTitle] [varchar](64) NOT NULL,
	[Description] [varchar](512) NOT NULL,
	[Modified_at] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Product].[Discount]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Product].[Discount](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountTitle] [varchar](64) NOT NULL,
	[DiscountDescription] [varchar](256) NOT NULL,
	[DiscountPercentage] [int] NOT NULL,
	[DiscountStartDate] [datetime] NOT NULL,
	[DiscountEndDate] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Product].[Product]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Product].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductTitle] [varchar](64) NOT NULL,
	[ProductDescription] [varchar](512) NOT NULL,
	[BrandId] [int] NULL,
	[CategoryID] [int] NULL,
	[MRP] [decimal](18, 0) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[UnitWeight] [float] NOT NULL,
	[DiscountId] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[SubCategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Product].[SubCatgory]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Product].[SubCatgory](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[SubCategoryTitle] [varchar](64) NOT NULL,
	[SubCategoryMetaTitle] [varchar](128) NULL,
	[SubCategoryDescription] [varchar](1024) NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Product].[VProduct]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Product].[VProduct]
AS
SELECT 
	p.ProductId,
	p.ProductTitle,
	p.ProductDescription,
	b.BrandTitle,
	c.CategoryTitle,
	sc.SubCategoryTitle,
	p.MRP,
	p.Price,
	d.DiscountPercentage,
	p.IsActive
FROM Product.Product p
JOIN Product.Brand b ON p.BrandId = b.BrandId
JOIN Product.Category c ON p.CategoryId = c.CategoryID
JOIN Product.SubCatgory sc ON p.SubCategoryId = sc.SubCategoryId
JOIN Product.Discount d ON p.DiscountId = d.DiscountId
GO
/****** Object:  Table [Address].[State]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Address].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [varchar](5) NOT NULL,
	[StateName] [varchar](32) NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Address].[City]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Address].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](32) NOT NULL,
	[StateID] [int] NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Address].[Address]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Address].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Addressline1] [varchar](64) NOT NULL,
	[AddressLine2] [varchar](64) NOT NULL,
	[contactNumber] [bigint] NOT NULL,
	[CityID] [int] NULL,
	[StateID] [int] NULL,
	[PostalCode] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Address].[VAddress]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Address].[VAddress]
As
SELECT 
	a.AddressId,
	a.Addressline1,
	a.AddressLine2,
	a.contactNumber,
	c.CityName,
	s.StateCode,
	a.PostalCode
FROM Address.Address a
JOIN Address.City c ON a.CityID = c.CityId
JOIN Address.State s ON s.StateId = a.StateID
GO
/****** Object:  Table [Admin].[Admin]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[Admin](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](32) NOT NULL,
	[MiddleName] [varchar](32) NULL,
	[LastName] [varchar](32) NOT NULL,
	[UserName] [varchar](32) NULL,
	[PhoneNumber] [bigint] NOT NULL,
	[Email] [varchar](32) NOT NULL,
	[Active] [bit] NOT NULL,
	[RegisteredAt] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Authentication].[AspNetRoleClaims]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Authentication].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Authentication].[AspNetRoles]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Authentication].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Authentication].[AspNetUserClaims]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Authentication].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Authentication].[AspNetUserLogins]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Authentication].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Authentication].[AspNetUserRoles]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Authentication].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Authentication].[AspNetUsers]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Authentication].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Authentication].[AspNetUserTokens]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Authentication].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Cart].[Cart]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cart].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[Total] [decimal](18, 0) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cart].[CartItem]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cart].[CartItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[NetPrice]  AS ([Quantity]*[UnitPrice]),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Customer].[Customer]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](32) NOT NULL,
	[MiddleName] [varchar](32) NOT NULL,
	[LastName] [varchar](32) NOT NULL,
	[PhoneNumber] [bigint] NOT NULL,
	[Email] [varchar](32) NOT NULL,
	[Active] [bit] NOT NULL,
	[RegisteredAt] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UserName] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Customer].[CustomerAddress]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer].[CustomerAddress](
	[CustomerAddressId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[AddressID] [int] NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Customer].[PaymentDetail]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer].[PaymentDetail](
	[PaymentDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[UPIID] [varchar](20) NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Product].[Inventory]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Product].[Inventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[UnitInStock] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Product].[ProductImage]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Product].[ProductImage](
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ProductImageURL] [nvarchar](256) NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Product].[ProductSeller]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Product].[ProductSeller](
	[ProductID] [int] NULL,
	[SellerID] [int] NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ProductSellerID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductSellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Product].[Seller]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Product].[Seller](
	[SellerId] [int] IDENTITY(1,1) NOT NULL,
	[SellerName] [varchar](64) NOT NULL,
	[SellerContactNumber] [varchar](15) NULL,
	[SellerEmail] [varchar](32) NOT NULL,
	[AddressID] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[OrderDetail]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderHeaderID] [int] NULL,
	[ProductId] [int] NULL,
	[OrderStatusID] [int] NULL,
	[ProductQuantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[CarrieTrakingNumber] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[NetPrice]  AS ([ProductQuantity]*[UnitPrice]),
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[OrderHeader]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[OrderHeader](
	[OrderHeaderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusID] [int] NULL,
	[OrderDate] [datetime] NOT NULL,
	[CustomerID] [int] NULL,
	[CartID] [int] NULL,
	[BillToAddressID] [int] NULL,
	[ShippingToAddressID] [int] NULL,
	[subTotal] [decimal](18, 0) NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderHeaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[OrderPayment]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[OrderPayment](
	[OrderPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderHeaderID] [int] NULL,
	[OrderPaymentStatus] [bit] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderPaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[OrderStatus]    Script Date: 25-12-2021 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[OrderStatus](
	[OrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [varchar](32) NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 25-12-2021 17:14:58 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [Authentication].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 25-12-2021 17:14:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [Authentication].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 25-12-2021 17:14:58 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [Authentication].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 25-12-2021 17:14:58 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [Authentication].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 25-12-2021 17:14:58 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [Authentication].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 25-12-2021 17:14:58 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [Authentication].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 25-12-2021 17:14:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [Authentication].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Address].[Address] ADD  CONSTRAINT [Address_Created_at]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Address].[Address] ADD  CONSTRAINT [Address_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Address].[Address] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Address].[City] ADD  CONSTRAINT [City_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Address].[City] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Address].[State] ADD  CONSTRAINT [State_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Address].[State] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Admin].[Admin] ADD  CONSTRAINT [Admin_Registered_at]  DEFAULT (getdate()) FOR [RegisteredAt]
GO
ALTER TABLE [Admin].[Admin] ADD  CONSTRAINT [Admin_Created_at]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Admin].[Admin] ADD  CONSTRAINT [Admin_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Admin].[Admin] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Cart].[Cart] ADD  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [Cart].[Cart] ADD  CONSTRAINT [Cart_Created_at]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Cart].[Cart] ADD  CONSTRAINT [Cart_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Cart].[Cart] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Cart].[CartItem] ADD  CONSTRAINT [CartItem_Created_at]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Cart].[CartItem] ADD  CONSTRAINT [CartItem_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Cart].[CartItem] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Customer].[Customer] ADD  CONSTRAINT [Customer_Registered_at]  DEFAULT (getdate()) FOR [RegisteredAt]
GO
ALTER TABLE [Customer].[Customer] ADD  CONSTRAINT [Customer_Created_at]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Customer].[Customer] ADD  CONSTRAINT [Customer_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Customer].[Customer] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Customer].[CustomerAddress] ADD  CONSTRAINT [CustomerAddress_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Customer].[CustomerAddress] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Customer].[PaymentDetail] ADD  CONSTRAINT [PaymentDetail_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Customer].[PaymentDetail] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Product].[Brand] ADD  CONSTRAINT [Brand_Modifed_at]  DEFAULT (getdate()) FOR [Modified_at]
GO
ALTER TABLE [Product].[Brand] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Product].[Category] ADD  CONSTRAINT [Category_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Product].[Category] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Product].[Discount] ADD  DEFAULT ((0)) FOR [DiscountPercentage]
GO
ALTER TABLE [Product].[Discount] ADD  CONSTRAINT [Discount_Created_at]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Product].[Discount] ADD  CONSTRAINT [Discount_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Product].[Discount] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Product].[Inventory] ADD  CONSTRAINT [Inventory_Created_at]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Product].[Inventory] ADD  CONSTRAINT [Inventory_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Product].[Inventory] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Product].[Product] ADD  DEFAULT ((0)) FOR [MRP]
GO
ALTER TABLE [Product].[Product] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [Product].[Product] ADD  CONSTRAINT [Product_Created_at]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Product].[Product] ADD  CONSTRAINT [Product_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Product].[Product] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Product].[ProductImage] ADD  CONSTRAINT [ProductImage_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Product].[ProductImage] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Product].[ProductSeller] ADD  CONSTRAINT [ProductSeller_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Product].[ProductSeller] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Product].[Seller] ADD  CONSTRAINT [Seller_Created_at]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Product].[Seller] ADD  CONSTRAINT [Seller_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Product].[Seller] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Product].[SubCatgory] ADD  CONSTRAINT [SubCategory_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Product].[SubCatgory] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Sales].[OrderDetail] ADD  DEFAULT (newid()) FOR [CarrieTrakingNumber]
GO
ALTER TABLE [Sales].[OrderDetail] ADD  CONSTRAINT [OrderDetail_Created_at]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Sales].[OrderDetail] ADD  CONSTRAINT [OrderDetail_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Sales].[OrderDetail] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Sales].[OrderHeader] ADD  CONSTRAINT [OrderHeader_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [Sales].[OrderHeader] ADD  CONSTRAINT [OrderHeader_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Sales].[OrderHeader] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Sales].[OrderPayment] ADD  CONSTRAINT [OrderPayment_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Sales].[OrderPayment] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [Sales].[OrderStatus] ADD  CONSTRAINT [Customer_Modifed_at]  DEFAULT (getdate()) FOR [ModifiedAt]
GO
ALTER TABLE [Address].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_CityID] FOREIGN KEY([CityID])
REFERENCES [Address].[City] ([CityId])
GO
ALTER TABLE [Address].[Address] CHECK CONSTRAINT [FK_Address_CityID]
GO
ALTER TABLE [Address].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_StateID] FOREIGN KEY([StateID])
REFERENCES [Address].[State] ([StateId])
GO
ALTER TABLE [Address].[Address] CHECK CONSTRAINT [FK_Address_StateID]
GO
ALTER TABLE [Address].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_StateID] FOREIGN KEY([StateID])
REFERENCES [Address].[State] ([StateId])
GO
ALTER TABLE [Address].[City] CHECK CONSTRAINT [FK_City_StateID]
GO
ALTER TABLE [Authentication].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [Authentication].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Authentication].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [Authentication].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [Authentication].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Authentication].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [Authentication].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [Authentication].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Authentication].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [Authentication].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [Authentication].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Authentication].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [Authentication].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [Authentication].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Authentication].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [Authentication].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [Authentication].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Authentication].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [Cart].[Cart]  WITH CHECK ADD  CONSTRAINT [Fk_ShoppingCart_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [Customer].[Customer] ([CustomerId])
GO
ALTER TABLE [Cart].[Cart] CHECK CONSTRAINT [Fk_ShoppingCart_CustomerID]
GO
ALTER TABLE [Cart].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_CartId] FOREIGN KEY([CartId])
REFERENCES [Cart].[Cart] ([CartId])
GO
ALTER TABLE [Cart].[CartItem] CHECK CONSTRAINT [FK_CartItem_CartId]
GO
ALTER TABLE [Cart].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_ProductId] FOREIGN KEY([ProductId])
REFERENCES [Product].[Product] ([ProductId])
GO
ALTER TABLE [Cart].[CartItem] CHECK CONSTRAINT [FK_CartItem_ProductId]
GO
ALTER TABLE [Customer].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddress_AddressID] FOREIGN KEY([AddressID])
REFERENCES [Address].[Address] ([AddressId])
GO
ALTER TABLE [Customer].[CustomerAddress] CHECK CONSTRAINT [FK_CustomerAddress_AddressID]
GO
ALTER TABLE [Customer].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [Fk_CustomerAddress_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [Customer].[Customer] ([CustomerId])
GO
ALTER TABLE [Customer].[CustomerAddress] CHECK CONSTRAINT [Fk_CustomerAddress_CustomerID]
GO
ALTER TABLE [Customer].[PaymentDetail]  WITH CHECK ADD  CONSTRAINT [Fk_PaymentDetail_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [Customer].[Customer] ([CustomerId])
GO
ALTER TABLE [Customer].[PaymentDetail] CHECK CONSTRAINT [Fk_PaymentDetail_CustomerID]
GO
ALTER TABLE [Product].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_ProductID] FOREIGN KEY([ProductID])
REFERENCES [Product].[Product] ([ProductId])
GO
ALTER TABLE [Product].[Inventory] CHECK CONSTRAINT [FK_Inventory_ProductID]
GO
ALTER TABLE [Product].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_BrandId] FOREIGN KEY([BrandId])
REFERENCES [Product].[Brand] ([BrandId])
GO
ALTER TABLE [Product].[Product] CHECK CONSTRAINT [FK_Product_BrandId]
GO
ALTER TABLE [Product].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_DiscountId] FOREIGN KEY([DiscountId])
REFERENCES [Product].[Discount] ([DiscountId])
GO
ALTER TABLE [Product].[Product] CHECK CONSTRAINT [FK_Product_DiscountId]
GO
ALTER TABLE [Product].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_subCategoryID] FOREIGN KEY([CategoryID])
REFERENCES [Product].[Category] ([CategoryId])
GO
ALTER TABLE [Product].[Product] CHECK CONSTRAINT [FK_Product_subCategoryID]
GO
ALTER TABLE [Product].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_subCatgoryId] FOREIGN KEY([SubCategoryId])
REFERENCES [Product].[SubCatgory] ([SubCategoryId])
GO
ALTER TABLE [Product].[Product] CHECK CONSTRAINT [FK_Product_subCatgoryId]
GO
ALTER TABLE [Product].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_ProductId] FOREIGN KEY([ProductID])
REFERENCES [Product].[Product] ([ProductId])
GO
ALTER TABLE [Product].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_ProductId]
GO
ALTER TABLE [Product].[ProductSeller]  WITH CHECK ADD  CONSTRAINT [FK_ProductSeller_ProductId] FOREIGN KEY([ProductID])
REFERENCES [Product].[Product] ([ProductId])
GO
ALTER TABLE [Product].[ProductSeller] CHECK CONSTRAINT [FK_ProductSeller_ProductId]
GO
ALTER TABLE [Product].[ProductSeller]  WITH CHECK ADD  CONSTRAINT [FK_ProductSeller_SellertId] FOREIGN KEY([SellerID])
REFERENCES [Product].[Seller] ([SellerId])
GO
ALTER TABLE [Product].[ProductSeller] CHECK CONSTRAINT [FK_ProductSeller_SellertId]
GO
ALTER TABLE [Product].[Seller]  WITH CHECK ADD  CONSTRAINT [FK_Seller_AddressID] FOREIGN KEY([AddressID])
REFERENCES [Address].[Address] ([AddressId])
GO
ALTER TABLE [Product].[Seller] CHECK CONSTRAINT [FK_Seller_AddressID]
GO
ALTER TABLE [Product].[SubCatgory]  WITH CHECK ADD  CONSTRAINT [FK_SubCatgory_subCategoryID] FOREIGN KEY([CategoryID])
REFERENCES [Product].[Category] ([CategoryId])
GO
ALTER TABLE [Product].[SubCatgory] CHECK CONSTRAINT [FK_SubCatgory_subCategoryID]
GO
ALTER TABLE [Sales].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_OrderHeaderId] FOREIGN KEY([OrderHeaderID])
REFERENCES [Sales].[OrderHeader] ([OrderHeaderId])
GO
ALTER TABLE [Sales].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_OrderHeaderId]
GO
ALTER TABLE [Sales].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_OrderStatusID] FOREIGN KEY([OrderStatusID])
REFERENCES [Sales].[OrderStatus] ([OrderStatusID])
GO
ALTER TABLE [Sales].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_OrderStatusID]
GO
ALTER TABLE [Sales].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductId] FOREIGN KEY([ProductId])
REFERENCES [Product].[Product] ([ProductId])
GO
ALTER TABLE [Sales].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductId]
GO
ALTER TABLE [Sales].[OrderHeader]  WITH CHECK ADD  CONSTRAINT [FK__AddressID] FOREIGN KEY([BillToAddressID])
REFERENCES [Address].[Address] ([AddressId])
GO
ALTER TABLE [Sales].[OrderHeader] CHECK CONSTRAINT [FK__AddressID]
GO
ALTER TABLE [Sales].[OrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddress_AddressID] FOREIGN KEY([ShippingToAddressID])
REFERENCES [Address].[Address] ([AddressId])
GO
ALTER TABLE [Sales].[OrderHeader] CHECK CONSTRAINT [FK_CustomerAddress_AddressID]
GO
ALTER TABLE [Sales].[OrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeader_CartID] FOREIGN KEY([CartID])
REFERENCES [Cart].[Cart] ([CartId])
GO
ALTER TABLE [Sales].[OrderHeader] CHECK CONSTRAINT [FK_OrderHeader_CartID]
GO
ALTER TABLE [Sales].[OrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeader_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [Customer].[Customer] ([CustomerId])
GO
ALTER TABLE [Sales].[OrderHeader] CHECK CONSTRAINT [FK_OrderHeader_CustomerID]
GO
ALTER TABLE [Sales].[OrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeader_OrderStatusID] FOREIGN KEY([OrderStatusID])
REFERENCES [Sales].[OrderStatus] ([OrderStatusID])
GO
ALTER TABLE [Sales].[OrderHeader] CHECK CONSTRAINT [FK_OrderHeader_OrderStatusID]
GO
ALTER TABLE [Sales].[OrderPayment]  WITH CHECK ADD  CONSTRAINT [FK_OrderPayment_OrderHeaderId] FOREIGN KEY([OrderHeaderID])
REFERENCES [Sales].[OrderHeader] ([OrderHeaderId])
GO
ALTER TABLE [Sales].[OrderPayment] CHECK CONSTRAINT [FK_OrderPayment_OrderHeaderId]
GO
ALTER TABLE [Address].[Address]  WITH CHECK ADD  CONSTRAINT [chk_CustomerAddress_contactNumber_valid] CHECK  ((len([contactNumber])=(10)))
GO
ALTER TABLE [Address].[Address] CHECK CONSTRAINT [chk_CustomerAddress_contactNumber_valid]
GO
ALTER TABLE [Address].[Address]  WITH CHECK ADD  CONSTRAINT [CHK_postalCode] CHECK  ((len([PostalCode])=(6)))
GO
ALTER TABLE [Address].[Address] CHECK CONSTRAINT [CHK_postalCode]
GO
ALTER TABLE [Admin].[Admin]  WITH CHECK ADD  CONSTRAINT [chk_Admin_email_valid] CHECK  (([email] like '%_@__%.__%'))
GO
ALTER TABLE [Admin].[Admin] CHECK CONSTRAINT [chk_Admin_email_valid]
GO
ALTER TABLE [Admin].[Admin]  WITH CHECK ADD  CONSTRAINT [chk_Admin_PhoneNumber_valid] CHECK  ((len([PhoneNumber])=(10)))
GO
ALTER TABLE [Admin].[Admin] CHECK CONSTRAINT [chk_Admin_PhoneNumber_valid]
GO
ALTER TABLE [Customer].[Customer]  WITH CHECK ADD  CONSTRAINT [chk_email_valid] CHECK  (([email] like '%_@__%.__%'))
GO
ALTER TABLE [Customer].[Customer] CHECK CONSTRAINT [chk_email_valid]
GO
ALTER TABLE [Customer].[Customer]  WITH CHECK ADD  CONSTRAINT [chk_PhoneNumber_valid] CHECK  ((len([PhoneNumber])=(10)))
GO
ALTER TABLE [Customer].[Customer] CHECK CONSTRAINT [chk_PhoneNumber_valid]
GO
ALTER TABLE [Customer].[PaymentDetail]  WITH CHECK ADD  CONSTRAINT [chk_PaymentDetail_UPIID] CHECK  (([UPIID] like '%[0-9]%@%'))
GO
ALTER TABLE [Customer].[PaymentDetail] CHECK CONSTRAINT [chk_PaymentDetail_UPIID]
GO
ALTER TABLE [Product].[Discount]  WITH CHECK ADD  CONSTRAINT [chk_DiscountPercentage] CHECK  (([DiscountPercentage]<(100)))
GO
ALTER TABLE [Product].[Discount] CHECK CONSTRAINT [chk_DiscountPercentage]
GO
ALTER TABLE [Product].[Inventory]  WITH CHECK ADD  CONSTRAINT [chk_UnitInStock] CHECK  (([UnitInStock]>=(0)))
GO
ALTER TABLE [Product].[Inventory] CHECK CONSTRAINT [chk_UnitInStock]
GO
ALTER TABLE [Product].[Seller]  WITH CHECK ADD  CONSTRAINT [chk_ContactNumber] CHECK  ((NOT [SellerContactNumber] like '%[^0-9]%'))
GO
ALTER TABLE [Product].[Seller] CHECK CONSTRAINT [chk_ContactNumber]
GO
ALTER TABLE [Product].[Seller]  WITH CHECK ADD  CONSTRAINT [chk_sellerEmail_valid] CHECK  (([SellerEmail] like '%_@__%.__%'))
GO
ALTER TABLE [Product].[Seller] CHECK CONSTRAINT [chk_sellerEmail_valid]
GO
USE [master]
GO
ALTER DATABASE [FlipkartAPIDB] SET  READ_WRITE 
GO
