USE [master]
GO
/****** Object:  Database [MusicWebsite]    Script Date: 6/2/2017 11:15:49 PM ******/
CREATE DATABASE [MusicWebsite]
GO
USE [MusicWebsite]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](100) NULL,
	[AccountId] [varchar](50) NULL,
	[SongId] [int] NULL,
	[TimeStam] [datetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Musician]    Script Date: 6/2/2017 11:15:49 PM ******/
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
/****** Object:  Table [dbo].[PaymentInfo]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentInfo](
	[PaymentInfoId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[Singer]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Singer](
	[SingerId] [int] IDENTITY(1,1) NOT NULL,
	[SingerName] [nvarchar](50) NULL,
	[Info] [nvarchar](250) NULL,
 CONSTRAINT [PK_Singer] PRIMARY KEY CLUSTERED 
(
	[SingerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Song]    Script Date: 6/2/2017 11:15:49 PM ******/
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
	[Link] [varchar](200) NULL,
	[UploaderId] [varchar](50) NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Song] PRIMARY KEY CLUSTERED 
(
	[SongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 6/2/2017 11:15:49 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 6/2/2017 11:15:49 PM ******/
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
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (1, N'hello', N'admin', 1, CAST(N'2017-06-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (2, N'hello1', N'admin', 1, CAST(N'2017-06-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (3, N'qbc', N'admin', 1, CAST(N'2017-06-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (4, N'qbc', N'admin', 1, CAST(N'2017-06-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (5, N'qbc', N'admin', 1, CAST(N'2017-06-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (6, N'fgh', N'admin', 1, CAST(N'2017-06-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (7, N'fgh', N'admin', 1, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (8, N'fgh1', N'admin', 1, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (10, N'the four is good!', N'd', 5, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (21, N'Virus is wonderful.', N'd', 5, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (22, N'Virus', N'd', 1, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (23, N'the four', N'd', 5, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (24, N'This song is good', N'd', 1, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (25, N'This song is good 1', N'd', 1, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (26, N'This song is good 2', N'd', 1, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (37, N'me is so wonderful.............', N'ngoc', 74, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (38, N'me 2 is a good song. I love it very much.', N'ngoc', 75, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (39, N'This song remind me of my childhood, when i first here it, i was about to cry.', N'd', 75, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (40, N'me is good', N'ngoc', 74, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentId], [Comment], [AccountId], [SongId], [TimeStam]) VALUES (41, N'hello everyone', N'ngoc', 74, CAST(N'2017-06-02 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Musician] ON 

INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (1, N'L.v Beethoven', N'This is a famous classical musician.')
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (2, N'J.S Bach', NULL)
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (3, N'J. Pachelbel', NULL)
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (4, N'A. Vivaldi', NULL)
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (5, N'G.F Handel', NULL)
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (6, N'Vivaldi', NULL)
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (7, N'Kt Dung Ha', NULL)
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (8, N'', NULL)
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (9, N'Bang Cuong', NULL)
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (1009, N'ÄÃ m VÄ©nh HÆ°ng', N'knk')
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (1010, N'Dam Vinh Hung', N'Ca si Viet Nam')
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (1011, N'ÄÃ m VÄ©nh HÆ°ng', N'Ca sÄ© viá»t nam')
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (1012, N'N''ÄÃ m VÄ©nh HÆ°ng''', N'CÃ¡ sÄ©')
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (1013, N'me music', NULL)
INSERT [dbo].[Musician] ([MusicianId], [MusicianName], [Info]) VALUES (1014, N'me music 2', NULL)
SET IDENTITY_INSERT [dbo].[Musician] OFF
SET IDENTITY_INSERT [dbo].[PaymentInfo] ON 

INSERT [dbo].[PaymentInfo] ([PaymentInfoId], [AccountId], [AccountHolder], [AddressLine1], [AddressLine2], [AddressZip], [AddressCountry], [CardNumber], [CvvCode], [ExpirationDate]) VALUES (3, N'id', N'name', N'line1', N'line2', N'zip', N'Azerbaijan', N'49843743874378', N'484', CAST(N'2050-12-01' AS Date))
INSERT [dbo].[PaymentInfo] ([PaymentInfoId], [AccountId], [AccountHolder], [AddressLine1], [AddressLine2], [AddressZip], [AddressCountry], [CardNumber], [CvvCode], [ExpirationDate]) VALUES (1003, N'1', N'1', N'1', N'1', N'1', N'Austria', N'1', N'1', CAST(N'1911-01-01' AS Date))
INSERT [dbo].[PaymentInfo] ([PaymentInfoId], [AccountId], [AccountHolder], [AddressLine1], [AddressLine2], [AddressZip], [AddressCountry], [CardNumber], [CvvCode], [ExpirationDate]) VALUES (1004, N'ngoc', N'Huynh Ngoc Thang', N'abc', N'abc', N'123434', N'Viet Nam', N'32345456565', N'325', CAST(N'2050-12-01' AS Date))
SET IDENTITY_INSERT [dbo].[PaymentInfo] OFF
SET IDENTITY_INSERT [dbo].[Singer] ON 

INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (1, N'Virus', NULL)
INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (2, N'A. Vivaldi', NULL)
INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (3, N'Ðan Tru?ng', NULL)
INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (4, N'Đan Trường', NULL)
INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (5, N'Kt Dung Ha', NULL)
INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (6, N'Äan TrÆ°á»ng', NULL)
INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (7, N'ÃÂan TrÃÂ°Ã¡Â»Âng', NULL)
INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (8, N'Ca si khong ten', N'Day la ca si tre viet nam')
INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (9, N'Bang Cuong', NULL)
INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (1009, N'Ca si 1', N'thong tin')
INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (1010, N'Ca si 2', N'thong tin ca si 2')
INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (1011, N'me singer', NULL)
INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (1012, N'me sing 2', NULL)
INSERT [dbo].[Singer] ([SingerId], [SingerName], [Info]) VALUES (1013, N'', NULL)
SET IDENTITY_INSERT [dbo].[Singer] OFF
SET IDENTITY_INSERT [dbo].[Song] ON 

INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (1, N'Virus', 1, 1, 0.0000, N'upload\Co-Gai-Pa-Co-Anh-Tho.mp3', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (2, N'Moonlight Sonata', 8, 1, 75000.0000, N'upload\NÄƒm Anh Em TrÃªn Má»™t Chiáº¿c Xe TÄƒng - ', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (3, N'No.9 Sonata Seg.2nd', 1, 2, 0.0000, NULL, N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (4, N'Cannon in D', 1, 3, 0.0000, NULL, N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (5, N'The Four Seasons', 1, 4, 0.0000, N'upload\ChacAnhSeNhoDenEmNhieu-AnhQuanIdolBangCuong-4374024.mp3', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (6, N'St. John''s Passion', 1, 2, 0.0000, NULL, N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (7, N'Water Music', 1, 5, 50000.0000, NULL, N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (9, N'test1', 1, 3, 0.0000, NULL, N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (10, N'test2', 1, 5, 0.0000, NULL, N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (11, N'test3', 1, 4, 0.0000, NULL, N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (12, N'test4', 1, 2, 0.0000, NULL, N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (15, N'Song add 1', 1, 1, 0.0000, N'[123doc] - bao-cao-thuc-tap', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (16, N'Song add 2', 1, 4, 0.0000, N'7jualxv1sn0jtyx3rglnxsvj...anh_thu_chi_phi_va.p0UW', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (17, N'Song add 3', 1, 5, 45000.0000, N'[123doc] - bao-cao-thuc-tap', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (18, N'Song 5', 1, 3, 100000.0000, N'7jualxv1sn0jtyx3rglnxsvj...anh_thu_chi_phi_va.p0UW', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (19, N'Song 6', 1, 4, 25000.0000, N'[123doc] - bao-cao-thuc-tap', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (20, N'Song 7', 1, 3, 1234.0000, N'45454_n.png', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (63, N'Ngay Mai Chuyen Da Khac', 5, 7, 0.0000, N'upload\Ngay-Mai-Chuyen-Da-Khac-Hakoota-Dung-Ha.mp3', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (64, N'Co Gai Pa Co', 1009, 5, 1234321.0000, N'upload\Co-Gai-Pa-Co-Anh-Tho.mp3', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (65, N'Song 12', 1, 2, 25000.0000, N'upload\Tau-Anh-Qua-Nui-Anh-Tho.mp3', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (66, N'Co Gai Vot Chong', 6, 3, 12000.0000, N'upload\Co-Gai-Vot-Chong-Anh-Tho.mp3', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (72, N'Chac anh se nho em nhieu', 9, 9, 25000.0000, N'upload\ChacAnhSeNhoDenEmNhieu-AnhQuanIdolBangCuong', N'admin', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (74, N'me upload', 1011, 1013, 0.0000, N'upload\quang-tao-cay-boong-Huynh-James-x-Pjnboy.mp3', N'ngoc', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (75, N'me 2', 1012, 1014, 0.0000, N'upload\Ngay-Mai-Chuyen-Da-Khac-Hakoota-Dung-Ha.mp3', N'ngoc', 0)
INSERT [dbo].[Song] ([SongId], [SongName], [SingerId], [MusicianId], [Price], [Link], [UploaderId], [DeleteFlag]) VALUES (76, N'me 3', 1013, 8, 0.0000, N'upload\', N'ngoc', 0)
SET IDENTITY_INSERT [dbo].[Song] OFF
INSERT [dbo].[User] ([AccountId], [Password], [AccountName], [Admin], [Status], [DeleteFlag]) VALUES (N'1', N'1', N'1', 0, 0, 0)
INSERT [dbo].[User] ([AccountId], [Password], [AccountName], [Admin], [Status], [DeleteFlag]) VALUES (N'admin', N'admin', N'Admin', 1, 0, 0)
INSERT [dbo].[User] ([AccountId], [Password], [AccountName], [Admin], [Status], [DeleteFlag]) VALUES (N'd', N'd', N'd', 0, 0, 0)
INSERT [dbo].[User] ([AccountId], [Password], [AccountName], [Admin], [Status], [DeleteFlag]) VALUES (N'id', N'pass', N'full name', 0, 0, 0)
INSERT [dbo].[User] ([AccountId], [Password], [AccountName], [Admin], [Status], [DeleteFlag]) VALUES (N'ngoc', N'thang', N'Huynh Ngoc Thang', 0, 0, 0)
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[User] ([AccountId])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__SongId__0B91BA14] FOREIGN KEY([SongId])
REFERENCES [dbo].[Song] ([SongId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__SongId__0B91BA14]
GO
ALTER TABLE [dbo].[PaymentInfo]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[User] ([AccountId])
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD  CONSTRAINT [FK__Song__MusicianId__1CF15040] FOREIGN KEY([MusicianId])
REFERENCES [dbo].[Musician] ([MusicianId])
GO
ALTER TABLE [dbo].[Song] CHECK CONSTRAINT [FK__Song__MusicianId__1CF15040]
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD  CONSTRAINT [FK__Song__SingerId__0D7A0286] FOREIGN KEY([SingerId])
REFERENCES [dbo].[Singer] ([SingerId])
GO
ALTER TABLE [dbo].[Song] CHECK CONSTRAINT [FK__Song__SingerId__0D7A0286]
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
/****** Object:  StoredProcedure [dbo].[SP_COMMENT_GETALL]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_COMMENT_GETALL]
@SongId as int
AS
BEGIN
	SELECT * FROM Comment C 
	LEFT JOIN [User] U ON C.AccountId =U.AccountId
	LEFT JOIN Song S ON C.SongId=S.SongId
	WHERE C.SongId = @SongId
END



GO
/****** Object:  StoredProcedure [dbo].[SP_COMMENT_INSERT]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_COMMENT_INSERT]
	@Comment nvarchar(100),
	@AccountId varchar(50),
	@SongId int,
	@TimeStam datetime
AS
BEGIN
	INSERT INTO Comment(Comment,AccountId,SongId,TimeStam)
	VALUES ( @Comment, @AccountId, @SongId,@TimeStam)
END



GO
/****** Object:  StoredProcedure [dbo].[SP_MUSICIAN_GETALL]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MUSICIAN_GETALL]
@Order varchar(10) = null,
@Start int = null,
@Num int = null
AS
IF(@Order IS NOT NULL)
BEGIN
	IF(@Start IS NOT NULL AND @Num IS NOT NULL)
	BEGIN
		SELECT * FROM Musician
		ORDER BY MusicianName
		OFFSET  @Start ROWS 
		FETCH NEXT @Num ROWS ONLY 
	END
	ELSE
	BEGIN
		SELECT * FROM Musician
		ORDER BY MusicianName
	END
END
ELSE
BEGIN
	IF(@Start IS NOT NULL AND @Num IS NOT NULL)
	BEGIN
		SELECT * FROM Musician
		ORDER BY MusicianId
		OFFSET  @Start ROWS 
		FETCH NEXT @Num ROWS ONLY 
	END
	ELSE
	BEGIN
		SELECT * FROM Musician
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MUSICIAN_GETBYID]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MUSICIAN_GETBYID]
@MusicianId int
AS
SELECT * FROM Musician
		WHERE MusicianId = @MusicianId
GO
/****** Object:  StoredProcedure [dbo].[SP_MUSICIAN_GETCOUNT]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MUSICIAN_GETCOUNT]
AS
SELECT COUNT(MusicianId) from Musician

GO
/****** Object:  StoredProcedure [dbo].[SP_MUSICIAN_GETID]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MUSICIAN_GETID]
@MusicianName nvarchar(50)
AS
IF (@MusicianName NOT IN (SELECT MusicianName FROM Musician))
	INSERT INTO [dbo].[Musician]
			   ([MusicianName])
		 VALUES(@MusicianName)
SELECT MusicianId 
FROM Musician 
WHERE MusicianName = @MusicianName


GO
/****** Object:  StoredProcedure [dbo].[SP_MUSICIAN_INS]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MUSICIAN_INS]
			@MusicianName nvarchar(50) 
           ,@Info nvarchar(250)
AS
INSERT INTO [dbo].[Musician]
		([MusicianName]
		,[Info])
VALUES(@MusicianName 
        ,@Info)
GO
/****** Object:  StoredProcedure [dbo].[SP_MUSICIAN_SEARCH]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MUSICIAN_SEARCH]
@Key nvarchar(50)
AS
DECLARE @SearchKey AS nvarchar(52);
SET @SearchKey = '%' + @Key + '%';
SELECT * FROM Musician
WHERE MusicianName LIKE @SearchKey
GO
/****** Object:  StoredProcedure [dbo].[SP_MUSICIAN_UPD]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MUSICIAN_UPD]
			@MusicianId int
			,@MusicianName nvarchar(50) 
           ,@Info nvarchar(250)
AS
UPDATE [dbo].[Musician]
   SET [MusicianName] = @MusicianName
      ,[Info] = @Info
 WHERE MusicianId = @MusicianId
GO
/****** Object:  StoredProcedure [dbo].[SP_PAYMENTINFO_INSERT]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PAYMENTINFO_INSERT]
			@AccountId varchar(50) 
           ,@AccountHolder varchar(50) 
           ,@AddressLine1 nvarchar(100) 
           ,@AddressLine2 nvarchar(100) 
           ,@AddressZip varchar(10) 
           ,@AddressCountry nvarchar(50) 
           ,@CardNumber varchar(25) 
           ,@CvvCode varchar(3) 
           ,@ExpirationDate date 
AS
INSERT INTO [dbo].[PaymentInfo]
           ([AccountId]
           ,[AccountHolder]
           ,[AddressLine1]
           ,[AddressLine2]
           ,[AddressZip]
           ,[AddressCountry]
           ,[CardNumber]
           ,[CvvCode]
           ,[ExpirationDate])
VALUES(@AccountId 
           ,@AccountHolder
           ,@AddressLine1 
           ,@AddressLine2 
           ,@AddressZip 
           ,@AddressCountry 
           ,@CardNumber  
           ,@CvvCode 
           ,@ExpirationDate)
GO
/****** Object:  StoredProcedure [dbo].[SP_SINGER_GETALL]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SINGER_GETALL]
@Order varchar(10) = null,
@Start int = null,
@Num int = null
AS
IF(@Order IS NOT NULL)
BEGIN
	IF(@Start IS NOT NULL AND @Num IS NOT NULL)
	BEGIN
		SELECT * FROM Singer
		ORDER BY SingerName
		OFFSET  @Start ROWS 
		FETCH NEXT @Num ROWS ONLY 
	END
	ELSE
	BEGIN
		SELECT * FROM Singer
		ORDER BY SingerName
	END
END
ELSE
BEGIN
	IF(@Start IS NOT NULL AND @Num IS NOT NULL)
	BEGIN
		SELECT * FROM Singer
		ORDER BY SingerId
		OFFSET  @Start ROWS 
		FETCH NEXT @Num ROWS ONLY 
	END
	ELSE
	BEGIN
		SELECT * FROM Singer
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SINGER_GETBYID]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SINGER_GETBYID]
@SingerId int
AS
SELECT * FROM Singer
		WHERE SingerId = @SingerId
GO
/****** Object:  StoredProcedure [dbo].[SP_SINGER_GETCOUNT]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SINGER_GETCOUNT]
AS
SELECT COUNT(SingerId) from Singer

GO
/****** Object:  StoredProcedure [dbo].[SP_SINGER_GETID]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SINGER_GETID]
@SingerName nvarchar(50)
AS
IF (@SingerName NOT IN (SELECT SingerName FROM Singer))
	INSERT INTO [dbo].[Singer]
			   ([SingerName])
		 VALUES(@SingerName)
SELECT SingerId 
FROM Singer 
WHERE SingerName = @SingerName


GO
/****** Object:  StoredProcedure [dbo].[SP_SINGER_INS]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SINGER_INS]
			@SingerName nvarchar(50)
           ,@Info nvarchar(250)
AS
INSERT INTO [dbo].[Singer]
		([SingerName]
		,[Info])
VALUES(@SingerName 
        ,@Info)
GO
/****** Object:  StoredProcedure [dbo].[SP_SINGER_SEARCH]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SINGER_SEARCH]
@Key nvarchar(50)
AS
DECLARE @SearchKey AS nvarchar(52);
SET @SearchKey = '%' + @Key + '%';
SELECT * FROM Singer
WHERE SingerName LIKE @SearchKey
GO
/****** Object:  StoredProcedure [dbo].[SP_SINGER_UPD]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SINGER_UPD]
			@SingerId int
			,@SingerName nvarchar(50) 
           ,@Info nvarchar(250)
AS
UPDATE [dbo].[Singer]
   SET [SingerName] = @SingerName
      ,[Info] = @Info
 WHERE SingerId = @SingerId
GO
/****** Object:  StoredProcedure [dbo].[SP_SONG_DEL]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SONG_DEL]
@SongId as int
AS
UPDATE SONG SET 
		DeleteFlag = 1 
WHERE SongId = @SongId
GO
/****** Object:  StoredProcedure [dbo].[SP_SONG_GETALL]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SONG_GETALL]
@Order varchar(10) = null,
@Start int = null,
@Num int = null
AS
IF(@Order IS NOT NULL)
BEGIN
	IF(@Start IS NOT NULL AND @Num IS NOT NULL)
	BEGIN
		SELECT * FROM SONG S
		LEFT JOIN Musician M ON S.MusicianId = M.MusicianId
		LEFT JOIN Singer SG ON SG.SingerId = S.SingerId
		LEFT JOIN [User] U ON U.AccountId = S.UploaderId 
		WHERE S.DeleteFlag = 0
		ORDER BY SongName
		OFFSET  @Start ROWS 
		FETCH NEXT @Num ROWS ONLY 
	END
	ELSE
	BEGIN
		SELECT * FROM SONG S
		LEFT JOIN Musician M ON S.MusicianId = M.MusicianId
		LEFT JOIN Singer SG ON SG.SingerId = S.SingerId
		LEFT JOIN [User] U ON U.AccountId = S.UploaderId 
		WHERE S.DeleteFlag = 0
		ORDER BY SongName
	END
END
ELSE
BEGIN
	IF(@Start IS NOT NULL AND @Num IS NOT NULL)
	BEGIN
		SELECT * FROM SONG S
		LEFT JOIN Musician M ON S.MusicianId = M.MusicianId
		LEFT JOIN Singer SG ON SG.SingerId = S.SingerId
		LEFT JOIN [User] U ON U.AccountId = S.UploaderId 
		WHERE S.DeleteFlag = 0
		ORDER BY SongId
		OFFSET  @Start ROWS 
		FETCH NEXT @Num ROWS ONLY 
	END
	ELSE
	BEGIN
		SELECT * FROM SONG S
		LEFT JOIN Musician M ON M.MusicianId = S.MusicianId
		LEFT JOIN Singer SG ON SG.SingerId = S.SingerId
		LEFT JOIN [User] U ON U.AccountId = S.UploaderId 
		WHERE S.DeleteFlag = 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SONG_GETBYID]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SONG_GETBYID]
@SongId int
AS
SELECT * FROM SONG S
		LEFT JOIN Musician M ON M.MusicianId = S.MusicianId
		LEFT JOIN Singer SG ON SG.SingerId = S.SingerId
		LEFT JOIN [User] U ON U.AccountId = S.UploaderId 
		WHERE S.DeleteFlag = 0 AND SongId = @SongId
GO
/****** Object:  StoredProcedure [dbo].[SP_SONG_GETCOUNT]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SONG_GETCOUNT]
AS
SELECT COUNT(SongId) from Song
WHERE DeleteFlag = 0
GO
/****** Object:  StoredProcedure [dbo].[SP_SONG_INS]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SONG_INS]
@SongName nvarchar(50) 
           ,@SingerId int 
           ,@MusicianId int 
           ,@Price money 
           ,@Link varchar(200) 
           ,@UploaderId varchar(50) 
           ,@DeleteFlag bit 
AS
INSERT INTO [dbo].[Song]
           ([SongName]
           ,[SingerId]
           ,[MusicianId]
           ,[Price]
           ,[Link]
           ,[UploaderId]
           ,[DeleteFlag])
     VALUES
           (@SongName 
           ,@SingerId  
           ,@MusicianId 
           ,@Price 
           ,@Link 
           ,@UploaderId 
           ,@DeleteFlag)

GO
/****** Object:  StoredProcedure [dbo].[SP_SONG_SEARCH]    Script Date: 6/2/2017 11:15:49 PM ******/
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
LEFT JOIN Singer SG ON S.SingerId = SG.SingerId 
LEFT JOIN [User] U ON U.AccountId = S.UploaderId
WHERE S.DeleteFlag = 0 AND (S.SongName LIKE @SearchKey OR M.MusicianName LIKE @SearchKey OR SG.SingerName = @SearchKey)
GO
/****** Object:  StoredProcedure [dbo].[SP_SONG_UPD]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SONG_UPD]
			@SongId int
			,@SongName nvarchar(50) 
           ,@SingerId int 
           ,@MusicianId int 
           ,@Price money 
           ,@Link varchar(200)
AS
UPDATE [dbo].[Song]
   SET [SongName] = @SongName
      ,[SingerId] = @SingerId
      ,[MusicianId] = @MusicianId
      ,[Price] = @Price
      ,[Link] = @Link
 WHERE SongId = @SongId
GO
/****** Object:  StoredProcedure [dbo].[SP_USER_GETALL]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_USER_GETALL]
AS
SELECT * FROM [User] 
WHERE DeleteFlag <> 1
GO
/****** Object:  StoredProcedure [dbo].[SP_USER_GETBYID]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_USER_GETBYID]
@AccountId varchar(50)
AS
SELECT * FROM [User]
		WHERE AccountId = @AccountId
GO
/****** Object:  StoredProcedure [dbo].[SP_USER_INSERT]    Script Date: 6/2/2017 11:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_USER_INSERT]
			@AccountId varchar(50)
           ,@Password varchar(50)
           ,@AccountName nvarchar(50)
		   ,@Admin bit
           ,@Status tinyint
           ,@DeleteFlag bit
           ,@AccountHolder nvarchar(50)
           ,@AddressLine1 nvarchar(100)
           ,@AddressLine2 nvarchar(100)
           ,@AddressZip nvarchar(50)
           ,@AddressCountry nvarchar(50)
           ,@CardNumber varchar(25)
           ,@CvvCode varchar(5)
           ,@ExpirationDate date
AS
BEGIN TRANSACTION TSS1
BEGIN TRY
INSERT INTO [dbo].[User]
           ([AccountId]
           ,[Password]
           ,[AccountName]
           ,[Admin]
           ,[Status]
           ,[DeleteFlag])
VALUES(@AccountId
           ,@Password 
           ,@AccountName
		   ,@Admin
           ,@Status
           ,@DeleteFlag)
EXEC SP_PAYMENTINFO_INSERT @AccountId
							,@AccountHolder
							,@AddressLine1
							,@AddressLine2
							,@AddressZip
							,@AddressCountry
							,@CardNumber
							,@CvvCode
							,@ExpirationDate
COMMIT TRANSACTION 
END TRY
BEGIN CATCH
	ROLLBACK TRAN TSS1
END CATCH

	

GO
/****** Object:  StoredProcedure [dbo].[SP_USER_VALIDATE]    Script Date: 6/2/2017 11:15:49 PM ******/
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
ELSE SELECT -1 AS 'RESULT'
GO
USE [master]
GO
ALTER DATABASE [MusicWebsite] SET  READ_WRITE 
GO
