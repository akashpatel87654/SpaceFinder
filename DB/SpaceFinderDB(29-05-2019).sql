USE [master]
GO
/****** Object:  Database [SpaceFinder]    Script Date: 05/29/2019 6:44:12 PM ******/
CREATE DATABASE [SpaceFinder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SpaceFinder', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SpaceFinder.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SpaceFinder_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SpaceFinder_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SpaceFinder] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SpaceFinder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SpaceFinder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SpaceFinder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SpaceFinder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SpaceFinder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SpaceFinder] SET ARITHABORT OFF 
GO
ALTER DATABASE [SpaceFinder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SpaceFinder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SpaceFinder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SpaceFinder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SpaceFinder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SpaceFinder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SpaceFinder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SpaceFinder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SpaceFinder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SpaceFinder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SpaceFinder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SpaceFinder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SpaceFinder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SpaceFinder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SpaceFinder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SpaceFinder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SpaceFinder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SpaceFinder] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SpaceFinder] SET  MULTI_USER 
GO
ALTER DATABASE [SpaceFinder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SpaceFinder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SpaceFinder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SpaceFinder] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SpaceFinder] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SpaceFinder]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 05/29/2019 6:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[Active] [bit] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Email] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[TotalProjects] [int] NULL,
	[OpenProjects] [int] NULL,
	[Awards] [int] NULL,
	[Customers] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photos]    Script Date: 05/29/2019 6:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[PhotoId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ProjectId] [int] NULL,
	[Active] [bit] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_Photos] PRIMARY KEY CLUSTERED 
(
	[PhotoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 05/29/2019 6:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Address] [nvarchar](max) NULL,
	[TotalUnits] [int] NULL,
	[UnitSold] [int] NULL,
	[UnitAvailable] [int] NULL,
	[TypeId] [int] NULL,
	[ContactNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Flats] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectTypes]    Script Date: 05/29/2019 6:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectTypes](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProjectTypes] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 05/29/2019 6:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/29/2019 6:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[RoleId] [int] NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Videos]    Script Date: 05/29/2019 6:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[VideoId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ProjectId] [int] NULL,
	[Active] [bit] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([CompanyId], [Name], [UserId], [Active], [Created], [Modified], [Email], [ContactNo], [Address], [TotalProjects], [OpenProjects], [Awards], [Customers], [Description]) VALUES (1, N'The Godrej Group', 1, 1, NULL, NULL, N'godrej@gmail.com', N'1231231231', N'Ahmedabad', 1500, 4, 200, 20000, N'The Godrej Group was established in 1897 out of a desire to demonstrate economic self-sufficiency and excellence within India in the pre-independence decades.')
SET IDENTITY_INSERT [dbo].[Companies] OFF
SET IDENTITY_INSERT [dbo].[Photos] ON 

INSERT [dbo].[Photos] ([PhotoId], [Name], [ProjectId], [Active], [Created], [Modified]) VALUES (1, N'gf1.jpg', 1, 1, NULL, NULL)
INSERT [dbo].[Photos] ([PhotoId], [Name], [ProjectId], [Active], [Created], [Modified]) VALUES (2, N'gf2.jpg', 2, 1, NULL, NULL)
INSERT [dbo].[Photos] ([PhotoId], [Name], [ProjectId], [Active], [Created], [Modified]) VALUES (3, N'gf3.jpg', 3, 1, NULL, NULL)
INSERT [dbo].[Photos] ([PhotoId], [Name], [ProjectId], [Active], [Created], [Modified]) VALUES (4, N'gf1.jpg', 4, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Photos] OFF
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([ProjectId], [CompanyId], [Name], [Active], [Created], [Modified], [Address], [TotalUnits], [UnitSold], [UnitAvailable], [TypeId], [ContactNo]) VALUES (1, 1, N'Godrej Garden City', 1, NULL, NULL, N'Godrej Garden City, Behind Nirma University, Off Sarkhej Gandhinagar highway, Village Jagatpur, Ahmedabad - 382481.', NULL, NULL, NULL, 1, N'1800-258-2588')
INSERT [dbo].[Projects] ([ProjectId], [CompanyId], [Name], [Active], [Created], [Modified], [Address], [TotalUnits], [UnitSold], [UnitAvailable], [TypeId], [ContactNo]) VALUES (2, 1, N'Godrej Aqua', 1, NULL, NULL, N'Godrej Garden City, Behind Nirma University, Off Sarkhej Gandhinagar highway, Village Jagatpur, Ahmedabad - 382 481.', NULL, NULL, NULL, 1, N'1800-258-2588')
INSERT [dbo].[Projects] ([ProjectId], [CompanyId], [Name], [Active], [Created], [Modified], [Address], [TotalUnits], [UnitSold], [UnitAvailable], [TypeId], [ContactNo]) VALUES (3, 1, N'Godrej  Reserve', 1, NULL, NULL, N'Godrej Garden City, Behind Nirma University, Off Sarkhej Gandhinagar highway, Village Jagatpur, Ahmedabad - 382 481.', NULL, NULL, NULL, 1, N'1800-258-2588')
INSERT [dbo].[Projects] ([ProjectId], [CompanyId], [Name], [Active], [Created], [Modified], [Address], [TotalUnits], [UnitSold], [UnitAvailable], [TypeId], [ContactNo]) VALUES (4, 1, N'Godrej Vision', 1, NULL, NULL, N'Godrej Garden City, Behind Nirma University, Off Sarkhej Gandhinagar highway, Village Jagatpur, Ahmedabad - 382 481.', NULL, NULL, NULL, 1, N'1800-258-2588')
SET IDENTITY_INSERT [dbo].[Projects] OFF
SET IDENTITY_INSERT [dbo].[ProjectTypes] ON 

INSERT [dbo].[ProjectTypes] ([TypeId], [Name]) VALUES (1, N'Residential')
INSERT [dbo].[ProjectTypes] ([TypeId], [Name]) VALUES (2, N'Commercial')
SET IDENTITY_INSERT [dbo].[ProjectTypes] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (2, N'Other')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [FirstName], [LastName], [Email], [Active], [Created], [Modified], [RoleId], [Password]) VALUES (1, N'Godrej', N'Godrej', N'Group', N'godrej@gmail.com', 1, NULL, NULL, 1, N'Godrej')
INSERT [dbo].[Users] ([UserId], [UserName], [FirstName], [LastName], [Email], [Active], [Created], [Modified], [RoleId], [Password]) VALUES (2, N'test', N'test', N'Test', N'test@test.com', 0, NULL, NULL, 2, N'Test@123')
INSERT [dbo].[Users] ([UserId], [UserName], [FirstName], [LastName], [Email], [Active], [Created], [Modified], [RoleId], [Password]) VALUES (3, N'test', NULL, N'Test', N'test@test.com', 1, NULL, NULL, 2, N'Test@123')
INSERT [dbo].[Users] ([UserId], [UserName], [FirstName], [LastName], [Email], [Active], [Created], [Modified], [RoleId], [Password]) VALUES (4, N'test', N'111', N'Test', N'test@test.com', 1, NULL, NULL, 2, N'Test@123')
INSERT [dbo].[Users] ([UserId], [UserName], [FirstName], [LastName], [Email], [Active], [Created], [Modified], [RoleId], [Password]) VALUES (5, N'test', N'2222', N'Test', N'test@test.com', 1, NULL, NULL, 2, N'Test@123')
INSERT [dbo].[Users] ([UserId], [UserName], [FirstName], [LastName], [Email], [Active], [Created], [Modified], [RoleId], [Password]) VALUES (6, N'test', N'8888', NULL, N'test@test.com', 1, NULL, NULL, 2, N'Test@123')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK_Photos_Flats] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK_Photos_Flats]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK__Flats__CompanyId__1A14E395] FOREIGN KEY([TypeId])
REFERENCES [dbo].[ProjectTypes] ([TypeId])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK__Flats__CompanyId__1A14E395]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Videos]  WITH CHECK ADD  CONSTRAINT [FK_Videos_Videos] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[Videos] CHECK CONSTRAINT [FK_Videos_Videos]
GO
/****** Object:  StoredProcedure [dbo].[ComapniesGetAll]    Script Date: 05/29/2019 6:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Akash Patel
-- Create date: 20/05/2019
-- Description:	Get All Companies and details
-- =============================================
CREATE PROCEDURE [dbo].[ComapniesGetAll]

@SearchText NVARCHAR(MAX) = NULL

AS

BEGIN
	SET NOCOUNT ON;

	SELECT Companies.CompanyId,Companies.Name AS 'CompanyName',Companies.TotalProjects,Companies.Customers,Companies.Awards,Companies.OpenProjects,Companies.Description,
	Projects.ProjectId,Projects.Name,Projects.Active,Projects.Address,Projects.ContactNo,ProjectTypes.TypeId,ProjectTypes.Name AS 'TypeName',
	Videos.VideoId,Videos.Name AS 'VideoName',
	Photos.PhotoId,Photos.Name AS 'PhotoName'

	FROM Companies
	INNER JOIN Projects 
	ON Companies.CompanyId = Projects.CompanyId
	INNER JOIN ProjectTypes
	ON Projects.TypeId = ProjectTypes.TypeId
	LEFT OUTER JOIN Videos
	ON Projects.ProjectId = Videos.ProjectId
	LEFT OUTER JOIN Photos
	ON Projects.ProjectId = Photos.ProjectId

	WHERE Companies.Active = 1 AND (@SearchText IS NULL OR Companies.Name LIKE '%' +  @SearchText + '%')


END

GO
/****** Object:  StoredProcedure [dbo].[UsersGetAll]    Script Date: 05/29/2019 6:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Akash Patel
-- Create date: 21-05-2019
-- Description:	Get all users
-- =============================================
CREATE PROCEDURE [dbo].[UsersGetAll]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT UserId,UserName,FirstName,LastName,Email,Active,Password,Roles.Name AS 'RoleName'
	FROM Users
	INNER JOIN Roles
	ON Users.RoleId = Roles.RoleId
    
END

GO
USE [master]
GO
ALTER DATABASE [SpaceFinder] SET  READ_WRITE 
GO
