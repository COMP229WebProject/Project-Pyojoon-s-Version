USE [master]
GO
/****** Object:  Database [BalloonShop]    Script Date: 03/23/2012 12:51:38 ******/
CREATE DATABASE [BalloonShop] 
ALTER DATABASE [BalloonShop] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BalloonShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BalloonShop] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BalloonShop] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BalloonShop] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BalloonShop] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BalloonShop] SET ARITHABORT OFF
GO
ALTER DATABASE [BalloonShop] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [BalloonShop] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BalloonShop] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BalloonShop] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BalloonShop] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BalloonShop] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BalloonShop] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BalloonShop] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BalloonShop] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BalloonShop] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BalloonShop] SET  ENABLE_BROKER
GO
ALTER DATABASE [BalloonShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BalloonShop] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BalloonShop] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BalloonShop] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [BalloonShop] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BalloonShop] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [BalloonShop] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BalloonShop] SET  READ_WRITE
GO
ALTER DATABASE [BalloonShop] SET RECOVERY FULL
GO
ALTER DATABASE [BalloonShop] SET  MULTI_USER
GO
ALTER DATABASE [BalloonShop] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BalloonShop] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'BalloonShop', N'ON'
GO
USE [BalloonShop]
GO
/****** Object:  FullTextCatalog [BalloonShopFullText]    Script Date: 03/23/2012 12:51:38 ******/
CREATE FULLTEXT CATALOG [BalloonShopFullText]WITH ACCENT_SENSITIVITY = ON
AS DEFAULT
AUTHORIZATION [dbo]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 03/23/2012 12:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attribute](
	[AttributeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Attribute] ON
INSERT [dbo].[Attribute] ([AttributeID], [Name]) VALUES (1, N'Color')
SET IDENTITY_INSERT [dbo].[Attribute] OFF
/****** Object:  Table [dbo].[Department]    Script Date: 03/23/2012 12:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description]) VALUES (1, N'Andriod', N'Andriod OS Smartphones')
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description]) VALUES (2, N'iOS', N'iOS Smartphones')
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description]) VALUES (3, N'Windows Phone', N'Windows OS Smartphones')
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description]) VALUES (4, N'Blackberry OS', N'Blackberry OS Smartphones')
SET IDENTITY_INSERT [dbo].[Department] OFF
/****** Object:  Table [dbo].[Product]    Script Date: 03/23/2012 12:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [money] NOT NULL,
	[Thumbnail] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[PromoFront] [bit] NOT NULL,
	[PromoDept] [bit] NOT NULL
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE FULLTEXT INDEX ON [dbo].[Product](
[Description] LANGUAGE [English], 
[Name] LANGUAGE [English])
KEY INDEX [PK_Product]ON ([BalloonShopFullText], FILEGROUP [PRIMARY])
WITH (CHANGE_TRACKING = AUTO, STOPLIST = SYSTEM)
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (1, N'Galaxy Note4', N'testing', 400, N'galaxynote4.jpg', N'galaxynote4.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (2, N'Galaxy Note5', N'testing', 400, N'galaxynote5.jpg', N'galaxynote5.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (3, N'Galaxy S5', N'testing', 500, N'galaxys5.jpg', N'galaxys5.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (4, N'Galaxy S6', N'testing', 12.4900, N'galaxys6.jpg', N'galaxys6.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (5, N'Galaxy S6 Edge', N'testing', 12.4900, N'galaxys6edge.jpg', N'galaxys6edge.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (6, N'Galaxy S6 Edge+', N'testing', 12.4900, N'galaxys6edgeplus.jpg', N'galaxys6edgeplus.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (7, N'HTC M7', N'testing', 12.4900, N'htca9.jpg', N'htca9.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (8, N'HTC M8', N'testing', 12.4900, N'htcm7.jpg', N'htcm7.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (9, N'HTC M9', N'testing', 12.4900, N'htcm8.jpg', N'htcm8.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (10, N'HTC A9', N'testing', 12.4900, N'htcm9.jpg', N'htcm9.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (11, N'iPhone 5s', N'testing', 12.4900, N'iphone5s.jpg', N'iphone5s.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (12, N'iPhone 6', N'testing', 12.4900, N'iphone6.jpg', N'iphone6.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (13, N'iPhone 6 plus', N'testing', 12.4900, N'iphone6plus.jpg', N'iphone6plus.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (14, N'iPhone 6s', N'testing', 12.4900, N'iphone6s.jpg', N'iphone6s.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (15, N'iPhone 6s plus', N'testing', 12.4900, N'iphone6splus.jpg', N'iphone6splus.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (16, N'LG G3', N'testing', 12.4900, N'lgg3.jpg', N'lgg3.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (17, N'LG G4', N'testing', 12.4900, N'lgg4.jpg', N'lgg4.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (18, N'LG G Flex', N'testing', 12.4900, N'lggflex.jpg', N'lggflex.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (19, N'LG G Stylo', N'testing', 12.4900, N'lggstylo.jpg', N'lggstylo.jpg', 0, 0)

INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (20, N'Xperia C5', N'testing', 12.4900, N'XperiaC5.jpg', N'XperiaC5.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (21, N'Xperia M4 Aqua', N'testing', 12.4900, N'XperiaM4Aqua.jpg', N'XperiaM4Aqua.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (22, N'Xperia M5', N'testing', 12.4900, N'XperiaM5.jpg', N'XperiaM5.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (23, N'Xperia M5 Dual', N'testing', 12.4900, N'XperiaM5Dual.jpg', N'XperiaM5Dual.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (24, N'Xperia Z5', N'testing', 12.4900, N'XperiaZ5.jpg', N'XperiaZ5.jpg', 0, 0)

INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (25, N'Blackberry Classic', N'testing', 12.4900, N'BBClassic.jpg', N'BBClassic.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (26, N'Blackberry Leap', N'testing', 12.4900, N'BBLeap.jpg', N'BBLeap.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (27, N'Blackberry Passport', N'testing', 12.4900, N'BBPassport.jpg', N'BBPassport.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (28, N'Blackberry Priv', N'testing', 12.4900, N'BBPriv.jpg', N'BBPriv.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (29, N'Blackberry Z30', N'testing', 12.4900, N'BBZ30.jpg', N'BBZ30.jpg', 0, 0)

INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (30, N'Lumia 535', N'testing', 12.4900, N'Lumia535.jpg', N'Lumia535.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (31, N'Lumia 635', N'testing', 12.4900, N'Lumia635.jpg', N'Lumia635.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (32, N'Lumia 640XL', N'testing', 12.4900, N'Lumia640XL.jpg', N'Lumia640XL.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (33, N'Lumia 950', N'testing', 12.4900, N'Lumia950.jpg', N'Lumia950.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (34, N'Lumia 950XL', N'testing', 12.4900, N'Lumia950XL.jpg', N'Lumia950XL.jpg', 0, 0)

INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (35, N'Missed You''ll Be', N'If someone special is Going away, let this cute puppy balloon tell them they''ll be missed.', 12.9900, N't16809p.jpg', N'16809p.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (36, N'You''re Appreciated', N'A spotty balloon with the words "You''re Appreciated". I bet they''ll appreciate it too!', 12.9900, N't16988p.jpg', N'16988p.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (37, N'Thinking of You', N'Thinking of someone? Let them know with this thoughtful heart-shaped balloon with flowers in the background.', 12.9900, N't214046p.jpg', N'214046p.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (38, N'Get Well-Daisy Smiles', N'We all get sick sometimes and need something to cheer us up. Make the world brighter for someone with this Get Well Soon balloon.', 12.9900, N't21825b.jpg', N'21825b.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (39, N'Toy Story', N'Woody and Buzz from Toy Story, on a round balloon.', 12.9900, N't0366101.jpg', N'0366101.jpg', 1, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (40, N'Rugrats Tommy & Chucky', N'If you are a Rugrats fan, you''ll be nuts about this purple Rugrats balloon featuring Chucky and Tommy. A definite Nickelodeon Toon favorite.', 12.9900, N't03944l.jpg', N'03944l.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (41, N'Rugrats & Reptar Character', N'Rugrats balloon featuring Angelica, Chucky, Tommy, and Reptar.', 12.9900, N't03945L.jpg', N'03945L.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (42, N'Tweety & Sylvester', N'A blue round balloon with the great cartoon pair: Tweety & Sylvester.', 12.9900, N't0510801.jpg', N'0510801.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (43, N'Mickey Close-up', N'A close-up of Mickey Mouse on a blue heart-shaped balloon. Check out our close-up matching Minnie balloon.', 12.9900, N't0521201.jpg', N'0521201.jpg', 1, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (44, N'Minnie Close-up', N'A close-up of Minnie Mouse on a pink heart-shaped balloon. Check out our close-up matching Mickey balloon.', 12.9900, N't0522101.jpg', N'0522101.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (45, N'Teletubbies Time', N'Time for Teletubbies balloon. Great gift for any kid.', 12.9900, N't0611401.jpg', N'0611401.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (46, N'Barbie My Special Things', N'Barbie and her friends on a round balloon.', 12.9900, N't0661701.jpg', N'0661701.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (47, N'Paddington Bear', N'Remember Paddington? A must-have for any Paddington Bear lover.', 12.9900, N't215017p.jpg', N'215017p.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (48, N'I Love You Snoopy', N'The one and only Snoopy hugging Charlie Brown to say "I Love You."', 12.9900, N't215402p.jpg', N'215402p.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (49, N'Pooh Adult', N'An adorable Winnie the Pooh balloon.', 12.9900, N't81947pl.jpg', N'81947pl.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (50, N'Pokemon Character', N'A Pokemon balloon with a lot of mini pictures of the rest of the cast. Pokemon, Gotta catch ''em all!', 12.9900, N't83947.jpg', N'83947.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (51, N'Pokemon Ash & Pikachu', N'A Pokemon balloon with Ash and Pikachu. Gotta catch ''em all!', 12.9900, N't83951.jpg', N'83951.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (52, N'Smiley Kiss Yellow', N'The ever-famous Smiley Face balloon on the classic yellow background with three smooch kisses.', 12.9900, N't16862p.jpg', N'16862p.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (53, N'Smiley Face', N'A red heart-shaped balloon with a cartoon smiley face.', 12.9900, N't214154p.jpg', N'214154p.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (54, N'Soccer Shape', N'A soccer-shaped balloon great for any soccer fan.', 12.9900, N't28734.jpg', N'28734.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (55, N'Goal Ball', N'A round soccer balloon. Ideal for any sports fan, or an original way to celebrate an important Goal in that "oh so important" game.', 12.9900, N'ta1180401.jpg', N'a1180401.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (56, N'Wedding Doves', N'A white heart-shaped balloon with wedding wishes and intricate designs of doves in silver.', 12.9900, N't1368601.jpg', N'1368601.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (57, N'Crystal Rose Silver', N'A transparent heart-shaped balloon with silver roses. Perfect for a silver anniversary or a wedding with a silver theme.', 12.9900, N't38196.jpg', N'38196.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (58, N'Crystal Rose Gold', N'A transparent heart-shaped balloon with Gold roses. Perfect for a Golden anniversary or a wedding with a Gold theme.', 12.9900, N't38199.jpg', N'38199.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (59, N'Crystal Rose Red', N'A transparent heart-shaped balloon with red roses. Perfect for an anniversary or a wedding with a red theme.', 12.9900, N't38202.jpg', N'38202.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (60, N'Crystal Etched Hearts', N'A transparent heart-shaped balloon with silver hearts. Perfect for a silver anniversary or a wedding with a silver theme.', 12.9900, N't42014.jpg', N'42014.jpg', 0, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (61, N'Crystal Love Doves Silver', N'A transparent heart-shaped balloon with two love doves in silver.', 12.9900, N't42080.jpg', N'42080.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (62, N'Crystal Etched Hearts', N'A transparent heart-shaped balloon with red hearts.', 12.9900, N't42139.jpg', N'42139.jpg', 0, 0)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Thumbnail], [Image], [PromoFront], [PromoDept]) VALUES (63, N'Joanne''s birthday balloon', N'red star shaped with sparkles', 23.9900, N't35732.jpg', N'35732.jpg', 1, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[Orders]    Script Date: 03/23/2012 12:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateShipped] [smalldatetime] NULL,
	[Verified] [bit] NOT NULL,
	[Completed] [bit] NOT NULL,
	[Canceled] [bit] NOT NULL,
	[Comments] [nvarchar](1000) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerEmail] [nvarchar](50) NULL,
	[ShippingAddress] [nvarchar](500) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Orders] ON
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (1, CAST(0x9E3903F0 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (2, CAST(0x9E3A01A9 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (3, CAST(0x9E3A0206 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (4, CAST(0x9E3A02CF AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (5, CAST(0x9E3E01B3 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (6, CAST(0x9E3E01B5 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (7, CAST(0x9E3E01B9 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (8, CAST(0x9E3E02A6 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (9, CAST(0x9E3E02A8 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (10, CAST(0x9E3E02BB AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (11, CAST(0x9EAA03D5 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (12, CAST(0x9EAA03D7 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (13, CAST(0xA01503E6 AS SmallDateTime), CAST(0x9EE40202 AS SmallDateTime), 0, 0, 1, N'', N'', N'', N'')
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (14, CAST(0xA01D02F7 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (15, CAST(0xA01D02F7 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (16, CAST(0xA01D02F8 AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [DateCreated], [DateShipped], [Verified], [Completed], [Canceled], [Comments], [CustomerName], [CustomerEmail], [ShippingAddress]) VALUES (17, CAST(0xA01D02FB AS SmallDateTime), NULL, 0, 0, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
/****** Object:  StoredProcedure [dbo].[CatalogGetProductDetails]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetProductDetails]
(@ProductID INT)
AS
SELECT Name, Description, Price, Thumbnail, Image, PromoFront, PromoDept
FROM Product
WHERE ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductsOnFrontPromo]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetProductsOnFrontPromo]
(@DescriptionLength INT,
@PageNumber INT,
@ProductsPerPage INT,
@HowManyProducts INT OUTPUT)
AS

-- declare a new TABLE variable
DECLARE @Products TABLE
(RowNumber INT,
 ProductID INT,
 Name NVARCHAR(50),
 Description NVARCHAR(MAX),
 Price MONEY,
 Thumbnail NVARCHAR(50),
 Image NVARCHAR(50),
 PromoFront bit,
 PromoDept bit)


-- populate the table variable with the complete list of products
INSERT INTO @Products
SELECT ROW_NUMBER() OVER (ORDER BY Product.ProductID),
       ProductID, Name,
       CASE WHEN LEN(Description) <= @DescriptionLength THEN Description 
            ELSE SUBSTRING(Description, 1, @DescriptionLength) + '...' END 
       AS Description, Price, Thumbnail, Image, PromoFront, PromoDept
FROM Product
WHERE PromoFront = 1

-- return the total number of products using an OUTPUT variable
SELECT @HowManyProducts = COUNT(ProductID) FROM @Products

-- extract the requested page of products
SELECT ProductID, Name, Description, Price, Thumbnail,
       Image, PromoFront, PromoDept
FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
  AND RowNumber <= @PageNumber * @ProductsPerPage
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitCost] [money] NOT NULL,
	[Subtotal]  AS ([Quantity]*[UnitCost]),
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (1, 4, N'Today, Tomorrow & Forever', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (2, 1, N'I Love You (Simon Elvin)', 2, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (2, 5, N'Smiley Heart Red Balloon', 5, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (3, 1, N'I Love You (Simon Elvin)', 2, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (3, 24, N'Birthday Star Balloon', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (4, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (4, 2, N'Elvis Hunka Burning Love', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (4, 4, N'Today, Tomorrow & Forever', 2, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (4, 5, N'Smiley Heart Red Balloon', 2, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (5, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (5, 4, N'Today, Tomorrow & Forever', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (6, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (6, 24, N'Birthday Star Balloon', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (7, 2, N'Elvis Hunka Burning Love', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (7, 25, N'Tweety Stars', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (7, 40, N'Rugrats Tommy & Chucky', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (8, 14, N'Love Rose', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (8, 22, N'I''m Younger Than You', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (9, 4, N'Today, Tomorrow & Forever', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (10, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (10, 4, N'Today, Tomorrow & Forever', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (10, 10, N'I Can''t Get Enough of You Baby', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (11, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (12, 3, N'Funny Love', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (12, 57, N'Crystal Rose Silver', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (12, 58, N'Crystal Rose Gold', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (13, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (13, 23, N'Birthday Balloon', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (14, 2, N'Elvis Hunka Burning Love', 2, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (14, 5, N'Smiley Heart Red Balloon', 31, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (14, 63, N'Joanne''s birthday balloon', 1, 23.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (17, 1, N'I Love You (Simon Elvin)', 1, 12.4900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (17, 7, N'Smiley Kiss Red Balloon', 1, 12.9900)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [ProductName], [Quantity], [UnitCost]) VALUES (17, 10, N'I Can''t Get Enough of You Baby', 1, 12.9900)
/****** Object:  StoredProcedure [dbo].[OrderUpdate]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderUpdate]
(@OrderID INT,
 @DateCreated SMALLDATETIME,
 @DateShipped SMALLDATETIME = NULL,
 @Verified BIT,
 @Completed BIT,
 @Canceled BIT,
 @Comments VARCHAR(200),
 @CustomerName VARCHAR(50),
 @ShippingAddress VARCHAR(200),
 @CustomerEmail VARCHAR(50))
AS
UPDATE Orders
SET DateCreated=@DateCreated,
    DateShipped=@DateShipped,
    Verified=@Verified,
    Completed=@Completed,
    Canceled=@Canceled,
    Comments=@Comments,
    CustomerName=@CustomerName,
    ShippingAddress=@ShippingAddress,
    CustomerEmail=@CustomerEmail
WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetVerifiedUncompleted]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetVerifiedUncompleted]
AS
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
WHERE Verified=1 AND Completed=0
ORDER BY DateCreated DESC
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetUnverifiedUncanceled]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetUnverifiedUncanceled]
AS
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
WHERE Verified=0 AND Canceled=0
ORDER BY DateCreated DESC
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetByRecent]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetByRecent] 
(@Count smallINT)
AS
-- Set the number of rows to be returned
SET ROWCOUNT @Count
-- Get list of orders
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
ORDER BY DateCreated DESC
-- Reset rowcount value
SET ROWCOUNT 0
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetByDate]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetByDate] 
(@StartDate SMALLDATETIME,
 @EndDate SMALLDATETIME)
AS
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
WHERE DateCreated BETWEEN @StartDate AND @EndDate
ORDER BY DateCreated DESC
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartID] [char](36) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Attributes] [nvarchar](1000) NULL,
	[DateAdded] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ShoppingCart] ([CartID], [ProductID], [Quantity], [Attributes], [DateAdded]) VALUES (N'a6ac31fb-ef2a-4e38-b3c1-7904d5d6a7c9', 5, 1, N'attributes', CAST(0xA01503E7 AS SmallDateTime))
/****** Object:  StoredProcedure [dbo].[SearchWord]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchWord] (@Word NVARCHAR(50))
AS

SET @Word = 'FORMSOF(INFLECTIONAL, "' + @Word + '")'

SELECT COALESCE(NameResults.[KEY], DescriptionResults.[KEY]) AS [KEY],
       ISNULL(NameResults.Rank, 0) * 3 + 
       ISNULL(DescriptionResults.Rank, 0) AS Rank 
FROM 
  CONTAINSTABLE(Product, Name, @Word, 
                LANGUAGE 'English') AS NameResults
  FULL OUTER JOIN
  CONTAINSTABLE(Product, Description, @Word, 
                LANGUAGE 'English') AS DescriptionResults
  ON NameResults.[KEY] = DescriptionResults.[KEY]
GO
/****** Object:  StoredProcedure [dbo].[OrderMarkVerified]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderMarkVerified]
(@OrderID INT)
AS
UPDATE Orders
SET Verified = 1
WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[OrderMarkCompleted]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderMarkCompleted]
(@OrderID INT)
AS
UPDATE Orders
SET Completed = 1,
    DateShipped = GETDATE()
WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[OrderMarkCanceled]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderMarkCanceled]
(@OrderID INT)
AS
UPDATE Orders
SET Canceled = 1
WHERE OrderID = @OrderID
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Category_1] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (1, 1, N'SAMSUNG', N'')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (2, 1, N'LG', N'')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (3, 1, N'HTC', N'')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (4, 1, N'SONY', N'')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (5, 2, N'iPhone', N'')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (6, 1, N'etc', N'')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (7, 3, N'MICROSOFT', N'')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (8, 3, N'etc', N'')
INSERT [dbo].[Category] ([CategoryID], [DepartmentID], [Name], [Description]) VALUES (9, 4, N'BLACKBERRY', N'')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  StoredProcedure [dbo].[CatalogUpdateProduct]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogUpdateProduct]
(@ProductID INT,
 @ProductName VARCHAR(50),
 @ProductDescription VARCHAR(5000),
 @Price MONEY,
 @Thumbnail VARCHAR(50),
 @Image VARCHAR(50),
 @PromoFront BIT,
 @PromoDept BIT)
AS
UPDATE Product
SET Name = @ProductName,
    Description = @ProductDescription,
    Price = @Price,
    Thumbnail = @Thumbnail,
    Image = @Image,
    PromoFront = @PromoFront,
    PromoDept = @PromoDept
WHERE ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[CatalogUpdateDepartment]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogUpdateDepartment]
(@DepartmentID int,
@DepartmentName nvarchar(50),
@DepartmentDescription nvarchar(1000))
AS
UPDATE Department
SET Name = @DepartmentName, Description = @DepartmentDescription
WHERE DepartmentID = @DepartmentID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetDepartments]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetDepartments] AS
SELECT DepartmentID, Name, Description
FROM Department
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetDepartmentDetails]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetDepartmentDetails]
(@DepartmentID INT)
AS
SELECT Name, Description
FROM Department
WHERE DepartmentID = @DepartmentID
GO
/****** Object:  StoredProcedure [dbo].[CatalogDeleteDepartment]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogDeleteDepartment]
(@DepartmentID int)
AS
DELETE FROM Department
WHERE DepartmentID = @DepartmentID
GO
/****** Object:  StoredProcedure [dbo].[CatalogAddDepartment]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogAddDepartment]
(@DepartmentName nvarchar(50),
@DepartmentDescription nvarchar(1000))
AS
INSERT INTO Department (Name, Description)
VALUES (@DepartmentName, @DepartmentDescription)
GO
/****** Object:  Table [dbo].[AttributeValue]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributeValue](
	[AttributeValueID] [int] IDENTITY(1,1) NOT NULL,
	[AttributeID] [int] NOT NULL,
	[Value] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AttributeValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AttributeValue] ON
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (1, 1, N'White')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (2, 1, N'Black')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (3, 1, N'Red')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (4, 1, N'Orange')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (5, 1, N'Yellow')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (6, 1, N'Green')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (7, 1, N'Blue')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (8, 1, N'Indigo')
INSERT [dbo].[AttributeValue] ([AttributeValueID], [AttributeID], [Value]) VALUES (9, 1, N'Purple')
SET IDENTITY_INSERT [dbo].[AttributeValue] OFF
/****** Object:  StoredProcedure [dbo].[CatalogCreateCategory]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogCreateCategory]
(@DepartmentID int,
@CategoryName nvarchar(50),
@CategoryDescription nvarchar(50))
AS
INSERT INTO Category (DepartmentID, Name, Description)
VALUES (@DepartmentID, @CategoryName, @CategoryDescription)
GO
/****** Object:  StoredProcedure [dbo].[CatalogDeleteCategory]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogDeleteCategory]
(@CategoryID int)
AS
DELETE FROM Category
WHERE CategoryID = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetCategoriesInDepartment]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--missing procedures from 05-07


CREATE PROCEDURE [dbo].[CatalogGetCategoriesInDepartment]
(@DepartmentID INT)
AS
SELECT CategoryID, Name, Description
FROM Category
WHERE DepartmentID = @DepartmentID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetCategoryDetails]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetCategoryDetails]
(@CategoryID INT)
AS
SELECT DepartmentID, Name, Description
FROM Category
WHERE CategoryID = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOrder] 
(@CartID char(36))
AS
/* Insert a new record INTo Orders */
DECLARE @OrderID INT
INSERT INTO Orders DEFAULT VALUES
/* Save the new Order ID */
SET @OrderID = @@IDENTITY
/* Add the order details to OrderDetail */
INSERT INTO OrderDetail 
     (OrderID, ProductID, ProductName, Quantity, UnitCost)
SELECT 
     @OrderID, Product.ProductID, Product.Name, 
     ShoppingCart.Quantity, Product.Price
FROM Product JOIN ShoppingCart
ON Product.ProductID = ShoppingCart.ProductID
WHERE ShoppingCart.CartID = @CartID
/* Clear the shopping cart */
DELETE FROM ShoppingCart
WHERE CartID = @CartID
/* Return the Order ID */
SELECT @OrderID
GO
/****** Object:  StoredProcedure [dbo].[CatalogUpdateCategory]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogUpdateCategory]
(@CategoryID int,
@CategoryName nvarchar(50),
@CategoryDescription nvarchar(1000))
AS
UPDATE Category
SET Name = @CategoryName, Description = @CategoryDescription
WHERE CategoryID = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[OrderGetInfo]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderGetInfo]
(@OrderID INT)
AS
SELECT OrderID, 
      (SELECT ISNULL(SUM(Subtotal), 0) FROM OrderDetail WHERE OrderID = @OrderID)        
       AS TotalAmount, 
       DateCreated, 
       DateShipped, 
       Verified, 
       Completed, 
       Canceled, 
       Comments, 
       CustomerName, 
       ShippingAddress, 
       CustomerEmail
FROM Orders
WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[OrderGetDetails]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderGetDetails]
(@OrderID INT)
AS
SELECT Orders.OrderID, 
       ProductID, 
       ProductName, 
       Quantity, 
       UnitCost, 
       Subtotal
FROM OrderDetail JOIN Orders
ON Orders.OrderID = OrderDetail.OrderID
WHERE Orders.OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[SearchCatalog]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchCatalog] 
(@DescriptionLength INT,
 @PageNumber TINYINT,
 @ProductsPerPage TINYINT,
 @HowManyResults INT OUTPUT,
 @AllWords BIT,
 @Word1 NVARCHAR(15) = NULL,
 @Word2 NVARCHAR(15) = NULL,
 @Word3 NVARCHAR(15) = NULL,
 @Word4 NVARCHAR(15) = NULL,
 @Word5 NVARCHAR(15) = NULL)
AS

/* @NecessaryMatches needs to be 1 for any-word searches and
   the number of words for all-words searches */
DECLARE @NecessaryMatches INT
SET @NecessaryMatches = 1
IF @AllWords = 1 
  SET @NecessaryMatches =
    CASE WHEN @Word1 IS NULL THEN 0 ELSE 1 END + 
    CASE WHEN @Word2 IS NULL THEN 0 ELSE 1 END + 
    CASE WHEN @Word3 IS NULL THEN 0 ELSE 1 END +
    CASE WHEN @Word4 IS NULL THEN 0 ELSE 1 END +
    CASE WHEN @Word5 IS NULL THEN 0 ELSE 1 END;

/* Create the table variable that will contain the search results */
DECLARE @Matches TABLE
([Key] INT NOT NULL,
 Rank INT NOT NULL)

-- Save matches for the first word
IF @Word1 IS NOT NULL
  INSERT INTO @Matches
  EXEC SearchWord @Word1

-- Save the matches for the second word
IF @Word2 IS NOT NULL
  INSERT INTO @Matches
  EXEC SearchWord @Word2

-- Save the matches for the third word
IF @Word3 IS NOT NULL
  INSERT INTO @Matches
  EXEC SearchWord @Word3

-- Save the matches for the fourth word
IF @Word4 IS NOT NULL
  INSERT INTO @Matches
  EXEC SearchWord @Word4

-- Save the matches for the fifth word
IF @Word5 IS NOT NULL
  INSERT INTO @Matches
  EXEC SearchWord @Word5

-- Calculate the IDs of the matching products
DECLARE @Results TABLE
(RowNumber INT,
 [KEY] INT NOT NULL,
 Rank INT NOT NULL)

-- Obtain the matching products 
INSERT INTO @Results
SELECT ROW_NUMBER() OVER (ORDER BY COUNT(M.Rank) DESC),
       M.[KEY], SUM(M.Rank) AS TotalRank
FROM @Matches M
GROUP BY M.[KEY]
HAVING COUNT(M.Rank) >= @NecessaryMatches

-- return the total number of results using an OUTPUT variable
SELECT @HowManyResults = COUNT(*) FROM @Results

-- populate the table variable with the complete list of products
SELECT Product.ProductID, Name,
       CASE WHEN LEN(Description) <= @DescriptionLength THEN Description 
            ELSE SUBSTRING(Description, 1, @DescriptionLength) + '...' END 
       AS Description, Price, Thumbnail, Image, PromoFront, PromoDept 
FROM Product 
INNER JOIN @Results R
ON Product.ProductID = R.[KEY]
WHERE R.RowNumber > (@PageNumber - 1) * @ProductsPerPage
  AND R.RowNumber <= @PageNumber * @ProductsPerPage
ORDER BY R.Rank DESC
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (1, 1)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (2, 1)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (3, 1)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (4, 1)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (5, 1)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (6, 1)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (7, 3)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (8, 3)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (9, 3)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (10, 3)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (11, 5)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (12, 5)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (13, 5)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (14, 5)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (15, 5)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (16, 2)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (17, 2)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (18, 2)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (19, 2)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (20, 4)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (21, 4)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (21, 4)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (21, 4)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (22, 4)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (22, 4)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (23, 4)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (23, 4)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (24, 4)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (25, 9)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (26, 9)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (26, 9)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (28, 9)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (28, 9)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (28, 9)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (29, 9)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (30, 7)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (30, 7)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (31, 7)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (32, 7)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (33, 7)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (34, 7)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (35, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (36, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (37, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (37, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (38, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (38, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (39, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (40, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (41, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (42, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (43, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (44, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (45, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (46, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (47, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (48, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (49, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (50, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (51, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (52, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (53, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (53, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (54, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (54, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (55, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (55, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (56, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (57, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (57, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (57, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (58, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (58, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (58, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (59, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (59, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (59, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (60, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (60, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (60, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (61, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (61, 6)
GO
print 'Processed 100 total records'
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (62, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (62, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (63, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (63, 6)
INSERT [dbo].[ProductCategory] ([ProductID], [CategoryID]) VALUES (63, 6)
/****** Object:  Table [dbo].[ProductAttributeValue]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttributeValue](
	[ProductID] [int] NOT NULL,
	[AttributeValueID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[AttributeValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (1, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (1, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (1, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (1, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (1, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (1, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (1, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (1, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (1, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (2, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (2, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (2, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (2, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (2, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (2, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (2, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (2, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (2, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (3, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (3, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (3, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (3, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (3, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (3, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (3, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (3, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (3, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (4, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (4, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (4, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (4, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (4, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (4, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (4, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (4, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (4, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (5, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (5, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (5, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (5, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (5, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (5, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (5, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (5, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (5, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (6, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (6, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (6, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (6, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (6, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (6, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (6, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (6, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (6, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (7, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (7, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (7, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (7, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (7, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (7, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (7, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (7, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (7, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (8, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (8, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (8, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (8, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (8, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (8, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (8, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (8, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (8, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (9, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (9, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (9, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (9, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (9, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (9, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (9, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (9, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (9, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (10, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (10, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (10, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (10, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (10, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (10, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (10, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (10, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (10, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (11, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (11, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (11, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (11, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (11, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (11, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (11, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (11, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (11, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (12, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (12, 2)
GO
print 'Processed 100 total records'
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (12, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (12, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (12, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (12, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (12, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (12, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (12, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (13, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (13, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (13, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (13, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (13, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (13, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (13, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (13, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (13, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (14, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (14, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (14, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (14, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (14, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (14, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (14, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (14, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (14, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (15, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (15, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (15, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (15, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (15, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (15, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (15, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (15, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (15, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (16, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (16, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (16, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (16, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (16, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (16, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (16, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (16, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (16, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (17, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (17, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (17, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (17, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (17, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (17, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (17, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (17, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (17, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (18, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (18, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (18, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (18, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (18, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (18, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (18, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (18, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (18, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (19, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (19, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (19, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (19, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (19, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (19, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (19, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (19, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (19, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (20, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (20, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (20, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (20, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (20, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (20, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (20, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (20, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (20, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (21, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (21, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (21, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (21, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (21, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (21, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (21, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (21, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (21, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (22, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (22, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (22, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (22, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (22, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (22, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (22, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (22, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (22, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (23, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (23, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (23, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (23, 4)
GO
print 'Processed 200 total records'
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (23, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (23, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (23, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (23, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (23, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (24, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (24, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (24, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (24, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (24, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (24, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (24, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (24, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (24, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (25, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (25, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (25, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (25, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (25, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (25, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (25, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (25, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (25, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (26, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (26, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (26, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (26, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (26, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (26, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (26, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (26, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (26, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (27, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (27, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (27, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (27, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (27, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (27, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (27, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (27, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (27, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (28, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (28, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (28, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (28, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (28, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (28, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (28, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (28, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (28, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (29, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (29, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (29, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (29, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (29, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (29, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (29, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (29, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (29, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (30, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (30, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (30, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (30, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (30, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (30, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (30, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (30, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (30, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (31, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (31, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (31, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (31, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (31, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (31, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (31, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (31, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (31, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (32, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (32, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (32, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (32, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (32, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (32, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (32, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (32, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (32, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (33, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (33, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (33, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (33, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (33, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (33, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (33, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (33, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (33, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (34, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (34, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (34, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (34, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (34, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (34, 6)
GO
print 'Processed 300 total records'
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (34, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (34, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (34, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (35, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (35, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (35, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (35, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (35, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (35, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (35, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (35, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (35, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (36, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (36, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (36, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (36, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (36, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (36, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (36, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (36, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (36, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (37, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (37, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (37, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (37, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (37, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (37, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (37, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (37, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (37, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (38, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (38, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (38, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (38, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (38, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (38, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (38, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (38, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (38, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (39, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (39, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (39, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (39, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (39, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (39, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (39, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (39, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (39, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (40, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (40, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (40, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (40, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (40, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (40, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (40, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (40, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (40, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (41, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (41, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (41, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (41, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (41, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (41, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (41, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (41, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (41, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (42, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (42, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (42, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (42, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (42, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (42, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (42, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (42, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (42, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (43, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (43, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (43, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (43, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (43, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (43, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (43, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (43, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (43, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (44, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (44, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (44, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (44, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (44, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (44, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (44, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (44, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (44, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (45, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (45, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (45, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (45, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (45, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (45, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (45, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (45, 8)
GO
print 'Processed 400 total records'
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (45, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (46, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (46, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (46, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (46, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (46, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (46, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (46, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (46, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (46, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (47, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (47, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (47, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (47, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (47, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (47, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (47, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (47, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (47, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (48, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (48, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (48, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (48, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (48, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (48, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (48, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (48, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (48, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (49, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (49, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (49, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (49, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (49, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (49, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (49, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (49, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (49, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (50, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (50, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (50, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (50, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (50, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (50, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (50, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (50, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (50, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (51, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (51, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (51, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (51, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (51, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (51, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (51, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (51, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (51, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (52, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (52, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (52, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (52, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (52, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (52, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (52, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (52, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (52, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (53, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (53, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (53, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (53, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (53, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (53, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (53, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (53, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (53, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (54, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (54, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (54, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (54, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (54, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (54, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (54, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (54, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (54, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (55, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (55, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (55, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (55, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (55, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (55, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (55, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (55, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (55, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (56, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (56, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (56, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (56, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (56, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (56, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (56, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (56, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (56, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (57, 1)
GO
print 'Processed 500 total records'
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (57, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (57, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (57, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (57, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (57, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (57, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (57, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (57, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (58, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (58, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (58, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (58, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (58, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (58, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (58, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (58, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (58, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (59, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (59, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (59, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (59, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (59, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (59, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (59, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (59, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (59, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (60, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (60, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (60, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (60, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (60, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (60, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (60, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (60, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (60, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (61, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (61, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (61, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (61, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (61, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (61, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (61, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (61, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (61, 9)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (62, 1)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (62, 2)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (62, 3)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (62, 4)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (62, 5)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (62, 6)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (62, 7)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (62, 8)
INSERT [dbo].[ProductAttributeValue] ([ProductID], [AttributeValueID]) VALUES (62, 9)
/****** Object:  StoredProcedure [dbo].[ShoppingCartRemoveItem]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartRemoveItem]
(@CartID char(36),
 @ProductID int)
AS
DELETE FROM ShoppingCart
WHERE CartID = @CartID and ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartGetTotalAmount]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartGetTotalAmount]
(@CartID char(36))
AS
SELECT ISNULL(SUM(Product.Price * ShoppingCart.Quantity), 0)
FROM ShoppingCart INNER JOIN Product
ON ShoppingCart.ProductID = Product.ProductID
WHERE ShoppingCart.CartID = @CartID
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartGetItems]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartGetItems]
(@CartID char(36))
AS
SELECT Product.ProductID, Product.Name, ShoppingCart.Attributes, Product.Price, ShoppingCart.Quantity,Product.Price * ShoppingCart.Quantity AS Subtotal
FROM ShoppingCart INNER JOIN Product
ON ShoppingCart.ProductID = Product.ProductID
WHERE ShoppingCart.CartID = @CartID
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartDeleteOldCarts]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartDeleteOldCarts]
(@Days smallint)
AS
DELETE FROM ShoppingCart
WHERE CartID IN
(SELECT CartID
FROM ShoppingCart
GROUP BY CartID
HAVING MIN(DATEDIFF(dd,DateAdded,GETDATE())) >= @Days)
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartCountOldCarts]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartCountOldCarts]
(@Days smallint)
AS
SELECT COUNT(CartID)
FROM ShoppingCart
WHERE CartID IN
(SELECT CartID
FROM ShoppingCart
GROUP BY CartID
HAVING MIN(DATEDIFF(dd,DateAdded,GETDATE())) >= @Days)
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartAddItem]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ShoppingCartAddItem]
(@CartID char(36),
 @ProductID int,
 @Attributes nvarchar(1000))
AS
IF EXISTS
        (SELECT CartID
         FROM ShoppingCart
         WHERE ProductID = @ProductID AND CartID = @CartID)
    UPDATE ShoppingCart
    SET Quantity = Quantity + 1
    WHERE ProductID = @ProductID AND CartID = @CartID
ELSE
    IF EXISTS (SELECT Name FROM Product WHERE ProductID=@ProductID)
        INSERT INTO ShoppingCart (CartID, ProductID, Attributes, Quantity, DateAdded)
        VALUES (@CartID, @ProductID, @Attributes, 1, GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[GetShoppingCartRecommendations]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetShoppingCartRecommendations]
(@CartID CHAR(36),
 @DescriptionLength INT)
AS
--- Returns the product recommendations
SELECT ProductID,
       Name,
       SUBSTRING(Description, 1, @DescriptionLength) + '...' AS Description
FROM Product
WHERE ProductID IN
   (
   -- Returns the products that exist in a list of orders
   SELECT TOP 5 od1.ProductID AS Rank
   FROM OrderDetail od1 
     JOIN OrderDetail od2
       ON od1.OrderID=od2.OrderID
     JOIN ShoppingCart sp
       ON od2.ProductID = sp.ProductID
   WHERE sp.CartID = @CartID
        -- Must not include products that already exist in the visitor''s cart
      AND od1.ProductID NOT IN
      (
      -- Returns the products in the specified shopping cart
      SELECT ProductID 
      FROM ShoppingCart
      WHERE CartID = @CartID
      )
   -- Group the ProductID so we can calculate the rank
   GROUP BY od1.ProductID
   -- Order descending by rank
   ORDER BY COUNT(od1.ProductID) DESC
   )
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductRecommendations]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CatalogGetProductRecommendations]
(@ProductID INT,
@DescriptionLength INT)
AS
SELECT ProductID,
Name,
CASE WHEN LEN(Description) <= @DescriptionLength THEN Description
ELSE SUBSTRING(Description, 1, @DescriptionLength) + '...' END
AS Description
FROM Product
WHERE ProductID IN
(
SELECT TOP 5 od2.ProductID
FROM OrderDetail od1
JOIN OrderDetail od2 ON od1.OrderID = od2.OrderID
WHERE od1.ProductID = @ProductID AND od2.ProductID != @ProductID
GROUP BY od2.ProductID
ORDER BY COUNT(od2.ProductID) DESC
)
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartUpdateItem]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ShoppingCartUpdateItem]
(@CartID char(36),
 @ProductID int,
 @Quantity int)
AS
IF @Quantity <= 0
  EXEC ShoppingCartRemoveItem @CartID, @ProductID
ELSE
  UPDATE ShoppingCart
  SET Quantity = @Quantity, DateAdded = GETDATE()
  WHERE ProductID = @ProductID AND CartID = @CartID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductsOnDeptPromo]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetProductsOnDeptPromo]
(@DepartmentID INT,
@DescriptionLength INT,
@PageNumber INT,
@ProductsPerPage INT,
@HowManyProducts INT OUTPUT)
AS

-- declare a new TABLE variable
DECLARE @Products TABLE
(RowNumber INT,
 ProductID INT,
 Name NVARCHAR(50),
 Description NVARCHAR(MAX),
 Price MONEY,
 Thumbnail NVARCHAR(50),
 Image NVARCHAR(50),
 PromoFront bit,
 PromoDept bit)

-- populate the table variable with the complete list of products
INSERT INTO @Products
SELECT ROW_NUMBER() OVER (ORDER BY ProductID) AS Row,
       ProductID, Name, SUBSTRING(Description, 1, @DescriptionLength)
+ '...' AS Description,
       Price, Thumbnail, Image, PromoFront, PromoDept
FROM
(SELECT DISTINCT Product.ProductID, Product.Name,
       CASE WHEN LEN(Product.Description) <= @DescriptionLength 
            THEN Product.Description 
            ELSE SUBSTRING(Product.Description, 1, @DescriptionLength) + '...' END 
       AS Description, Price, Thumbnail, Image, PromoFront, PromoDept 
  FROM Product INNER JOIN ProductCategory
                      ON Product.ProductID = ProductCategory.ProductID
              INNER JOIN Category
                      ON ProductCategory.CategoryID = Category.CategoryID
  WHERE Product.PromoDept = 1
   AND Category.DepartmentID = @DepartmentID
) AS ProductOnDepPr

-- return the total number of products using an OUTPUT variable
SELECT @HowManyProducts = COUNT(ProductID) FROM @Products

-- extract the requested page of products
SELECT ProductID, Name, Description, Price, Thumbnail,
       Image, PromoFront, PromoDept
FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
  AND RowNumber <= @PageNumber * @ProductsPerPage
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductsInCategory]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetProductsInCategory]
(@CategoryID INT,
@DescriptionLength INT,
@PageNumber INT,
@ProductsPerPage INT,
@HowManyProducts INT OUTPUT)
AS

-- declare a new TABLE variable
DECLARE @Products TABLE
(RowNumber INT,
 ProductID INT,
 Name NVARCHAR(50),
 Description NVARCHAR(MAX),
 Price MONEY,
 Thumbnail NVARCHAR(50),
 Image NVARCHAR(50),
 PromoFront bit,
 PromoDept bit)


-- populate the table variable with the complete list of products
INSERT INTO @Products
SELECT ROW_NUMBER() OVER (ORDER BY Product.ProductID),
       Product.ProductID, Name,
       CASE WHEN LEN(Description) <= @DescriptionLength THEN Description 
            ELSE SUBSTRING(Description, 1, @DescriptionLength) + '...' END 
       AS Description, Price, Thumbnail, Image, PromoFront, PromoDept 
FROM Product INNER JOIN ProductCategory
  ON Product.ProductID = ProductCategory.ProductID
WHERE ProductCategory.CategoryID = @CategoryID

-- return the total number of products using an OUTPUT variable
SELECT @HowManyProducts = COUNT(ProductID) FROM @Products

-- extract the requested page of products
SELECT ProductID, Name, Description, Price, Thumbnail,
       Image, PromoFront, PromoDept
FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
  AND RowNumber <= @PageNumber * @ProductsPerPage
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetProductAttributeValues]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create CatalogGetProductAttributeValues stored procedure
CREATE PROCEDURE [dbo].[CatalogGetProductAttributeValues]
(@ProductId INT)
AS
SELECT a.Name AS AttributeName,
       av.AttributeValueID, 
       av.Value AS AttributeValue
FROM AttributeValue av
INNER JOIN attribute a ON av.AttributeID = a.AttributeID
WHERE av.AttributeValueID IN
  (SELECT AttributeValueID
   FROM ProductAttributeValue
   WHERE ProductID = @ProductID)
ORDER BY a.Name;
GO
/****** Object:  View [dbo].[ProdsInCats]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProdsInCats]
AS
SELECT dbo.Product.ProductID, dbo.Product.Name, dbo.Product.Description, dbo.Product.Price, dbo.Product.Thumbnail, dbo.ProductCategory.CategoryID
FROM   dbo.Product INNER JOIN
            dbo.ProductCategory ON dbo.Product.ProductID = dbo.ProductCategory.ProductID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Product"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 156
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "ProductCategory"
            Begin Extent = 
               Top = 9
               Left = 307
               Bottom = 114
               Right = 500
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProdsInCats'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProdsInCats'
GO
/****** Object:  StoredProcedure [dbo].[CatalogRemoveProductFromCategory]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogRemoveProductFromCategory]
(@ProductID int, @CategoryID int)
AS
DELETE FROM ProductCategory
WHERE CategoryID = @CategoryID AND ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[CatalogMoveProductToCategory]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogMoveProductToCategory]
(@ProductID int, @OldCategoryID int, @NewCategoryID int)
AS
UPDATE ProductCategory
SET CategoryID = @NewCategoryID
WHERE CategoryID = @OldCategoryID
  AND ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetCategoriesWithProduct]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetCategoriesWithProduct]
(@ProductID int)
AS
SELECT Category.CategoryID, Name
FROM Category INNER JOIN ProductCategory
ON Category.CategoryID = ProductCategory.CategoryID
WHERE ProductCategory.ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetCategoriesWithoutProduct]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetCategoriesWithoutProduct]
(@ProductID int)
AS
SELECT CategoryID, Name
FROM Category
WHERE CategoryID NOT IN
   (SELECT Category.CategoryID
    FROM Category INNER JOIN ProductCategory
    ON Category.CategoryID = ProductCategory.CategoryID
    WHERE ProductCategory.ProductID = @ProductID)
GO
/****** Object:  StoredProcedure [dbo].[CatalogGetAllProductsInCategory]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogGetAllProductsInCategory]
(@CategoryID INT)
AS
SELECT Product.ProductID, Name, Description, Price, Thumbnail, 
       Image, PromoDept, PromoFront
FROM Product INNER JOIN ProductCategory
  ON Product.ProductID = ProductCategory.ProductID
WHERE ProductCategory.CategoryID = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[CatalogDeleteProduct]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogDeleteProduct]
(@ProductID int)
AS
DELETE FROM ShoppingCart WHERE ProductID=@ProductID
DELETE FROM ProductCategory WHERE ProductID=@ProductID
DELETE FROM Product where ProductID=@ProductID
GO
/****** Object:  StoredProcedure [dbo].[CatalogCreateProduct]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogCreateProduct]
(@CategoryID INT,
 @ProductName NVARCHAR(50),
 @ProductDescription NVARCHAR(MAX),
 @Price MONEY,
 @Thumbnail NVARCHAR(50),
 @Image NVARCHAR(50),
 @PromoFront BIT,
 @PromoDept BIT)
AS
-- Declare a variable to hold the generated product ID
DECLARE @ProductID int
-- Create the new product entry

INSERT INTO Product 
    (Name, 
     Description, 
     Price, 
     Thumbnail, 
     Image,
     PromoFront, 
     PromoDept)
VALUES 
    (@ProductName, 
     @ProductDescription, 
     @Price, 
     @Thumbnail, 
     @Image,
     @PromoFront, 
     @PromoDept)
-- Save the generated product ID to a variable
SELECT @ProductID = @@Identity
-- Associate the product with a category
INSERT INTO ProductCategory (ProductID, CategoryID)
VALUES (@ProductID, @CategoryID)
GO
/****** Object:  StoredProcedure [dbo].[CatalogAssignProductToCategory]    Script Date: 03/23/2012 12:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogAssignProductToCategory]
(@ProductID int, @CategoryID int)
AS
INSERT INTO ProductCategory (ProductID, CategoryID)
VALUES (@ProductID, @CategoryID)
GO
/****** Object:  Default [DF_Orders_DateCreated]    Script Date: 03/23/2012 12:51:38 ******/
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Orders_Verified]    Script Date: 03/23/2012 12:51:38 ******/
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Verified]  DEFAULT ((0)) FOR [Verified]
GO
/****** Object:  Default [DF_Orders_Completed]    Script Date: 03/23/2012 12:51:38 ******/
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Completed]  DEFAULT ((0)) FOR [Completed]
GO
/****** Object:  Default [DF_Orders_Canceled]    Script Date: 03/23/2012 12:51:38 ******/
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Canceled]  DEFAULT ((0)) FOR [Canceled]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Orders]    Script Date: 03/23/2012 12:51:39 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
/****** Object:  ForeignKey [FK_ShoppingCart_Product]    Script Date: 03/23/2012 12:51:39 ******/
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Product]
GO
/****** Object:  ForeignKey [FK_Category_Department]    Script Date: 03/23/2012 12:51:39 ******/
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Department]
GO
/****** Object:  ForeignKey [FK_AttributeValue_Attribute]    Script Date: 03/23/2012 12:51:39 ******/
ALTER TABLE [dbo].[AttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_AttributeValue_Attribute] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Attribute] ([AttributeID])
GO
ALTER TABLE [dbo].[AttributeValue] CHECK CONSTRAINT [FK_AttributeValue_Attribute]
GO
/****** Object:  ForeignKey [FK_ProductCategory_Category]    Script Date: 03/23/2012 12:51:39 ******/
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Category]
GO
/****** Object:  ForeignKey [FK_ProductCategory_Product]    Script Date: 03/23/2012 12:51:39 ******/
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Product]
GO
/****** Object:  ForeignKey [FK_ProductAttributeValue_AttributeValue]    Script Date: 03/23/2012 12:51:39 ******/
ALTER TABLE [dbo].[ProductAttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributeValue_AttributeValue] FOREIGN KEY([AttributeValueID])
REFERENCES [dbo].[AttributeValue] ([AttributeValueID])
GO
ALTER TABLE [dbo].[ProductAttributeValue] CHECK CONSTRAINT [FK_ProductAttributeValue_AttributeValue]
GO
/****** Object:  ForeignKey [FK_ProductAttributeValue_Product]    Script Date: 03/23/2012 12:51:39 ******/
ALTER TABLE [dbo].[ProductAttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributeValue_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductAttributeValue] CHECK CONSTRAINT [FK_ProductAttributeValue_Product]
GO
