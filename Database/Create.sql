USE [master]
GO
/****** Object:  Database [KurbSide]    Script Date: 2021-04-15 8:17:35 PM ******/
CREATE DATABASE [KurbSide]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KurbSide', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KurbSide.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KurbSide_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KurbSide_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KurbSide] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KurbSide].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KurbSide] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KurbSide] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KurbSide] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KurbSide] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KurbSide] SET ARITHABORT OFF 
GO
ALTER DATABASE [KurbSide] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KurbSide] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KurbSide] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KurbSide] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KurbSide] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KurbSide] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KurbSide] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KurbSide] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KurbSide] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KurbSide] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KurbSide] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KurbSide] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KurbSide] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KurbSide] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KurbSide] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KurbSide] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KurbSide] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KurbSide] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KurbSide] SET  MULTI_USER 
GO
ALTER DATABASE [KurbSide] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KurbSide] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KurbSide] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KurbSide] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KurbSide] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KurbSide] SET QUERY_STORE = OFF
GO
USE [KurbSide]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2021-04-15 8:17:35 PM ******/
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
/****** Object:  Table [dbo].[AccountSettings]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountSettings](
	[AspNetId] [nvarchar](450) NOT NULL,
	[TimeZoneID] [uniqueidentifier] NULL,
	[PromotionalEmails] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AspNetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Business]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business](
	[AspNetId] [nvarchar](450) NOT NULL,
	[BusinessId] [uniqueidentifier] NOT NULL,
	[BusinessName] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](22) NOT NULL,
	[Street] [nvarchar](255) NOT NULL,
	[StreetLn2] [nvarchar](255) NULL,
	[City] [nvarchar](60) NOT NULL,
	[Postal] [nvarchar](10) NOT NULL,
	[ProvinceCode] [nvarchar](2) NULL,
	[CountryCode] [nvarchar](2) NULL,
	[BusinessNumber] [nvarchar](255) NULL,
	[ContactPhone] [nvarchar](22) NOT NULL,
	[ContactFirst] [nvarchar](100) NOT NULL,
	[ContactLast] [nvarchar](100) NOT NULL,
	[Lat] [float] NOT NULL,
	[Lng] [float] NOT NULL,
	[StoreIdentifier] [varchar](30) NULL,
	[LogoLocation] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AspNetId] ASC,
	[BusinessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusinessHours]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessHours](
	[BusinessId] [uniqueidentifier] NOT NULL,
	[MonOpen] [time](7) NULL,
	[MonClose] [time](7) NULL,
	[TuesOpen] [time](7) NULL,
	[TuesClose] [time](7) NULL,
	[WedOpen] [time](7) NULL,
	[WedClose] [time](7) NULL,
	[ThuOpen] [time](7) NULL,
	[ThuClose] [time](7) NULL,
	[FriOpen] [time](7) NULL,
	[FriClose] [time](7) NULL,
	[SatOpen] [time](7) NULL,
	[SatClose] [time](7) NULL,
	[SunOpen] [time](7) NULL,
	[SunClose] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[BusinessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [uniqueidentifier] NOT NULL,
	[MemberId] [uniqueidentifier] NOT NULL,
	[ExpiryDate] [date] NULL,
	[BusinessId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[CartId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryCode] [nvarchar](2) NOT NULL,
	[FullName] [nvarchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [uniqueidentifier] NOT NULL,
	[BusinessId] [uniqueidentifier] NOT NULL,
	[ItemName] [nvarchar](100) NOT NULL,
	[Details] [nvarchar](500) NULL,
	[Price] [decimal](19, 4) NOT NULL,
	[SKU] [nvarchar](50) NULL,
	[UPC] [nvarchar](50) NULL,
	[ImageLocation] [nvarchar](255) NULL,
	[Category] [nvarchar](50) NULL,
	[Removed] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC,
	[BusinessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[AspNetId] [nvarchar](450) NOT NULL,
	[MemberId] [uniqueidentifier] NOT NULL,
	[Lat] [float] NOT NULL,
	[Lng] [float] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Street] [nvarchar](255) NOT NULL,
	[StreetLn2] [nvarchar](255) NULL,
	[City] [nvarchar](60) NOT NULL,
	[Postal] [nvarchar](10) NOT NULL,
	[ProvinceCode] [nvarchar](2) NULL,
	[CountryCode] [nvarchar](2) NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Gender] [nvarchar](10) NULL,
	[Birthday] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AspNetId] ASC,
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationId] [uniqueidentifier] NOT NULL,
	[SenderId] [nvarchar](450) NOT NULL,
	[RecipientId] [nvarchar](450) NOT NULL,
	[NotificationDateTime] [datetime] NOT NULL,
	[NotificationDetails] [nvarchar](500) NULL,
	[Read] [bit] NOT NULL,
	[SaleId] [uniqueidentifier] NULL,
	[OrderId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [uniqueidentifier] NOT NULL,
	[MemberId] [uniqueidentifier] NOT NULL,
	[SubTotal] [decimal](19, 4) NOT NULL,
	[DiscountTotal] [decimal](19, 4) NULL,
	[Tax] [decimal](19, 4) NOT NULL,
	[GrandTotal] [decimal](19, 4) NOT NULL,
	[Status] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[BusinessId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [decimal](19, 4) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[StatusId] [int] NOT NULL,
	[StatusName] [nvarchar](25) NOT NULL,
	[StatusText] [nvarchar](500) NOT NULL,
	[BootstrapClass] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[ProvinceCode] [nvarchar](2) NOT NULL,
	[CountryCode] [nvarchar](2) NOT NULL,
	[FullName] [nvarchar](60) NOT NULL,
	[TaxRate] [decimal](19, 4) NOT NULL,
	[TaxCode] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProvinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleId] [uniqueidentifier] NOT NULL,
	[BusinessId] [uniqueidentifier] NOT NULL,
	[SaleName] [nvarchar](50) NOT NULL,
	[SaleDescription] [nvarchar](500) NULL,
	[SaleCategory] [nvarchar](50) NULL,
	[SaleDiscountPercentage] [decimal](19, 4) NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleItem]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleItem](
	[SaleId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeZones]    Script Date: 2021-04-15 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeZones](
	[TimeZoneID] [uniqueidentifier] NOT NULL,
	[Offset] [varchar](25) NOT NULL,
	[Label] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TimeZoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'0157f938-ea8f-4b16-a7ac-1ec9f149757f', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'08a7e5ef-3143-451d-a6d7-65a0423d63c5', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'0caf4ed6-0953-4ce5-aabc-641bcb533034', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'0e2cb5ab-2ccf-4b45-90b6-3b3d7ec4a4d9', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'3734596e-0859-4268-bb15-20903999a618', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'39cd8208-5778-4702-8d49-649374ebd833', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'5e283caf-b6b3-4fae-8be0-4d6e27169a3d', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'5ffe5a32-e0c6-4fd2-a920-0b8e85bb9330', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'6e141fc5-335c-4fb4-a5c4-ecf9d2a84291', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'77d8d3fc-75fc-45f5-bb14-99ac84c4cd76', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'7aab93b4-bc0b-44d2-98f3-391c81641864', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'8575142b-6409-4ce1-bd42-70a26a11b59a', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'86ca9b21-449e-49cb-a163-41d6cfe237e4', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'91c1aa28-b65c-4591-84ff-f766cee2a6bf', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'b2380ac0-8dc7-48eb-a3e4-793c99b4a4f1', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'b69d048e-a3a5-463e-aa16-ad5d60407876', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'b7367094-751d-40ed-8f8c-ceb2413436b8', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'b8fe74d8-8483-488a-aeaf-f3b9fd768354', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'bb6d41de-8d16-4957-a1c6-225bc56e87f2', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'c07bea00-9078-42c7-bcfd-6162bb181319', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'c674e161-6066-4954-9d05-e0f9e7a4dfff', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'c7d1a7f6-bdc0-4a0e-948e-02f5eb10d54f', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'cec60a64-3a45-4ef2-9b1f-10c9dfdaeb4e', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'd229c3eb-aabe-45a2-8034-6f4e3d0ec8d7', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'd6867a89-3540-458f-b69a-752356420243', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'e359f266-07bd-4963-8d4f-35d5ca747acb', N'46f80240-9775-40ba-9ba4-1519a7bb04ea', 1)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'e9db5055-0c11-4b27-802e-235d29cced27', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'ef87f859-e9bc-4f12-ac61-09b777a1c418', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'f15fa658-68d6-44a6-9a2d-d8b633377718', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
INSERT [dbo].[AccountSettings] ([AspNetId], [TimeZoneID], [PromotionalEmails]) VALUES (N'ff901e9b-1824-44a7-aea3-364ff10d559a', N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0157f938-ea8f-4b16-a7ac-1ec9f149757f', N'test@kurbsi.de', N'TEST@KURBSI.DE', N'test@kurbsi.de', N'TEST@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAENZnFJWLHkLMJto14yjo6HcUp9BScOeNBzbOC9wYrwisC73f4SOxnQpRWBdV5thwNA==', N'BSOP47MFNVRAI7YCQV3Y6PHQAK6JEJBA', N'40842fc2-a67d-4ac5-9895-2e81fc3b6569', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'08a7e5ef-3143-451d-a6d7-65a0423d63c5', N'bestbuy@kurbsi.de', N'BESTBUY@KURBSI.DE', N'bestbuy@kurbsi.de', N'BESTBUY@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEO+KsnaKe1ZyQx43GuwjnXX35V1fgBEDzTNCRyoQuGaZcBb/SlfwAjJ51C+4BFfCyA==', N'2OBB5TCVZ7AZCXJTYOXLHSZDRBZWXALK', N'c76c4911-795a-489c-aefc-3ffe55a51b63', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0caf4ed6-0953-4ce5-aabc-641bcb533034', N'Scotiabank@kurbsi.de', N'SCOTIABANK@KURBSI.DE', N'Scotiabank@kurbsi.de', N'SCOTIABANK@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEG/56sh7l3WC2OLUDVMJbcD1GAlVhoCn+tcp/v3anDIiLIKScboNj0dCs1ELjRSgvQ==', N'NV2UFSSS2G6MXED4YW6C42WMTIHNI3SI', N'0be1d2e2-2619-46e6-a52c-fba99b0c0d44', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0e2cb5ab-2ccf-4b45-90b6-3b3d7ec4a4d9', N'AltimaCambridgeDentalCentre@kurbsi.de', N'ALTIMACAMBRIDGEDENTALCENTRE@KURBSI.DE', N'AltimaCambridgeDentalCentre@kurbsi.de', N'ALTIMACAMBRIDGEDENTALCENTRE@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEPVmK8eqg+ocHYaxsymrNNy0YDQtWxqpApt2Wb4zbNv6uQtAW+PqA9/qanioQ57otw==', N'FEL75PKHZ56J5RJJRXFKP4TTQXADSXQY', N'30167ce4-e9d9-4a2c-a54c-a87111939f71', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3734596e-0859-4268-bb15-20903999a618', N'AlderPestManagementInc.@kurbsi.de', N'ALDERPESTMANAGEMENTINC.@KURBSI.DE', N'AlderPestManagementInc.@kurbsi.de', N'ALDERPESTMANAGEMENTINC.@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEK79IABG8wFhJsqj7kJx4nQgp/GFTMBtWP2nTFG1J0touTzHUNic6okivVKP+zlUjg==', N'G5L6MTTVEXUVPS67DXTHR5PSYYCH37P2', N'19394f82-ac63-466c-aee7-6f26cee3fef5', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'39cd8208-5778-4702-8d49-649374ebd833', N'BakerTillyGWD@kurbsi.de', N'BAKERTILLYGWD@KURBSI.DE', N'BakerTillyGWD@kurbsi.de', N'BAKERTILLYGWD@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEGjT1YIpo4kNAHLBghNrcc+eivybzOuOr4UyGJ1BrTtX0gx268UQfwk477sF84ZtlQ==', N'L4XCIEVU4HGHMIZLEL2IMQWX7EZ6W2D6', N'74a93fb8-7e77-4f49-a266-fbc75f1e77c2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5e283caf-b6b3-4fae-8be0-4d6e27169a3d', N'HealingFoundationsNaturopathicClinic@kurbsi.de', N'HEALINGFOUNDATIONSNATUROPATHICCLINIC@KURBSI.DE', N'HealingFoundationsNaturopathicClinic@kurbsi.de', N'HEALINGFOUNDATIONSNATUROPATHICCLINIC@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEBhEnJKRr6hx0hlIB5vYQAyF7+WYk01SCl71c9jsK1qFQWS7IV5drKb/rf5bxLbDFg==', N'QSUSZ2ZQ4RFPC6BET2WCSRPXLTFJODFF', N'a7a9e848-63e3-44d3-91c4-3da4b2887b1e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5ffe5a32-e0c6-4fd2-a920-0b8e85bb9330', N'5dcomputersystemsandsupplies@kurbsi.de', N'5DCOMPUTERSYSTEMSANDSUPPLIES@KURBSI.DE', N'5dcomputersystemsandsupplies@kurbsi.de', N'5DCOMPUTERSYSTEMSANDSUPPLIES@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEMft64YkbtRjb7fgE03ff2vTnJPo5meLAekhxKMqIyb1JkUe7t5AjH2uHr6cKDN9Yg==', N'P3OPXBBTHOKO5AZZUART7RTQVLMYCFBQ', N'fb2dee96-6b55-4ed5-bba1-47d2e747dc2b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6e141fc5-335c-4fb4-a5c4-ecf9d2a84291', N'HairRazors@kurbsi.de', N'HAIRRAZORS@KURBSI.DE', N'HairRazors@kurbsi.de', N'HAIRRAZORS@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEKXzekopEj2hmhe6PCU9AjGtaAjsw95vkDl8VqQLvUWxQa8TRjEFhRikkq11AeJL7A==', N'DZ5UCSKZQWUBAOVGBMIWSYKYEBT5RT5A', N'd4f192ff-29c7-4f9d-a66b-c1fd8e81fa8d', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'77d8d3fc-75fc-45f5-bb14-99ac84c4cd76', N'CanadianChristianBusinessFederation@kurbsi.de', N'CANADIANCHRISTIANBUSINESSFEDERATION@KURBSI.DE', N'CanadianChristianBusinessFederation@kurbsi.de', N'CANADIANCHRISTIANBUSINESSFEDERATION@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEBpE/b1K5ugFwAn5BHPHhVX/Y3HkCEfGOLlFtg4glud6aU8pMsBxi1geuUKO/4wccA==', N'YMZPWOWU2XOOVOXIG7SRTNYNZJCA3VYY', N'73ca7da4-7e4b-4005-9de9-2d17f2cfc4fd', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7aab93b4-bc0b-44d2-98f3-391c81641864', N'2groboticsinc@kurbsi.de', N'2GROBOTICSINC@KURBSI.DE', N'2groboticsinc@kurbsi.de', N'2GROBOTICSINC@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEH88Yx7CMS8sZ91ed7bl+6eczHvaWitOuOl/A8OQqODmD7CexZa7tLvOEJwgWptgNQ==', N'XIU45IRL2YCCC6ONMTX7MHTRNY2YBJMF', N'83f13691-d9e3-4b15-aa37-9616871717bb', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8575142b-6409-4ce1-bd42-70a26a11b59a', N'harleydavidson@kurbsi.de', N'HARLEYDAVIDSON@KURBSI.DE', N'harleydavidson@kurbsi.de', N'HARLEYDAVIDSON@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEH+cfga86QIk4+W4V8geIbbeBo+GBN/CvjtZ53CEMXMH3o7KhnkbjONa+uymL/5dAg==', N'24ILQ74MSS5Q24LP4BHAFODBZ7WFBGVL', N'ffde1f0d-0ff9-4290-a40e-5105711534dd', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'86ca9b21-449e-49cb-a163-41d6cfe237e4', N'3DSheetMetalLtd.@kurbsi.de', N'3DSHEETMETALLTD.@KURBSI.DE', N'3DSheetMetalLtd.@kurbsi.de', N'3DSHEETMETALLTD.@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEBgLg8fT24oaU0tkuVSXQu2lnqtlo92Wj/mKKc0s/iwKHkhQNjHP1dthpUfjE2T8ww==', N'N3Q6QELIPAPZY7WO56NQANPCSBRSNVTI', N'02fe4fa5-7793-41cc-989b-734eace6ad31', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'91c1aa28-b65c-4591-84ff-f766cee2a6bf', N'ActionCoachBusinessCoaching@kurbsi.de', N'ACTIONCOACHBUSINESSCOACHING@KURBSI.DE', N'ActionCoachBusinessCoaching@kurbsi.de', N'ACTIONCOACHBUSINESSCOACHING@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEIMaSnDJdJRhjGU7gTk2nPpboQc2G20z+Zo4/QJv0H5q44ifoSF1dWtzv45sMOm4sQ==', N'SOTRRKROUQUVTQY53TMQWUTNHBERCJN2', N'92afff27-210c-42f3-aa4e-d59cfba03539', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b2380ac0-8dc7-48eb-a3e4-793c99b4a4f1', N'hywtas@kurbsi.de', N'HYWTAS@KURBSI.DE', N'hywtas@kurbsi.de', N'HYWTAS@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEAMc7HKc+KpLZ0PVzUQrlleFMn6YEhsgg5Lmc8fIQlPDWRcy8/W9KNPlC1ZpZPPstA==', N'NI563COEFKC2XTTUFXHUXF47X6WYHNQA', N'1f30327b-d4cc-4ae4-aec0-d1b1060392d6', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b69d048e-a3a5-463e-aa16-ad5d60407876', N'654SignInc.@kurbsi.de', N'654SIGNINC.@KURBSI.DE', N'654SignInc.@kurbsi.de', N'654SIGNINC.@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEO1UYPsIhKqG3+rFcK95K9qfOo21uRWBPp2ytO19AxtYZEZ5BvONCWi4jjE4bFSNGg==', N'NHA5D2IZBAH346T7PRZV5HLG73H7SUZ6', N'662b801a-654a-4132-9fac-a4bd0b012b78', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b7367094-751d-40ed-8f8c-ceb2413436b8', N'WellyTailsInc@kurbsi.de', N'WELLYTAILSINC@KURBSI.DE', N'WellyTailsInc@kurbsi.de', N'WELLYTAILSINC@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEFSKl4WAx4z/8+0j8jurDw7i0C3sx867jF6+PRjKsVukA0Wyaw46QChNnnbV5i6w8A==', N'5DRHYHTJRQRDDEQKCFO5OOIXJ73TJGC3', N'9bb31676-d60d-42fe-8665-13192192077f', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b8fe74d8-8483-488a-aeaf-f3b9fd768354', N'amcwilliamsgroup@kurbsi.de', N'AMCWILLIAMSGROUP@KURBSI.DE', N'amcwilliamsgroup@kurbsi.de', N'AMCWILLIAMSGROUP@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEAnfnZJeK92qIrWKwg2heiyUs2GqkO3zmli/t207XHSSouIBkFr623DXc+aYLx2VTg==', N'2FRIOSBJGXMGNX2A53BWMGNDGPNEDTF6', N'e6e8a8d1-179b-4d99-b6aa-c3f6f33c7778', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'bb6d41de-8d16-4957-a1c6-225bc56e87f2', N'AlltechCanada@kurbsi.de', N'ALLTECHCANADA@KURBSI.DE', N'AlltechCanada@kurbsi.de', N'ALLTECHCANADA@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEL0o7PGCcRHhbFMRPncu0lUInIbgVZAkHb4Gnjk5erg9+CDjK8DNqKMJKfHXgWO1Wg==', N'K7P3KHZGS4774IPTTR4KR6DFOIZGUVJC', N'70456c4e-4aba-46f6-a867-f66c406364ba', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c07bea00-9078-42c7-bcfd-6162bb181319', N'anopticallab@kurbsi.de', N'ANOPTICALLAB@KURBSI.DE', N'anopticallab@kurbsi.de', N'ANOPTICALLAB@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEOHv84u7hwdYBt/Mcwb2qtq/9Ymq13fMXycSlmg2ydYZTnnxy43mwJLpoACSKRHl/g==', N'LLPG4R6KGQFVYCQHFSSHRQPBMOJ7D7G7', N'5ac9ade4-2035-4326-b697-10c1f754f8dc', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c674e161-6066-4954-9d05-e0f9e7a4dfff', N'365ConsultantsInc.@kurbsi.de', N'365CONSULTANTSINC.@KURBSI.DE', N'365ConsultantsInc.@kurbsi.de', N'365CONSULTANTSINC.@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEE0W2yrMXmP1mMznjUcTAVuO4fu5QpqcPCP9C11gtPMqkQBJevZFUpjdyCqNP1i5PQ==', N'S6GAB7WBPUY6PH3R6YHIJG6GXHORR5B4', N'c120ddeb-9a13-4165-9b81-ccb165c94f5f', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c7d1a7f6-bdc0-4a0e-948e-02f5eb10d54f', N'21stCenturySolutionsLtd.@kurbsi.de', N'21STCENTURYSOLUTIONSLTD.@KURBSI.DE', N'21stCenturySolutionsLtd.@kurbsi.de', N'21STCENTURYSOLUTIONSLTD.@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEKU21e4npL2e3xR3p8fFReUZ86nIf9GN/6c1/VDi7+n7ciRLTym7SE7ZcZ0GTLcUNQ==', N'NAHA65HW44XYJJI4F7STCKA76ZLG472Q', N'edeef4e9-f1d2-455a-9f1e-212ffd5c61bc', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'cec60a64-3a45-4ef2-9b1f-10c9dfdaeb4e', N'3rdPartyInspectionServices@kurbsi.de', N'3RDPARTYINSPECTIONSERVICES@KURBSI.DE', N'3rdPartyInspectionServices@kurbsi.de', N'3RDPARTYINSPECTIONSERVICES@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEN4sOf7Lgf0zFCimjvFpUNVxpjdEKTRakIeHUvxpuKrDyQS13CH5aleQbJ20En89EA==', N'DEKTXFJ3ENOV2AKIF3MM24AUNYJHHRXU', N'7a7b3f65-a7ef-45af-af4a-936641542a1a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd229c3eb-aabe-45a2-8034-6f4e3d0ec8d7', N'430mobilecorporation@kurbsi.de', N'430MOBILECORPORATION@KURBSI.DE', N'430mobilecorporation@kurbsi.de', N'430MOBILECORPORATION@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEDCEGfntCpUU2om58C1yrYnkWBZFyZ1VomoLwv9YU0WGN4nbWaqOybwsGoC1Bj1W3Q==', N'ZBMTYXIMZZYGFIWQDVEUQS6SX6XLVQD7', N'aa83f783-077a-4260-b91b-eca0b53ad805', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd6867a89-3540-458f-b69a-752356420243', N'JRGConsultingGroup@kurbsi.de', N'JRGCONSULTINGGROUP@KURBSI.DE', N'JRGConsultingGroup@kurbsi.de', N'JRGCONSULTINGGROUP@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEOBzX405l0/bgZcEYeYMLPmNBWb+ET3dwxQUxDAkMvZLrL2fCp/Vc+XPCJQbcRkwJg==', N'2RT26HXXPATS7ATYDNYDOVTZTJRCVQHQ', N'eef4dc06-0aaa-441e-9b62-29ad6a2e5602', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e359f266-07bd-4963-8d4f-35d5ca747acb', N'member@kurbsi.de', N'MEMBER@KURBSI.DE', N'member@kurbsi.de', N'MEMBER@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEE9qZkIFH+Bz0PO3mIlkBJwvhmg+ayVt2iul9vlVtS20AVv+evN06wuUC72Sm1aLXA==', N'VEPA5MKKBW73KSJDRDOBQUVSFU3OWIYU', N'72009a6b-7f6f-4448-9e6c-96ef7b9e540f', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e9db5055-0c11-4b27-802e-235d29cced27', N'4seasonspizza@kurbsi.de', N'4SEASONSPIZZA@KURBSI.DE', N'4seasonspizza@kurbsi.de', N'4SEASONSPIZZA@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEA6HX/ksxe3ep+O4VQhh/Zn+OsGxbIjnP4GUSN3CPwRAMXs8Qf8SWenv5/mzqBajNQ==', N'7MXZFN4VU6YBV5GNAM3WRGZHTA55M6LA', N'72deae9d-4427-4a28-a938-4ccd2ef144ec', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ef87f859-e9bc-4f12-ac61-09b777a1c418', N'RensPetsDepot@kurbsi.de', N'RENSPETSDEPOT@KURBSI.DE', N'RensPetsDepot@kurbsi.de', N'RENSPETSDEPOT@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEL9Bn+MNHZv6rXCdMkDGqDjBDCxJh1MlZ04t+jRVaik3Ngp7A7xuRPZyC+JGsVWK2g==', N'P32O3KLPVRYBAWPXYA4CZMAGRNKYHP5L', N'ac182795-c878-4fc8-b26e-dd1cdfb63989', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f15fa658-68d6-44a6-9a2d-d8b633377718', N'business@kurbsi.de', N'BUSINESS@KURBSI.DE', N'business@kurbsi.de', N'BUSINESS@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEEeMdw8e6BDxULO5V6nsq3ylzR+p0MEc9sEbC/MsFxm7S/+oheecmMUFm1jVjkthXg==', N'NKCOHZMAOJBBRFGU76LNJHCFS5XDUCI3', N'e968a932-970f-4312-b67d-6b7b44c46c30', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ff901e9b-1824-44a7-aea3-364ff10d559a', N'ajautoservice@kurbsi.de', N'AJAUTOSERVICE@KURBSI.DE', N'ajautoservice@kurbsi.de', N'AJAUTOSERVICE@KURBSI.DE', 1, N'AQAAAAEAACcQAAAAEFo4ZFjiLUq7770dUhAHj6icYVdu90rDnS4MfPnEGHB+iuoIZlxFj0+OK3HwgQenpw==', N'5ZNIQTLOUJS65AXZ6EW5ZI7UMTCARNJW', N'6883117b-80b2-4a26-9ba9-a5dafd1a1cb9', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'0157f938-ea8f-4b16-a7ac-1ec9f149757f', N'c6404f8b-09fd-4ee9-9d7c-6adfc7eb8a04', N'test', N'5198850300', N'test', NULL, N'Waterloo', N'N2J 2W2', N'ON', N'CA', N'123456789', N'5198850300', N'test', N'test', 43.479692, -80.518172, NULL, NULL)
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'08a7e5ef-3143-451d-a6d7-65a0423d63c5', N'b883bdb5-a673-4965-a8e3-f231910f9224', N'Bestbuy', N'(519) 886-1073', N'580 King St N', N'Unit 2', N'Waterloo', N'N2L 6L3', N'ON', N'CA', N'123456789', N'(519) 886-1073', N'BestbuyFIRSTNAME', N'BestbuyLASTNAME', 43.5006948, -80.531906, N'Waterloo-B', N'https://i.imgur.com/9vpIKsN.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'0caf4ed6-0953-4ce5-aabc-641bcb533034', N'34a835de-57fa-450f-a1b1-970cca9b1c3d', N'Scotiabank', N'519-837-3443', N'15 Clair Rd W', NULL, N'Guelph', N'N1L 0A6', N'ON', N'CA', N'123456789', N'519-837-3443', N'ScotiabankFIRSTNAME', N'ScotiabankLASTNAME', 43.500251, -80.191041, N'Guelph-Clair', N'https://i.imgur.com/nrr5yj1.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'0e2cb5ab-2ccf-4b45-90b6-3b3d7ec4a4d9', N'ea49add5-a123-494f-9950-354f2825376a', N'Altima Cambridge Dental Centre', N'519-653-3181', N'668 King Street East', NULL, N'Cambridge', N'N3H 3N6', N'ON', N'CA', N'123456789', N'519-653-3181', N'Altima Cambridge Dental CentreFIRSTNAME', N'Altima Cambridge Dental CentreLASTNAME', 43.396068, -80.359257, NULL, N'https://i.imgur.com/OPWy6rI.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'3734596e-0859-4268-bb15-20903999a618', N'c29aeb5f-bdf7-483c-975b-f7a0c6bb6f6e', N'Alder Pest Management Inc.', N'226-606-7378', N'145 Hawkins Dr', NULL, N'Cambridge', N'N1T 2A4', N'ON', N'CA', N'123456789', N'226-606-7378', N'Alder Pest Management Inc.FIRSTNAME', N'Alder Pest Management Inc.LASTNAME', 43.39788, -80.293649, NULL, N'https://i.imgur.com/d7XcWLV.jpg')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'39cd8208-5778-4702-8d49-649374ebd833', N'81847657-48cd-4fd7-a89f-ffa05ef2f88e', N'Baker Tilly GWD', N'519-821-1555', N'350 Speedvale Ave W', N'Unit 8', N'Guelph', N'N1H 7M7', N'ON', N'CA', N'123456789', N'519-821-1555', N'Baker Tilly GWDFIRSTNAME', N'Baker Tilly GWDLASTNAME', 43.5422753, -80.2901788, NULL, N'https://i.imgur.com/2Nnex9C.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'5e283caf-b6b3-4fae-8be0-4d6e27169a3d', N'39e25f01-510a-4e48-bb9d-4b98590e3cba', N'Healing Foundations Naturopathic Clinic', N'519-821-1999', N'231 Woolwich St', NULL, N'Guelph', N'N1H 3V4', N'ON', N'CA', N'123456789', N'519-821-1999', N'Healing Foundations Naturopathic ClinicFIRSTNAME', N'Healing Foundations Naturopathic ClinicLASTNAME', 43.5488205, -80.2549291, NULL, N'https://i.imgur.com/kP3SLtP.jpg')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'5ffe5a32-e0c6-4fd2-a920-0b8e85bb9330', N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', N'5D Computer Systems & Supplies', N'(519) 725-5535', N'180 Frobisher Dr', N'Unit 3', N'Waterloo', N'N2V 2A2', N'ON', N'CA', N'123456789', N'(519) 725-5535', N'5D Computer Systems & SuppliesFIRSTNAME', N'5D Computer Systems & SuppliesLASTNAME', 43.508452, -80.526296, NULL, N'https://i.imgur.com/NyDjh77.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'6e141fc5-335c-4fb4-a5c4-ecf9d2a84291', N'79c18850-5c35-4e8c-84c0-6107350b5ed3', N'Hair Razors', N'519-821-4989', N'220 Edinburgh Rd S', NULL, N'Guelph', N'N1G 2J4', N'ON', N'CA', N'123456789', N'519-821-4989', N'Hair RazorsFIRSTNAME', N'Hair RazorsLASTNAME', 43.530915, -80.248753, NULL, N'https://i.imgur.com/t4Ej8I3.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'77d8d3fc-75fc-45f5-bb14-99ac84c4cd76', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Canadian Christian Business Federation', N'519-837-9172', N'26 Blueridge Crt', NULL, N'Guelph', N'N1H 6S6', N'ON', N'CA', N'123456789', N'519-837-9172', N'Canadian Christian Business FederationFIRSTNAME', N'Canadian Christian Business FederationLASTNAME', 43.536363, -80.285856, NULL, N'https://i.imgur.com/FHtwxtd.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'7aab93b4-bc0b-44d2-98f3-391c81641864', N'd92093ee-04fe-4814-bf7c-1379b6db6cd4', N'2G Robotics Inc.', N'(519) 580-4080', N'614 Colby Drive', N'Unit 2', N'Waterloo', N'N2V 1A2', N'ON', N'CA', N'123456789', N'(519) 580-4080', N'2G Robotics Inc.FIRSTNAME', N'2G Robotics Inc.LASTNAME', 43.503973, -80.54078, NULL, N'https://i.imgur.com/NrM8gTr.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'8575142b-6409-4ce1-bd42-70a26a11b59a', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Harley-Davidson', N'(519) 893-0493', N'310 Holiday Inn Dr', NULL, N'Cambridge', N'N3C 1Z4', N'ON', N'CA', N'123456789', N'(519) 893-0493', N'Harley-DavidsonFIRSTNAME', N'Harley-DavidsonLASTNAME', 43.416404, -80.316356, N'Blackbridge', N'https://i.imgur.com/uUfBBsl.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'86ca9b21-449e-49cb-a163-41d6cfe237e4', N'1cdc1f7f-4908-4907-b237-ab541eb72291', N'3D Sheet Metal Ltd.', N'519-624-7575', N'1459 Edworthy Side', NULL, N'Cambridge', N'N1S 5S5', N'ON', N'CA', N'123456789', N'519-624-7575', N'3D Sheet Metal Ltd.FIRSTNAME', N'3D Sheet Metal Ltd.LASTNAME', 43.3601, -80.31269, NULL, N'https://i.imgur.com/IufVs5D.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'91c1aa28-b65c-4591-84ff-f766cee2a6bf', N'1200fa6e-c6b3-432b-b2f0-fcc408da7ff7', N'ActionCoach Business Coaching', N'519-729-0033', N'147 Attwood Drive', NULL, N'Cambridge', N'N1T 2A5', N'ON', N'CA', N'123456789', N'519-729-0033', N'ActionCoach Business CoachingFIRSTNAME', N'ActionCoach Business CoachingLASTNAME', 43.387028, -80.280727, NULL, N'https://i.imgur.com/fKZGELl.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'b2380ac0-8dc7-48eb-a3e4-793c99b4a4f1', N'fc1afd08-ce18-49b6-916d-91ec00eaf84e', N'hywtas', N'519-856-0918', N'8397 Sideroad 15', NULL, N'Rockwood', N'N0B 2K0', N'ON', N'CA', N'123456789', N'519-856-0918', N'hywtasFIRSTNAME', N'hywtasLASTNAME', 43.570325, -80.063381, NULL, N'https://i.imgur.com/YK4YqsV.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'b69d048e-a3a5-463e-aa16-ad5d60407876', N'd8321cd3-e3b3-4f69-9c68-b4bf4b010e0d', N'654 Sign Inc.', N'519-654-7446', N'990 Bishop Dr', NULL, N'Cambridge', N'N3H 4V7', N'ON', N'CA', N'123456789', N'519-654-7446', N'654 Sign Inc.FIRSTNAME', N'654 Sign Inc.LASTNAME', 43.393385, -80.332694, NULL, N'https://i.imgur.com/lgJBWVk.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'b7367094-751d-40ed-8f8c-ceb2413436b8', N'38bfc848-dd0b-49bd-b04b-281df3a14773', N'WellyTails Inc', N'519-766-8242', N'304 Stone Rd W', N'Unit 3', N'Guelph', N'N1G 4W4', N'ON', N'CA', N'123456789', N'519-766-8242', N'WellyTails IncFIRSTNAME', N'WellyTails IncLASTNAME', 43.526536, -80.224881, NULL, N'https://i.imgur.com/q0FMJ1z.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'b8fe74d8-8483-488a-aeaf-f3b9fd768354', N'bdeeac9a-ec2e-41ce-b448-a6a2bae7eb42', N'A McWilliams Group', N'(519) 763-9442', N'215 Frobisher Drive', NULL, N'Waterloo', N'N2V 2G4', N'ON', N'CA', N'123456789', N'(519) 763-9442', N'A McWilliams GroupFIRSTNAME', N'A McWilliams GroupLASTNAME', 43.509883, -80.523852, NULL, N'https://i.imgur.com/XozwY76.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'bb6d41de-8d16-4957-a1c6-225bc56e87f2', N'0484c491-1612-476a-9592-058096499d6a', N'Alltech Canada', N'519-763-3331', N'20 Cutten Pl', NULL, N'Guelph', N'N1G 4Z7', N'ON', N'CA', N'123456789', N'519-763-3331', N'Alltech CanadaFIRSTNAME', N'Alltech CanadaLASTNAME', 43.49895, -80.216734, NULL, N'https://i.imgur.com/Ku3Vl5l.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'c07bea00-9078-42c7-bcfd-6162bb181319', N'28ae82d2-374c-47d5-9b6f-d56cbd000b08', N'A N Optical Lab', N'(519) 747-3301', N'31 Durward Pl', NULL, N'Waterloo', N'N2L 4E5', N'ON', N'CA', N'123456789', N'(519) 747-3301', N'A N Optical LabFIRSTNAME', N'A N Optical LabLASTNAME', 43.498808, -80.534918, NULL, N'https://i.imgur.com/5ZHRy7f.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'c674e161-6066-4954-9d05-e0f9e7a4dfff', N'963c6a94-86f4-4ab5-bf3f-83c6aa35b0c7', N'365 Consultants Inc.', N'519-622-6655', N'39 Tassie Lane', NULL, N'Cambridge', N'N1T 1C7', N'ON', N'CA', N'123456789', N'519-622-6655', N'365 Consultants Inc.FIRSTNAME', N'365 Consultants Inc.LASTNAME', 43.38191, -80.297452, NULL, N'https://i.imgur.com/JQsUkod.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'c7d1a7f6-bdc0-4a0e-948e-02f5eb10d54f', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'21st Century Solutions Ltd.', N'519-622-4646', N'19 Thorne St.', N'Suite 305', N'Cambridge', N'N1R 1S3', N'ON', N'CA', N'123456789', N'519-622-4646', N'21st Century Solutions Ltd.FIRSTNAME', N'21st Century Solutions Ltd.LASTNAME', 43.3607491, -80.3139727, NULL, N'https://i.imgur.com/IGPz9tF.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'cec60a64-3a45-4ef2-9b1f-10c9dfdaeb4e', N'1ffd00a6-93c8-4dd7-9f4a-401aea6e0686', N'3rd Party Inspection Services', N'519-740-8938', N'30 Fleming Dr', NULL, N'Cambridge', N'N1T 2B1', N'ON', N'CA', N'123456789', N'519-740-8938', N'3rd Party Inspection ServicesFIRSTNAME', N'3rd Party Inspection ServicesLASTNAME', 43.412692, -80.294854, NULL, N'https://i.imgur.com/UYaQWfs.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'd229c3eb-aabe-45a2-8034-6f4e3d0ec8d7', N'a3ea2e3a-3d5e-43d6-b03e-9fe873b8faf4', N'430 Mobile Corporation', N'(519) 807-5433', N'463 Kingsford Place', N'null', N'Waterloo', N'N2T1K9', N'ON', N'CA', N'123456789', N'(519) 807-5433', N'430 Mobile CorporationFIRSTNAME', N'430 Mobile CorporationLASTNAME', 43.454632, -80.558302, NULL, N'https://i.imgur.com/5jzdlii.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'd6867a89-3540-458f-b69a-752356420243', N'a96233b7-63ae-444f-8866-1380ad1b4e95', N'JRG Consulting Group', N'519-836-1860', N'39 Fieldstone Rd', NULL, N'Guelph', N'N1L 1B4', N'ON', N'CA', N'123456789', N'519-836-1860', N'JRG Consulting GroupFIRSTNAME', N'JRG Consulting GroupLASTNAME', 43.523529, -80.205592, NULL, N'https://i.imgur.com/HAbCOdX.jpg')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'e9db5055-0c11-4b27-802e-235d29cced27', N'9196be0f-b1e0-4e00-b12f-d2009a26fc3b', N'4 Seasons Pizza', N'(519) 342-2525', N'220 King St N', N'Unit A', N'Waterloo', N'N2J 2Y7', N'ON', N'CA', N'123456789', N'(519) 342-2525', N'4 Seasons PizzaFIRSTNAME', N'4 Seasons PizzaLASTNAME', 43.4748382, -80.5245616, NULL, N'https://i.imgur.com/z7MdmNH.jpg')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'ef87f859-e9bc-4f12-ac61-09b777a1c418', N'ad08a231-59d2-436a-a5f8-7d5791f61ce2', N'Rens Pets Depot', N'519-767-5311', N'20 Brock Rd N', NULL, N'Guelph', N'N1H 6H9', N'ON', N'CA', N'123456789', N'519-767-5311', N'Rens Pets DepotFIRSTNAME', N'Rens Pets DepotLASTNAME', 43.471974, -80.148163, NULL, N'https://i.imgur.com/s4kuOQZ.png')
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'f15fa658-68d6-44a6-9a2d-d8b633377718', N'1f5262e7-3ae9-4ac5-981e-2a4c5d89ee82', N'Business', N'519-885-0300', N'108 University Ave. East', NULL, N'Waterloo', N'N2J2W2', N'ON', N'CA', N'123456789', N'519-885-0300', N'Big', N'Business', 43.479692, -80.518172, N'Waterloo', NULL)
INSERT [dbo].[Business] ([AspNetId], [BusinessId], [BusinessName], [PhoneNumber], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [BusinessNumber], [ContactPhone], [ContactFirst], [ContactLast], [Lat], [Lng], [StoreIdentifier], [LogoLocation]) VALUES (N'ff901e9b-1824-44a7-aea3-364ff10d559a', N'1c6dc732-ea2f-4c2d-afa4-bd9d250f3b80', N'A & J Auto Service', N'(519) 746-4988', N'123 Moore Ave. South', NULL, N'Waterloo', N'N2J 1X4', N'ON', N'CA', N'123456789', N'(519) 746-4988', N'A & J Auto ServiceFIRSTNAME', N'A & J Auto ServiceLASTNAME', 43.462139, -80.510357, NULL, N'https://i.imgur.com/5jzdlii.png')
GO
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'0484c491-1612-476a-9592-058096499d6a', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'7c259e52-62f3-4632-9e3b-0ed4bc208767', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'd92093ee-04fe-4814-bf7c-1379b6db6cd4', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'a96233b7-63ae-444f-8866-1380ad1b4e95', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'38bfc848-dd0b-49bd-b04b-281df3a14773', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'1f5262e7-3ae9-4ac5-981e-2a4c5d89ee82', CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'ea49add5-a123-494f-9950-354f2825376a', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'1ffd00a6-93c8-4dd7-9f4a-401aea6e0686', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'39e25f01-510a-4e48-bb9d-4b98590e3cba', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'79c18850-5c35-4e8c-84c0-6107350b5ed3', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'da0b141e-518b-4cde-b520-6a381d704c26', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'c6404f8b-09fd-4ee9-9d7c-6adfc7eb8a04', CAST(N'01:23:00' AS Time), CAST(N'13:23:00' AS Time), CAST(N'01:23:00' AS Time), CAST(N'13:23:00' AS Time), CAST(N'01:23:00' AS Time), CAST(N'13:23:00' AS Time), CAST(N'01:23:00' AS Time), CAST(N'13:23:00' AS Time), CAST(N'01:23:00' AS Time), CAST(N'13:23:00' AS Time), CAST(N'01:23:00' AS Time), CAST(N'13:23:00' AS Time), CAST(N'01:23:00' AS Time), CAST(N'13:23:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'ad08a231-59d2-436a-a5f8-7d5791f61ce2', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'963c6a94-86f4-4ab5-bf3f-83c6aa35b0c7', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'fc1afd08-ce18-49b6-916d-91ec00eaf84e', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'34a835de-57fa-450f-a1b1-970cca9b1c3d', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'a3ea2e3a-3d5e-43d6-b03e-9fe873b8faf4', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'bdeeac9a-ec2e-41ce-b448-a6a2bae7eb42', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'1cdc1f7f-4908-4907-b237-ab541eb72291', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'd8321cd3-e3b3-4f69-9c68-b4bf4b010e0d', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'1c6dc732-ea2f-4c2d-afa4-bd9d250f3b80', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'9196be0f-b1e0-4e00-b12f-d2009a26fc3b', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'28ae82d2-374c-47d5-9b6f-d56cbd000b08', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'b883bdb5-a673-4965-a8e3-f231910f9224', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'c29aeb5f-bdf7-483c-975b-f7a0c6bb6f6e', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'1200fa6e-c6b3-432b-b2f0-fcc408da7ff7', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[BusinessHours] ([BusinessId], [MonOpen], [MonClose], [TuesOpen], [TuesClose], [WedOpen], [WedClose], [ThuOpen], [ThuClose], [FriOpen], [FriClose], [SatOpen], [SatClose], [SunOpen], [SunClose]) VALUES (N'81847657-48cd-4fd7-a89f-ffa05ef2f88e', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[Country] ([CountryCode], [FullName]) VALUES (N'CA', N'Canada')
GO
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'be4c542a-0950-4a8d-b759-01fc54e4bc76', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Green Paint', N'Wonderful Green Paint', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Green+20paint', N'Paint', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'575d0c42-2ed7-4631-a925-035bf9f8e378', N'39e25f01-510a-4e48-bb9d-4b98590e3cba', N'Smelling Stone', N'Wonderful Smelling Stone', CAST(200.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Smelling+Stone', N'Solids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'f28e2ff3-1c67-4cb6-88dd-05138d5293b3', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Live Wire', N'A bolt of lightning that electrifies the urban grid.', CAST(37250.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/wHHSs8a.png', N'Electric', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'44ca7736-a0c5-42f0-8a94-0537697aed18', N'39e25f01-510a-4e48-bb9d-4b98590e3cba', N'Magic Herbs', N'Wonderful Magic Herbs', CAST(25.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Magic+Herbs', N'Solids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'38190219-f5c9-4fc1-bee1-060dd85b8c31', N'79c18850-5c35-4e8c-84c0-6107350b5ed3', N'Bad Hairspray', N'Wonderful Bad Hairspray', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Bad+Hairspray', N'Hairspray', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'37d06482-b332-4b82-8a3e-092fbe901567', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Small Cat', N'Wonderful Small Cat', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Small+Cat', N'Cats', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'2efc355e-4a73-4dd8-8319-0b8aba2678ca', N'38bfc848-dd0b-49bd-b04b-281df3a14773', N'Magic Stones', N'Wonderful Magic Stones For Pets', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Magic+Stones', N'Solids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'9fd767dc-dbc5-43a1-a4f7-0bd4d6211ca5', N'b883bdb5-a673-4965-a8e3-f231910f9224', N'Good Printer', N'Wonderful Good Printer', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Good+Printer', N'Printers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'222ab7be-302e-4fa3-87a2-0c960649f068', N'd92093ee-04fe-4814-bf7c-1379b6db6cd4', N'Leg', N'Wonderful Robotic Leg', CAST(20000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Robotic+20Leg', N'Limbs', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'8d31e56f-10b4-4733-8ac4-0cf26c2ce508', N'39e25f01-510a-4e48-bb9d-4b98590e3cba', N'Healing Beads', N'Wonderful Healing Beads', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Healing+Beads', N'Solids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'8eacb452-3e41-44ca-9ca5-0e28e05e5c20', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Violet Paint', N'Wonderful Violet Paint', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Violet+20paint', N'Paint', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'e4a22c12-8233-4eaf-af90-0f1a5b7e489e', N'1200fa6e-c6b3-432b-b2f0-fcc408da7ff7', N'Programming', N'Wonderful Programming Business Coaching', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Programming', N'Coaching', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'fba318d8-d9f5-49bd-941e-0f66de19933a', N'38bfc848-dd0b-49bd-b04b-281df3a14773', N'Snake Oil', N'Wonderful Snake Oil For Pets', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Snake+Oil', N'Liquids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'd2205ea3-305a-43b9-99a9-10de4627b2ef', N'0484c491-1612-476a-9592-058096499d6a', N'Kinda Fast Laptop', N'Wonderful Kinda Fast Laptop', CAST(4000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Kinda+Fast+Laptop', N'Laptops', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'462cf26f-cb46-449d-8b17-11e3f5e7bdef', N'0484c491-1612-476a-9592-058096499d6a', N'Good Printer', N'Good Printer', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Good+Printer', N'Printers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'49a4c6be-2898-4cb6-ac4a-11f98022855d', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Softail Standard', N'Raw, stripped-down bobber style. A blank canvas for customization.', CAST(15699.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/GlZyZ2i.png', N'Cruiser', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'bbfc16e4-e36c-406e-9344-13aae9f6074b', N'ea49add5-a123-494f-9950-354f2825376a', N'Surgery', N'Wonderful Surgery', CAST(500.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Surgery', N'Surgery', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'14e32cee-0a9f-48a0-9cb5-141b99dacba9', N'34a835de-57fa-450f-a1b1-970cca9b1c3d', N'Toony', N'The Great Canadian Toony', CAST(2.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Toony', N'Canadian Dollars', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'88209794-7ca2-4573-9ee7-158774da60e9', N'b883bdb5-a673-4965-a8e3-f231910f9224', N'Slow Laptop', N'Wonderful Slow Laptop', CAST(2000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Slow+Laptop', N'Laptops', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'0a0677e0-497f-4194-a40c-15ab1ce176cd', N'963c6a94-86f4-4ab5-bf3f-83c6aa35b0c7', N'HR', N'Wonderful Consulting On HR', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=HR+Consulting', N'Consulting', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'0a2f7269-f8ad-48b1-a8ca-17e30342ff8e', N'38bfc848-dd0b-49bd-b04b-281df3a14773', N'Healing Beads', N'Wonderful Healing Beads For Pets', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Healing+Beads', N'Solids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'00002fe3-b5cb-4112-91d8-18eb349ccb32', N'd92093ee-04fe-4814-bf7c-1379b6db6cd4', N'Cat', N'Wonderful Robotic Cat', CAST(20000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Robotic+Cat', N'Pets', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'd98168b2-22a3-43ca-802c-1b4073a62c1b', N'1200fa6e-c6b3-432b-b2f0-fcc408da7ff7', N'Accounting', N'Wonderful Accounting Business Coaching', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Accounting', N'Coaching', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'399277d4-3e79-4904-b3a0-1c038acb3429', N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', N'Good Keyboard', N'Good Keyboard', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Good+Keyboard', N'Keyboards', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'9eb1117b-243a-403e-ac5a-1c1ebc1c7f26', N'963c6a94-86f4-4ab5-bf3f-83c6aa35b0c7', N'Accounting', N'Wonderful Consulting On Accounting', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Accounting+Consulting', N'Consulting', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'5e9379c6-065b-4391-adbc-1d042b56aae7', N'a3ea2e3a-3d5e-43d6-b03e-9fe873b8faf4', N'Medium Truck', N'Wonderful Medium Truck', CAST(35000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Medium+Truck', N'Trucks', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'3f4dfc7c-955a-4088-937c-1e2305eba2ab', N'34a835de-57fa-450f-a1b1-970cca9b1c3d', N'Quarter', N'The Great Canadian Quarter', CAST(0.2500 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Quarter', N'Canadian Dollars', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'd875356c-b07a-4ec4-908a-1fa5ab08755f', N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', N'Good Printer', N'Good Printer', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Good+Printer', N'Printers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'7c03ae1d-74a7-4c21-8610-200a4d828c6f', N'a3ea2e3a-3d5e-43d6-b03e-9fe873b8faf4', N'Big Car', N'Wonderful Big Car', CAST(35000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Big+Car', N'Cars', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'28d8ff18-f5c4-47eb-a6e1-2024fc3eec9f', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Big Bird', N'Wonderful Big Bird', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Big+Bird', N'Birds', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'bc948b03-3ec5-4794-8c76-210058865bcc', N'34a835de-57fa-450f-a1b1-970cca9b1c3d', N'Nickel', N'The Great Canadian Nickel', CAST(0.0500 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Nickel', N'Canadian Dollars', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'19759aac-d149-4627-b636-2107319bcdfc', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Street Bob', N'No nonsense, raw bobber attitude packed into the lightest weight Softail, equipped with a Milwaukee-Eight™ 114 engine.', CAST(17599.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/q2br3aa.png', N'Cruiser', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'f5744d19-3533-41e5-b84c-2289d211a1c1', N'1c6dc732-ea2f-4c2d-afa4-bd9d250f3b80', N'Blinker Fuild Change', N'Wonderful Blinker Fuild Change', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Blinker+Fuild+Change', N'Scam', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'bf6d9e2d-4748-4bb5-a91f-245f2ed1888b', N'79c18850-5c35-4e8c-84c0-6107350b5ed3', N'Good Razor', N'Wonderful Good Razor', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Good+Razor', N'Razors', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'd18ce0b0-8939-4f12-8444-290116a40eeb', N'9196be0f-b1e0-4e00-b12f-d2009a26fc3b', N'Cheese', N'Wonderful Cheese Pizza', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Cheese+Pizza', N'Gluten Free', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'94a0dbc6-8e27-46b2-bb75-295830a13ce2', N'1ffd00a6-93c8-4dd7-9f4a-401aea6e0686', N'Foundation', N'Wonderful Foundation Inspection', CAST(200.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Foundation+Inspection', N'Inspections', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'2627a5bb-09e5-4132-b88d-2a49906f6b37', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Blue Paint', N'Wonderful Blue Paint', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Blue+20paint', N'Paint', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'7ae9ba43-bda9-4119-acb1-2aaf335ff22a', N'28ae82d2-374c-47d5-9b6f-d56cbd000b08', N'Glasses', N'Wonderful Glasses', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Glasses', N'Vision', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'1abbba43-5ea9-4a83-84bc-2d0bf0cdd447', N'0484c491-1612-476a-9592-058096499d6a', N'Kinda Fast Compute', N'Wonderful Kinda Fast Compute', CAST(7500.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Kinda+Fast+Compute', N'Computers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'6887160e-0043-4cbe-b635-2d4c0b4be77f', N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', N'Fast Computer', N'Wonderful Fast Computer', CAST(10000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Fast+Computer', N'Computers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'd4c9d276-1541-4513-aed7-2f2a99439ec1', N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', N'Bad Printer', N'Bad Printer', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Bad+Printer', N'Printers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'51dfed81-bee3-4acc-8e61-33c5e986ef2d', N'a96233b7-63ae-444f-8866-1380ad1b4e95', N'IT', N'Wonderful Consulting On IT', CAST(150.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=IT+Consulting', N'Consulting', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'364a669d-5e7d-4eb8-830a-364f40786003', N'34a835de-57fa-450f-a1b1-970cca9b1c3d', N'Loony', N'The Great Canadian Loony', CAST(1.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Loony', N'Canadian Dollars', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'438e7ce6-458d-4b27-afc6-38b1702030d1', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Heritage Classic', N'The quintessential American cruiser. Showstopping vintage details and pure rock and roll style.', CAST(22349.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/reol1H8.png', N'Touring', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'30be7124-5830-4c10-9bc0-3988f3fe331b', N'38bfc848-dd0b-49bd-b04b-281df3a14773', N'Healing Charms', N'Wonderful Healing Charms For Pets', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Healing+Charms', N'Solids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'e028ff2c-b62b-4e8a-9d9e-3a2a4b286f55', N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', N'Slow Computer', N'Wonderful Slow Computer', CAST(5000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Slow+Computer', N'Computers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'3a3e47d3-b9ba-41c3-97cf-3abd9db63be6', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Angle Paint Brush', N'Wonderful Angle Paint Brush', CAST(20.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Angle+20paintbrush', N'Paint Brushes', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'd2d49132-4bfe-480b-8907-3c32960afecf', N'b883bdb5-a673-4965-a8e3-f231910f9224', N'Kinda Fast Compute', N'Wonderful Kinda Fast Compute', CAST(7500.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Kinda+Fast+Compute', N'Computers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'72e2f58b-bee4-49ba-9dda-3d67e917d929', N'd92093ee-04fe-4814-bf7c-1379b6db6cd4', N'Hand', N'Wonderful Robotic Hand', CAST(20000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Robotic+20Hand', N'Limbs', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'7e0229f2-5683-4032-a42b-3eda153fc9e1', N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', N'Fast Laptop', N'Wonderful Fast Laptop', CAST(5000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Fast+Laptop', N'Laptops', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'd63e5b83-9df5-4c25-aad5-3f13c868a04b', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Envious Business Practices', N'Wonderful Envious Business Practices', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Envious', N'Business Practices', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'20854a18-a501-446a-98ef-408944e3aa72', N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', N'Kinda Fast Compute', N'Wonderful Kinda Fast Compute', CAST(7500.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Kinda+Fast+Compute', N'Computers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'f421be9c-8e83-47a9-bbe5-40fc167bef2a', N'c29aeb5f-bdf7-483c-975b-f7a0c6bb6f6e', N'Termite', N'Wonderful Termite Pest Removal', CAST(350.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Termite', N'Pest Removal', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'6c51271c-b770-492d-b5aa-414c440c25b6', N'9196be0f-b1e0-4e00-b12f-d2009a26fc3b', N'Veggie', N'Wonderful Veggie Pizza', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Veggie+Pizza', N'Pizza', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'bbfeeafc-8f48-40fc-9c97-430ba97b7315', N'1200fa6e-c6b3-432b-b2f0-fcc408da7ff7', N'Business', N'Wonderful Business Business Coaching', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Business', N'Coaching', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'42980982-c71c-4b1c-b066-4383c02139df', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Pan America 1250', N'The Pan America™ 1250 motorcycle is a two-wheel multi-tool built to endure, designed to explore, and engineered for adventure.', CAST(20999.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/EXyPJMG.png', N'Adventure Touring', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'378fd134-43df-40f0-83df-43bf88a134a7', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Medium Bird', N'Wonderful Medium Bird', CAST(75.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Medium+Bird', N'Birds', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'e8fdddc6-d21e-43e3-8ab5-44a72dc4219e', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Fat Boy 114', N'The original fat custom icon. Rolling with massive presence and a dominant attitude.', CAST(24799.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/PkBCdp4.png', N'Cruiser', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'1fc043ce-071d-495f-9f04-44e86cda5cfb', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'CVO Tri Glide', N'The paragon of comfort. Locked-and-loaded with premium tour features and chrome accessories.', CAST(59999.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/ZDmuXla.png', N'Trike', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'9701215f-c902-4cc6-bb15-46f7957e2540', N'34a835de-57fa-450f-a1b1-970cca9b1c3d', N'Dime', N'The Great Canadian Dime', CAST(0.1000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Dime', N'Canadian Dollars', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'49c572c6-cb73-423d-871c-4862e963700b', N'1c6dc732-ea2f-4c2d-afa4-bd9d250f3b80', N'Oil Change', N'Wonderful Oil Change', CAST(25.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Oil+Change', N'Good', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'dfe6bf21-d553-4610-a8f3-49183e808864', N'b883bdb5-a673-4965-a8e3-f231910f9224', N'Fast Computer', N'Wonderful Fast Computer', CAST(10000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Fast+Computer', N'Computers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'a54dceb4-a731-4ce8-9c41-4ad55bd26bc7', N'd8321cd3-e3b3-4f69-9c68-b4bf4b010e0d', N'Pedestrian Sign', N'Wonderful Pedestrian Sign', CAST(30.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Pedestrian+Sign', N'Signs', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'84998673-bb77-4ceb-905e-4b2db9044240', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Low Rider S', N'A blacked-out, factory custom performance cruiser.', CAST(23599.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/lpkHPbC.png', N'Cruiser', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'e53cc276-3a37-4626-bb6e-4c223873cdb1', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Rigger Paint Brush', N'Wonderful Rigger Paint Brush', CAST(20.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Rigger+20paintbrush', N'Paint Brushes', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'dc8ef97b-03d0-4a1f-8ccd-4d185d198f73', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Big Mouse', N'Wonderful Big Mouse', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Big+Mouse', N'Mice', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'a2f5328d-b35b-499c-8e9e-4fe0f9d9bf10', N'1cdc1f7f-4908-4907-b237-ab541eb72291', N'Big Circle Metal', N'Wonderful Big Circle Sheet Metal', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Big+Circle+Metal', N'Circle', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'7b63d853-d56f-4f2b-8d13-52e8d05fa45b', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Freewheeler', N'A stripped-down hot rod cruiser with raw attitude and the confidence of three wheels.', CAST(34295.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/hWEQfqx.png', N'Trike', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'c73ff981-bbdf-4c18-ab73-5346aa2fbfdb', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Small Mouse', N'Wonderful Small Mouse', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Small+Mouse', N'Mice', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'5f9b67d1-35c6-413f-82fe-546c03c72049', N'a3ea2e3a-3d5e-43d6-b03e-9fe873b8faf4', N'Big Truck', N'Wonderful Big Truck', CAST(40000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Big+Truck', N'Trucks', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'a5beb392-eab0-4f7d-bf37-573abc50ebf4', N'38bfc848-dd0b-49bd-b04b-281df3a14773', N'Mystic Water', N'Wonderful Mystic Water For Pets', CAST(300.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Mystic+Water', N'Liquids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'ccc9fe4f-5b1a-4698-b580-5795cb93f5e8', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Road King', N'A stripped-down highway legend with classic chrome styling and modern touring performance.', CAST(23899.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/5dxOITh.png', N'Touring', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'54df325d-9e89-47d2-a245-593bc6fff1d5', N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', N'Slow Laptop', N'Wonderful Slow Laptop', CAST(2000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Slow+Laptop', N'Laptops', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'ca84c700-c35c-4ffc-b4b8-5970d006a343', N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', N'Kinda Fast Laptop', N'Wonderful Kinda Fast Laptop', CAST(4000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Kinda+Fast+Laptop', N'Laptops', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'841115b8-d453-44cd-bdb8-59f5461740d0', N'1f5262e7-3ae9-4ac5-981e-2a4c5d89ee82', N'Test Item', N'Test Item Details', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, NULL, N'Test Category', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'91f06e26-7bff-4db9-99cb-5d490128ab0a', N'1cdc1f7f-4908-4907-b237-ab541eb72291', N'Medium Square Metal', N'Wonderful Medium Square Sheet Metal', CAST(75.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Medium+Square+Metal', N'Square', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'26646245-74ab-4d1d-b5d3-5dbd9512626a', N'c29aeb5f-bdf7-483c-975b-f7a0c6bb6f6e', N'Bat', N'Wonderful Bat Pest Removal', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Bat', N'Pest Removal', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'0c7a4706-cb5e-462a-a93f-60108f2352e5', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Filbert Paint Brush', N'Wonderful Filbert Paint Brush', CAST(20.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Filbert+20paintbrush', N'Paint Brushes', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'13eda02a-13b7-493a-a1ed-617b1a4f11ce', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Road King Special', N'A custom bagger with top-of-the-line power and a commanding presence.', CAST(27899.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/pB4DMVS.png', N'Touring', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'b15b7c8d-a763-4678-b025-6385e8a3d5c8', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Big Cat', N'Wonderful Big Cat', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Big+Cat', N'Cats', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'93dcb76b-7e55-4370-8b0b-65e61724e3b4', N'd8321cd3-e3b3-4f69-9c68-b4bf4b010e0d', N'Speed Limit Sign', N'Wonderful Speed Limit Sign', CAST(30.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Speed+Limit+Sign', N'Signs', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'd650c4ac-f959-464b-bbec-663a296f92e6', N'79c18850-5c35-4e8c-84c0-6107350b5ed3', N'Mediocre Razor', N'Wonderful Mediocre Razor', CAST(75.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Mediocre+Razor', N'Razors', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'79acba11-89b8-41df-8306-66f98c938cb3', N'd92093ee-04fe-4814-bf7c-1379b6db6cd4', N'Arm', N'Wonderful Robotic Arm', CAST(20000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Robotic+20Arm', N'Limbs', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'22af5a4b-e172-47e6-8d83-670212587043', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Small Dog', N'Wonderful Small Dog', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Small+Dog', N'Dogs', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'6e8bc601-6ca0-40ec-b896-678299807a34', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Pan America 1250 Special', N'The Pan America™ 1250 Special motorcycle is our premier two-wheel multi-tool built to endure, designed to explore, and engineered for adventure.', CAST(24199.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/XC4Q5OW.png', N'Adventure Touring', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'0f53820f-e53a-4f3e-a7ad-67c5a649e05e', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Bright Paint Brush', N'Wonderful Bright Paint Brush', CAST(20.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Bright+20paintbrush', N'Paint Brushes', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'f24061e6-ae35-463f-94d1-6d22d8257a38', N'c29aeb5f-bdf7-483c-975b-f7a0c6bb6f6e', N'Dragon', N'Wonderful Dragon Pest Removal', CAST(5000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Dragon', N'Pest Removal', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'5537b79e-0a86-4d74-b74c-6e52e0ffe4b9', N'1cdc1f7f-4908-4907-b237-ab541eb72291', N'Small Triangle Metal', N'Wonderful Small Triangle Sheet Metal', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Small+Triangle+Metal', N'Triangle', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'5bb266d7-1173-4b0e-909c-6fd9a51362ff', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Gluttonous Business Practices', N'Wonderful Gluttonous Business Practices', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Gluttonous', N'Business Practices', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'04421713-05b5-4228-bcc3-702e8a34ab87', N'0484c491-1612-476a-9592-058096499d6a', N'Slow Computer', N'Wonderful Slow Computer', CAST(5000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Slow+Computer', N'Computers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'ca112e24-4029-4921-b9fd-72e8438d1ac6', N'28ae82d2-374c-47d5-9b6f-d56cbd000b08', N'Surgery', N'Wonderful Surgery', CAST(500.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Surgery', N'Surgery', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'0226f039-4a7c-4776-8193-73136aa38ab6', N'39e25f01-510a-4e48-bb9d-4b98590e3cba', N'Magic Stones', N'Wonderful Magic Stones', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Magic+Stones', N'Solids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'aaf2523b-07a7-42e3-9a74-74a7110f35c6', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Slothful Business Practices', N'Wonderful Slothful Business Practices', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Slothful', N'Business Practices', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'd03f150f-d486-4dce-b657-753d536c7ab2', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Orange Paint', N'Wonderful Orange Paint', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Orange+20paint', N'Paint', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'e202f5f0-cc06-42a2-bb7b-75960c33a7b3', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Iron 1200', N'Blacked-out chopper profile with the power to go beyond the city limits.', CAST(12499.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/lZMAHJZ.png', N'Street', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'142e2d4a-cef5-44cc-ba5f-76720969cfa4', N'1c6dc732-ea2f-4c2d-afa4-bd9d250f3b80', N'Tire Change', N'Wonderful Tire Change', CAST(300.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Tire+Change', N'Good', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'8e5d986e-2b69-4f7d-8a01-76dba198de65', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Medium Cat', N'Wonderful Medium Cat', CAST(75.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Medium+Cat', N'Cats', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'8d12c527-b03e-45ed-bae8-77a871f60398', N'81847657-48cd-4fd7-a89f-ffa05ef2f88e', N'Bread', N'Wonderful Bread', CAST(5.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Bread', N'Bread', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'267cb650-a049-4953-a6fd-77e4d23a7caf', N'b883bdb5-a673-4965-a8e3-f231910f9224', N'Good Mouse', N'Wonderful Good Mouse', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Good+Mouse', N'Mice', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'e12a5db2-187a-4c10-ba4a-785635cc02fc', N'79c18850-5c35-4e8c-84c0-6107350b5ed3', N'Trash Razor', N'Wonderful Trash Razor', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Trash+Razor', N'Razors', 0)
GO
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'c722d2bb-54a2-4fe3-ab29-7b93ca605cc5', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Small Rat', N'Wonderful Small Rat', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Small+Rat', N'Rats', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'8dd307bd-cece-4af8-97d1-7c0c86c0fd5c', N'd92093ee-04fe-4814-bf7c-1379b6db6cd4', N'Finger', N'Wonderful Robotic Finger', CAST(20000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Robotic+20Finger', N'Limbs', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'80890c53-269c-488f-8635-7da19fb18eec', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Prideful Business Practices', N'Wonderful Prideful Business Practices', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Prideful', N'Business Practices', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'9c80c234-265d-467b-92de-7e01f864f1b9', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Sport Glide', N'An aggressive combination of cruising agility and long-distance touring.', CAST(22999.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/SH7wzRo.png', N'Cruiser', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'c2b717c2-975f-421d-9a57-7faf4cadc834', N'9196be0f-b1e0-4e00-b12f-d2009a26fc3b', N'Canadian', N'Wonderful Canadian Pizza', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Canadian+Pizza', N'Gluten Free', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'517c5fa0-a5f2-48ac-af78-854cb16f980b', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Big Dog', N'Wonderful Big Dog', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Big+Dog', N'Dogs', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'0b1e2523-57bb-4451-824a-8814b1babd08', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Round Paint Brush', N'Wonderful Round Paint Brush', CAST(20.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Round+20paintbrush', N'Paint Brushes', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'5bb77965-cc39-4d31-a5c1-887e3c88b3bc', N'b883bdb5-a673-4965-a8e3-f231910f9224', N'Good Keyboard', N'Wonderful Good Keyboard', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Good+Keyboard', N'Keyboards', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'978191d8-a101-4fed-a575-8b1cd5a91d0a', N'1cdc1f7f-4908-4907-b237-ab541eb72291', N'Big Triangle Metal', N'Wonderful Big Triangle Sheet Metal', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Big+Triangle+Metal', N'Triangle', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'ebdb015a-9179-449c-aaf3-8de27bed382c', N'bdeeac9a-ec2e-41ce-b448-a6a2bae7eb42', N'Junk', N'Wonderful Junk Service', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Junk+Removal+Service', N'Services', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'c1ca71d2-3923-42ca-a4fc-8e73b52695b1', N'0484c491-1612-476a-9592-058096499d6a', N'Bad Keyboard', N'Bad Keyboard', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Bad+Keyboard', N'Keyboards', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'6dd0e876-d540-4cc9-86a7-8fcebdede02b', N'963c6a94-86f4-4ab5-bf3f-83c6aa35b0c7', N'Business', N'Wonderful Consulting On Business', CAST(150.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Business+Consulting', N'Consulting', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'4aa3c5cb-4221-4777-aacf-90378c8c7c31', N'1cdc1f7f-4908-4907-b237-ab541eb72291', N'Small Circle Metal', N'Wonderful Small Circle Sheet Metal', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Small+Circle+Metal', N'Circle', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'acb1917d-e697-46a0-b6c8-90d98f20caa7', N'9196be0f-b1e0-4e00-b12f-d2009a26fc3b', N'Pepperoni', N'Wonderful Pepperoni Pizza', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Pepperoni+Pizza', N'Pizza', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'8b9b27b3-5529-4292-880d-90e1a2eabc77', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Lustful Business Practices', N'Wonderful Lustful Business Practices', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Lustful', N'Business Practices', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'75230ff3-896f-4b49-b6a3-9221b5d06ebd', N'1200fa6e-c6b3-432b-b2f0-fcc408da7ff7', N'IT', N'Wonderful IT Business Coaching', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=IT', N'Coaching', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'3920ab87-92c1-4d27-9b13-9257d2faa0bb', N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', N'Good Mouse', N'Good Mouse', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Good+Mouse', N'Mice', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'bd03eb9d-7834-4718-b4d2-925a7c8c48f6', N'd92093ee-04fe-4814-bf7c-1379b6db6cd4', N'Bird', N'Wonderful Robotic Bird', CAST(20000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Robotic+Bird', N'Pets', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'0f469541-84ad-4800-b1ce-9332e02328a1', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Medium Dog', N'Wonderful Medium Dog', CAST(75.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Medium+Dog', N'Dogs', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'43ed5fd1-21e2-48dc-895a-9569a5891675', N'1200fa6e-c6b3-432b-b2f0-fcc408da7ff7', N'HR', N'Wonderful HR Business Coaching', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=HR', N'Coaching', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'8cbf079c-8f52-4b11-913a-96c31699e53a', N'd8321cd3-e3b3-4f69-9c68-b4bf4b010e0d', N'Stop Sign', N'Wonderful Stop Sign', CAST(30.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Stop+Sign', N'Signs', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'8834cbd4-a501-49db-965b-9744b295be70', N'1cdc1f7f-4908-4907-b237-ab541eb72291', N'Medium Rectangle Metal', N'Wonderful Medium Rectangle Sheet Metal', CAST(75.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Medium+Rectangle+Metal', N'Rectangle', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'903e3344-4c41-482a-9481-97ad2c3d97bf', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Indigo Paint', N'Wonderful Indigo Paint', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Indigo+20paint', N'Paint', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'4fe79d73-6fb3-4000-a12f-98ff78546989', N'963c6a94-86f4-4ab5-bf3f-83c6aa35b0c7', N'Programming', N'Wonderful Consulting On Programming', CAST(150.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Programming+Consulting', N'Consulting', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'cb06d2b9-3a13-4054-9bde-9b437370ad9b', N'9196be0f-b1e0-4e00-b12f-d2009a26fc3b', N'Meat Lovers', N'Wonderful Meat Lovers Pizza', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Meat Lovers+Pizza', N'Pizza', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'd952fa9d-c169-4754-8fe9-9ce65d4f5710', N'0484c491-1612-476a-9592-058096499d6a', N'Fast Computer', N'Wonderful Fast Computer', CAST(10000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Fast+Computer', N'Computers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'5f1c6efb-8344-4206-a3c4-9d7a37402eff', N'39e25f01-510a-4e48-bb9d-4b98590e3cba', N'Snake Oil', N'Wonderful Snake Oil', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Snake+Oil', N'Liquids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'2f715ed8-9aac-4009-a5eb-9de346ceadc7', N'9196be0f-b1e0-4e00-b12f-d2009a26fc3b', N'Cheese', N'Wonderful Cheese Pizza', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Cheese+Pizza', N'Pizza', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'5c8f0803-df31-4c53-bd6f-9eb320729775', N'39e25f01-510a-4e48-bb9d-4b98590e3cba', N'Holy Sand', N'Wonderful Holy Sand', CAST(500.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Holy+Sand', N'Solids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'71070a48-cf51-48dd-af2d-9f2678fed2a3', N'0484c491-1612-476a-9592-058096499d6a', N'Good Keyboard', N'Good Keyboard', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Good+Keyboard', N'Keyboards', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'b9c96afc-8e45-48ad-b4df-a3994697ac2b', N'1cdc1f7f-4908-4907-b237-ab541eb72291', N'Medium Circle Metal', N'Wonderful Medium Circle Sheet Metal', CAST(75.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Medium+Circle+Metal', N'Circle', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'2996bb40-ca98-4a38-9f90-a53e528f29d8', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Tri Glide Ultra', N'The total package. A long-haul touring trike with unmistakable style and precision-cooled power.', CAST(43345.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/92c6R0C.png', N'Trike', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'22c84da4-5274-4d51-aa42-a54f39250c03', N'ea49add5-a123-494f-9950-354f2825376a', N'Removal', N'Wonderful Removal', CAST(250.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Removal', N'Surgery', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'b7e96180-d72d-46c7-8ed6-a691abad735f', N'38bfc848-dd0b-49bd-b04b-281df3a14773', N'Holy Sand', N'Wonderful Holy Sand For Pets', CAST(500.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Holy+Sand', N'Solids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'959cb2bd-a416-4e7a-ad6e-a6f56478340c', N'a96233b7-63ae-444f-8866-1380ad1b4e95', N'Programming', N'Wonderful Consulting On Programming', CAST(150.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Programming+Consulting', N'Consulting', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'1e0e2c9f-35a5-4d3f-9929-a7cf255f86e0', N'a3ea2e3a-3d5e-43d6-b03e-9fe873b8faf4', N'Small Truck', N'Wonderful Small Truck', CAST(30000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Small+Truck', N'Trucks', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'e665b440-4e29-4c04-bac4-a86b462c17cc', N'9196be0f-b1e0-4e00-b12f-d2009a26fc3b', N'Pepperoni', N'Wonderful Pepperoni Pizza', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Pepperoni+Pizza', N'Gluten Free', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'679286b8-163c-414a-816c-a90bcf3a5232', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Fat Bob 114', N'A street-eater with an appetite for power. Built with muscular style and performance.', CAST(23599.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/bOsopWh.png', N'Cruiser', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'5dc984f2-8faf-425b-acab-a9c72e7e29fd', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Red Paint', N'Wonderful Red Paint', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Red+20paint', N'Paint', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'6832ad8e-b333-4093-9ed8-acd0499ec7e3', N'1cdc1f7f-4908-4907-b237-ab541eb72291', N'Big Square Metal', N'Wonderful Big Square Sheet Metal', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Big+Square+Metal', N'Square', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'f67ea03b-5c05-4bdd-a7da-ad80fae08654', N'81847657-48cd-4fd7-a89f-ffa05ef2f88e', N'Muffins', N'Wonderful Muffins', CAST(5.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Muffins', N'Muffins', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'123f0b28-e1b2-45cc-992a-af27ea0820f4', N'9196be0f-b1e0-4e00-b12f-d2009a26fc3b', N'Canadian', N'Wonderful Canadian Pizza', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Canadian+Pizza', N'Pizza', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'df5298a9-6676-402c-871e-b28d767c9aae', N'1ffd00a6-93c8-4dd7-9f4a-401aea6e0686', N'Building', N'Wonderful Building Inspection', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Building+Inspection', N'Inspections', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'26a9d7dd-595c-44e4-b176-b3bb52b90ca5', N'1cdc1f7f-4908-4907-b237-ab541eb72291', N'Big Rectangle Metal', N'Wonderful Big Rectangle Sheet Metal', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Big+Rectangle+Metal', N'Rectangle', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'b5fcb1a1-111e-42b3-998b-b51c2e3fb131', N'28ae82d2-374c-47d5-9b6f-d56cbd000b08', N'Contacts', N'Wonderful Contacts', CAST(150.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Contacts', N'Vision', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'e73bcab2-c981-4f4b-9a49-b6485b374906', N'a96233b7-63ae-444f-8866-1380ad1b4e95', N'HR', N'Wonderful Consulting On HR', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=HR+Consulting', N'Consulting', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'b0a76af5-2813-43f4-8260-b739836e8a8b', N'c29aeb5f-bdf7-483c-975b-f7a0c6bb6f6e', N'Racoon', N'Wonderful Racoon Pest Removal', CAST(250.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Racoon', N'Pest Removal', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'651ffd94-ab54-495e-b7f2-b74ddcd14ce7', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Wrathful Business Practices', N'Wonderful Wrathful Business Practices', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Wrathful', N'Business Practices', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'e0fcee77-b9a4-493c-860c-b90d49183b9c', N'9196be0f-b1e0-4e00-b12f-d2009a26fc3b', N'Meat Lovers', N'Wonderful Meat Lovers Pizza', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Meat Lovers+Pizza', N'Gluten Free', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'ece8ca11-8965-4ccd-9d08-b982a708f1a1', N'0484c491-1612-476a-9592-058096499d6a', N'Bad Printer', N'Bad Printer', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Bad+Printer', N'Printers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'80e8ec30-59fa-4d99-94be-badcc09ac519', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Medium Mouse', N'Wonderful Medium Mouse', CAST(75.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Medium+Mouse', N'Mice', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'6cbafbf4-21ca-48a1-baaa-bb6566fc3dc9', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Greedy Business Practices', N'Wonderful Greedy Business Practices', CAST(101.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Greedy', N'Business Practices', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'f59d7828-a4b7-4d16-92a6-bd271aa8eda7', N'0484c491-1612-476a-9592-058096499d6a', N'Bad Mouse', N'Bad Mouse', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Bad+Mouse', N'Mice', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'38f689b3-4f23-4963-8509-bf91201a7dc0', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Big Rat', N'Wonderful Big Rat', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Big+Rat', N'Rats', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'302ef096-3613-44ab-85e6-bfcbd45e60a6', N'a96233b7-63ae-444f-8866-1380ad1b4e95', N'Business', N'Wonderful Consulting On Business', CAST(150.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Business+Consulting', N'Consulting', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'9d47de7f-387c-41e8-ad13-c1f88612aeb5', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Fan Paint Brush', N'Wonderful Fan Paint Brush', CAST(20.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Fan+20paintbrush', N'Paint Brushes', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'5b7a988b-9011-4a70-af07-c37b6aaf2215', N'b883bdb5-a673-4965-a8e3-f231910f9224', N'Bad Mouse', N'Wonderful Bad Mouse', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Bad+Mouse', N'Mice', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'c448d645-7f42-40f6-b730-c3eea3a0551c', N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', N'Bad Keyboard', N'Bad Keyboard', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Bad+Keyboard', N'Keyboards', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'25ecb75d-959e-45b8-aadd-c4dcc52491a6', N'1cdc1f7f-4908-4907-b237-ab541eb72291', N'Medium Triangle Metal', N'Wonderful Medium Triangle Sheet Metal', CAST(75.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Medium+Triangle+Metal', N'Triangle', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'dd11da2d-437e-43cb-b361-c4e600f0c97f', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Iron 883', N'Blacked-out and stripped-down with a legendary profile.', CAST(11499.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/O7DPqRy.png', N'Street', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'106fa3ba-f7d8-4e33-a299-c51ce5662f84', N'79c18850-5c35-4e8c-84c0-6107350b5ed3', N'Mediocre Hairspray', N'Wonderful Mediocre Hairspray', CAST(75.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Mediocre+Hairspray', N'Hairspray', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'ec6dc64d-7428-429e-b66d-c54ba29a9030', N'1cdc1f7f-4908-4907-b237-ab541eb72291', N'Small Rectangle Metal', N'Wonderful Small Rectangle Sheet Metal', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Small+Rectangle+Metal', N'Rectangle', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'98234650-0d8e-4458-93b1-c5f27272a84a', N'1ffd00a6-93c8-4dd7-9f4a-401aea6e0686', N'Pool', N'Wonderful Pool Inspection', CAST(150.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Pool+Inspection', N'Inspections', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'89376f57-4c53-4ec0-842f-c6667cffb8f1', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Street Glide', N'The original stripped-down hot-rod bagger.', CAST(26999.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/6YIGRQO.png', N'Touring', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'537b1b3d-7193-458e-987f-c7154d710487', N'38bfc848-dd0b-49bd-b04b-281df3a14773', N'Smelling Stone', N'Wonderful Smelling Stone For Pets', CAST(200.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Smelling+Stone', N'Solids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'2988ee98-194d-4de5-b841-c76159ecfce2', N'963c6a94-86f4-4ab5-bf3f-83c6aa35b0c7', N'Project', N'Wonderful Consulting On Project', CAST(500.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Project+Consulting', N'Consulting', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'aee75cdb-6dfb-4cbe-a4b4-c8658cb19499', N'd92093ee-04fe-4814-bf7c-1379b6db6cd4', N'Dog', N'Wonderful Robotic Dog', CAST(20000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Robotic+Dog', N'Pets', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'5cf5244c-ebd9-4643-91dc-c8b54dc822f1', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Medium Rat', N'Wonderful Medium Rat', CAST(75.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Medium+Rat', N'Rats', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'2015b7fc-5d61-4a62-b280-cf5bdbd84860', N'bdeeac9a-ec2e-41ce-b448-a6a2bae7eb42', N'Moving', N'Wonderful Moving Service', CAST(250.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Moving+Service', N'Services', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'0f104f4d-34ed-4257-ae3b-d0765847ae94', N'b883bdb5-a673-4965-a8e3-f231910f9224', N'Slow Computer', N'Wonderful Slow Computer', CAST(5000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Slow+Computer', N'Computers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'79ef3b54-1b5b-4d40-a9b7-d34721bba189', N'c29aeb5f-bdf7-483c-975b-f7a0c6bb6f6e', N'Mice', N'Wonderful Mice Pest Removal', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Mice', N'Pest Removal', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'01257aab-d7f8-47dd-88ad-d4f47d40f0f2', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Forty-Eight', N'Heavy-hitting fat tire style with an iconic peanut tank and bulldog stance.', CAST(12999.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/qyWJNMK.png', N'Street', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'f5738eb1-32b2-4b2d-b7e3-d51c9b3d26ec', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Red Paint', N'Wonderful Red Paint', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Red+20paint', N'Paint', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'8cae0015-7ee9-4411-85b8-d53718597c40', N'0484c491-1612-476a-9592-058096499d6a', N'Fast Laptop', N'Wonderful Fast Laptop', CAST(5000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Fast+Laptop', N'Laptops', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'9abe5321-f6ec-44c8-99b7-d53c3490f929', N'0484c491-1612-476a-9592-058096499d6a', N'Slow Laptop', N'Wonderful Slow Laptop', CAST(2000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Slow+Laptop', N'Laptops', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'beadec5a-f943-4ad5-89ec-d58297d451f8', N'39e25f01-510a-4e48-bb9d-4b98590e3cba', N'Healing Charms', N'Wonderful Healing Charms', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Healing+Charms', N'Solids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'6dcc06af-3b80-4e06-b424-d6193fccef33', N'bdeeac9a-ec2e-41ce-b448-a6a2bae7eb42', N'Anything', N'Wonderful Anything Service', CAST(500.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Anything+Service', N'Services', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'3dc9f7a9-d4be-45a8-8977-d71394a33e5d', N'da0b141e-518b-4cde-b520-6a381d704c26', N'Small Bird', N'Wonderful Small Bird', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Small+Bird', N'Birds', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'2cbce198-29f6-41ae-b6d2-d7a738c6d621', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Flat Paint Brush', N'Wonderful Flat Paint Brush', CAST(20.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Flat+20paintbrush', N'Paint Brushes', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'aadce339-0bea-43cb-878e-d8c5e631754b', N'd8321cd3-e3b3-4f69-9c68-b4bf4b010e0d', N'Yield Sign', N'Wonderful Yield Sign', CAST(30.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Yield+Sign', N'Signs', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'f7db032d-c96c-47b4-85a9-d8c91322019f', N'd92093ee-04fe-4814-bf7c-1379b6db6cd4', N'Foot', N'Wonderful Robotic Foot', CAST(20000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Robotic+20Foot', N'Limbs', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'fd1d67b2-724d-4499-86fe-da9bc58fb25f', N'0484c491-1612-476a-9592-058096499d6a', N'Good Mouse', N'Good Mouse', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Good+Mouse', N'Mice', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'6f87b658-7c43-41db-afc4-dce118ffbc6b', N'b883bdb5-a673-4965-a8e3-f231910f9224', N'Kinda Fast Laptop', N'Wonderful Kinda Fast Laptop', CAST(4000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Kinda+Fast+Laptop', N'Laptops', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'5dfeb53a-3358-44eb-93fe-df68f8a2865c', N'b883bdb5-a673-4965-a8e3-f231910f9224', N'Fast Laptop', N'Wonderful Fast Laptop', CAST(5000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Fast+Laptop', N'Laptops', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'7c31bc87-4fea-4316-83f5-e1cc8762ede8', N'4a18d3e4-a7e2-4cc9-8be0-bbba86b54078', N'Bad Mouse', N'Bad Mouse', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Bad+Mouse', N'Mice', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'ed6407e1-ed8e-482c-97d5-e3a0b09769fc', N'38bfc848-dd0b-49bd-b04b-281df3a14773', N'Magic Herbs', N'Wonderful Magic Herbs For Pets', CAST(25.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Magic+Herbs', N'Solids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'7a4f0629-5067-44e2-8548-e5150e9b03db', N'a3ea2e3a-3d5e-43d6-b03e-9fe873b8faf4', N'Small Car', N'Wonderful Small Car', CAST(25000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Small+Car', N'Cars', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'51e9a8cd-e1c8-481c-80ce-e7557be378d1', N'1ffd00a6-93c8-4dd7-9f4a-401aea6e0686', N'Routine', N'Wonderful Routine Inspection', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Routine+Inspection', N'Inspections', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'a8e7357e-673b-4289-b610-e8e40c3aa88b', N'1cdc1f7f-4908-4907-b237-ab541eb72291', N'Small Square Metal', N'Wonderful Small Square Sheet Metal', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Small+Square+Metal', N'Square', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'e0ca163c-fe44-4b42-8913-ea63e3f63b0a', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Road Glide', N'The benchmark for long-distance touring bikes. Runs mile after mile with ease.', CAST(26999.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/4BnW0IV.png', N'Touring', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'22d31299-4679-4afb-b1cb-eafebcf8c711', N'39e25f01-510a-4e48-bb9d-4b98590e3cba', N'Mystic Water', N'Wonderful Mystic Water', CAST(300.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Mystic+Water', N'Liquids', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'bffcccc3-5a81-4634-a172-ecc8a7d21672', N'9196be0f-b1e0-4e00-b12f-d2009a26fc3b', N'Veggie', N'Wonderful Veggie Pizza', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Veggie+Pizza', N'Gluten Free', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'4d55bae8-b295-4dc4-b57f-edc50cdc9434', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Yellow Paint', N'Wonderful Yellow Paint', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Yellow+20paint', N'Paint', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'95d2a959-227e-44e9-8d35-ee782ea99652', N'1200fa6e-c6b3-432b-b2f0-fcc408da7ff7', N'Project', N'Wonderful Project Business Coaching', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Project', N'Coaching', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'86efcc7a-f1f6-4194-8a0e-ee8433d5a5b3', N'2314e177-c2b5-4bae-85f9-47ce1869c1b3', N'Mob Paint Brush', N'Wonderful Mob Paint Brush', CAST(20.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Mob+20paintbrush', N'Paint Brushes', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'4a1cbb7b-ea56-40e8-9f1f-f105016080a1', N'81847657-48cd-4fd7-a89f-ffa05ef2f88e', N'Cake', N'Wonderful Cake', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Cake', N'Cake', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'ba9b63ef-a31e-4d9a-a483-f172fe9b9925', N'28ae82d2-374c-47d5-9b6f-d56cbd000b08', N'Checkup', N'Wonderful Checkup', CAST(50.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Checkup', N'Doctoral', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'53487a4a-0cf0-47ee-a545-f42b87a22621', N'ea49add5-a123-494f-9950-354f2825376a', N'Checkup', N'Wonderful Checkup', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Checkup', N'Scam', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'9ab3fac4-c818-4de9-b926-f62607bd745c', N'b883bdb5-a673-4965-a8e3-f231910f9224', N'Bad Printer', N'Wonderful Bad Printer', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Bad+Printer', N'Printers', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'48e6eea4-7396-4749-a87e-f79d11f29e0a', N'a96233b7-63ae-444f-8866-1380ad1b4e95', N'Project', N'Wonderful Consulting On Project', CAST(500.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Project+Consulting', N'Consulting', 0)
GO
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'411cf03f-2653-41de-8ee0-f8084b946b85', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Electra Glide Standard', N'Everything you need for a lifetime of cross-country adventure with room make it your own.', CAST(24999.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/RNXiVsX.png', N'Touring', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'63b1b239-914c-41a4-90d0-f8bbafa12ead', N'c29aeb5f-bdf7-483c-975b-f7a0c6bb6f6e', N'Rat', N'Wonderful Rat Pest Removal', CAST(200.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Rat', N'Pest Removal', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'53467df0-f3ff-474f-960e-f8bd6e496510', N'963c6a94-86f4-4ab5-bf3f-83c6aa35b0c7', N'IT', N'Wonderful Consulting On IT', CAST(150.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=IT+Consulting', N'Consulting', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'96a9e69e-59f3-4c27-82b4-f9054c5cb40f', N'b883bdb5-a673-4965-a8e3-f231910f9224', N'Bad Keyboard', N'Wonderful Bad Keyboard', CAST(10.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Bad+Keyboard', N'Keyboards', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'93172c00-16e0-422e-845e-f91f20d16389', N'79c18850-5c35-4e8c-84c0-6107350b5ed3', N'Good Hairspray', N'Wonderful Good Hairspray', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Good+Hairspray', N'Hairspray', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'8792e42f-af80-46c1-9402-fa9e3624b6e5', N'7c259e52-62f3-4632-9e3b-0ed4bc208767', N'Softail Slim', N'The essential stripped-down, low-slung bobber for all-day riding.', CAST(18999.0000 AS Decimal(19, 4)), NULL, NULL, N'https://i.imgur.com/pbBqxBh.png', N'Cruiser', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'a5e65471-cba3-47f1-9ce5-fb2dc7b8dc6f', N'a3ea2e3a-3d5e-43d6-b03e-9fe873b8faf4', N'Medium Car', N'Wonderful Medium Car', CAST(30000.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Medium+Car', N'Cars', 0)
INSERT [dbo].[Item] ([ItemId], [BusinessId], [ItemName], [Details], [Price], [SKU], [UPC], [ImageLocation], [Category], [Removed]) VALUES (N'199ca50f-398c-4bca-9220-fcac50dad981', N'a96233b7-63ae-444f-8866-1380ad1b4e95', N'Accounting', N'Wonderful Consulting On Accounting', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'https://dummyimage.com/300/09f.png/fff/sadasdasd&text=Accounting+Consulting', N'Consulting', 0)
GO
INSERT [dbo].[Member] ([AspNetId], [MemberId], [Lat], [Lng], [FirstName], [LastName], [Street], [StreetLn2], [City], [Postal], [ProvinceCode], [CountryCode], [PhoneNumber], [Gender], [Birthday]) VALUES (N'e359f266-07bd-4963-8d4f-35d5ca747acb', N'354baaf5-1ef9-4144-bb8a-0d6fb1933f9c', 43.479692, -80.518172, N'member', N'member', N'108 University Ave. East', NULL, N'Waterloo', N'N2J 2W2', N'ON', N'CA', N'519-885-0300', N'Male', CAST(N'1234-12-31' AS Date))
GO
INSERT [dbo].[OrderStatus] ([StatusId], [StatusName], [StatusText], [BootstrapClass]) VALUES (0, N'Pending', N'Waiting for the merchant to accept order.', N'primary')
INSERT [dbo].[OrderStatus] ([StatusId], [StatusName], [StatusText], [BootstrapClass]) VALUES (1, N'Accepted', N'Order has been accepted, and will be prepared soon.', N'warning')
INSERT [dbo].[OrderStatus] ([StatusId], [StatusName], [StatusText], [BootstrapClass]) VALUES (2, N'Preparing', N'Order is currently being prepared by the merchant', N'info')
INSERT [dbo].[OrderStatus] ([StatusId], [StatusName], [StatusText], [BootstrapClass]) VALUES (3, N'Ready For Pickup', N'Order is ready for pickup.', N'success')
INSERT [dbo].[OrderStatus] ([StatusId], [StatusName], [StatusText], [BootstrapClass]) VALUES (4, N'Picked Up', N'Order has been picked up and completed.', N'secondary')
INSERT [dbo].[OrderStatus] ([StatusId], [StatusName], [StatusText], [BootstrapClass]) VALUES (5, N'Canceled', N'Order has been canceled by the customer.', N'danger')
INSERT [dbo].[OrderStatus] ([StatusId], [StatusName], [StatusText], [BootstrapClass]) VALUES (6, N'Denied', N'Order has been denied by the merchant.', N'danger')
GO
INSERT [dbo].[Province] ([ProvinceCode], [CountryCode], [FullName], [TaxRate], [TaxCode]) VALUES (N'ON', N'CA', N'Ontario', CAST(0.1300 AS Decimal(19, 4)), N'HST')
GO
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'043406d6-2884-4e54-926b-052c219f5c38', N'+00:00', N'(GMT) Western Europe Time, London, Lisbon, Casablanca')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'3761f075-bc26-4878-b70d-13c081660742', N'+10:50', N'(GMT +10:30) Lord Howe Island')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'46f80240-9775-40ba-9ba4-1519a7bb04ea', N'+11:00', N'(GMT +11:00) Magadan, Solomon Islands, New Caledonia')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'21ee0cfa-0c90-4cc3-ac0d-1561cc97f8c0', N'-03:00', N'(GMT -3:00) Brazil, Buenos Aires, Georgetown')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'd28ac79d-4829-4b1e-8b4e-161c65ac5492', N'-02:00', N'(GMT -2:00) Mid-Atlantic')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'd4d66784-c477-4ed7-9269-16ea61c7d81f', N'-07:00', N'(GMT -7:00) Mountain Time (US &amp; Canada)')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'90aaa6e4-befa-4d25-a977-179ad0ff9dd9', N'+04:50', N'(GMT +4:30) Kabul')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'58107db9-8a3d-4d76-b964-1826b70090b9', N'-04:00', N'(GMT -4:00) Atlantic Time (Canada), Caracas, La Paz')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'ee96272f-1db9-460e-a8e9-19147c7ce166', N'+10:00', N'(GMT +10:00) Eastern Australia, Guam, Vladivostok')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'4cb52b2b-9ae1-4031-94b6-197c10145e14', N'+04:00', N'(GMT +4:00) Abu Dhabi, Muscat, Baku, Tbilisi')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'6d2c0d9c-d36d-4c28-ad20-1a9d9cfdb7b9', N'+07:00', N'(GMT +7:00) Bangkok, Hanoi, Jakarta')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'2357bc8d-ce51-457d-9319-348295ed64bc', N'+09:00', N'(GMT +9:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'7cebf0f3-c35f-4c78-b2f9-3680f1c41ca8', N'-12:00', N'(GMT -12:00) Eniwetok, Kwajalein')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'058c274d-5eaf-43ba-a73f-3d834a3ff0c0', N'-04:50', N'(GMT -4:30) Caracas')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'1e9d6dea-1184-4dd2-aaf7-465f392e4c52', N'-10:00', N'(GMT -10:00) Hawaii')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'e2eea908-2287-4dee-b5fc-6043a1f0dde8', N'-06:00', N'(GMT -6:00) Central Time (US &amp; Canada), Mexico City')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'fd50ef86-136e-468c-95b5-6b3ab63f8fe4', N'+03:00', N'(GMT +3:00) Baghdad, Riyadh, Moscow, St. Petersburg')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'2be5336a-41cc-41de-b6bf-6de06ea49a9c', N'-11:00', N'(GMT -11:00) Midway Island, Samoa')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'a579aa3a-7da9-49f8-b251-724d5501c819', N'+01:00', N'(GMT +1:00) Brussels, Copenhagen, Madrid, Paris')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'3b0651ac-5b3f-4f2c-b4f0-7786d65d8159', N'+08:00', N'(GMT +8:00) Beijing, Perth, Singapore, Hong Kong')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'ae43cb56-ca3f-445b-8601-7bd6d3451a89', N'+12:00', N'(GMT +12:00) Auckland, Wellington, Fiji, Kamchatka')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'93f64cb0-b484-46d4-83c8-82360236ee40', N'+11:50', N'(GMT +11:30) Norfolk Island')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'e39367c0-d54f-4183-bb45-8390ebc215ab', N'-09:00', N'(GMT -9:00) Alaska')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'98716a1b-1a5f-4765-8d9f-896c4ad61b1d', N'-09:50', N'(GMT -9:30) Taiohae')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'630ce6f5-6cd3-443b-b60e-951facdc1f8a', N'-01:00', N'(GMT -1:00) Azores, Cape Verde Islands')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'45bc2a1b-2436-4d59-adf8-9b68006e7e75', N'-08:00', N'(GMT -8:00) Pacific Time (US &amp; Canada)')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'6448fa61-59be-40fd-899a-ac5bce772894', N'+05:50', N'(GMT +5:30) Bombay, Calcutta, Madras, New Delhi')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'ab9c0f97-02aa-42c0-92ee-b3714fe622bc', N'-05:00', N'(GMT -5:00) Eastern Time (US &amp; Canada), Bogota, Lima')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'af3c693b-7e43-4adb-a742-b5aff358b3d6', N'-03:50', N'(GMT -3:30) Newfoundland')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'217c6558-2dca-4c4e-aee4-b609e61a3616', N'+06:50', N'(GMT +6:30) Yangon, Mandalay')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'83b1cd28-eb7b-4f7c-84e9-b621bc738c21', N'+14:00', N'(GMT +14:00) Line Islands, Tokelau')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'8a5dd2a7-5a53-434b-886a-bc95647fcc7e', N'+05:75', N'(GMT +5:45) Kathmandu, Pokhar')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'e456eaed-baaa-4aea-be6f-bce70813899d', N'+13:00', N'(GMT +13:00) Apia, Nukualofa')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'313b6491-aa9a-427b-a9ad-c1ccf3b7119e', N'+08:75', N'(GMT +8:45) Eucla')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'693937b6-c1f7-4245-9281-c9592f01940c', N'+05:00', N'(GMT +5:00) Ekaterinburg, Islamabad, Karachi, Tashkent')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'aaf03d20-a78c-4a82-9621-d577b23de757', N'+12:75', N'(GMT +12:45) Chatham Islands')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'f538908b-6b49-437b-91f2-e09ab45ecd6a', N'+09:50', N'(GMT +9:30) Adelaide, Darwin')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'26217338-5a05-461a-b218-f3850258df4d', N'+03:50', N'(GMT +3:30) Tehran')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'73ed3dd3-2dc2-4fd8-9cf1-f9bedcae55dd', N'+06:00', N'(GMT +6:00) Almaty, Dhaka, Colombo')
INSERT [dbo].[TimeZones] ([TimeZoneID], [Offset], [Label]) VALUES (N'acb3ddc0-3317-4796-9c4f-fd5847e41cdc', N'+02:00', N'(GMT +2:00) Kaliningrad, South Africa')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2021-04-15 8:17:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2021-04-15 8:17:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2021-04-15 8:17:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2021-04-15 8:17:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2021-04-15 8:17:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2021-04-15 8:17:36 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2021-04-15 8:17:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK_Business_Unique]    Script Date: 2021-04-15 8:17:36 PM ******/
ALTER TABLE [dbo].[Business] ADD  CONSTRAINT [PK_Business_Unique] UNIQUE NONCLUSTERED 
(
	[BusinessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Item__727E838A40CE9702]    Script Date: 2021-04-15 8:17:36 PM ******/
ALTER TABLE [dbo].[Item] ADD UNIQUE NONCLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Item__727E838A4FD90586]    Script Date: 2021-04-15 8:17:36 PM ******/
ALTER TABLE [dbo].[Item] ADD UNIQUE NONCLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK_Member_Unique]    Script Date: 2021-04-15 8:17:36 PM ******/
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [PK_Member_Unique] UNIQUE NONCLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Order__C3905BCECCCB2681]    Script Date: 2021-04-15 8:17:36 PM ******/
ALTER TABLE [dbo].[Order] ADD UNIQUE NONCLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountSettings] ADD  DEFAULT ((0)) FOR [PromotionalEmails]
GO
ALTER TABLE [dbo].[Business] ADD  DEFAULT (newid()) FOR [BusinessId]
GO
ALTER TABLE [dbo].[Business] ADD  DEFAULT ('ON') FOR [ProvinceCode]
GO
ALTER TABLE [dbo].[Business] ADD  DEFAULT ('CA') FOR [CountryCode]
GO
ALTER TABLE [dbo].[Business] ADD  DEFAULT ((0)) FOR [Lat]
GO
ALTER TABLE [dbo].[Business] ADD  DEFAULT ((0)) FOR [Lng]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [df_cartId]  DEFAULT (newid()) FOR [CartId]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (dateadd(week,(1),getdate())) FOR [ExpiryDate]
GO
ALTER TABLE [dbo].[Item] ADD  DEFAULT (newid()) FOR [ItemId]
GO
ALTER TABLE [dbo].[Item] ADD  DEFAULT ('FALSE') FOR [Removed]
GO
ALTER TABLE [dbo].[Member] ADD  DEFAULT (newid()) FOR [MemberId]
GO
ALTER TABLE [dbo].[Member] ADD  DEFAULT ((0)) FOR [Lat]
GO
ALTER TABLE [dbo].[Member] ADD  DEFAULT ((0)) FOR [Lng]
GO
ALTER TABLE [dbo].[Member] ADD  DEFAULT ('ON') FOR [ProvinceCode]
GO
ALTER TABLE [dbo].[Member] ADD  DEFAULT ('CA') FOR [CountryCode]
GO
ALTER TABLE [dbo].[Member] ADD  DEFAULT (getdate()) FOR [Birthday]
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT (newid()) FOR [NotificationId]
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT ((0)) FOR [Read]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [df_orderId]  DEFAULT (newid()) FOR [OrderId]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [DiscountTotal]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Province] ADD  DEFAULT ('') FOR [TaxCode]
GO
ALTER TABLE [dbo].[Sale] ADD  DEFAULT (newid()) FOR [SaleId]
GO
ALTER TABLE [dbo].[Sale] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[TimeZones] ADD  DEFAULT (newid()) FOR [TimeZoneID]
GO
ALTER TABLE [dbo].[AccountSettings]  WITH CHECK ADD FOREIGN KEY([AspNetId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AccountSettings]  WITH CHECK ADD FOREIGN KEY([TimeZoneID])
REFERENCES [dbo].[TimeZones] ([TimeZoneID])
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Business]  WITH CHECK ADD FOREIGN KEY([AspNetId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Business]  WITH CHECK ADD FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Business]  WITH CHECK ADD FOREIGN KEY([ProvinceCode])
REFERENCES [dbo].[Province] ([ProvinceCode])
GO
ALTER TABLE [dbo].[BusinessHours]  WITH CHECK ADD FOREIGN KEY([BusinessId])
REFERENCES [dbo].[Business] ([BusinessId])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([BusinessId])
REFERENCES [dbo].[Business] ([BusinessId])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD FOREIGN KEY([BusinessId])
REFERENCES [dbo].[Business] ([BusinessId])
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD FOREIGN KEY([AspNetId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD FOREIGN KEY([ProvinceCode])
REFERENCES [dbo].[Province] ([ProvinceCode])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([RecipientId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([SaleId])
REFERENCES [dbo].[Sale] ([SaleId])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([SenderId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([BusinessId])
REFERENCES [dbo].[Business] ([BusinessId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ORDERSTATUS] FOREIGN KEY([Status])
REFERENCES [dbo].[OrderStatus] ([StatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ORDERSTATUS]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_ORDERITEM_ORDERID] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_ORDERITEM_ORDERID]
GO
ALTER TABLE [dbo].[Province]  WITH CHECK ADD FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([BusinessId])
REFERENCES [dbo].[Business] ([BusinessId])
GO
ALTER TABLE [dbo].[SaleItem]  WITH CHECK ADD FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[SaleItem]  WITH CHECK ADD FOREIGN KEY([SaleId])
REFERENCES [dbo].[Sale] ([SaleId])
GO
USE [master]
GO
ALTER DATABASE [KurbSide] SET  READ_WRITE 
GO
