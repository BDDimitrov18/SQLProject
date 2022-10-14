USE [master]
GO
/****** Object:  Database [ProjectDatabase]    Script Date: 10/14/2022 12:55:29 PM ******/
CREATE DATABASE [ProjectDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectDatabase', FILENAME = N'C:\Users\BDDimitrov18\ProjectDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectDatabase_log', FILENAME = N'C:\Users\BDDimitrov18\ProjectDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [ProjectDatabase]
GO
/****** Object:  Table [dbo].[Leaders]    Script Date: 10/14/2022 12:55:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leaders](
	[LeaderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] SPARSE  NULL,
	[ProjectId] [int] NULL,
 CONSTRAINT [PK_Leaders] PRIMARY KEY CLUSTERED 
(
	[LeaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 10/14/2022 12:55:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/14/2022 12:55:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 10/14/2022 12:55:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[WorkingProject] [int] NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/14/2022 12:55:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[role] [int] NULL,
	[team] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacations]    Script Date: 10/14/2022 12:55:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateStart] [date] NULL,
	[DateEnd] [date] NULL,
	[CreationDate] [date] NULL,
	[HalfDayVacation] [bit] NULL,
	[Accepted] [bit] NULL,
	[Applicant] [int] NULL,
	[FileLocation] [nvarchar](255) NULL,
 CONSTRAINT [PK_Vacations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 10/14/2022 12:55:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[WorkerId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProjectID] [int] NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[WorkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Leaders]  WITH CHECK ADD  CONSTRAINT [FK_Leaders_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Leaders] CHECK CONSTRAINT [FK_Leaders_ProjectId]
GO
ALTER TABLE [dbo].[Leaders]  WITH CHECK ADD  CONSTRAINT [FK_Leaders_Roles] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Leaders] CHECK CONSTRAINT [FK_Leaders_Roles]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Projects] FOREIGN KEY([WorkingProject])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Projects]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([role])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_teams] FOREIGN KEY([team])
REFERENCES [dbo].[Teams] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_teams]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Projects]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Users]
GO
USE [master]
GO
ALTER DATABASE [ProjectDatabase] SET  READ_WRITE 
GO
