USE [DiagnosticCenterManagementDB]
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 01-Nov-16 12:38:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Fee] [decimal](18, 0) NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 01-Nov-16 12:38:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[PatientId] [int] NOT NULL,
	[TestId] [int] NOT NULL,
	[BillNo] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bills]    Script Date: 01-Nov-16 12:38:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[BillNo] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[TotalAmount] [decimal](18, 0) NOT NULL,
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ViewTestWiseReport]    Script Date: 01-Nov-16 12:38:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ViewTestWiseReport]
AS
SELECT T.Name,R.Date, COUNT(R.BillNo) TotalTest, T.Fee*COUNT(R.BillNo) AS TotalAmount FROM (SELECT O.TestId,O.BillNo,B.Date FROM Orders O INNER JOIN Bills B ON O.BillNo=B.BillNo) R RIGHT JOIN Tests T ON R.TestId=T.Id GROUP BY T.Name,R.Date,T.Fee


GO
/****** Object:  Table [dbo].[Types]    Script Date: 01-Nov-16 12:38:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ViewAllTestWithType]    Script Date: 01-Nov-16 12:38:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewAllTestWithType]
AS
SELECT Tests.*,Types.Name as TypeName FROM Tests INNER JOIN Types 
ON Tests.TypeId=Types.Id
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 01-Nov-16 12:38:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Mobile] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Bills] ([BillNo], [Date], [TotalAmount], [Status]) VALUES (N'201610312030262', CAST(N'2016-10-31' AS Date), CAST(500 AS Decimal(18, 0)), N'paid')
INSERT [dbo].[Bills] ([BillNo], [Date], [TotalAmount], [Status]) VALUES (N'201610312136483', CAST(N'2016-10-31' AS Date), CAST(400 AS Decimal(18, 0)), N'unpaid')
INSERT [dbo].[Bills] ([BillNo], [Date], [TotalAmount], [Status]) VALUES (N'201610312143307', CAST(N'2016-10-31' AS Date), CAST(300 AS Decimal(18, 0)), N'unpaid')
INSERT [dbo].[Bills] ([BillNo], [Date], [TotalAmount], [Status]) VALUES (N'201610312156388', CAST(N'2016-10-31' AS Date), CAST(500 AS Decimal(18, 0)), N'paid')
INSERT [dbo].[Bills] ([BillNo], [Date], [TotalAmount], [Status]) VALUES (N'201610312201349', CAST(N'2016-10-31' AS Date), CAST(600 AS Decimal(18, 0)), N'paid')
INSERT [dbo].[Bills] ([BillNo], [Date], [TotalAmount], [Status]) VALUES (N'2016103122444410', CAST(N'2016-10-31' AS Date), CAST(950 AS Decimal(18, 0)), N'paid')
INSERT [dbo].[Orders] ([PatientId], [TestId], [BillNo]) VALUES (3, 1, N'201610312136483')
INSERT [dbo].[Orders] ([PatientId], [TestId], [BillNo]) VALUES (3, 9, N'201610312136483')
INSERT [dbo].[Orders] ([PatientId], [TestId], [BillNo]) VALUES (7, 9, N'201610312143307')
INSERT [dbo].[Orders] ([PatientId], [TestId], [BillNo]) VALUES (7, 13, N'201610312143307')
INSERT [dbo].[Orders] ([PatientId], [TestId], [BillNo]) VALUES (8, 10, N'201610312156388')
INSERT [dbo].[Orders] ([PatientId], [TestId], [BillNo]) VALUES (8, 13, N'201610312156388')
INSERT [dbo].[Orders] ([PatientId], [TestId], [BillNo]) VALUES (9, 12, N'201610312201349')
INSERT [dbo].[Orders] ([PatientId], [TestId], [BillNo]) VALUES (9, 8, N'201610312201349')
INSERT [dbo].[Orders] ([PatientId], [TestId], [BillNo]) VALUES (10, 6, N'2016103122444410')
INSERT [dbo].[Orders] ([PatientId], [TestId], [BillNo]) VALUES (10, 14, N'2016103122444410')
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([Id], [Name], [DateOfBirth], [Mobile]) VALUES (1, N' Nurul Alam Masud', CAST(N'1990-10-31' AS Date), N'02547865327')
INSERT [dbo].[Patients] ([Id], [Name], [DateOfBirth], [Mobile]) VALUES (2, N' Syful Islam', CAST(N'2016-10-19' AS Date), N'58796532')
INSERT [dbo].[Patients] ([Id], [Name], [DateOfBirth], [Mobile]) VALUES (3, N' Syful Islam', CAST(N'2016-10-11' AS Date), N'2547896532')
INSERT [dbo].[Patients] ([Id], [Name], [DateOfBirth], [Mobile]) VALUES (5, N'Ismail', CAST(N'2010-05-19' AS Date), N'5478965')
INSERT [dbo].[Patients] ([Id], [Name], [DateOfBirth], [Mobile]) VALUES (6, N'Arif', CAST(N'1990-10-05' AS Date), N'875496532')
INSERT [dbo].[Patients] ([Id], [Name], [DateOfBirth], [Mobile]) VALUES (7, N'Sayedul Islam', CAST(N'2016-10-12' AS Date), N'54896532')
INSERT [dbo].[Patients] ([Id], [Name], [DateOfBirth], [Mobile]) VALUES (8, N' Rajib', CAST(N'2016-10-11' AS Date), N'547896523')
INSERT [dbo].[Patients] ([Id], [Name], [DateOfBirth], [Mobile]) VALUES (9, N' Rajib', CAST(N'2016-10-11' AS Date), N'54796521')
INSERT [dbo].[Patients] ([Id], [Name], [DateOfBirth], [Mobile]) VALUES (10, N' Asif', CAST(N'2016-10-11' AS Date), N'254896532')
SET IDENTITY_INSERT [dbo].[Patients] OFF
SET IDENTITY_INSERT [dbo].[Tests] ON 

INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (1, N'RBS', CAST(150 AS Decimal(18, 0)), 9)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (2, N'LS Spine', CAST(1100 AS Decimal(18, 0)), 7)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (4, N'Complete Blood count (Total Count-Differential Count-ESR, Hb %)', CAST(400 AS Decimal(18, 0)), 9)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (5, N'S. Creatinine', CAST(300 AS Decimal(18, 0)), 9)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (6, N'Lipid profile', CAST(450 AS Decimal(18, 0)), 9)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (7, N'Hand X-ray', CAST(200 AS Decimal(18, 0)), 7)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (8, N'Feet X-ray', CAST(300 AS Decimal(18, 0)), 7)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (9, N'Lower Abdomen', CAST(300 AS Decimal(18, 0)), 1)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (10, N'Whole Abdomen', CAST(800 AS Decimal(18, 0)), 1)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (11, N'Pregnancy profile', CAST(550 AS Decimal(18, 0)), 1)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (12, N'ECG', CAST(150 AS Decimal(18, 0)), 10)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (13, N'Echo', CAST(150 AS Decimal(18, 0)), 11)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (14, N'Vision Test', CAST(500 AS Decimal(18, 0)), 13)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (15, N'Cornia Test', CAST(500 AS Decimal(18, 0)), 13)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (16, N'Test Type', CAST(100 AS Decimal(18, 0)), 1)
INSERT [dbo].[Tests] ([Id], [Name], [Fee], [TypeId]) VALUES (17, N'Test Type2', CAST(500 AS Decimal(18, 0)), 9)
SET IDENTITY_INSERT [dbo].[Tests] OFF
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([Id], [Name]) VALUES (1, N'USG')
INSERT [dbo].[Types] ([Id], [Name]) VALUES (7, N'X-Ray')
INSERT [dbo].[Types] ([Id], [Name]) VALUES (9, N'Blood')
INSERT [dbo].[Types] ([Id], [Name]) VALUES (10, N'ECG')
INSERT [dbo].[Types] ([Id], [Name]) VALUES (11, N'Echo')
INSERT [dbo].[Types] ([Id], [Name]) VALUES (12, N'MRI')
INSERT [dbo].[Types] ([Id], [Name]) VALUES (13, N'Eye')
SET IDENTITY_INSERT [dbo].[Types] OFF
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Bill] FOREIGN KEY([BillNo])
REFERENCES [dbo].[Bills] ([BillNo])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Bill]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Patient]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Test] FOREIGN KEY([TestId])
REFERENCES [dbo].[Tests] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Test]
GO
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD  CONSTRAINT [FK_Test_Type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([Id])
GO
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_Test_Type]
GO
