USE [master]
GO
/****** Object:  Database [MusicWebsite]    Script Date: 5/6/2017 3:30:05 PM ******/
CREATE DATABASE [MusicWebsite]
GO
USE [MusicWebsite]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/6/2017 3:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](100) NULL,
	[AccountId] [int] NULL,
	[SongId] [int] NULL,
	[TimeStam] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Musician]    Script Date: 5/6/2017 3:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musician](
	[MusicianId] [int] IDENTITY(1,1) NOT NULL,
	[MusicianName] [nvarchar](50) NULL,
	[Info] [nvarchar](250) NULL,
 CONSTRAINT [PK_Musician] PRIMARY KEY CLUSTERED 
(
	[MusicianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentInfo]    Script Date: 5/6/2017 3:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentInfo](
	[PaymentInfoId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[AccountHolder] [varchar](50) NULL,
	[AddressLine1] [nvarchar](100) NULL,
	[AddressLine2] [nvarchar](100) NULL,
	[AddressZip] [varchar](10) NULL,
	[AddressCountry] [nvarchar](50) NULL,
	[CardNumber] [varchar](25) NULL,
	[CvvCode] [varchar](3) NULL,
	[ExpirationDate] [date] NULL,
 CONSTRAINT [PK_PaymentInfo] PRIMARY KEY CLUSTERED 
(
	[PaymentInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Singer]    Script Date: 5/6/2017 3:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Singer](
	[SingerId] [int] IDENTITY(1,1) NOT NULL,
	[SingerName] [nvarchar](50) NULL,
	[SingerInfo] [nvarchar](250) NULL,
 CONSTRAINT [PK_Singer] PRIMARY KEY CLUSTERED 
(
	[SingerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Song]    Script Date: 5/6/2017 3:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Song](
	[SongId] [int] IDENTITY(1,1) NOT NULL,
	[SongName] [nvarchar](50) NULL,
	[SingerId] [int] NULL,
	[MusicianId] [int] NULL,
	[Price] [money] NULL,
	[Link] [varchar](50) NULL,
	[UploaderId] [int] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Song] PRIMARY KEY CLUSTERED 
(
	[SongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 5/6/2017 3:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NULL,
	[SongId] [int] NULL,
	[PaymentInfoId] [int] NULL,
	[PayAmount] [money] NULL,
	[TimeStam] [datetime] NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/6/2017 3:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[AccountId] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[AccountName] [nvarchar](50) NULL,
	[Admin] [bit] NULL,
	[Status] [tinyint] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Musician] ON 

INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (1, N'L.v Beethoven', NULL)
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (2, N'J.S Bach', NULL)
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (3, N'J. Pachelbel', NULL)
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (4, N'A. Vivaldi', NULL)
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (5, N'G.F Handel', NULL)
SET IDENTITY_INSERT [dbo].[Musician] OFF
SET IDENTITY_INSERT [dbo].[Singer] ON 

INSERT [dbo].[Singer] ([SingerId], [SingerName], [SingerInfo]) VALUES (1, N'Virus', NULL)
SET IDENTITY_INSERT [dbo].[Singer] OFF
SET IDENTITY_INSERT [dbo].[Song] ON 

INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (1, N'Virus', 1, 1, 50000.0000, NULL, NULL, 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (2, N'Moonlight Sonata', NULL, 1, 75000.0000, NULL, NULL, 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (3, N'No.9 Sonata Seg.2nd', NULL, 2, 0.0000, NULL, NULL, 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (4, N'Cannon in D', NULL, 3, 0.0000, NULL, NULL, 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (5, N'The Four Seasons', NULL, 4, 25000.0000, NULL, NULL, 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (6, N'St. John''s Passion', NULL, 2, 0.0000, NULL, NULL, 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (7, N'Water Music', NULL, 5, 50000.0000, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Song] OFF
INSERT [dbo].[User] ([AccountId], [Password], [AccountName], [Admin], [Status], [DeleteFlag]) VALUES (N'admin', N'admin', N'Admin', 1, 0, 0)
ALTER TABLE [dbo].[Song]  WITH CHECK ADD FOREIGN KEY([MusicianId])
REFERENCES [dbo].[Musician] ([MusicianId])
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK__Purchase__SongId__1FCDBCEB] FOREIGN KEY([SongId])
REFERENCES [dbo].[Song] ([SongId])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK__Purchase__SongId__1FCDBCEB]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK__Purchase__UserId__3F466844] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([AccountId])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK__Purchase__UserId__3F466844]
GO
/****** Object:  StoredProcedure [dbo].[SP_PURCHASE_GETALL]    Script Date: 5/6/2017 3:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PURCHASE_GETALL]
AS
SELECT * FROM Purchase 
GO
/****** Object:  StoredProcedure [dbo].[SP_SONG_GETALL]    Script Date: 5/6/2017 3:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SONG_GETALL]
AS
SELECT * FROM SONG S
LEFT JOIN Musician M ON S.MusicianId = M.MusicianId
LEFT JOIN Singer SG ON S.SingerId = S.SingerId
WHERE S.DeleteFlag <> 1
GO
/****** Object:  StoredProcedure [dbo].[SP_SONG_SEARCH]    Script Date: 5/6/2017 3:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SONG_SEARCH]
@Key nvarchar(50)
AS
DECLARE @SearchKey AS nvarchar(52);
SET @SearchKey = '%' + @Key + '%';
SELECT * FROM SONG S
LEFT JOIN Musician M ON S.MusicianId = M.MusicianId 
LEFT JOIN Singer SG on S.SingerId = SG.SingerId 
WHERE S.DeleteFlag <> 1 AND (S.SongName LIKE @SearchKey OR M.MusicianName LIKE @SearchKey OR SG.SingerName = @SearchKey)
GO
/****** Object:  StoredProcedure [dbo].[SP_USER_GETALL]    Script Date: 5/6/2017 3:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_USER_GETALL]
AS
SELECT * FROM [User] 
WHERE DeleteFlag <> 1
GO
/****** Object:  StoredProcedure [dbo].[SP_USER_INSERT]    Script Date: 5/6/2017 3:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_USER_INSERT]
			@AccountId varchar(50)
           ,@Password varchar(50)
           ,@AccountName nvarchar(50)
           ,@Name nvarchar(50)
           ,@AddressLine1 nvarchar(100)
           ,@AddressLine2 nvarchar(100)
           ,@AddressZip nvarchar(50)
           ,@AddressCountry nvarchar(50)
           ,@CardNumber varchar(25)
           ,@CvvCode varchar(5)
           ,@Expiration date
AS
INSERT INTO [dbo].[User]
           ([AccountId]
           ,[Password]
           ,[AccountName]
           ,[Name]
           ,[AddressLine1]
           ,[AddressLine2]
           ,[AddressZip]
           ,[AddressCountry]
           ,[CardNumber]
           ,[CvvCode]
           ,[Expiration])
VALUES(@AccountId 
           ,@Password 
           ,@AccountName 
           ,@Name 
           ,@AddressLine1 
           ,@AddressLine2 
           ,@AddressZip 
           ,@AddressCountry 
           ,@CardNumber 
           ,@CvvCode 
           ,@Expiration)
GO
/****** Object:  StoredProcedure [dbo].[SP_USER_VALIDATE]    Script Date: 5/6/2017 3:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_USER_VALIDATE]
@AccountId varchar(50),
@Password varchar(50)
AS
IF (@AccountId IN (SELECT AccountId FROM [User]))
	BEGIN
		IF(@Password IN (SELECT [Password] FROM [USER] WHERE AccountId = @AccountId))
			SELECT 1 AS 'RESULT'
		ELSE
			SELECT 0 AS 'RESULT'
	END
ELSE SELECT 0 AS 'RESULT'
GO
USE [master]
GO
ALTER DATABASE [MusicWebsite] SET  READ_WRITE 
GO
