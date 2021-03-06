USE [master]
GO
/****** Object:  Database [Music]    Script Date: 1/7/2022 1:32:03 AM ******/
CREATE DATABASE [Music]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Music', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Music.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Music_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Music_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Music] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Music].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Music] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Music] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Music] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Music] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Music] SET ARITHABORT OFF 
GO
ALTER DATABASE [Music] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Music] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Music] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Music] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Music] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Music] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Music] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Music] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Music] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Music] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Music] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Music] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Music] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Music] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Music] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Music] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Music] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Music] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Music] SET  MULTI_USER 
GO
ALTER DATABASE [Music] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Music] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Music] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Music] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Music] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Music] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Music] SET QUERY_STORE = OFF
GO
USE [Music]
GO
/****** Object:  FullTextCatalog [album_search]    Script Date: 1/7/2022 1:32:03 AM ******/
CREATE FULLTEXT CATALOG [album_search] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  FullTextCatalog [artist_search]    Script Date: 1/7/2022 1:32:03 AM ******/
CREATE FULLTEXT CATALOG [artist_search] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  FullTextCatalog [playlist_search]    Script Date: 1/7/2022 1:32:03 AM ******/
CREATE FULLTEXT CATALOG [playlist_search] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  FullTextCatalog [playlistus_search]    Script Date: 1/7/2022 1:32:03 AM ******/
CREATE FULLTEXT CATALOG [playlistus_search] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  FullTextCatalog [song_search]    Script Date: 1/7/2022 1:32:03 AM ******/
CREATE FULLTEXT CATALOG [song_search] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  Table [dbo].[AccountAdmin]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountAdmin](
	[AccountName] [char](30) NOT NULL,
	[Password] [char](20) NOT NULL,
	[Role] [tinyint] NOT NULL,
	[State] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[PersonID] [varchar](50) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AccountAdmin] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountUser]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountUser](
	[AccountName] [char](30) NOT NULL,
	[Password] [char](20) NOT NULL,
	[Role] [tinyint] NOT NULL,
	[State] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[PersonID] [varchar](50) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AccountUser] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[PersonID] [varchar](50) NOT NULL,
	[PersonName] [nvarchar](50) NOT NULL,
	[Gender] [tinyint] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [char](15) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[AlbumID] [varchar](50) NOT NULL,
	[AlbumName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Image] [nvarchar](200) NOT NULL,
	[ArtistID] [varchar](50) NOT NULL,
	[ReleasedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumLiked]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumLiked](
	[AccountName] [char](30) NOT NULL,
	[AlbumID] [varchar](50) NOT NULL,
	[DateLiked] [datetime] NOT NULL,
 CONSTRAINT [PK_AlbumLiked] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumListened]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumListened](
	[AccountName] [char](30) NOT NULL,
	[AlbumID] [varchar](50) NOT NULL,
	[DateListened] [datetime] NOT NULL,
 CONSTRAINT [PK_AlbumListened] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[ArtistID] [varchar](50) NOT NULL,
	[ArtistName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Image] [nvarchar](200) NOT NULL,
	[ImageBig] [nvarchar](200) NOT NULL,
	[Nation] [tinyint] NOT NULL,
	[GenderorisBand] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collection]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collection](
	[CollectionID] [varchar](50) NOT NULL,
	[CollectionName] [nvarchar](50) NOT NULL,
	[KindofCollection] [tinyint] NOT NULL,
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED 
(
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](200) NOT NULL,
	[Date] [datetime] NOT NULL,
	[SongID] [varchar](50) NOT NULL,
	[AccountName] [char](30) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistAdmin]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistAdmin](
	[PlaylistID] [varchar](50) NOT NULL,
	[PlaylistName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[DateCreated] [datetime] NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[AccountName] [char](30) NOT NULL,
	[isPublic] [bit] NULL,
 CONSTRAINT [PK_PlaylistAdmin] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistAdmin_Collection]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistAdmin_Collection](
	[PlaylistID] [varchar](50) NOT NULL,
	[CollectionID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PlaylistAdmin_Collection] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC,
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistAdmin_Song]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistAdmin_Song](
	[PlaylistID] [varchar](50) NOT NULL,
	[SongID] [varchar](50) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_PlaylistAdmin_Song] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC,
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistAdminLiked]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistAdminLiked](
	[AccountName] [char](30) NOT NULL,
	[PlaylistID] [varchar](50) NOT NULL,
	[DateLiked] [datetime] NOT NULL,
 CONSTRAINT [PK_PlaylistAdminLiked] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistAdminListened]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistAdminListened](
	[AccountName] [char](30) NOT NULL,
	[PlaylistID] [varchar](50) NOT NULL,
	[DateListened] [datetime] NOT NULL,
 CONSTRAINT [PK_PlaylistAdminListened] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistUser]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistUser](
	[PlaylistID] [varchar](50) NOT NULL,
	[PlaylistName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[DateCreated] [datetime] NOT NULL,
	[AccountName] [char](30) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[isPublic] [bit] NOT NULL,
 CONSTRAINT [PK_PlaylistUser] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistUser_Song]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistUser_Song](
	[PlaylistID] [varchar](50) NOT NULL,
	[SongID] [varchar](50) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_PlaylistUser_Song] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC,
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistUserLiked]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistUserLiked](
	[AccountName] [char](30) NOT NULL,
	[PlaylistID] [varchar](50) NOT NULL,
	[DateLiked] [datetime] NOT NULL,
 CONSTRAINT [PK_PlaylistUserLiked] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistUserListened]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistUserListened](
	[AccountName] [char](30) NOT NULL,
	[PlaylistID] [varchar](50) NOT NULL,
	[DateListened] [datetime] NOT NULL,
 CONSTRAINT [PK_PlaylistUserListened] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song](
	[SongID] [varchar](50) NOT NULL,
	[SongName] [nvarchar](50) NOT NULL,
	[Lyric] [nvarchar](3000) NULL,
	[ReleaseDate] [date] NOT NULL,
	[Nation] [int] NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[SongPath] [nvarchar](200) NOT NULL,
	[MV] [nvarchar](200) NULL,
	[AlbumID] [varchar](50) NULL,
 CONSTRAINT [PK_Song] PRIMARY KEY CLUSTERED 
(
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song_Artist]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song_Artist](
	[ArtistID] [varchar](50) NOT NULL,
	[SongID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Song_Artist] PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC,
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song_Collection]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song_Collection](
	[SongID] [varchar](50) NOT NULL,
	[CollectionID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Song_Collection] PRIMARY KEY CLUSTERED 
(
	[SongID] ASC,
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongLiked]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongLiked](
	[AccountName] [char](30) NOT NULL,
	[SongID] [varchar](50) NOT NULL,
	[DateLiked] [datetime] NOT NULL,
 CONSTRAINT [PK_SongLiked] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongListened]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongListened](
	[AccountName] [char](30) NOT NULL,
	[SongID] [varchar](50) NOT NULL,
	[DateListened] [datetime] NOT NULL,
 CONSTRAINT [PK_SongListened] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[PersonID] [varchar](50) NOT NULL,
	[PersonName] [nvarchar](50) NOT NULL,
	[Gender] [tinyint] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [char](15) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[View]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View](
	[ViewID] [bigint] IDENTITY(1,1) NOT NULL,
	[Views] [int] NOT NULL,
	[SongID] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_View] PRIMARY KEY CLUSTERED 
(
	[ViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AccountAdmin] ([AccountName], [Password], [Role], [State], [DateCreated], [PersonID], [Image]) VALUES (N'binhanvio@gmail.com           ', N'0987654321          ', 2, 1, CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'P000000003', N'nam.jpg')
INSERT [dbo].[AccountAdmin] ([AccountName], [Password], [Role], [State], [DateCreated], [PersonID], [Image]) VALUES (N'nam278z01@gmail.com           ', N'1234567890          ', 1, 1, CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'P000000001', N'nam.jpg')
INSERT [dbo].[AccountAdmin] ([AccountName], [Password], [Role], [State], [DateCreated], [PersonID], [Image]) VALUES (N'ntuyet44@gmail.com            ', N'1234567890          ', 1, 1, CAST(N'2021-11-23T00:00:00.000' AS DateTime), N'P000000002', N'nam.jpg')
GO
INSERT [dbo].[AccountUser] ([AccountName], [Password], [Role], [State], [DateCreated], [PersonID], [Image]) VALUES (N'binhanvio@gmail.com           ', N'0987654321          ', 2, 1, CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'P000000003', N'nam.jpg')
INSERT [dbo].[AccountUser] ([AccountName], [Password], [Role], [State], [DateCreated], [PersonID], [Image]) VALUES (N'nam278z01@gmail.com           ', N'1234567890          ', 1, 1, CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'P000000001', N'nam.jpg')
INSERT [dbo].[AccountUser] ([AccountName], [Password], [Role], [State], [DateCreated], [PersonID], [Image]) VALUES (N'nam278z01v@gmail.com          ', N'1234567890          ', 1, 1, CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'P000000002', N'nam.jpg')
INSERT [dbo].[AccountUser] ([AccountName], [Password], [Role], [State], [DateCreated], [PersonID], [Image]) VALUES (N'ngiang44@gmail.com            ', N'1234567890          ', 1, 1, CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'P000000012', N'nam.jpg')
INSERT [dbo].[AccountUser] ([AccountName], [Password], [Role], [State], [DateCreated], [PersonID], [Image]) VALUES (N'ntuyet44@gmail.com            ', N'1234567890          ', 1, 1, CAST(N'2021-11-23T00:00:00.000' AS DateTime), N'P000000004', N'nam.jpg')
GO
INSERT [dbo].[Admin] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000001', N'Nguyễn Thanh Nam', 1, N'nam278z01@gmail.com', N'0328731170     ')
INSERT [dbo].[Admin] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000002', N'Nguyễn Thị Tuyết', 0, N'ntuyet44@gmail.com', N'0395897920     ')
INSERT [dbo].[Admin] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000003', N'Thái Bình An', 1, N'binhanvio@mail.com', N'0983001432     ')
INSERT [dbo].[Admin] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000004', N'Nguyễn Thị Giang', 0, N'ngiang44@gmail.com', N'0924724612     ')
GO
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'11fe964b-7efa-41f8-8769-5fd436ada15f', N'Nhà là nơi để về', N'We are one', N'camon.jpg', N'AT00000017', CAST(N'2022-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'4e0896c8-6867-429f-a6a7-460593698f20', N'Tết trọn vẹn', N'Một năm bắt đầu từ mùa xuân, đời người bắt đầu từ tuổi trẻ. Chúc mọi người đón tết an lành và nghe nhạc vui vẻ', N'tettronven.jpg', N'AT00000009', CAST(N'2022-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000001', N'Hollywood''s Bleeding', N'Hollywood''s Bleeding is the third studio album by American rapper and singer Post Malone. It was released on September 6, 2019, by Republic Records.  ', N'Post_Malone_Hollywood''s_Bleeding.png', N'AT00000012', CAST(N'2021-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000002', N'30', N'Inspired by her divorce from ex-husband Simon Konecki, Adele tackles the separation on the album, whilst discussing her motherhood and the scrutiny of fame', N'30-adele.jpg', N'AT00000001', CAST(N'2021-11-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000003', N'Folklore ', N'Folklore is the eighth studio album by American singer-songwriter Taylor Swift. It was a surprise album, released on July 24, 2020, via Republic Records', N'Folklore (Full Album).jpg', N'AT00000013', CAST(N'2020-07-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000004', N'Dangerous: The double Album', N'Dangerous: The Double Album is the second studio album by American country music singer Morgan Wallen', N'dangerous.jpg', N'AT00000016', CAST(N'2020-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000005', N'Divide', N'÷ is the third studio album by English singer-songwriter Ed Sheeran. ', N'Divide_cover.png', N'AT00000003', CAST(N'2017-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000006', N'Jordi', N'Jordi is the seventh studio album by American band Maroon 5.', N'jordi.jpg', N'AT00000026', CAST(N'2020-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000007', N'Bước Qua Mùa Cô Đơn', N'Bước qua một vùng trời nhớ thương, là cả một mùa cô đơn đến quặn thắt.  Rời bỏ một cuộc tình, là đặt chân bước qua mùa cô đơn.', N'buocquamuacodon.jpg', N'AT00000017', CAST(N'2021-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000008', N'Trái Tim Vàng Son', N'Album "Trái tim vàng son" - dự án thuộc WeChoice Awards tiếp tục gửi đến người nghe một ca khúc giàu cảm xúc mang tên "Cảm Ơn" do ca sĩ Đông Nhi thể hiện', N'camon.jpg', N'AT00000020', CAST(N'2021-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000009', N'LiLac', N' Album phòng thu thứ 5 của IU sẽ có 11 bài, trong đó ca khúc chủ đề cùng tên album sẽ hứa hẹn mang đến nhiều điều đặc biệt.', N'albumiu.jpeg', N'AT00000018', CAST(N'2021-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'cbd91255-9fff-44af-b8ba-f8e007271712', N'Tết là để trở về', N'Với những đôi lứa đang yêu nhau, mùa xuân là mùa hạnh phúc và ngọt ngào nhất khi hai người cùng nắm tay nhau, bước đi giữa những cơn gió xuân, giữa đất trời đang giao mùa.', N'tet.jfif', N'AT00000020', CAST(N'2022-01-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[AlbumLiked] ([AccountName], [AlbumID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'AB00000001', CAST(N'2022-01-04T23:58:59.727' AS DateTime))
INSERT [dbo].[AlbumLiked] ([AccountName], [AlbumID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'AB00000002', CAST(N'2022-01-05T14:04:45.877' AS DateTime))
INSERT [dbo].[AlbumLiked] ([AccountName], [AlbumID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'AB00000007', CAST(N'2021-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[AlbumLiked] ([AccountName], [AlbumID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'AB00000008', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[AlbumLiked] ([AccountName], [AlbumID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'AB00000009', CAST(N'2021-02-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[AlbumListened] ([AccountName], [AlbumID], [DateListened]) VALUES (N'nam278z01@gmail.com           ', N'AB00000001', CAST(N'2022-01-05T00:09:31.090' AS DateTime))
INSERT [dbo].[AlbumListened] ([AccountName], [AlbumID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'AB00000007', CAST(N'2021-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[AlbumListened] ([AccountName], [AlbumID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'AB00000008', CAST(N'2021-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000001', N'Adele', NULL, N'adele.jpg', N'adele-big.jpeg', 2, 0)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000002', N'Coldplay', NULL, N'coldplay.jpg', N'coldplay-big.jpg', 2, 3)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000003', N'Ed Sheeran', NULL, N'edsheeran.jpg', N'edsheeran-big.jpg', 2, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000004', N'Lil Nas X', NULL, N'lilnasx.jpg', N'lilnasx-big.jpg', 2, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000005', N'Masew', NULL, N'masew.jpg', N'masew-big.jpg', 1, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000006', N'Bích Phương', NULL, N'bichphuong.jpg', N'bichphuong-big.jpg', 1, 0)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000007', N'Justatee', NULL, N'Justatee.jpg', N'Justatee-big.jpg', 1, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000008', N'Sơn Tùng MTP', NULL, N'sontung.jpg', N'songtung-big.jpg', 1, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000009', N'Đức Phúc', NULL, N'ducphuc.jpg', N'ducphuc-big.jpg', 1, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000010', N'Mỹ Tâm', NULL, N'mytam.jpg', N'mytam-big.jpg', 1, 0)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000011', N'BTS', NULL, N'bts.jpg', N'bts-big.jpg', 3, 3)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000012', N'Post Malone', NULL, N'postmalone.jpg', N'postmalone-big.jpg', 2, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000013', N'Taylor Swift', NULL, N'taylorswift.jpg', N'taylorswift-big.jpg', 2, 0)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000014', N'Ellie Goulding', NULL, N'elliegoulding.jpg', N'elliegouldung.jpg', 2, 0)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000015', N'Phương Ly', NULL, N'phuongly.jpg', N'phuongly-big.jpg', 1, 0)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000016', N'Morgan Wallen', NULL, N'morganwallen.jpg', N'morganwallen-big.jpg', 2, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000017', N'Vũ', NULL, N'vu.jpg', N'vu-big.jpg', 1, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000018', N'IU', N'', N'iu.jpg', N'iu-big.jpg', 3, 0)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000019', N'Doãn Hiếu', NULL, N'doanhieu.jpg', N'doanhieu-big.jpg', 1, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000020', N'Đông Nhi', NULL, N'dongnhi.jpg', N'dongnhi-big.jpg', 1, 0)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000026', N'Maroon 5', NULL, N'maroon5.jpg', N'maroon5.jpg', 2, 3)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000027', N'The Script', NULL, N'thescript.jpg', N'thescriptjpg', 2, 3)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000028', N'Jason Mraz', NULL, N'JasonMraz.jpg', N'JasonMraz.jpg', 2, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000029', N'Fools Garden', NULL, N'FoolsGarden.jpg', N'FoolsGarden.jpg', 2, 3)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000030', N'Sia', NULL, N'sia.jpg', N'sia.jpg', 2, 0)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000031', N'Martin', NULL, N'martin.jpg', N'martin.jpg', 2, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000032', N'pitbull_kesha', NULL, N'pitbull_kesha.jpg', N'pitbull_kesha.jpg', 2, 3)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000033', N'Excuse', NULL, N'Excuse.jpg', N'Excuse.jpg', 2, 3)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000034', N'Bon Jovi', NULL, N'BonJovi.jpg', N'BonJovi.jpg', 2, 3)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000035', N'linkin park', NULL, N'linkinpark.jpg', N'linkinpark.jpg', 2, 3)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000036', N'shaun', NULL, N'shaun.jpg', N'shaun.jpg', 3, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000037', N'A Nhũng', NULL, N'aNhung.jpg', N'aNhung.jpg', 3, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000038', N'vlanobrie', NULL, N'vlanobrie.jpg', N'vlanobrie.jpg', 2, 3)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000039', N'slander', NULL, N'slander.jpg', N'slander.jpg', 2, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000040', N'passenger', NULL, N'passenger.jpg', N'passenger.jpg', 2, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000041', N'hozier', NULL, N'hozier.jpg', N'hozier.jpg', 2, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000042', N'OneRepublic', NULL, N'OneRepublic.jpg', N'OneRepublic.jpg', 2, 1)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000043', N'Rixton', NULL, N'Rixton.jpg', N'Rixton.jpg', 2, 3)
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000044', N'Big Bang', NULL, N'bigbang.jpg', N'bigbang.jpg', 3, 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000001', N'Nhạc Trẻ', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000002', N'Electronica/Dance', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000003', N'Pop', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000004', N'Country', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000005', N'Rock', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000006', N'Rap Việt', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000007', N'Không lời', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000008', N'Bolero', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000009', N'Cải lương', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000010', N'Indie Việt', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000011', N'Thiếu nhi', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000012', N'Cách mạng', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000013', N'Trữ tình', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000014', N'Acoustic', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000015', N'Indie', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000016', N'R&B/Hip Hop/Rap', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000017', N'Latin', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000018', N'SoundTrack', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000019', N'Guitar', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000020', N'Piano', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000021', N'Buồn', 2)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000022', N'Cô đơn', 2)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000023', N'FA', 2)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000024', N'Nhớ nhung', 2)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000025', N'Thất tình', 2)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000026', N'Hưng phấn', 2)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000027', N'Vui vẻ', 2)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000028', N'Hy vọng', 2)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000029', N'Quyết tâm', 2)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000030', N'Ngọt ngào', 2)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000031', N'Thư giãn', 2)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000032', N'Cafe', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000033', N'Du lịch', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000034', N'Buổi sáng', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000035', N'Buối tối', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000036', N'Buổi trưa', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000037', N'Lãng mạn', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000038', N'Lái xe', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000039', N'Làm việc', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000040', N'Học tập', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000041', N'Chơi game', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000042', N'Tập gym', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000043', N'Giảm stress', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000044', N'Mùa xuân', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000045', N'Mùa hạ', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000046', N'Mùa thu', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000047', N'Mùa đông', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000048', N'Trước khi ngủ', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000049', N'Hẹn hò', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000050', N'Làm việc nhà', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000051', N'Nắng', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000052', N'Mưa', 3)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000053', N'Bất hủ', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000054', N'Chill out', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000055', N'Giải thưởng âm nhạc', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000056', N'Cover', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000057', N'Mashup', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000058', N'Song ca', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000059', N'Top 100', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000060', N'Tết', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000061', N'Weekend', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000062', N'Tình bạn', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000063', N'Tình yêu', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000064', N'Quê hương', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000065', N'Gia đình', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000066', N'Thầy cô', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000067', N'Epic music', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000068', N'Đoàn - Đảng', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000069', N'Giáng sinh', 4)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000070', N'Remix Việt', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000071', N'Rock Việt', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000072', N'Blues/Jazz', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000073', N'Nhạc Hàn', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000074', N'Nhạc Hoa', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000075', N'Nhạc Thái', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000076', N'Nhạc Nhật', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000077', N'Nhạc Phim', 1)
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000078', N'Pop Việt', 1)
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [SongID], [AccountName]) VALUES (1, N'Replay 1000 lần', CAST(N'2021-03-23T00:00:00.000' AS DateTime), N'SG00000041', N'ntuyet44@gmail.com            ')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [SongID], [AccountName]) VALUES (2, N'Bài hát rất ý nghĩa', CAST(N'2021-09-23T00:00:00.000' AS DateTime), N'SG00000042', N'ntuyet44@gmail.com            ')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [SongID], [AccountName]) VALUES (3, N'2021 rồi vẫn nghe lại bài này', CAST(N'2021-04-23T00:00:00.000' AS DateTime), N'SG00000050', N'ntuyet44@gmail.com            ')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [SongID], [AccountName]) VALUES (4, N'Tình cờ nghe và rồi thấy hay quá', CAST(N'2021-05-20T00:00:00.000' AS DateTime), N'SG00000044', N'ntuyet44@gmail.com            ')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [SongID], [AccountName]) VALUES (5, N'Hay quá trời', CAST(N'2021-09-12T00:00:00.000' AS DateTime), N'SG00000060', N'ngiang44@gmail.com            ')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [SongID], [AccountName]) VALUES (6, N'Siêu đỉnh ạ ', CAST(N'2021-07-12T00:00:00.000' AS DateTime), N'SG00000058', N'ngiang44@gmail.com            ')
INSERT [dbo].[Comment] ([CommentID], [Content], [Date], [SongID], [AccountName]) VALUES (7, N'U là trời', CAST(N'2021-08-12T00:00:00.000' AS DateTime), N'SG00000020', N'ngiang44@gmail.com            ')
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000001', N'Nhạc trẻ gây nghiện', N'Những giai điệu nghe một lần là không thể quên của V-Pop', CAST(N'2021-05-11T00:00:00.000' AS DateTime), N'nhactregaynghien.jpg', N'nam278z01@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000002', N'Nhạc trẻ Remix thất tình', N'Những bài hát đầy tâm trạng, thất tình được remix lại với phong cách mới                                                                                                                                ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'nhactreremixthattinh.jpg', N'nam278z01@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000003', N'Những chuyến di dài', N'Playlist này đặc biệt dành cho những người đam mê chu du khắp mọi miền đất nước hay còn gọi là đi phượt.                                                                                                ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'nhungchuyendidai.jpg', N'nam278z01@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000004', N'Bạn thân ơi mình đi thôi', NULL, CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'ban-than-oi-minh-di-thoi.jpg', N'nam278z01@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000005', N'Song ca Âu Mỹ bất hủ', N'Những màn song ca sống mãi với thời gian                                                                                                                                                                ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'songcaaumy.jpg', N'nam278z01@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000006', N'Đỉnh cao Hip Hop', N'Tôn vinh những flow rap đỉnh nhất trong văn hóa Hip-Hop                                                                                                                                                 ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'dinhcaohiphop.jpg', N'nam278z01@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000007', N'Đỉnh cao Rock', N'Những cái tên hàng đầu giữ cho ngọn lửa Rock cháy mãi                                                                                                                                                   ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'dinhcaorock.jpg', N'nam278z01@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000008', N'Đỉnh cao R&B', N'Tôn vinh những siêu sao thống trị dòng nhạc R&B                                                                                                                                                         ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'dinhcaorb.jpg', N'nam278z01@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000009', N'Đỉnh cao Pop', N'Ở đây có những ca khúc... Top Of The POP                                                                                                                                                                ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'dinhcaopop.jpg', N'nam278z01@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000010', N'Nhẹ nhàng cùng V-Pop', N'Thả mình cùng những giai điệu V-Pop nhẹ nhàng                                                                                                                                                           ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'nhenhangcungvpop.jpg', N'nam278z01@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000011', N'Nghe gì dễ ngủ', N'Kiến tạo giấc ngủ sâu và thoải mái nhất cho bạn cùng những bản nhạc                                                                                                                                     ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'nghegidengu.jpg', N'nam278z01@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000012', N'Nhạc giáng sinh', N'Tết này buồn làm sao?                                                                                                                                                                                   ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'giangsinh.jpg', N'binhanvio@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000013', N'Việt Nam Ơi', N'Tự hào về đất nước :3                                                                                                                                                                                   ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'vietnam.jpg', N'binhanvio@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000014', N'Căn phòng chỉ mình tôi', N'Cô đơn chỉ muốn một mình                                                                                                                                                                                ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'codon.jpg', N'binhanvio@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000015', N'Trái tim tan vỡ', N'Nắng tàn Mưa tan Tình ta cạn                                                                                                                                                                            ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'thattinh.jpg', N'binhanvio@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000016', N'Hiện tượng mới', N'Bản hit nổi mới nhất                                                                                                                                                                                    ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'hientuong.jpg', N'binhanvio@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000017', N'Piano', N'Nơi thể hiện trình độ âm nhạc đỉnh cao                                                                                                                                                                  ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'piano.jpg', N'binhanvio@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000018', N'Âm nhạc không gian', N'Không gian riêng với âm nhạc                                                                                                                                                                            ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'khonggian.jpg', N'binhanvio@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000019', N'Love You', N'Độc thân muốn có người yêu nghe ngay nào                                                                                                                                                                ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'yeu.jpg', N'binhanvio@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000020', N'Đêm hẹn hò', N'hẹn hò nên nghe gì?                                                                                                                                                                                     ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'henho.jpg', N'binhanvio@gmail.com           ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000021', N'Playlist này chill phết', N' Va vào những giai điệu chill khó cưỡng của V-Pop                                                                                                                                                       ', CAST(N'2021-11-23T00:00:00.000' AS DateTime), N'playlistchill.jpg', N'ntuyet44@gmail.com            ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000022', N'Tình Khúc', N'                                                                                                                                                                                                        ', CAST(N'2021-11-23T00:00:00.000' AS DateTime), N'tinhkhuc.jpg', N'ntuyet44@gmail.com            ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000023', N'K-Candy', NULL, CAST(N'2021-11-23T00:00:00.000' AS DateTime), N'kcandy.jpg', N'ntuyet44@gmail.com            ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000024', N'Thính nhẹ thôi, liệu em có đổ', NULL, CAST(N'2021-11-23T00:00:00.000' AS DateTime), N'thathinh.jpg', N'ntuyet44@gmail.com            ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000025', N'Nơi ta chờ em ', NULL, CAST(N'2021-11-23T00:00:00.000' AS DateTime), N'noitachoem.jpg', N'ntuyet44@gmail.com            ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000026', N'Cà Phê Mùa Thu', NULL, CAST(N'2021-11-23T00:00:00.000' AS DateTime), N'cafemuathu.jpg', N'ntuyet44@gmail.com            ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000027', N'Đông Qua Em Có Nhớ', NULL, CAST(N'2021-11-23T00:00:00.000' AS DateTime), N'dongqua.jpg', N'ntuyet44@gmail.com            ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000028', N'Nhạc Sôi Động Cho Ngày Mới', NULL, CAST(N'2021-11-23T00:00:00.000' AS DateTime), N'ngaymoi.jpg', N'ntuyet44@gmail.com            ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000029', N'Đi Cùng Năm Tháng', NULL, CAST(N'2021-11-23T00:00:00.000' AS DateTime), N'dicungnamthang.jpg', N'ntuyet44@gmail.com            ', 1)
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000030', N'Thanh Xuân Là Để Nhớ', NULL, CAST(N'2021-11-23T00:00:00.000' AS DateTime), N'thanhxuan.jpg', N'ntuyet44@gmail.com            ', 1)
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000001', N'Col0000001')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000002', N'Col0000001')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000003', N'Col0000033')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000003', N'Col0000078')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000004', N'Col0000033')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000004', N'Col0000078')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000005', N'Col0000003')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000005', N'Col0000053')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000005', N'Col0000058')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000006', N'Col0000016')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000007', N'Col0000005')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000008', N'Col0000005')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000009', N'Col0000003')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000010', N'Col0000031')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000010', N'Col0000078')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000011', N'Col0000003')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000011', N'Col0000031')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000011', N'Col0000035')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000012', N'Col0000021')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000013', N'Col0000003')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000014', N'Col0000023')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000015', N'Col0000024')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000016', N'Col0000025')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000017', N'Col0000027')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000018', N'Col0000028')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000019', N'Col0000029')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000020', N'Col0000036')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000021', N'Col0000001')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000022', N'Col0000013')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000023', N'Col0000073')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000024', N'Col0000024')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000024', N'Col0000049')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000024', N'Col0000063')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000025', N'Col0000024')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000025', N'Col0000078')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000026', N'Col0000046')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000026', N'Col0000054')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000027', N'Col0000022')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000027', N'Col0000047')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000028', N'Col0000026')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000028', N'Col0000027')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000029', N'Col0000008')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000029', N'Col0000012')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000030', N'Col0000031')
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000030', N'Col0000062')
GO
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'SG00000001', CAST(N'2021-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'SG00000002', CAST(N'2021-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'SG00000003', CAST(N'2021-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'SG00000004', CAST(N'2021-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'SG00000005', CAST(N'2021-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000021', N'SG00000012', CAST(N'2021-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000021', N'SG00000041', CAST(N'2021-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000021', N'SG00000042', CAST(N'2021-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000021', N'SG00000052', CAST(N'2021-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000021', N'SG00000054', CAST(N'2021-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000022', N'SG00000011', CAST(N'2021-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000022', N'SG00000045', CAST(N'2021-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000022', N'SG00000050', CAST(N'2021-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000022', N'SG00000051', CAST(N'2021-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000023', N'SG00000046', CAST(N'2021-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000023', N'SG00000053', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000023', N'SG00000056', CAST(N'2021-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000023', N'SG00000058', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000023', N'SG00000060', CAST(N'2021-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000024', N'SG00000012', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000024', N'SG00000041', CAST(N'2021-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000024', N'SG00000048', CAST(N'2021-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000024', N'SG00000055', CAST(N'2021-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000025', N'SG00000011', CAST(N'2021-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000025', N'SG00000015', CAST(N'2021-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000025', N'SG00000042', CAST(N'2021-02-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000025', N'SG00000052', CAST(N'2021-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000026', N'SG00000047', CAST(N'2021-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000026', N'SG00000057', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000026', N'SG00000059', CAST(N'2021-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000030', N'SG00000010', CAST(N'2021-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000030', N'SG00000017', CAST(N'2021-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000030', N'SG00000048', CAST(N'2021-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdmin_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000030', N'SG00000052', CAST(N'2021-12-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'PL00000002', CAST(N'2022-01-05T19:49:47.420' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'PL00000003', CAST(N'2022-01-05T15:05:53.903' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'PL00000005', CAST(N'2022-01-05T14:57:04.587' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'PL00000006', CAST(N'2022-01-05T14:59:43.607' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'PL00000007', CAST(N'2022-01-05T14:59:37.183' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'PL00000009', CAST(N'2022-01-05T14:57:05.827' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'PL00000011', CAST(N'2022-01-05T14:57:06.643' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'PL00000013', CAST(N'2022-01-05T14:55:57.363' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'PL00000021', CAST(N'2022-01-05T15:36:36.607' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'PL00000022', CAST(N'2022-01-05T14:59:13.450' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'PL00000025', CAST(N'2022-01-05T16:11:48.010' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'PL00000003', CAST(N'2021-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'PL00000021', CAST(N'2021-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'PL00000025', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'PL00000027', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'PL00000028', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'PL00000029', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'PL00000030', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PlaylistAdminListened] ([AccountName], [PlaylistID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'PL00000022', CAST(N'2021-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdminListened] ([AccountName], [PlaylistID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'PL00000023', CAST(N'2021-04-09T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdminListened] ([AccountName], [PlaylistID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'PL00000024', CAST(N'2021-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdminListened] ([AccountName], [PlaylistID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'PL00000025', CAST(N'2021-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistAdminListened] ([AccountName], [PlaylistID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'PL00000030', CAST(N'2021-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PlaylistUser] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [AccountName], [Image], [isPublic]) VALUES (N'PL00000001', N'Duyên', N'Những cái tên hàng đầu giữ cho ngọn lửa Rock cháy mãi                                                                                                                                                   ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'nam278z01@gmail.com           ', N'duyen.jpg', 0)
INSERT [dbo].[PlaylistUser] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [AccountName], [Image], [isPublic]) VALUES (N'PL0000021 ', N'Nhạc Trung', N'Trước giờ đi ngủ                                                                                                                                                                                        ', CAST(N'2021-02-12T00:00:00.000' AS DateTime), N'ntuyet44@gmail.com            ', N'nhactrung.jpg', 0)
INSERT [dbo].[PlaylistUser] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [AccountName], [Image], [isPublic]) VALUES (N'PL0000022 ', N'Nhạc hot', N'Nghe theo giờ                                                                                                                                                                                           ', CAST(N'2021-02-12T00:00:00.000' AS DateTime), N'ngiang44@gmail.com            ', N'nhachot.jpg', 1)
INSERT [dbo].[PlaylistUser] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [AccountName], [Image], [isPublic]) VALUES (N'PL0000023 ', N'Nhac tiktok', N'Bắt trọn trend                                                                                                                                                                                          ', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'ngiang44@gmail.com            ', N'nhactiktok.jpg', 1)
INSERT [dbo].[PlaylistUser] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [AccountName], [Image], [isPublic]) VALUES (N'PL0000024 ', N'OST Doctor', N'Xem phim không chỉ vì nội dung mà còn vì diễn viên                                                                                                                                                      ', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'ntuyet44@gmail.com            ', N'doctor.jpg', 0)
INSERT [dbo].[PlaylistUser] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [AccountName], [Image], [isPublic]) VALUES (N'PL0000025 ', N'OST Thương ngày nắng về ', N'Phim siêu hay                                                                                                                                                                                           ', CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'ntuyet44@gmail.com            ', N'nangve.jpg', 1)
INSERT [dbo].[PlaylistUser] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [AccountName], [Image], [isPublic]) VALUES (N'PL0000026 ', N'Nhạc tiktok Viet Nam', N'Xu hướng luôn thay đổi                                                                                                                                                                                  ', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'ngiang44@gmail.com            ', N'tiktokviet.jpg', 0)
INSERT [dbo].[PlaylistUser] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [AccountName], [Image], [isPublic]) VALUES (N'PL0000027 ', N'Nhạc buổi sáng', N'Ngày mới vui vẻ                                                                                                                                                                                         ', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'ntuyet44@gmail.com            ', N'binhminh.jpg', 1)
GO
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'3df8503d-a3ce-4abb-a5a6-2cc0120a4e3a', CAST(N'2021-12-29T19:09:14.677' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'6308325f-15f6-4672-8810-213fea9dfb5e', CAST(N'2021-12-24T11:19:30.873' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'SG00000001', CAST(N'2021-12-01T15:26:08.323' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'SG00000002', CAST(N'2021-12-29T19:57:02.710' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'SG00000005', CAST(N'2021-12-14T21:25:25.167' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'SG00000006', CAST(N'2021-12-01T15:26:28.113' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'SG00000007', CAST(N'2021-12-01T00:28:55.110' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'SG00000009', CAST(N'2021-11-21T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'SG00000011', CAST(N'2021-11-21T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL00000001', N'SG00000012', CAST(N'2022-01-05T20:22:33.127' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000021 ', N'SG00000005', CAST(N'2021-12-05T20:01:02.643' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000021 ', N'SG00000056', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000021 ', N'SG00000059', CAST(N'2021-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000022 ', N'SG00000013', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000022 ', N'SG00000014', CAST(N'2021-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000022 ', N'SG00000020', CAST(N'2021-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000022 ', N'SG00000046', CAST(N'2021-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000022 ', N'SG00000054', CAST(N'2021-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000023 ', N'SG00000020', CAST(N'2021-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000023 ', N'SG00000041', CAST(N'2021-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000023 ', N'SG00000048', CAST(N'2021-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000023 ', N'SG00000053', CAST(N'2021-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000023 ', N'SG00000054', CAST(N'2021-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000024 ', N'SG00000005', CAST(N'2021-12-05T20:07:19.523' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000024 ', N'SG00000009', CAST(N'2021-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000024 ', N'SG00000056', CAST(N'2021-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000024 ', N'SG00000057', CAST(N'2021-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000024 ', N'SG00000058', CAST(N'2021-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000024 ', N'SG00000060', CAST(N'2021-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000025 ', N'SG00000005', CAST(N'2021-12-07T22:09:55.067' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000026 ', N'SG00000017', CAST(N'2021-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000026 ', N'SG00000041', CAST(N'2021-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000026 ', N'SG00000044', CAST(N'2021-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000026 ', N'SG00000055', CAST(N'2021-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000027 ', N'SG00000009', CAST(N'2021-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000027 ', N'SG00000016', CAST(N'2021-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000027 ', N'SG00000046', CAST(N'2021-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUser_Song] ([PlaylistID], [SongID], [DateAdded]) VALUES (N'PL0000027 ', N'SG00000056', CAST(N'2021-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PlaylistUserLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'PL0000027 ', CAST(N'2022-01-05T20:05:36.047' AS DateTime))
INSERT [dbo].[PlaylistUserLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'ngiang44@gmail.com            ', N'PL0000024 ', CAST(N'2021-05-08T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUserLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'ngiang44@gmail.com            ', N'PL0000027 ', CAST(N'2021-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUserLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'PL0000021 ', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUserLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'PL0000022 ', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUserLiked] ([AccountName], [PlaylistID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'PL0000023 ', CAST(N'2021-07-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PlaylistUserListened] ([AccountName], [PlaylistID], [DateListened]) VALUES (N'ngiang44@gmail.com            ', N'PL0000023 ', CAST(N'2021-12-14T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUserListened] ([AccountName], [PlaylistID], [DateListened]) VALUES (N'ngiang44@gmail.com            ', N'PL0000024 ', CAST(N'2021-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUserListened] ([AccountName], [PlaylistID], [DateListened]) VALUES (N'ngiang44@gmail.com            ', N'PL0000026 ', CAST(N'2021-12-16T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUserListened] ([AccountName], [PlaylistID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'PL0000023 ', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUserListened] ([AccountName], [PlaylistID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'PL0000024 ', CAST(N'2021-12-28T00:00:00.000' AS DateTime))
INSERT [dbo].[PlaylistUserListened] ([AccountName], [PlaylistID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'PL0000027 ', CAST(N'2021-12-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'3df8503d-a3ce-4abb-a5a6-2cc0120a4e3a', N'Afterglow', N'<p>
</p><div>Stop the clocks, it''s amazing<br>You should see the way the light dances off your head<br>A million colours of hazel, golden and red<br>Saturday morning is fading<br>The sun''s reflected by the coffee in your hand<br>My eyes are caught in your gaze all over again</div><div>We were love drunk, waiting on a miracle<br>Tryna find ourselves in the winter snow<br>So alone in love like the world had disappeared<br>Oh, I won''t be silent and I won''t let go<br>I will hold on tighter ''til the afterglow<br>And we''ll burn so bright ''til the darkness softly clears</div><div>Oh, I will hold on to the afterglow<br>Oh, I will hold on to the afterglow</div><div>The weather outside''s changing<br>The leaves are buried under six inches of white<br>The radio is playing, Iron &amp; Wine<br>This is a new dimension<br>This is a level where we''re losing track of time<br>I''m holding nothing against it, except you and I</div><div>We were love drunk, waiting on a miracle<br>Tryna find ourselves in the winter snow<br>So alone in love like the world had disappeared<br>Oh, I won''t be silent and I won''t let go<br>I will hold on tighter ''til the afterglow<br>And we''ll burn so bright ''til the darkness softly clears</div><div>Oh, I will hold on to the afterglow<br>Oh, I will hold on to the afterglow<br>Oh, I will hold on to the afterglow</div>
<br><p></p>', CAST(N'2021-12-21' AS Date), 2, N'Ed-Sheeran-Afterglow-Studio-Acapella.jpg', N'y2mate.com - Ed Sheeran  Afterglow Official Performance Video.mp3', N'https://www.youtube.com/embed/_NGQfFCFUn4', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'6308325f-15f6-4672-8810-213fea9dfb5e', N'The Man', N'<p>
</p><div>I would be complex<br>I would be cool<br>They''d say I played the ﬁeld before I found someone to commit to<br>And that would be ok<br>For me to do<br>Every conquest I had made would make me more of a boss to you</div><div>I''d be a fearless leader<br>I''d be an alpha type<br>When everyone believes ya<br>What''s that like?</div><div>I''m so sick of running as fast as I can<br>Wondering if I''d get there quicker<br>If I was a man<br>And I''m so sick of them coming at me again<br>''Cause if I was a man<br>Then I''d be the man<br>I''d be the man<br>I''d be the man</div><div>They''d say I hustled<br>Put in the work<br>They wouldn''t shake their heads and question how much of this I deserve<br>What I was wearing<br>If I was rude<br>Could all be separated from my good ideas and power moves?</div><div>And they would toast to me, oh<br>Let the players play<br>I''d be just like Leo<br>In Saint-Tropez</div><div>I''m so sick of running as fast as I can<br>Wondering if I''d get there quicker<br>If I was a man<br>And I''m so sick of them coming at me again<br>''Cause if I was a man<br>Then I''d be the man<br>I''d be the man<br>I''d be the man</div><div>What''s it like to brag about<br>Raking in dollars<br>And getting bitches and models<br>And it''s all good if you''re bad<br>And it''s okay if you''re mad<br>If I was out ﬂashing my dollars<br>I''d be a bitch, not a baller<br>They paint me out to be bad<br>So it''s okay that I''m mad</div><div>I''m so sick of running as fast as I can<br>Wondering if I''d get there quicker if I was a man (you know that)<br>And I''m so sick of them coming at me again (coming at me again)<br>''Cause if I was a man (if I was a man)<br>Then I''d be the man (then I''d be the man)<br>I''m so sick of running as fast as I can (as fast as I can)<br>Wondering if I''d get there quicker if I was a man (hey)<br>And I''m so sick of them coming at me again (coming at me again)<br>''Cause if I was a man (if I was a man), then I''d be the man</div><div>I''d be the man<br>I''d be the man (oh)<br>I''d be the man (yeah)<br>I''d be the man (I''d be the man)</div><div>If I was a man<br>Then I''d be the man</div>
<br><p></p>', CAST(N'2021-12-22' AS Date), 2, N'themantaylor.jpg', N'y2mate.com - Taylor Swift  The Man Official Video.mp3', N'https://www.youtube.com/embed/AqAJLh9wuZ0', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'fa419f15-36f8-4ff7-a36a-6032e228adef', N'That''s what I want', N'', CAST(N'2021-08-18' AS Date), 2, N'thatswhatiwwantlinasx.jpg', N'y2mate.com - Lil Nas X  THATS WHAT I WANT Official Video.mp3', N'https://www.youtube.com/embed/QDYDRA5JPLE', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000001', N'Easy on me', N'[Verse 1]<br>
There ain''t no gold in this river<br>
That I''ve been washin'' my hands in forever<br>
I know there is hope in these waters<br>
But I can''t bring myself to swim<br>
When I am drowning in this silence<br>
Baby, let me in<br><br>
[Chorus]<br>
Go easy on me, baby<br>
I was still a child<br>
Didn''t get the chance to<br>
Feel the world around me<br>
I had no time to choose what I chose to do<br>
So go easy on me<br><br>
[Verse 2]<br>
There ain''t no room for things to change<br>
When we are both so deeply stuck in our ways<br>
You can''t deny how hard I have tried<br>
I changed who I was to put you both first<br>
But now I give up<br>
[Chorus]<br>
Go easy on mе, baby<br>
I was still a child<br>
Didn''t get the chance to<br>
Feel thе world around me<br>
Had no time to choose what I chose to do<br>
So go easy on me<br><br>
[Bridge]<br>
I had good intentions<br>
And the highest hopes<br>
But I know right now<br>
It probably doesn''t even show<br><br>
[Chorus]<br>
Go easy on me, baby<br>
I was still a child<br>
I didn''t get the chance to<br>
Feel the world around me<br>
I had no time to choose what I chose to do<br>
So go easy on me<br>', CAST(N'2021-10-15' AS Date), 2, N'easy-on-me-adele.jpg', N'easy-on-me-adele.mp3', N'https://www.youtube.com/embed/U3ASj1L6_sY', N'AB00000002')
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000002', N'Viva La Vida', N'I used to rule the world<br>
Seas would rise when I gave the word<br>
Now in the morning, I sleep alone<br>
Sweep the streets I used to own<br><br>
I used to roll the dice<br>
Feel the fear in my enemy''s eyes<br>
Listen as the crowd would sing<br>
Now the old king is dead, long live the king<br>
One minute I held the key<br>
Next the walls were closed on me<br>
And I discovered that my castles stand<br>
Upon pillars of salt and pillars of sand<br><br>
I hear Jerusalem bells are ringing<br>
Roman Cavalry choirs are singing<br>
Be my mirror, my sword and shield<br>
My missionaries in a foreign field<br>
For some reason I can''t explain<br>
Once you go there was never, never an honest word<br>
And that was when I ruled the world<br><br>
It was a wicked and wild wind<br>
Blew down the doors to let me in<br>
Shattered windows and the sound of drums<br>
People couldn''t believe what I''d become<br>
Revolutionaries wait<br>
For my head on a silver plate<br>
Just a puppet on a lonely string<br>
Oh, who would ever want to be king?<br><br>
I hear Jerusalem bells are ringing<br>
Roman Calvary choirs are singing<br>
Be my mirror, my sword and shield<br>
My missionaries in a foreign field<br>
For some reason I can''t explain<br>
I know Saint Peter won''t call my name<br>
Never an honest word<br>
But that was when I ruled the world<br><br>
Oh-oh-oh, oh-oh, oh<br>
Oh-oh-oh, oh-oh, oh<br>
Oh-oh-oh, oh-oh, oh<br>
Oh-oh-oh, oh-oh, oh<br>
Oh-oh-oh, oh-oh, oh<br><br>
I hear Jerusalem bells are ringing<br>
Roman Calvary choirs are singing<br>
Be my mirror, my sword and shield<br>
My missionaries in a foreign field<br>
For some reason I can''t explain<br>
I know Saint Peter won''t call my name<br>
Never an honest word<br>
But that was when I ruled the world<br>', CAST(N'2008-04-08' AS Date), 2, N'vivalavida-coldplay.jpg', N'vivalavida-coldplay.mp3', N'https://www.youtube.com/embed/dvgZkm1xWPE', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000003', N'My Universe', N'Bài hát: My Universe - Coldplay, BTS (Bangtan Boys)<br><br>
You, you are my universe and<br>
I just want to put you first<br>
And you, you are my universe, and I<br><br>
In the night I lie and look up at you<br>
When the morning comes I watch you rise<br>
There’s a paradise they couldn’t capture<br>
That bright infinity inside your eyes<br>
Maeil bam nege nalaga (ga)<br>
Kkumilan geosdo ijeun chae<br>
Na useumyeo neoleul manna (na)<br>
Never ending forever baby<br><br>
You, you are my universe and<br>
I just want to put you first<br>
And you, you are my universe, and<br>
You make my world light up inside<br><br>
Eodumi naegen *** pyeonhaesseossji<br>
Gileojin geulimja sogeseo (eyes)<br><br>
And they said that we can’t be together<br>
Because<br>
Because we come from different sides<br><br>
You, you are my universe and<br>
I just want to put you first<br>
And you, you are my universe, and<br>
You make my world light up inside<br><br>
My universe (do do, do do)<br>
My universe (do do, do do)<br>
My universe (do do, do do)<br>
(You make my world)<br>
You make my world light up inside<br>
Make my world light up inside<br><br>
Naleul balghyeojuneun geon<br>
Neolan salangeulo su nohajin byeol<br>
Nae ujuui neon<br>
Tto daleun sesangeul mandeuleo juneun geol<br><br>
Neoneun nae byeolija naui ujunikka<br>
Jigeum i silyeondo gyeolgugen jamsinikka<br>
Neoneun eonjekkajina jigeumcheoleom balggeman bichnajwo<br>
Ulineun neoleul ttala i gin bameul sunoheul geoya<br><br>
Neowa hamkke nalaga (ga)<br>
When I’m without you I’m crazy<br>
Ja eoseo nae soneul jaba (a)<br>
We are made of each other baby<br><br>
You, you are my universe and<br>
I just want to put you first<br>
And you, you are my universe, and<br>
You make my world light up inside<br><br>
My universe (you, you are)<br>
My universe (I just want)<br>
My universe (you, you are)<br>
My universe and I<br>
My universe<br>', CAST(N'2021-09-24' AS Date), 2, N'myuniverse-coldplay.jpg', N'myuniverse-coldplay.mp3', N'https://www.youtube.com/embed/3YqPKLZF_WU', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000004', N'Old Town Road', N'Bài hát: Old Town Road - Lil Nas X<br><br>
Yeah, I''m gonna take my horse to the old town road<br>
I''m gonna ride ''til I can''t no more<br>
I''m gonna take my horse to the old town road<br>
I''m gonna ride ''til I can''t no more (Kio, Kio)<br><br>
I got the horses in the back<br>
Horse tack is attached<br>
Hat is matte black<br>
Got the boots that''s black to match<br>
Ridin'' on a horse, ha<br>
You can whip your Porsche<br>
I been in the valley<br>
You ain''t been up off that porch, now<br><br>
Can''t nobody tell me nothin''<br>
You can''t tell me nothin''<br>
Can''t nobody tell me nothin''<br>
You can''t tell me nothin''<br><br>
Ridin'' on a tractor<br>
Lean all in my bladder<br>
Cheated on my baby<br>
You can go and ask her<br>
My life is a movie<br>
Bull ridin'' and boobies<br>
Cowboy hat from Gucci<br>
Wrangler on my booty<br>
Can''t nobody tell me nothin''<br>
You can''t tell me nothin''<br>
Can''t nobody tell me nothin''<br>
You can''t tell me nothin''<br><br>
Yeah, I''m gonna take my horse to the old town road<br>
I''m gonna ride ''til I can''t no more<br>
I''m gonna take my horse to the old town road<br>
I''m gonna ride ''til I can''t no more<br>
I got the hor<br>', CAST(N'2021-09-24' AS Date), 2, N'oldtownroad-lilnasx.jpg', N'oldtownroad-lilnasx.mp3', N'https://www.youtube.com/embed/r7qovpFAGrQ', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000005', N'Tides', N'[Verse 1]<br>
I have grown up, I am a father now<br>
Everything has changed, but I am still the same somehow<br>
You know I''ve never been afraid of death<br>
But now I wanna see the things that haven''t happened yet<br>
I still love getting out of my mind, I should cut it down<br>
I still know people I don''t like and I should cut them out<br>
I feel embarrassed ''bout the things that I did in my youth<br>
''Cause now I have a child, I know one day that you will do<br><br>
[Pre-Chorus]<br>
Freight cargo, dot stops and aeroplanes<br>
Late-night calls, signal is in and out again<br>
Feelin'' low, serotonin known better days<br>
Go, go, go! But every moment you''re here with me<br><br>
[Chorus]<br>
Timе stops to still<br>
When you are in my arms, it always will<br>
And life, lifе is changin'' tides<br><br>
[Verse 2]<br>
I lost the confidence in who I was<br>
Too busy tryna chase the high and get the numbers up<br>
I have the same dream every night<br>
A bullet through my brain the moment that I close my eyes<br>
I still have to lean on a shoulder when I''ve broken down<br>
And I have people that depend on me to sort them out<br>
I sometimes fantasise I disappear without a trace<br>
I''ve no regrets, but wish I did things in a different way<br>
[Pre-Chorus]<br>
Low fly zone, lawsuits, and film stars<br>
Headline wrote the princess and the face scar<br>
Broken bones, break-ins, and Babylon<br>
Go, go, go! But every moment you''re here with me<br><br>
[Chorus]<br>
Time stops to still<br>
When you are in my arms, it always will<br>
And life, life is changin'' tides<br>
Time stops to still<br>
When you are in my arms, it always will<br>
And life, life is changin'' tides<br>', CAST(N'2021-11-29' AS Date), 2, N'tides-edsheeran.jpg', N'tides-edsheeran.mp3', NULL, NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000006', N'Circles', N'We couldn''t turn around <br>
''Til we were upside down<br>
I''ll be the bad guy now<br>
But no, I ain''t too proud<br><br>
I couldn''t be there<br>
Even when I tried<br>
You don''t believe it<br>
We do this every time<br><br>
Seasons change and our love went cold<br>
Feed the flame ''cause we can''t let it go<br>
Run away, but we''re running in circles<br>
Run away, run away<br><br>
I dare you to do something<br>
I''m waiting on you again<br>
So I don''t take the blame<br>
Run away, but we''re running in circles<br>
Run away, run away, run away<br><br>
Let go<br>
I got a feeling that it''s time to let go<br>
I say so<br>
I knew that this was doomed from the get-go<br><br>
You thought that it was special, special<br>
But it was just the sex though, the sex though<br>
And I still hear the echoes (the echoes)<br>
I got a feeling that it''s time to let it go, let it go<br><br>
Seasons change and our love went cold<br>
Feed the flame ''cause we can''t let it go<br>
Run away, but we''re running in circles<br>
Run away, run away<br><br>
I dare you to do something<br>
I''m waiting on you again<br>
So I don''t take the blame<br>
Run away, but we''re running in circles<br>
Run away, run away, run away<br><br>
Maybe you don''t understand what I''m going through<br>
It''s only me<br>
What you got to lose?<br>
Make up your mind, tell me<br>
What are you gonna do?<br>
It''s only me<br>
Let it go<br><br>
Seasons change and our love went cold<br>
Feed the flame ''cause we can''t let it go<br>
Run away, but we''re running in circles<br>
Run away, run away<br><br>
I dare you to do something<br>
I''m waiting on you again<br>
So I don''t take the blame<br>
Run away, but we''re running in circles<br>
Run away, run away, run away<br>', CAST(N'2021-10-29' AS Date), 2, N'circles-postmalone.jpg', N'Post Malone  Circles.mp3', N'https://www.youtube.com/embed/wXhTHyIgQ_U', N'AB00000001')
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000007', N'All Too Well', N'I walked through the door with you <br>
The air was cold <br>
But something about it felt like home somehow <br>
And I, left my scarf there at your sister''s house <br>
And you''ve still got it in your drawer even now <br> <br>
Oh, your sweet disposition <br>
And my wide-eyed gaze <br>
We''re singing in the car, getting lost upstate <br>
Autumn leaves falling down like pieces into place <br>
And I can picture it after all these days <br> <br>
And I know it''s long gone and that magic''s not here no more <br>
And I might be okay but I''m not fine at all <br> <br>
''Cause there we are again on that little town street <br>
You almost ran the red ''cause you were lookin'' over at me <br>
Wind in my hair, I was there <br>
I remember it all too well <br> <br>
Photo album on the counter <br>
Your cheeks were turning red <br>
You used to be a little kid with glasses in a twin-sized bed <br>
And your mother''s telling stories ''bout you on the tee-ball team <br>
You told me ''bout your past thinking your future was me <br> <br>
And I know it''s long gone and there was nothing else I could do <br>
And I forget about you long enough to forget why I needed to <br> <br>
''Cause there we are again in the middle of the night <br>
We''re dancing ''round the kitchen in the refrigerator light <br>
Down the stairs, I was there <br>
I remember it all too well, yeah <br> <br>
And maybe we got lost in translation <br>
Maybe I asked for too much <br>
But maybe this thing was a masterpiece ''til you tore it all up <br>
Running scared, I was there <br>
I remember it all too well <br> <br>
And you call me up again just to break me like a promise <br>
So casually cruel in the name of being honest <br>
I''m a crumpled up piece of paper lying here <br>
''Cause I remember it all, all, all <br>
Too well <br> <br>
Time won''t fly, it''s like I''m paralyzed by it <br>
I''d like to be my old self again <br>
But I''m still trying to find it <br>
After plaid shirt days and nights when you made me your own <br>
Now you mail back my things and I walk home alone <br>
But you keep my old scarf from that very first week <br>
''Cause it reminds you of innocence <br>
And it smells like me <br>
You can''t get rid of it <br>
''Cause you remember it all too well, yeah <br> <br>
''Cause there we are again when I loved you so <br>
Back before you lost the one real thing you''ve ever known <br>
It was rare, I was there, I remember it all too well <br> <br>
Wind in my hair, you were there, you remember it all <br>
Down the stairs, you were there, you remember it all <br>
It was rare, I was there, I remember it all too well <br>', CAST(N'2021-10-29' AS Date), 2, N'alltoowell-taylorswift.jpg', N'All Too Well - Taylor Swift.mp3', N'https://www.youtube.com/embed/tollGa3S0o8', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000008', N'Chạy ngay đi', NULL, CAST(N'2018-04-12' AS Date), 1, N'Chay_ngay_di.png', N'Chay Ngay Di Run Now_ - Son Tung M-TP_.mp3', N'https://www.youtube.com/embed/32sYGCOYJUM', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000009', N'Love me like you do', NULL, CAST(N'2015-01-22' AS Date), 2, N'Ellie_Goulding_-_Love_Me_Like_You_Do.png', N'Love Me Like You Do - Ellie Goulding.mp3', N'https://www.youtube.com/embed/AJtDXIazrMo', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000010', N'Thằng điên', NULL, CAST(N'2018-10-12' AS Date), 1, N'thang_dien.jpg', N'Thang Dien - JustaTee_ Phuong Ly.mp3', N'https://www.youtube.com/embed/HXkh7EOqcQ4', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000011', N'Đã Lỡ Yêu Em Nhiều', NULL, CAST(N'2017-11-13' AS Date), 1, N'da-lo-yeu-em-nhieu.jpg', N'Da Lo Yeu Em Nhieu - JustaTee.mp3', N'https://www.youtube.com/embed/KhTCatAKVpk', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000012', N'Bùa Yêu', NULL, CAST(N'2018-05-12' AS Date), 1, N'bua-yeu.png', N'BÍCH PHƯƠNG  Bùa Yêu Official MV.mp3', N'https://www.youtube.com/embed/FkOt19CUC30', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000013', N'Hơn cả yêu', NULL, CAST(N'2020-02-11' AS Date), 1, N'honcayeu.jpg', N'HƠN CẢ YÊU  ĐỨC PHÚC  OFFICIAL MUSIC VIDEO.mp3', N'https://www.youtube.com/embed/__kGJZ-kPno', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000014', N'Túy Âm', NULL, CAST(N'2017-08-25' AS Date), 1, N'tuyam.jpg', N'Túy Âm  Xesi x Masew x Nhatnguyen.mp3', NULL, NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000015', N'Đâu chỉ riêng em', NULL, CAST(N'2017-06-17' AS Date), 1, N'dauchiriengem.jpg', N'MỸ TÂM  ĐÂU CHỈ RIÊNG EM MV ONE SHOT CLOSEUP.mp3', N'https://www.youtube.com/embed/ttd3hNNxfZw', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000016', N'Sand In My Boots', NULL, CAST(N'2021-01-08' AS Date), 2, N'sandinmyboots.jpg', N'Morgan Wallen Sand In My Boots The Dangerous Sessions.mp3', N'https://www.youtube.com/embed/FXzE9eP1U_E', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000017', N'Chúng ta của hiện tại', NULL, CAST(N'2020-12-20' AS Date), 1, N'chungtacuahientai.jpg', N'SƠN TÙNG MTP  CHÚNG TA CỦA HIỆN TẠI  OFFICIAL MUSIC VIDEO.mp3', N'https://www.youtube.com/embed/psZ1g9fMfeo', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000018', N'Muộn rồi mà sao còn', NULL, CAST(N'2021-04-17' AS Date), 1, N'muonroimasaocon.jpg', N'SƠN TÙNG MTP  MUỘN RỒI MÀ SAO CÒN  OFFICIAL MUSIC VIDEO.mp3', N'https://www.youtube.com/embed/xypzmu5mMPY', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000019', N'Look what you made me do', NULL, CAST(N'2017-08-28' AS Date), 2, N'lookwhatyoumademedo.jpg', N'Taylor Swift  Look What You Made Me Do.mp3', N'https://www.youtube.com/embed/3tmd-ClpJxA', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000020', N'Shape of you', N'Lời bài hát', CAST(N'2017-01-30' AS Date), 2, N'Shape_of_You_cover.jpg', N'Ed Sheeran  Shape of You Official Music Video.mp3', N'https://www.youtube.com/embed/JGwWNGJdvx8', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000021', N'Sugar', N'Lời bài hát', CAST(N'2015-01-14' AS Date), 2, N'sugar.jpg', N'Maroon 5  Sugar Official Music Video.mp3', N'https://www.youtube.com/watch?v=09R8_2nJtjg&list=RD09R8_2nJtjg&start_radio=1', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000022', N'Hall Of Fame', NULL, CAST(N'2021-07-20' AS Date), 2, N'HallOfFame.jpg', N'The Script  Hall Of Fame Lyrics.p3', N'https://www.youtube.com/watch?v=3Kxf2dHlDpQ&list=RD09R8_2nJtjg&index=2', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000023', N'I''m Yours', N'Lời bài hát', CAST(N'2020-10-14' AS Date), 2, N'I''mYours.jpg', N'Im Yours  Jason Mraz Lyrics', N'https://www.youtube.com/watch?v=NpngifA8iRM&list=RD09R8_2nJtjg&index=4', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000024', N'Lemon Tree', N'Lời bài hát', CAST(N'2020-09-28' AS Date), 2, N'LemonTree.jpg', N'Lemon Tree  Fools Garden Lyrics.mp3', N'https://www.youtube.com/watch?v=l2UiY2wivTs&list=RD09R8_2nJtjg&index=6', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000025', N'Unstoppable', NULL, CAST(N'2020-05-21' AS Date), 2, N'Unstoppable.jpg', N'Sia  Unstoppable Lyrics.mp3', N'https://www.youtube.com/watch?v=h3h035Eyz5A&list=RD09R8_2nJtjg&index=7', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000026', N'So Far Away', NULL, CAST(N'2017-07-12' AS Date), 2, N'SoFarAway.jpg', N'So Far Away Acoustic.mp3', N'https://www.youtube.com/watch?v=hiRqIZcVkv4&list=RD09R8_2nJtjg&index=9', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000027', N'Timber', NULL, CAST(N'2013-11-26' AS Date), 2, N'Timber.jpg', N'Pitbull  Timber ft Keha Official Video.mp3', N'https://www.youtube.com/watch?v=hHUbLv4ThOo&list=RD09R8_2nJtjg&index=10', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000028', N'Con đường bình phàm', NULL, CAST(N'2018-05-29' AS Date), 1, N'conduongbinhpham.jpg', N'ConDuongBinhPham.mp3', N'https://www.youtube.com/watch?v=B0khI4ha4L0', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000029', N'It''s My Life', N'Lời bài hát', CAST(N'2009-06-17' AS Date), 2, N'It''sMyLife.jpg', N'Bon Jovi  Its My Life Official Music Video.mp3', N'https://www.youtube.com/watch?v=vx2u5uUu3DE&list=RD09R8_2nJtjg&index=11', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000030', N'In The End', N'Lời bài hát', CAST(N'2009-10-27' AS Date), 2, N'InTheEnd.jpg', N'In The End Official HD Music Video.mp3', N'https://www.youtube.com/watch?v=eVTXPUF4Oz4&list=RD09R8_2nJtjg&index=12', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000031', N'Way Back Home', NULL, CAST(N'2018-12-07' AS Date), 3, N'WayBackHome.jpg', N'숀 SHAUN  웨이백홈 Way Back Home Lyric Video.mp3', N'https://www.youtube.com/watch?v=amOSaNX7KJg&list=RD09R8_2nJtjg&index=13', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000032', N'Đáp án của bạn', NULL, CAST(N'2019-12-13' AS Date), 1, N'dap-an-cua-ban.jpg', N'Đáp án của bạn  A Nhũng.mp3', N'https://www.youtube.com/watch?v=R-j4Nmu0GMI&list=RD09R8_2nJtjg&index=19', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000033', N'Monsters', NULL, CAST(N'2019-05-03' AS Date), 2, N'Monsters.jpg', N'Monsters  Katie Sky Lyrics  Vietsub.mp3', N'https://www.youtube.com/watch?v=ritnXLZHgmc&list=RD09R8_2nJtjg&index=27', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000034', N'Love Is Gone', NULL, CAST(N'2019-11-14' AS Date), 2, N'LoveIsGone.jpg', N'SLANDER  Love Is Gone ft Dylan Matthew Acoustic.mp3', N'https://www.youtube.com/watch?v=hCrtcVDgCGw&list=RD09R8_2nJtjg&index=27', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000035', N'Let Her Go', NULL, CAST(N'2012-07-26' AS Date), 2, N'LetHerGo.jpg', N'Passenger  Let Her Go Official Video.mp3', N'https://www.youtube.com/watch?v=RBumgq5yVrA&list=RD09R8_2nJtjg&index=27', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000036', N'Take Me To Church', NULL, CAST(N'2020-05-21' AS Date), 2, N'TakeMeToChurch.jpg', N'Take Me To Church  Hozier Lyrics.mp3', N'https://www.youtube.com/watch?v=Td2bsJIaC5M&list=RD09R8_2nJtjg&index=28', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000037', N'Counting Stars', NULL, CAST(N'2021-06-16' AS Date), 2, N'CountingStars.jpg', N'OneRepublic  Counting Stars Extended Radio Edit.mp3', N'https://www.youtube.com/watch?v=eXjeMeNur8o&list=RD09R8_2nJtjg&index=28', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000038', N'Me and My Broken Heart', NULL, CAST(N'2014-03-27' AS Date), 2, N'MeandMyBrokenHeart.jpg', N'Rixton  Me and My Broken Heart Official Video.mp3', N'https://www.youtube.com/watch?v=7JJfJgyHYwU&list=RD09R8_2nJtjg&index=34', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000039', N'Haru Haru', NULL, CAST(N'2008-10-03' AS Date), 3, N'HaruHaru.jpg', N'BIGBANG  HARU HARU하루하루 MV.mp3', N'https://www.youtube.com/watch?v=MzCbEdtNbJ0&list=RD09R8_2nJtjg&index=34', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000040', N'Apologize', NULL, CAST(N'2009-06-17' AS Date), 2, N'Apologize.jpg', N'Timbaland  Apologize ft OneRepublic.mp3', N'https://www.youtube.com/watch?v=ZSM3w1v-A_Y', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000041', N'Chân Tình', NULL, CAST(N'2021-10-23' AS Date), 1, N'chantinh.jpg', N'CHÂN TÌNH.mp3', N'https://www.youtube.com/embed/0awDfoADlnM', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000042', N'Bước Qua Nhau', NULL, CAST(N'2021-10-20' AS Date), 1, N'buocquanhau_vu.jpg', N'Bước qua nhau  Vũ  Video Lyrics  Lofi Chill Music.mp3', N'https://www.youtube.com/embed/ixdSsW5n2rI" title', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000043', N'Đúng Cũng Thành Sai', NULL, CAST(N'2020-09-22' AS Date), 1, N'dungcungthanhsai.jpg', N'MỸ TÂM  ĐÚNG CŨNG THÀNH SAI  OFFICIAL MUSIC VIDEO.mp3', N'https://www.youtube.com/embed/ixdSsW5n2rI" title', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000044', N'You Don''t Know', NULL, CAST(N'2019-03-23' AS Date), 2, N'Youdon''tknow.jpg', N'MV You dont know.mp3', N'https://www.youtube.com/embed/tBu5GFibFfw', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000045', N'Muộn Màng Là Từ Lúc', NULL, CAST(N'2010-09-12' AS Date), 1, N'muonmanglatuluc.jpg', N'MUỘN MÀNG LÀ TỪ LÚC LATE FROM THE BEGINNING  MỸ TÂM  ANIMATION VIDEO.mp3', N'https://www.youtube.com/embed/qEBtvP7P5GE', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000046', N'Celebrity', N'Lời bài hát', CAST(N'2006-02-20' AS Date), 3, N'celebrityui.jpg', N'IU 아이유  Celebrity Easy Lyrics.mp3', N'https://www.youtube.com/embed/azqrYvE6N9g', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000047', N'SomeThing Just Like This', NULL, CAST(N'2018-05-22' AS Date), 2, N'somethingjustlikethis.jpg', N'Lyrics  Vietsub Something Just Like This  Romy Wave Piano Cover.mp3', N'https://www.youtube.com/embed/DVmsjXRndj0', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000048', N'Nụ Cười 18 20', NULL, CAST(N'2020-09-23' AS Date), 1, N'nucuoi1820.jpg', N'Nụ Cười 18 20  Doãn Hiếu Official.mp3', N'https://www.youtube.com/embed/9EwqXZtviTM', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000049', N'Ato Hitotsu', NULL, CAST(N'2017-03-10' AS Date), 2, N'atohitotsu.jpg', N'Ato Hitotsu Một chút nữa thôi.mp3', N'https://www.youtube.com/embed/4SYlLpPB_bs', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000050', N'Tàu Anh Qua Núi', NULL, CAST(N'2011-02-20' AS Date), 1, N'tauanhquanui.jpg', N'Tàu anh qua núi Anh Thơ.mp3', N'https://www.youtube.com/embed/zCg114eXP-Q', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000051', N'Duyên Phận', NULL, CAST(N'2015-02-21' AS Date), 1, N'duyenphan.jpg', N'Duyên Phận Thái Thịnh PBN 99.mp3', N'https://www.youtube.com/embed/ycGfvA1vkR8', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000052', N'Ta Là Của Nhau', NULL, CAST(N'2016-03-21' AS Date), 1, N'talacuanhau.jpg', N'Ta Là Của Nhau  Đông Nhi ft Ông Cao Thắng.mp3', N'https://www.youtube.com/embed/tv0ttp0bS8A', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000053', N'Last ChrisMas', NULL, CAST(N'2009-03-20' AS Date), 2, N'lastchristmas.jpg', N'Last Christmas  George Michael  Wham  Beth Acoustic Piano Cover.mp3', N'https://www.youtube.com/embed/7A1IJqGgaAY', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000054', N'Sài Gòn Đâu Có Lạnh', NULL, CAST(N'2021-10-20' AS Date), 1, N'saigondaucolanh.jpg', N'Sài Gòn đâu có lạnh  Changg x LeWiuy x meChill.mp3', N'https://www.youtube.com/embed/8VncPMehKWs', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000055', N'Một Nhà', NULL, CAST(N'2017-04-02' AS Date), 1, N'motnha.jpg', N'Một Nhà  Da LAB  Official Lyric Video.mp3', N'https://www.youtube.com/embed/TKlXc3iywoM', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000056', N'Aloha', NULL, CAST(N'2016-04-23' AS Date), 2, N'aloha.jpg', N'ALOHACOOL Learning English Lyrics.mp3', N'https://www.youtube.com/embed/Loh0viRPiI0', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000057', N'Cry On My Shoulder', N'Lời bài hát', CAST(N'2010-03-24' AS Date), 2, N'Cryonmyshoulder.jpg', N'CRY ON MY SHOULDER.MP3', N'https://www.youtube.com/embed/F4BVYp1KJSA', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000058', N'Stay With Me', NULL, CAST(N'2018-02-20' AS Date), 2, N'staywithme.jpg', N'Goblin Stay with me MVOST.mp3', N'https://www.youtube.com/embed/op1QYwRAQpI', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000059', N'Muốn Gặp Em', NULL, CAST(N'2020-04-25' AS Date), 2, N'muongapem.jpg', N' muốn gặp em.mp3', N'https://www.youtube.com/embed/_lehN1SDnag', NULL)
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [AlbumID]) VALUES (N'SG00000060', N'Can you hear my heart', N'Lời bài hát', CAST(N'2021-04-12' AS Date), 2, N'canyouhearmyheart.jpg', N'Can you hear my heart  Epik High   FMV  Hae Soo.mp3', N'https://www.youtube.com/embed/y2Mtw6eQCvk', NULL)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000001', N'SG00000001')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000002', N'SG00000002')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000002', N'SG00000003')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000003', N'3df8503d-a3ce-4abb-a5a6-2cc0120a4e3a')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000003', N'SG00000005')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000003', N'SG00000020')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000004', N'fa419f15-36f8-4ff7-a36a-6032e228adef')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000004', N'SG00000004')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000005', N'SG00000014')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000006', N'SG00000012')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000007', N'SG00000010')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000007', N'SG00000011')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000008', N'SG00000008')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000008', N'SG00000017')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000008', N'SG00000018')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000009', N'SG00000013')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000010', N'SG00000015')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000010', N'SG00000043')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000010', N'SG00000045')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000011', N'SG00000003')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000012', N'SG00000006')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000013', N'6308325f-15f6-4672-8810-213fea9dfb5e')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000013', N'SG00000007')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000013', N'SG00000019')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000014', N'SG00000009')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000015', N'SG00000010')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000016', N'SG00000016')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000017', N'SG00000042')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000018', N'SG00000046')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000019', N'SG00000048')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000020', N'SG00000052')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000026', N'SG00000021')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000027', N'SG00000022')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000028', N'SG00000023')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000029', N'SG00000024')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000030', N'SG00000025')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000031', N'SG00000026')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000032', N'SG00000027')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000033', N'SG00000028')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000034', N'SG00000029')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000035', N'SG00000030')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000036', N'SG00000031')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000037', N'SG00000032')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000038', N'SG00000033')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000039', N'SG00000034')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000040', N'SG00000035')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000041', N'SG00000036')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000042', N'SG00000037')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000042', N'SG00000040')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000043', N'SG00000038')
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID]) VALUES (N'AT00000044', N'SG00000039')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'3df8503d-a3ce-4abb-a5a6-2cc0120a4e3a', N'Col0000004')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'6308325f-15f6-4672-8810-213fea9dfb5e', N'Col0000003')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'fa419f15-36f8-4ff7-a36a-6032e228adef', N'Col0000005')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000001', N'Col0000003')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000001', N'Col0000010')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000002', N'Col0000003')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000002', N'Col0000005')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000003', N'Col0000004')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000004', N'Col0000003')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000004', N'Col0000005')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000005', N'Col0000003')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000005', N'Col0000005')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000006', N'Col0000016')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000007', N'Col0000003')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000007', N'Col0000015')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000008', N'Col0000001')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000008', N'Col0000006')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000008', N'Col0000016')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000009', N'Col0000005')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000010', N'Col0000001')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000010', N'Col0000006')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000011', N'Col0000001')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000012', N'Col0000078')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000013', N'Col0000001')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000013', N'Col0000078')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000014', N'Col0000001')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000015', N'Col0000013')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000016', N'Col0000004')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000017', N'Col0000078')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000018', N'Col0000078')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000019', N'Col0000002')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000020', N'Col0000002')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000020', N'Col0000003')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000020', N'Col0000016')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000021', N'Col0000003')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000021', N'Col0000005')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000022', N'Col0000004')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000023', N'Col0000003')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000024', N'Col0000003')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000025', N'Col0000005')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000026', N'Col0000012')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000027', N'Col0000016')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000028', N'Col0000021')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000029', N'Col0000003')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000029', N'Col0000004')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000029', N'Col0000016')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000030', N'Col0000003')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000030', N'Col0000005')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000031', N'Col0000021')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000032', N'Col0000022')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000033', N'Col0000023')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000034', N'Col0000024')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000035', N'Col0000025')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000036', N'Col0000036')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000037', N'Col0000027')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000038', N'Col0000028')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000039', N'Col0000029')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000040', N'Col0000030')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000041', N'Col0000001')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000042', N'Col0000022')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000043', N'Col0000053')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000044', N'Col0000077')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000045', N'Col0000053')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000046', N'Col0000073')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000047', N'Col0000026')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000048', N'Col0000027')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000049', N'Col0000029')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000050', N'Col0000012')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000051', N'Col0000008')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000052', N'Col0000063')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000053', N'Col0000069')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000054', N'Col0000063')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000055', N'Col0000065')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000057', N'Col0000061')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000058', N'Col0000077')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000059', N'Col0000074')
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000060', N'Col0000003')
GO
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'3df8503d-a3ce-4abb-a5a6-2cc0120a4e3a', CAST(N'2022-01-05T18:25:31.847' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'6308325f-15f6-4672-8810-213fea9dfb5e', CAST(N'2022-01-04T16:21:25.243' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'SG00000002', CAST(N'2022-01-04T09:35:23.663' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'SG00000005', CAST(N'2022-01-05T00:01:04.903' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'SG00000007', CAST(N'2022-01-04T09:35:19.233' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'SG00000011', CAST(N'2022-01-05T19:51:20.080' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'SG00000012', CAST(N'2022-01-05T20:22:28.720' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'nam278z01@gmail.com           ', N'SG00000041', CAST(N'2022-01-05T19:52:39.707' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'6308325f-15f6-4672-8810-213fea9dfb5e', CAST(N'2022-01-05T15:37:11.110' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000041', CAST(N'2021-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000043', CAST(N'2021-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000045', CAST(N'2021-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000051', CAST(N'2021-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000052', CAST(N'2021-11-23T00:00:00.000' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000053', CAST(N'2021-11-25T00:00:00.000' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000055', CAST(N'2021-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000056', CAST(N'2021-11-17T00:00:00.000' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000057', CAST(N'2021-11-23T00:00:00.000' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000058', CAST(N'2021-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000060', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[SongListened] ([AccountName], [SongID], [DateListened]) VALUES (N'nam278z01@gmail.com           ', N'6308325f-15f6-4672-8810-213fea9dfb5e', CAST(N'2022-01-06T13:46:18.727' AS DateTime))
INSERT [dbo].[SongListened] ([AccountName], [SongID], [DateListened]) VALUES (N'nam278z01@gmail.com           ', N'SG00000001', CAST(N'2022-01-06T13:48:09.377' AS DateTime))
INSERT [dbo].[SongListened] ([AccountName], [SongID], [DateListened]) VALUES (N'nam278z01@gmail.com           ', N'SG00000004', CAST(N'2022-01-06T13:48:07.180' AS DateTime))
INSERT [dbo].[SongListened] ([AccountName], [SongID], [DateListened]) VALUES (N'nam278z01@gmail.com           ', N'SG00000046', CAST(N'2022-01-06T13:46:26.480' AS DateTime))
INSERT [dbo].[SongListened] ([AccountName], [SongID], [DateListened]) VALUES (N'ngiang44@gmail.com            ', N'SG00000044', CAST(N'2021-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SongListened] ([AccountName], [SongID], [DateListened]) VALUES (N'ngiang44@gmail.com            ', N'SG00000046', CAST(N'2021-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[SongListened] ([AccountName], [SongID], [DateListened]) VALUES (N'ngiang44@gmail.com            ', N'SG00000049', CAST(N'2021-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SongListened] ([AccountName], [SongID], [DateListened]) VALUES (N'ngiang44@gmail.com            ', N'SG00000057', CAST(N'2021-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SongListened] ([AccountName], [SongID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000046', CAST(N'2021-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SongListened] ([AccountName], [SongID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000048', CAST(N'2021-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SongListened] ([AccountName], [SongID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000053', CAST(N'2021-12-09T00:00:00.000' AS DateTime))
INSERT [dbo].[SongListened] ([AccountName], [SongID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000058', CAST(N'2021-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SongListened] ([AccountName], [SongID], [DateListened]) VALUES (N'ntuyet44@gmail.com            ', N'SG00000060', CAST(N'2021-12-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000001', N'Nguyễn Nam', 1, N'nam278z01@gmail.com', N'0328731170     ')
INSERT [dbo].[User] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000002', N'Nguyễn Nam', 1, N'nam278z01vip@gmail.com', NULL)
INSERT [dbo].[User] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000003', N'Thái Bình An', 1, N'binhanvio@gmail.com', N'0983001432     ')
INSERT [dbo].[User] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000004', N'Nguyễn Thị Tuyết', 0, N'ntuyet44@gmail.com', N'0395897920     ')
INSERT [dbo].[User] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000010', N'Đặng Vân Anh', 0, N'vananh@gmail.com', N'               ')
INSERT [dbo].[User] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000011', N'Thu Huyền', 0, N'anhuyen@gmail.com', N'0913824123     ')
INSERT [dbo].[User] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000012', N'Thu Giang', 0, N'ngiang44@gmail.com', N'0924735462     ')
GO
SET IDENTITY_INSERT [dbo].[View] ON 

INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (1, 1312, N'SG00000001', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (2, 12300, N'SG00000041', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (3, 10934, N'SG00000042', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (4, 2479, N'SG00000050', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (5, 5769, N'SG00000044', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (6, 12789, N'SG00000060', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (7, 34570, N'SG00000058', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (8, 6570, N'SG00000020', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (9, 12300, N'SG00000041', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (10, 10934, N'SG00000042', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (11, 2479, N'SG00000050', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (12, 5769, N'SG00000044', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (13, 12789, N'SG00000060', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (14, 34570, N'SG00000058', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (15, 6570, N'SG00000020', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (17, 1234, N'SG00000001', CAST(N'2021-11-29' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (19, 5464, N'SG00000041', CAST(N'2021-11-29' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (20, 1245, N'SG00000043', CAST(N'2021-11-29' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (22, 6783, N'SG00000020', CAST(N'2021-11-29' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (23, 3245, N'SG00000044', CAST(N'2021-11-29' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (24, 4233, N'SG00000044', CAST(N'2021-11-28' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (26, 1234, N'SG00000058', CAST(N'2021-11-29' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (27, 2, N'SG00000001', CAST(N'2022-01-04' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (28, 6, N'3df8503d-a3ce-4abb-a5a6-2cc0120a4e3a', CAST(N'2022-01-06' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (29, 4, N'6308325f-15f6-4672-8810-213fea9dfb5e', CAST(N'2022-01-06' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (30, 1, N'SG00000007', CAST(N'2022-01-06' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (31, 7, N'SG00000013', CAST(N'2022-01-06' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (32, 2, N'SG00000010', CAST(N'2022-01-06' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (33, 184384, N'SG00000039', CAST(N'2022-01-04' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (34, 842312, N'SG00000046', CAST(N'2022-01-04' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (35, 1983223, N'SG00000056', CAST(N'2022-01-04' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (36, 1938353, N'SG00000057', CAST(N'2022-01-05' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (37, 123432, N'SG00000046', CAST(N'2022-01-05' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (38, 9834623, N'SG00000060', CAST(N'2022-01-05' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (39, 1902343, N'SG00000039', CAST(N'2022-01-05' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (40, 192843, N'SG00000048', CAST(N'2022-01-05' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (41, 1773435, N'SG00000052', CAST(N'2022-01-05' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (42, 918327, N'SG00000055', CAST(N'2022-01-05' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (43, 924354, N'SG00000055', CAST(N'2022-01-05' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (44, 209284, N'SG00000048', CAST(N'2022-01-04' AS Date))
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (45, 1898342, N'SG00000052', CAST(N'2022-01-04' AS Date))
SET IDENTITY_INSERT [dbo].[View] OFF
GO
ALTER TABLE [dbo].[AccountAdmin]  WITH CHECK ADD  CONSTRAINT [FK_PersonID_AccountAdmin] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Admin] ([PersonID])
GO
ALTER TABLE [dbo].[AccountAdmin] CHECK CONSTRAINT [FK_PersonID_AccountAdmin]
GO
ALTER TABLE [dbo].[AccountUser]  WITH CHECK ADD  CONSTRAINT [FK_PersonID_AccountUser] FOREIGN KEY([PersonID])
REFERENCES [dbo].[User] ([PersonID])
GO
ALTER TABLE [dbo].[AccountUser] CHECK CONSTRAINT [FK_PersonID_AccountUser]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_ArtistID_Album] FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artist] ([ArtistID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_ArtistID_Album]
GO
ALTER TABLE [dbo].[AlbumLiked]  WITH CHECK ADD  CONSTRAINT [FK_AccountName_AlbumLiked] FOREIGN KEY([AccountName])
REFERENCES [dbo].[AccountUser] ([AccountName])
GO
ALTER TABLE [dbo].[AlbumLiked] CHECK CONSTRAINT [FK_AccountName_AlbumLiked]
GO
ALTER TABLE [dbo].[AlbumLiked]  WITH CHECK ADD  CONSTRAINT [FK_AlbumID_AlbumLiked] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([AlbumID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AlbumLiked] CHECK CONSTRAINT [FK_AlbumID_AlbumLiked]
GO
ALTER TABLE [dbo].[AlbumListened]  WITH CHECK ADD  CONSTRAINT [FK_AccountName_AlbumListened] FOREIGN KEY([AccountName])
REFERENCES [dbo].[AccountUser] ([AccountName])
GO
ALTER TABLE [dbo].[AlbumListened] CHECK CONSTRAINT [FK_AccountName_AlbumListened]
GO
ALTER TABLE [dbo].[AlbumListened]  WITH CHECK ADD  CONSTRAINT [FK_AlbumID_AlbumListened] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([AlbumID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AlbumListened] CHECK CONSTRAINT [FK_AlbumID_AlbumListened]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_AccountName_Comment] FOREIGN KEY([AccountName])
REFERENCES [dbo].[AccountUser] ([AccountName])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_AccountName_Comment]
GO
ALTER TABLE [dbo].[PlaylistAdmin]  WITH CHECK ADD  CONSTRAINT [FK_AccountName_PlaylistAdmin] FOREIGN KEY([AccountName])
REFERENCES [dbo].[AccountAdmin] ([AccountName])
GO
ALTER TABLE [dbo].[PlaylistAdmin] CHECK CONSTRAINT [FK_AccountName_PlaylistAdmin]
GO
ALTER TABLE [dbo].[PlaylistAdmin_Collection]  WITH CHECK ADD  CONSTRAINT [FK_CollectionID_PlaylistAdmin_Collection] FOREIGN KEY([CollectionID])
REFERENCES [dbo].[Collection] ([CollectionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistAdmin_Collection] CHECK CONSTRAINT [FK_CollectionID_PlaylistAdmin_Collection]
GO
ALTER TABLE [dbo].[PlaylistAdmin_Collection]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistID_PlaylistAdmin_Collection] FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[PlaylistAdmin] ([PlaylistID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistAdmin_Collection] CHECK CONSTRAINT [FK_PlaylistID_PlaylistAdmin_Collection]
GO
ALTER TABLE [dbo].[PlaylistAdmin_Song]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistID_PlaylistAdmin_Song] FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[PlaylistAdmin] ([PlaylistID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistAdmin_Song] CHECK CONSTRAINT [FK_PlaylistID_PlaylistAdmin_Song]
GO
ALTER TABLE [dbo].[PlaylistAdmin_Song]  WITH CHECK ADD  CONSTRAINT [FK_SongID_PlaylistAdmin_Song] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistAdmin_Song] CHECK CONSTRAINT [FK_SongID_PlaylistAdmin_Song]
GO
ALTER TABLE [dbo].[PlaylistAdminLiked]  WITH CHECK ADD  CONSTRAINT [FK_AccountName_PlaylistAdminLiked] FOREIGN KEY([AccountName])
REFERENCES [dbo].[AccountUser] ([AccountName])
GO
ALTER TABLE [dbo].[PlaylistAdminLiked] CHECK CONSTRAINT [FK_AccountName_PlaylistAdminLiked]
GO
ALTER TABLE [dbo].[PlaylistAdminLiked]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistID_PlaylistAdminLiked] FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[PlaylistAdmin] ([PlaylistID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistAdminLiked] CHECK CONSTRAINT [FK_PlaylistID_PlaylistAdminLiked]
GO
ALTER TABLE [dbo].[PlaylistAdminListened]  WITH CHECK ADD  CONSTRAINT [FK_AccountName_PlaylistAdminListened] FOREIGN KEY([AccountName])
REFERENCES [dbo].[AccountUser] ([AccountName])
GO
ALTER TABLE [dbo].[PlaylistAdminListened] CHECK CONSTRAINT [FK_AccountName_PlaylistAdminListened]
GO
ALTER TABLE [dbo].[PlaylistAdminListened]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistID_PlaylistAdminListened] FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[PlaylistAdmin] ([PlaylistID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistAdminListened] CHECK CONSTRAINT [FK_PlaylistID_PlaylistAdminListened]
GO
ALTER TABLE [dbo].[PlaylistUser]  WITH CHECK ADD  CONSTRAINT [FK_AccountName_PlaylistUser] FOREIGN KEY([AccountName])
REFERENCES [dbo].[AccountUser] ([AccountName])
GO
ALTER TABLE [dbo].[PlaylistUser] CHECK CONSTRAINT [FK_AccountName_PlaylistUser]
GO
ALTER TABLE [dbo].[PlaylistUser_Song]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistID_PlaylistUser_Song] FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[PlaylistUser] ([PlaylistID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistUser_Song] CHECK CONSTRAINT [FK_PlaylistID_PlaylistUser_Song]
GO
ALTER TABLE [dbo].[PlaylistUser_Song]  WITH CHECK ADD  CONSTRAINT [FK_SongID_PlaylistUser_Song] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistUser_Song] CHECK CONSTRAINT [FK_SongID_PlaylistUser_Song]
GO
ALTER TABLE [dbo].[PlaylistUserLiked]  WITH CHECK ADD  CONSTRAINT [FK_AccountName_PlaylistUserLiked] FOREIGN KEY([AccountName])
REFERENCES [dbo].[AccountUser] ([AccountName])
GO
ALTER TABLE [dbo].[PlaylistUserLiked] CHECK CONSTRAINT [FK_AccountName_PlaylistUserLiked]
GO
ALTER TABLE [dbo].[PlaylistUserLiked]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistID_PlaylistUserLiked] FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[PlaylistUser] ([PlaylistID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistUserLiked] CHECK CONSTRAINT [FK_PlaylistID_PlaylistUserLiked]
GO
ALTER TABLE [dbo].[PlaylistUserListened]  WITH CHECK ADD  CONSTRAINT [FK_AccountName_PlaylistUserListened] FOREIGN KEY([AccountName])
REFERENCES [dbo].[AccountUser] ([AccountName])
GO
ALTER TABLE [dbo].[PlaylistUserListened] CHECK CONSTRAINT [FK_AccountName_PlaylistUserListened]
GO
ALTER TABLE [dbo].[PlaylistUserListened]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistID_PlaylistUserListened] FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[PlaylistUser] ([PlaylistID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistUserListened] CHECK CONSTRAINT [FK_PlaylistID_PlaylistUserListened]
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD  CONSTRAINT [FK_AlbumID_Song] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([AlbumID])
GO
ALTER TABLE [dbo].[Song] CHECK CONSTRAINT [FK_AlbumID_Song]
GO
ALTER TABLE [dbo].[Song_Artist]  WITH CHECK ADD  CONSTRAINT [FK_ArtistID_Song_Artist] FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artist] ([ArtistID])
GO
ALTER TABLE [dbo].[Song_Artist] CHECK CONSTRAINT [FK_ArtistID_Song_Artist]
GO
ALTER TABLE [dbo].[Song_Artist]  WITH CHECK ADD  CONSTRAINT [FK_SongID_Artist_Song] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Song_Artist] CHECK CONSTRAINT [FK_SongID_Artist_Song]
GO
ALTER TABLE [dbo].[Song_Collection]  WITH CHECK ADD  CONSTRAINT [FK_CollectionID_Song_Collection] FOREIGN KEY([CollectionID])
REFERENCES [dbo].[Collection] ([CollectionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Song_Collection] CHECK CONSTRAINT [FK_CollectionID_Song_Collection]
GO
ALTER TABLE [dbo].[Song_Collection]  WITH CHECK ADD  CONSTRAINT [FK_SongID_Collection_Song] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Song_Collection] CHECK CONSTRAINT [FK_SongID_Collection_Song]
GO
ALTER TABLE [dbo].[SongLiked]  WITH CHECK ADD  CONSTRAINT [FK_AccountName_SongLiked] FOREIGN KEY([AccountName])
REFERENCES [dbo].[AccountUser] ([AccountName])
GO
ALTER TABLE [dbo].[SongLiked] CHECK CONSTRAINT [FK_AccountName_SongLiked]
GO
ALTER TABLE [dbo].[SongLiked]  WITH CHECK ADD  CONSTRAINT [FK_SongID_SongLiked] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SongLiked] CHECK CONSTRAINT [FK_SongID_SongLiked]
GO
ALTER TABLE [dbo].[SongListened]  WITH CHECK ADD  CONSTRAINT [FK_AccountName_SongListened] FOREIGN KEY([AccountName])
REFERENCES [dbo].[AccountUser] ([AccountName])
GO
ALTER TABLE [dbo].[SongListened] CHECK CONSTRAINT [FK_AccountName_SongListened]
GO
ALTER TABLE [dbo].[SongListened]  WITH CHECK ADD  CONSTRAINT [FK_SongID_SongListened] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SongListened] CHECK CONSTRAINT [FK_SongID_SongListened]
GO
ALTER TABLE [dbo].[View]  WITH CHECK ADD  CONSTRAINT [FK__SongID_View] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[View] CHECK CONSTRAINT [FK__SongID_View]
GO
/****** Object:  StoredProcedure [dbo].[AddAlbum]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[AddAlbum] (
	@jsonAlbum nvarchar(max)
)
AS
BEGIN
	SET XACT_ABORT ON;
	set nocount on;
    BEGIN TRAN;
	BEGIN TRY
		INSERT INTO Album
			([AlbumID],
			[AlbumName],
			[Description],
			[Image],
			[ArtistID],
			[ReleasedDate])
		SELECT 
			[AlbumID],
			[AlbumName],
			[Description],
			[Image],
			[ArtistID],
			[ReleasedDate]
		FROM OPENJSON(@jsonAlbum)
		WITH (
			[AlbumID] [varchar](50),
			[AlbumName] [nvarchar](50),
			[Description] [nvarchar](max),
			[Image] [varchar](50),
			[ArtistID][varchar](50),
			[ReleasedDate] [date]
		)
		
	END TRY
	BEGIN CATCH
		select ERROR_MESSAGE();
	END CATCH
	COMMIT TRAN;
END
GO
/****** Object:  StoredProcedure [dbo].[AddPlaylistAdmin]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddPlaylistAdmin] (
	@jsonPlaylist nvarchar(max)
)
AS
BEGIN
	SET XACT_ABORT ON;
	set nocount on;
    BEGIN TRAN;
	BEGIN TRY
		DECLARE @PlaylistID varchar(50)
		SET @PlaylistID = (SELECT *
						FROM OPENJSON(@jsonPlaylist)
						WITH (
							[PlaylistID] [varchar](50)
		))
		INSERT INTO PlaylistAdmin 
			([PlaylistID],
			[PlaylistName],
			[Description],
			[DateCreated],
			[Image],
			[AccountName],
			[isPublic])
		SELECT 
			[PlaylistID],
			[PlaylistName],
			[Description],
			[DateCreated],
			[Image],
			[AccountName],
			[isPublic]
		FROM OPENJSON(@jsonPlaylist)
		WITH (
			[PlaylistID] [varchar](50),
			[PlaylistName] [nvarchar](50),
			[Description] [nvarchar](200),
			[DateCreated] [date],
			[Image] [nvarchar](200),
			[AccountName] [char](30),
			[isPublic] [bit]
		)
		INSERT INTO PlaylistAdmin_Collection 
			([PlaylistID],
			[CollectionID])
		SELECT 
			[PlaylistID] = @PlaylistID,
			[CollectionID]
		FROM OPENJSON(@jsonPlaylist, '$.Collections')
		WITH (
			[CollectionID] varchar(50)
		)
		INSERT INTO PlaylistAdmin_Song
			([PlaylistID],
			[SongID],
			[DateAdded])
		SELECT 
			[PlaylistID] = @PlaylistID,
			[SongID],
			[DateAdded]
		FROM OPENJSON(@jsonPlaylist, '$.Songs')
		WITH (
			[SongID] varchar(50),
			[DateAdded] [date]
		)
	END TRY
	BEGIN CATCH
		select ERROR_MESSAGE();
	END CATCH
	COMMIT TRAN;
END
GO
/****** Object:  StoredProcedure [dbo].[AddSong]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddSong] (
	@jsonSong nvarchar(max)
)
AS
BEGIN
	SET XACT_ABORT ON;
	set nocount on;
    BEGIN TRAN;
	BEGIN TRY
		INSERT INTO Song 
			([SongID],
			[SongName],
			[Lyric],
			[ReleaseDate],
			[Nation],
			[Image],
			[SongPath],
			[MV],
			[AlbumID])
		SELECT 
			[SongID],
			[SongName],
			[Lyric],
			[ReleaseDate],
			[Nation],
			[Image],
			[SongPath],
			[MV],
			[AlbumID]
		FROM OPENJSON(@jsonSong)
		WITH (
			[SongID] [varchar](50),
			[SongName] [nvarchar](50),
			[Lyric] [nvarchar](max),
			[ReleaseDate] [date],
			[Nation] [int],
			[Image] [nvarchar](200),
			[SongPath] [nvarchar](200),
			[MV] [nvarchar](200),
			[AlbumID] [varchar](50)
		)

		INSERT INTO Song_Collection 
			([SongID],
			[CollectionID])
		SELECT 
			[SongID],
			[CollectionID]
		FROM OPENJSON(@jsonSong, '$.Collections')
		WITH (
			[SongID] varchar(50),
			[CollectionID] varchar(50)
		)

		INSERT INTO Song_Artist 
			([SongID],
			[ArtistID])
		SELECT 
			[SongID],
			[ArtistID]
		FROM OPENJSON(@jsonSong, '$.Artists')
		WITH (
			[SongID] varchar(50),
			[ArtistID] varchar(50)
		)
	END TRY
	BEGIN CATCH
		select ERROR_MESSAGE();
	END CATCH
	COMMIT TRAN;
END
GO
/****** Object:  StoredProcedure [dbo].[CheckAccountAM]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CheckAccountAM]
(
	@AccountName char(30),
	@Password char(20)
)
as
begin
	select ac.*,u.PersonName, u.Gender, u.Email, u.Phone from AccountAdmin as ac left join [Admin] u on ac.PersonID = u.PersonID
	where ac.AccountName=@AccountName and ac.Password=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[EditAlbum]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EditAlbum] (
	@jsonAlbum nvarchar(max)
)
AS
BEGIN
	SET XACT_ABORT ON;
	set nocount on;
    BEGIN TRAN;
	BEGIN TRY
	UPDATE Album
		SET AlbumName = s.[AlbumName],
			[Description] = s.[Description],
			[Image] = s.[Image],
			[ArtistID] = s.[ArtistID],
			[ReleasedDate] = s.[ReleasedDate]
		FROM 
			OPENJSON(@jsonAlbum)
			WITH (
				[AlbumID] [varchar](50),
			[AlbumName] [nvarchar](50),
			[Description] [nvarchar](max),
			[Image] [varchar](50),
			[ArtistID][varchar](50),
			[ReleasedDate] [date]
			) as s
		WHERE Album.AlbumID = s.AlbumID
	END TRY
	BEGIN CATCH
		select ERROR_MESSAGE();
	END CATCH
	COMMIT TRAN;
END
GO
/****** Object:  StoredProcedure [dbo].[EditPlaylistAdmin]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditPlaylistAdmin] (
	@jsonPlaylistAM nvarchar(max)
)
AS
BEGIN
	SET XACT_ABORT ON;
	set nocount on;
    BEGIN TRAN;
	BEGIN TRY
		DECLARE @PlaylistID varchar(50)
		SET @PlaylistID = (SELECT * 
						FROM OPENJSON(@jsonPlaylistAM)
						WITH (
							[PlaylistID] [varchar](50)
		))
		UPDATE PlaylistAdmin
		SET PlaylistName = p.[PlaylistName],
			[Description] = p.[Description],
			[DateCreated] = p.[DateCreated],
			[Image] = p.[Image],
			[AccountName] = p.[AccountName],
			[isPublic] = p.[isPublic]
		FROM 
			OPENJSON(@jsonPlaylistAM)
			WITH (
				[PlaylistID] [varchar](50),
				[PlaylistName] [nvarchar](50),
				[Description] [nvarchar](200),
				[DateCreated] [date],
				[Image] [nvarchar](200),
				[AccountName] [char](30),
				[isPublic] [bit]
			) as p
		WHERE PlaylistAdmin.PlaylistID = p.PlaylistID

		SELECT 
			[CollectionID],
			[status]
		INTO #Col
		FROM OPENJSON(@jsonPlaylistAM, '$.Collections')
		WITH (
			[CollectionID] varchar(50),
			[status] int
		) as c

		INSERT INTO PlaylistAdmin_Collection
			([PlaylistID],
			[CollectionID])
		SELECT 
			[PlaylistID] = @PlaylistID,
			c.[CollectionID]
		FROM #Col c
		WHERE c.[status] = 0

		DELETE FROM  PlaylistAdmin_Collection
		WHERE CollectionID in
			(SELECT CollectionID
			FROM #Col c
			WHERE c.[status] = 2)
		
		DROP TABLE #Col

		SELECT 
			[SongID],
			[DateAdded],
			[status]
		INTO #AT
		FROM OPENJSON(@jsonPlaylistAM, '$.Songs')
		WITH (
			[SongID] varchar(50),
			[DateAdded] [date],
			[status] int
		) as c

		INSERT INTO PlaylistAdmin_Song 
			([PlaylistID],
			[SongID],
			[DateAdded])
		SELECT 
			[PlaylistID] = @PlaylistID,
			a.[SongID],
			a.[DateAdded]
		FROM #AT a
		WHERE a.[status] = 0

		DELETE FROM  PlaylistAdmin_Song
		WHERE [SongID] in
			(SELECT [SongID]
			FROM #AT a
			WHERE a.[status] = 2)
		
		DROP TABLE #AT
	END TRY
	BEGIN CATCH
		select ERROR_MESSAGE();
	END CATCH
	COMMIT TRAN;
END
GO
/****** Object:  StoredProcedure [dbo].[EditSong]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditSong] (
	@jsonSong nvarchar(max)
)
AS
BEGIN
	SET XACT_ABORT ON;
	set nocount on;
    BEGIN TRAN;
	BEGIN TRY
		UPDATE Song
		SET SongName = s.[SongName],
			[Lyric] = s.[Lyric],
			[ReleaseDate] = s.[ReleaseDate],
			[Nation] = s.[Nation],
			[Image] = s.[Image],
			[SongPath] = s.[SongPath],
			[MV] = s.[MV],
			[AlbumID] = s.[AlbumID]
		FROM 
			OPENJSON(@jsonSong)
			WITH (
				[SongID] [varchar](50),
				[SongName] [nvarchar](50),
				[Lyric] [nvarchar](max),
				[ReleaseDate] [date],
				[Nation] [int],
				[Image] [nvarchar](200),
				[SongPath] [nvarchar](200),
				[MV] [nvarchar](200),
				[AlbumID] [varchar](50)
			) as s
		WHERE Song.SongID = s.SongID

		SELECT 
			[SongID],
			[CollectionID],
			[status]
		INTO #Col
		FROM OPENJSON(@jsonSong, '$.Collections')
		WITH (
			[SongID] varchar(50),
			[CollectionID] varchar(50),
			[status] int
		) as c

		INSERT INTO Song_Collection 
			([SongID],
			[CollectionID])
		SELECT 
			c.[SongID],
			c.[CollectionID]
		FROM #Col c
		WHERE c.[status] = 0

		DELETE FROM  Song_Collection
		WHERE CollectionID in
			(SELECT CollectionID
			FROM #Col c
			WHERE c.[status] = 2)
		
		DROP TABLE #Col

		SELECT 
			[SongID],
			[ArtistID],
			[status]
		INTO #AT
		FROM OPENJSON(@jsonSong, '$.Artists')
		WITH (
			[SongID] varchar(50),
			[ArtistID] varchar(50),
			[status] int
		) as c

		INSERT INTO Song_Artist 
			([SongID],
			[ArtistID])
		SELECT 
			a.[SongID],
			a.[ArtistID]
		FROM #AT a
		WHERE a.[status] = 0

		DELETE FROM  Song_Artist 
		WHERE [ArtistID] in
			(SELECT [ArtistID]
			FROM #AT a
			WHERE a.[status] = 2)
		
		DROP TABLE #AT
	END TRY
	BEGIN CATCH
		select ERROR_MESSAGE();
	END CATCH
	COMMIT TRAN;
END
GO
/****** Object:  StoredProcedure [dbo].[Get10AlbumsRandom]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Get10AlbumsRandom](
	@accountName char(20)
)
as
	begin
		SELECT TOP 10 al.AlbumID, al.AlbumName, al.[Image], a.ArtistID, a.ArtistName
		INTO #Results
		FROM Album al inner join Artist a on al.ArtistID = a.ArtistID
		ORDER BY NEWID()

		if(@accountName = '')
		begin
			SELECT s.*, Liked = 0
			FROM #Results s
		end
		else
		begin
			SELECT s.*,
				case when exists ( SELECT * 
									FROM AlbumLiked al 
									WHERE  s.AlbumID = al.AlbumID and al.AccountName = @accountName ) then 1
					else 0 end as Liked
			FROM #Results s
		end

		DROP TABLE #Results
	end
GO
/****** Object:  StoredProcedure [dbo].[Get10PlaylistsNewest]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Get10PlaylistsNewest](
	@accountName char(20)
)
AS
	BEGIN
		SELECT TOP 10 pl.*, ad.PersonName
		INTO #Results
		FROM PlaylistAdmin pl inner join AccountAdmin acd on acd.AccountName = pl.AccountName
							  inner join [Admin] ad on acd.PersonID = ad.PersonID
		WHERE pl.isPublic = 1
		ORDER BY pl.DateCreated DESC

		if(@accountName = '')
		begin
			SELECT *, Liked = 0
			FROM #Results s
		end
		else
		begin
			SELECT *,
					case when exists ( SELECT * 
									   FROM PlaylistAdminLiked plal 
									   WHERE s.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked
			FROM #Results s
		end

		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[Get10PlaylistsRandom]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Get10PlaylistsRandom](
	@accountName char(20)
)
AS
	BEGIN
		SELECT TOP 10 pl.*, ad.PersonName
		INTO #Results
		FROM PlaylistAdmin pl inner join AccountAdmin acd on acd.AccountName = pl.AccountName
							  inner join [Admin] ad on acd.PersonID = ad.PersonID
		WHERE pl.isPublic = 1
		ORDER BY NEWID()

		if(@accountName = '')
		begin
			SELECT *, Liked = 0
			FROM #Results s
		end
		else
		begin
			SELECT *,
					case when exists ( SELECT * 
									   FROM PlaylistAdminLiked plal 
									   WHERE s.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked
			FROM #Results s
		end

		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[Get10PlaylistsRandomCollection]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Get10PlaylistsRandomCollection](
	@accountName char(20),
	@collectionID char(10),
	@playlistID char(10)
)
AS
	BEGIN
		SELECT TOP 10 pl.*, ad.PersonName
		INTO #Results
		FROM ( SELECT pl.* 
			   FROM PlaylistAdmin pl inner join PlaylistAdmin_Collection plc on pl.PlaylistID = plc.PlaylistID
			   WHERE plc.CollectionID = @collectionID and pl.PlaylistID != @playlistID ) as pl
				inner join AccountAdmin acd on acd.AccountName = pl.AccountName
				inner join [Admin] ad on acd.PersonID = ad.PersonID
		WHERE pl.isPublic = 1
		ORDER BY NEWID()

		if(@accountName = '')
		begin
			SELECT *, Liked = 0
			FROM #Results s
		end
		else
		begin
			SELECT *,
					case when exists ( SELECT * 
									   FROM PlaylistAdminLiked plal 
									   WHERE s.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked
			FROM #Results s
		end

		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[Get10SongsNewest]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Get10SongsNewest](
	@accountName char(20)
)
as
begin
select  s.SongID as 'Song.SongID',
		s.SongName as 'Song.SongName',
		s.Lyric as 'Song.Lyric',
		s.ReleaseDate as 'Song.ReleaseDate',
		s.Nation as 'Song.Nation',
		s.[Image] as 'Song.Image',
		s.SongPath as 'Song.SongPath',
		s.MV as 'Song.MV',
		case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
		sum(ISNULL([Views], 0)) as [Views],
		(
			SELECT a.ArtistID, a.ArtistName, a.[Image]
			FROM (SELECT *
				  FROM Song_Artist sa
				  WHERE sa.SongID = s.SongID) as san
				  inner join Artist a on san.ArtistID = a.ArtistID
			for json path
		) as Artists
from (select top 10 s.*
	  from Song s
	  ORDER BY s.ReleaseDate DESC) as s
	  left join [View] v on s.SongID = v.SongID
group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
		 s.[Image], s.SongPath, s.MV, s.AlbumID
ORDER BY s.ReleaseDate DESC
for json path
end
GO
/****** Object:  StoredProcedure [dbo].[Get10SongsRandom]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Get10SongsRandom](
	@accountName char(30)
)
as
begin
select  s.SongID as 'Song.SongID',
		s.SongName as 'Song.SongName',
		s.Lyric as 'Song.Lyric',
		s.ReleaseDate as 'Song.ReleaseDate',
		s.Nation as 'Song.Nation',
		s.[Image] as 'Song.Image',
		s.SongPath as 'Song.SongPath',
		s.MV as 'Song.MV',
		case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
		sum(ISNULL([Views], 0)) as [Views],
		(
			SELECT a.ArtistID, a.ArtistName, a.[Image]
			FROM (SELECT *
				  FROM Song_Artist sa
				  WHERE sa.SongID = s.SongID) as san
				  inner join Artist a on san.ArtistID = a.ArtistID
			for json path
		) as Artists
from (select top 10 s.*
	  from Song s
	  ORDER BY NEWID()) as s
	  left join [View] v on s.SongID = v.SongID
group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
		 s.[Image], s.SongPath, s.MV, s.AlbumID
for json path
end
GO
/****** Object:  StoredProcedure [dbo].[Get10SongsRandomCollection]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Get10SongsRandomCollection](
	@accountName char(30),
	@collectionID varchar(50),
	@songID varchar(50)
)
as
begin
select  s.SongID as 'Song.SongID',
		s.SongName as 'Song.SongName',
		s.Lyric as 'Song.Lyric',
		s.ReleaseDate as 'Song.ReleaseDate',
		s.Nation as 'Song.Nation',
		s.[Image] as 'Song.Image',
		s.SongPath as 'Song.SongPath',
		s.MV as 'Song.MV',
		case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
		sum(ISNULL([Views], 0)) as [Views],
		(
			SELECT a.ArtistID, a.ArtistName, a.[Image]
			FROM (SELECT *
				  FROM Song_Artist sa
				  WHERE sa.SongID = s.SongID) as san
				  inner join Artist a on san.ArtistID = a.ArtistID
			for json path
		) as Artists
from (SELECT top 10 sn.*
	  FROM (select s.*
			from Song s inner join Song_Collection sc on s.SongID = sc.SongID
			where sc.CollectionID = @collectionID) as sn
			Where sn.SongID != @songID
			ORDER BY NEWID()) as s
	  left join [View] v on s.SongID = v.SongID
group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
		 s.[Image], s.SongPath, s.MV, s.AlbumID
for json path
end
GO
/****** Object:  StoredProcedure [dbo].[Get3RankSongsofWeek]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Get3RankSongsofWeek](
	@accountName char(30),
	@quantity int,
	@week int,
	@year int
)
as
begin
select s.SongID, s.Nation,
	DATEPART ( ISO_WEEK, [Date] ) as [Week],
    ROW_NUMBER() OVER (PARTITION BY s.Nation ORDER BY  sum(isnull([Views], 0)) DESC) as [Rank]
into #Result
from Song s inner join [View] v on v.SongID = s.SongID
where year([Date]) = @year
group by s.SongID, DATEPART (ISO_WEEK, [Date]), s.Nation
having DATEPART ( ISO_WEEK, [Date] ) = @week

select *
into #Result2
from #Result
where [Rank] between 1 and @quantity
drop table #Result 

select  s.SongID as 'Song.SongID',
		s.SongName as 'Song.SongName',
		s.Lyric as 'Song.Lyric',
		s.ReleaseDate as 'Song.ReleaseDate',
		s.Nation as 'Song.Nation',
		s.[Image] as 'Song.Image',
		s.SongPath as 'Song.SongPath',
		s.MV as 'Song.MV',
		case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
		sum(ISNULL([Views], 0)) as [Views],
		(
			SELECT a.ArtistID, a.ArtistName, a.[Image]
			FROM (SELECT *
				  FROM Song_Artist sa
				  WHERE sa.SongID = s.SongID) as san
				  inner join Artist a on san.ArtistID = a.ArtistID
			for json path
		) as Artists,
		RT.[Week] as 'RankDetail.Week',
		RT.[Rank] as 'RankDetail.RankCurrent'
from (select *
	  from #Result2 s
	  where s.Nation = 1) as RT
	  inner join Song s on RT.SongID = s.SongID
	  left join [View] v on s.SongID = v.SongID
group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
		 s.[Image], s.SongPath, s.MV, s.AlbumID, RT.SongID, RT.[Week], RT.[Rank]
order by RT.[Rank]
for json path

select  s.SongID as 'Song.SongID',
		s.SongName as 'Song.SongName',
		s.Lyric as 'Song.Lyric',
		s.ReleaseDate as 'Song.ReleaseDate',
		s.Nation as 'Song.Nation',
		s.[Image] as 'Song.Image',
		s.SongPath as 'Song.SongPath',
		s.MV as 'Song.MV',
		case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
		sum(ISNULL([Views], 0)) as [Views],
		(
			SELECT a.ArtistID, a.ArtistName, a.[Image]
			FROM (SELECT *
				  FROM Song_Artist sa
				  WHERE sa.SongID = s.SongID) as san
				  inner join Artist a on san.ArtistID = a.ArtistID
			for json path
		) as Artists,
		RT.[Week] as 'RankDetail.Week',
		RT.[Rank] as 'RankDetail.RankCurrent'
from (select *
	  from #Result2 s
	  where s.Nation = 2) as RT
	  inner join Song s on RT.SongID = s.SongID
	  left join [View] v on s.SongID = v.SongID
group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
		 s.[Image], s.SongPath, s.MV, s.AlbumID, RT.SongID, RT.[Week], RT.[Rank]
order by RT.[Rank]
for json path

select  s.SongID as 'Song.SongID',
		s.SongName as 'Song.SongName',
		s.Lyric as 'Song.Lyric',
		s.ReleaseDate as 'Song.ReleaseDate',
		s.Nation as 'Song.Nation',
		s.[Image] as 'Song.Image',
		s.SongPath as 'Song.SongPath',
		s.MV as 'Song.MV',
		case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
		sum(ISNULL([Views], 0)) as [Views],
		(
			SELECT a.ArtistID, a.ArtistName, a.[Image]
			FROM (SELECT *
				  FROM Song_Artist sa
				  WHERE sa.SongID = s.SongID) as san
				  inner join Artist a on san.ArtistID = a.ArtistID
			for json path
		) as Artists,
		RT.[Week] as 'RankDetail.Week',
		RT.[Rank] as 'RankDetail.RankCurrent'
from (select *
	  from #Result2 s
	  where s.Nation = 3) as RT
	  inner join Song s on RT.SongID = s.SongID
	  left join [View] v on s.SongID = v.SongID
group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
		 s.[Image], s.SongPath, s.MV, s.AlbumID, RT.SongID, RT.[Week], RT.[Rank]
order by RT.[Rank]
for json path

drop table #Result2 
end
GO
/****** Object:  StoredProcedure [dbo].[GetAlbumDetail]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAlbumDetail](
	@albumID varchar(50),
	@accountName char(30)
)
as
begin
	select a.AlbumID as 'Album.AlbumID',
		   a.AlbumName as 'Album.AlbumName',
		   a.[Description] as 'Album.Description',
		   a.[Image] as 'Album.Image',
		   a.ArtistID as 'Album.ArtistID',
		   a.ReleasedDate as 'Album.ReleasedDate',
		   ar.ArtistID as 'Artits.ArtistID',
		   ar.ArtistName as 'Artits.ArtistName',
		   ar.[Image] as 'Artits.Image',
		case when exists ( SELECT * 
							FROM AlbumLiked al 
							WHERE  a.AlbumID = al.AlbumID and al.AccountName = @accountName ) then 1
					else 0 end as Liked,
			 count(al.AlbumID) as TotalLikes,
			 (
				select  s.SongID as 'Song.SongID',
						s.SongName as 'Song.SongName',
						s.Lyric as 'Song.Lyric',
						s.ReleaseDate as 'Song.ReleaseDate',
						s.Nation as 'Song.Nation',
						s.[Image] as 'Song.Image',
						s.SongPath as 'Song.SongPath',
						s.MV as 'Song.MV',
						s.isVip as 'Song.isVip',
						case when sl.AccountName = @accountName then 1
							 else 0
						end as Liked,
						sum(ISNULL([Views], 0)) as [Views]
				from (select s.*
					  from Song s
					  where s.AlbumID = a.AlbumID) as s
					  left join SongLiked sl on s.SongID = sl.SongID
					  left join [View] v on s.SongID = v.SongID
				group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
					s.[Image], s.SongPath, s.MV, s.isVip, s.AlbumID, sl.AccountName
				for json path
			 ) as Songs
	from Album a left join AlbumLiked al on a.AlbumID = al.AlbumID
		inner join Artist ar on a.ArtistID = ar.ArtistID
	where a.AlbumID = @albumID
	group by a.AlbumID,a.AlbumName,a.[Description],a.[Image], a.ArtistID, a.ReleasedDate,
		   ar.ArtistID,
		   ar.ArtistName,
		   ar.[Image],al.AccountName,
		   ar.ArtistID,
		   ar.ArtistName,
		   ar.[Image]
	for json path, WITHOUT_ARRAY_WRAPPER 
end
GO
/****** Object:  StoredProcedure [dbo].[GetAlbumNation]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetAlbumNation] (@nation int, @albumID varchar(50))
as 
begin 
	select a.*,ar.ArtistName from  Album a inner join Artist  ar on a.ArtistID=ar.ArtistID 
	where ar.Nation=@nation and a.AlbumID != @albumID
for json path 
end
GO
/****** Object:  StoredProcedure [dbo].[GetAlbumsByArtist]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAlbumsByArtist](
	@pageIndex int,
	@pageSize int,
	@artistID varchar(50),
	@accountName char(30)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT al.AlbumID, al.AlbumName, al.[Image], a.ArtistID, a.ArtistName, ROW_NUMBER() OVER (ORDER BY al.ReleasedDate DESC) AS RowNum
		INTO #Results
		FROM Album al inner join Artist a on al.ArtistID = a.ArtistID
		WHERE al.ArtistID = @artistID

		SELECT COUNT(*) AS totalCount
		FROM #Results

		if(@accountName = '')
		begin
			SELECT s.*, Liked = 0
			FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End
		end
		else
		begin
			SELECT s.*,
					case when exists ( SELECT * 
									FROM AlbumLiked al 
									WHERE  s.AlbumID = al.AlbumID and al.AccountName = @accountName ) then 1
					else 0 end as Liked
			FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End
		end

		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetAlbumsForMana]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAlbumsForMana]
as
begin
	select a.AlbumID as 'AlbumID',
		   a.AlbumName as 'AlbumName',
		   a.[Description] as 'Description',
		   a.[Image] as 'Image',
		   a.ArtistID as 'ArtistID',
		   a.ReleasedDate as 'ReleasedDate',
		   ar.ArtistID as 'Artist.ArtistID',
		   ar.ArtistName as 'Artist.ArtistName',
		   ar.[Image] as 'Artist.Image',
		   count(al.AlbumID) as TotalLikes,
		   (
				select s.SongID as 'SongID',
				s.SongName as 'SongName',
				s.[Image] as 'Image',
				s.AlbumID as 'AlbumID',
			   (
					SELECT a.ArtistID, a.ArtistName, a.[Image]
					FROM (SELECT *
						  FROM Song_Artist sa
						  WHERE sa.SongID = s.SongID) as san
						  inner join Artist a on san.ArtistID = a.ArtistID
					for json path
				) as Artists
				from (select s.*
					from Song s
					where s.AlbumID = a.AlbumID) as s
				for json path
			) as [Songs]
	from Album a left join AlbumLiked al on a.AlbumID = al.AlbumID
		inner join Artist ar on a.ArtistID = ar.ArtistID
	group by a.AlbumID,a.AlbumName,a.[Description],a.[Image], a.ArtistID, a.ReleasedDate,
		   ar.ArtistID,
		   ar.ArtistName,
		   ar.[Image]
	for json path
end
GO
/****** Object:  StoredProcedure [dbo].[GetAlbumsGenresArtistsForManaSong]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAlbumsGenresArtistsForManaSong]
as
begin
	select a.AlbumID as 'AlbumID',
		   a.AlbumName as 'AlbumName',
		   a.[Image] as 'ALImage',
		   ar.ArtistID as 'ArtistID',
		   ar.ArtistName as 'ArtistName',
		   ar.[Image] as 'ATImage'
	from Album a inner join Artist ar on a.ArtistID = ar.ArtistID
	for json path
	select c.CollectionID,
		   c.CollectionName
	from [Collection] c
	where c.KindofCollection = 1
	for json path
	select ar.ArtistID,
		   ar.ArtistName,
		   ar.[Image]
	from Artist ar
	for json path
end
GO
/****** Object:  StoredProcedure [dbo].[GetAlbumsLiked]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAlbumsLiked](
	@pageIndex int,
	@pageSize int,
	@accountName char(30)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT al.AlbumID, al.AlbumName, al.[Image], a.ArtistID, a.ArtistName, ROW_NUMBER() OVER (ORDER BY ald.DateLiked DESC) AS RowNum
		INTO #Results
		FROM Album al inner join Artist a on al.ArtistID = a.ArtistID
					  inner join AlbumLiked ald on al.AlbumID = ald.AlbumID
		WHERE ald.AccountName = @accountName

		SELECT COUNT(*) AS totalCount
		FROM #Results

		if(@accountName = '')
		begin
			SELECT s.*, Liked = 0
			FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End
		end
		else
		begin
			SELECT s.*,
					case when exists ( SELECT * 
									FROM AlbumLiked al 
									WHERE  s.AlbumID = al.AlbumID and al.AccountName = @accountName ) then 1
					else 0 end as Liked
			FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End
		end

		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetAlbumsListened]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAlbumsListened](
	@pageIndex int,
	@pageSize int,
	@accountName char(30)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT al.AlbumID, al.AlbumName, al.[Image], a.ArtistID, a.ArtistName, ROW_NUMBER() OVER (ORDER BY ald.DateListened DESC) AS RowNum
		INTO #Results
		FROM Album al inner join Artist a on al.ArtistID = a.ArtistID
					  inner join AlbumListened ald on al.AlbumID = ald.AlbumID
		WHERE ald.AccountName = @accountName

		SELECT COUNT(*) AS totalCount
		FROM #Results

		if(@accountName = '')
		begin
			SELECT s.*, Liked = 0
			FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End
		end
		else
		begin
			SELECT s.*,
					case when exists ( SELECT * 
									FROM AlbumLiked al 
									WHERE  s.AlbumID = al.AlbumID and al.AccountName = @accountName ) then 1
					else 0 end as Liked
			FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End
		end

		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetAlbumsNewAHot]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAlbumsNewAHot](
	@pageIndex int,
	@pageSize int,
	@time int,
	@accountName char(30)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT al.AlbumID, al.AlbumName, al.[Image], al.ReleasedDate, a.ArtistID, a.ArtistName, sum(ISNULL([Views], 0)) as [Views]
		INTO #Results0
		FROM Album al inner join Artist a on al.ArtistID = a.ArtistID
					  left join Song s on al.AlbumID = s.AlbumID
					  left join [View] v on s.SongID = v.SongID
		WHERE al.ReleasedDate <= GetDate() and al.ReleasedDate >= dateadd(day, @time, getdate())
		group by al.AlbumID, al.AlbumName, al.[Image], al.ReleasedDate, a.ArtistID, a.ArtistName

		SELECT s.*, ROW_NUMBER() OVER (ORDER BY s.[Views] DESC, s.ReleasedDate DESC) AS RowNum
		INTO #Results
		FROM #Results0 s
		DROP TABLE #Results0

		SELECT COUNT(*) AS totalCount
		FROM #Results

		if(@accountName = '')
		begin
			SELECT s.*, Liked = 0
			FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End
		end
		else
		begin
			SELECT s.*,
					case when exists ( SELECT * 
									FROM AlbumLiked al 
									WHERE  s.AlbumID = al.AlbumID and al.AccountName = @accountName ) then 1
					else 0 end as Liked
			FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End
		end

		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetAlbumsPage]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAlbumsPage](
	@pageIndex int,
	@pageSize int,
	@nation int,
	@accountName char(30)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT al.AlbumID, al.AlbumName, al.[Image], a.ArtistID, a.ArtistName, ROW_NUMBER() OVER (ORDER BY al.ReleasedDate DESC) AS RowNum
		INTO #Results
		FROM Album al inner join Artist a on al.ArtistID = a.ArtistID
		WHERE a.Nation = @Nation

		SELECT COUNT(*) AS totalCount
		FROM #Results

		if(@accountName = '')
		begin
			SELECT s.*, Liked = 0
			FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End
		end
		else
		begin
			SELECT s.*,
					case when exists ( SELECT * 
									FROM AlbumLiked al 
									WHERE  s.AlbumID = al.AlbumID and al.AccountName = @accountName ) then 1
					else 0 end as Liked
			FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End
		end

		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetAlbumsSearch]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAlbumsSearch](
	@pageIndex int,
	@pageSize int,
	@textSearch nvarchar(100),
	@accountName char(30)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT al.AlbumID, al.AlbumName, al.[Image], al.ArtistID, ROW_NUMBER() OVER (ORDER BY KEY_TBL.RANK DESC) AS RowNum, KEY_TBL.RANK
		INTO #Results
		FROM Album al INNER JOIN FREETEXTTABLE (Album, AlbumName, @textSearch) AS KEY_TBL ON al.AlbumID = KEY_TBL.[KEY]

		SELECT COUNT(*) AS totalCount
		FROM #Results

		if(@accountName = '')
		begin
			SELECT s.*, a.ArtistName, Liked = 0
			FROM #Results s inner join Artist a on s.ArtistID = a.ArtistID
			WHERE s.RowNum BETWEEN @Start AND @End
		end
		else
		begin
			SELECT s.*, a.ArtistName,
					case when exists ( SELECT * 
									FROM AlbumLiked al 
									WHERE  s.AlbumID = al.AlbumID and al.AccountName = @accountName ) then 1
					else 0 end as Liked
			FROM #Results s inner join Artist a on s.ArtistID = a.ArtistID
			WHERE s.RowNum BETWEEN @Start AND @End
		end
		
		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetArtistDetail]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetArtistDetail](@artistID nvarchar (50))
as 
begin 
	select
	 ar.ArtistID ,
		   ar.ArtistName ,
		   ar.[Description] ,
		   ar.[Image] ,
		   ar.ImageBig,
		   ar.Nation ,
		   ar.GenderorisBand
		   from Artist ar where ar.ArtistID=@artistID
		   for json path, WITHOUT_ARRAY_WRAPPER
		   end
GO
/****** Object:  StoredProcedure [dbo].[GetArtistForMana]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetArtistForMana]
 as 
 begin 
 select a.*from Artist  a
 for json path 
 end
GO
/****** Object:  StoredProcedure [dbo].[GetArtistPageForMana]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GetArtistPageForMana]
	(@PageIndex INT, @pageSize INT, @artistName nvarchar(100))
AS
BEGIN
	DECLARE	@RecordCount INT;
	SELECT * INTO #Results FROM Artist
	where (ArtistName='') or (ArtistName like '%' +@artistName+'%')
	select * from #Results ORDER BY ArtistID OFFSET @PageSize * (@PageIndex -1)
	ROWS FETCH NEXT @PageSize ROW ONLY;
	SELECT count(*) as totalCount FROM Artist;
	DROP TABLE #Results
END
GO
/****** Object:  StoredProcedure [dbo].[GetArtistsHot]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetArtistsHot](
	@pageIndex int,
	@pageSize int,
	@time int,
	@genderorband int
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT a.ArtistID, a.ArtistName, a.[Image], sum(ISNULL([Views], 0)) as [Views]
		INTO #Results0
		FROM Artist a inner join Song_Artist sa on a.ArtistID = sa.ArtistID
					  left join [View] v on v.SongID = sa.SongID
		WHERE v.[Date] <= GetDate() and v.[Date] >= dateadd(day, @time, getdate()) and a.GenderorisBand = @genderorband
		GROUP BY a.ArtistID, a.ArtistName, a.[Image]

		SELECT s.*, ROW_NUMBER() OVER (ORDER BY s.[Views] DESC) AS RowNum
		INTO #Results
		FROM #Results0 s
		DROP TABLE #Results0

		SELECT COUNT(*) AS totalCount
		FROM #Results

		SELECT *
		FROM #Results
		WHERE #Results.RowNum BETWEEN @Start AND @End
		
		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetArtistSongForAlbumMana]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetArtistSongForAlbumMana]
as
begin
	select a.ArtistID, a.ArtistName, a.[Image]
	from Artist a
	for json path

	select  s.SongID as 'SongID',
		s.SongName as 'SongName',
		s.[Image] as 'Image',
		s.AlbumID as 'AlbumID',
		(
			SELECT a.ArtistID, a.ArtistName, a.[Image]
			FROM (SELECT *
				  FROM Song_Artist sa
				  WHERE sa.SongID = s.SongID) as san
				  inner join Artist a on san.ArtistID = a.ArtistID
			for json path
		) as Artists
		from Song  as s
		for json path
end
GO
/****** Object:  StoredProcedure [dbo].[GetArtistsPage]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetArtistsPage](
	@pageIndex int,
	@pageSize int,
	@nation int,
	@genderorband int
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT a.ArtistID, a.ArtistName, a.[Image], ROW_NUMBER() OVER (ORDER BY a.ArtistID) AS RowNum
		INTO #Results
		FROM Artist a
		WHERE a.Nation = @Nation and a.GenderorisBand = @genderorband

		SELECT COUNT(*) AS totalCount
		FROM #Results

		SELECT *
		FROM #Results
		WHERE #Results.RowNum BETWEEN @Start AND @End
		
		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetArtistsSearch]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[GetArtistsSearch](
	@pageIndex int,
	@pageSize int,
	@textSearch nvarchar(100)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT a.ArtistID, a.ArtistName, a.[Image], ROW_NUMBER() OVER (ORDER BY KEY_TBL.RANK DESC) AS RowNum, KEY_TBL.RANK
		INTO #Results
		FROM Artist a INNER JOIN FREETEXTTABLE (Artist, ArtistName, @textSearch) AS KEY_TBL ON a.ArtistID = KEY_TBL.[KEY]

		SELECT COUNT(*) AS totalCount
		FROM #Results

		SELECT *
		FROM #Results
		WHERE #Results.RowNum BETWEEN @Start AND @End
		
		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetCollectionsSongsForManaPlaylistAdmin]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCollectionsSongsForManaPlaylistAdmin]
as
begin
	select c.CollectionID,
		   c.CollectionName,
		   c.KindofCollection 
	from [Collection] c
	for json path
	select  s.SongID as 'SongID',
		s.SongName as 'SongName',
		s.[Image] as 'Image',
		(
			SELECT a.ArtistID, a.ArtistName, a.[Image]
			FROM (SELECT *
				  FROM Song_Artist sa
				  WHERE sa.SongID = s.SongID) as san
				  inner join Artist a on san.ArtistID = a.ArtistID
			for json path
		) as Artists
		from Song  as s
		for json path
end
GO
/****** Object:  StoredProcedure [dbo].[GetLikedSong]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetLikedSong] (
	@pageIndex int,
	@pageSize int,
	@accountName char(30)
)
as
begin
	DECLARE @Start int, @End int
	SET @Start = @pageSize * (@pageIndex - 1) + 1
	SET @End = @Start + @pageSize - 1

	SELECT s.*, sl.DateLiked, ROW_NUMBER() OVER (ORDER BY sl.DateLiked DESC) AS RowNum
	INTO #Results
	FROM Song s inner join SongLiked sl on s.SongID = sl.SongID
	WHERE sl.AccountName = @accountName

					  
	SELECT COUNT(*) AS totalCount
	FROM #Results s

	select  s.SongID as 'Song.SongID',
			s.SongName as 'Song.SongName',
			s.Lyric as 'Song.Lyric',
			s.ReleaseDate as 'Song.ReleaseDate',
			s.Nation as 'Song.Nation',
			s.[Image] as 'Song.Image',
			s.SongPath as 'Song.SongPath',
			s.MV as 'Song.MV',
			case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
			sum(ISNULL([Views], 0)) as [Views],
			(
				SELECT a.ArtistID, a.ArtistName, a.[Image]
				FROM (SELECT *
					  FROM Song_Artist sa
					  WHERE sa.SongID = s.SongID) as san
					  inner join Artist a on san.ArtistID = a.ArtistID
				for json path
			) as Artists
	from (select s.*
		  from #Results s
		  WHERE s.RowNum BETWEEN @Start AND @End) as s
		  left join [View] v on s.SongID = v.SongID
	group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
			 s.[Image], s.SongPath, s.MV, s.AlbumID, s.DateLiked
	order by s.DateLiked DESC
	for json path

	DROP TABLE #Results
end
GO
/****** Object:  StoredProcedure [dbo].[GetListenedSong]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetListenedSong] (
	@pageIndex int,
	@pageSize int,
	@accountName char(30)
)
as
begin
	DECLARE @Start int, @End int
	SET @Start = @pageSize * (@pageIndex - 1) + 1
	SET @End = @Start + @pageSize - 1

	SELECT s.*, sl.DateListened, ROW_NUMBER() OVER (ORDER BY sl.DateListened DESC) AS RowNum
	INTO #Results
	FROM Song s inner join SongListened sl on s.SongID = sl.SongID
	WHERE sl.AccountName = @accountName

					  
	SELECT COUNT(*) AS totalCount
	FROM #Results s

	select  s.SongID as 'Song.SongID',
			s.SongName as 'Song.SongName',
			s.Lyric as 'Song.Lyric',
			s.ReleaseDate as 'Song.ReleaseDate',
			s.Nation as 'Song.Nation',
			s.[Image] as 'Song.Image',
			s.SongPath as 'Song.SongPath',
			s.MV as 'Song.MV',
			case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
			sum(ISNULL([Views], 0)) as [Views],
			(
				SELECT a.ArtistID, a.ArtistName, a.[Image]
				FROM (SELECT *
					  FROM Song_Artist sa
					  WHERE sa.SongID = s.SongID) as san
					  inner join Artist a on san.ArtistID = a.ArtistID
				for json path
			) as Artists
	from (select s.*
		  from #Results s
		  WHERE s.RowNum BETWEEN @Start AND @End) as s
		  left join [View] v on s.SongID = v.SongID
	group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
			 s.[Image], s.SongPath, s.MV, s.AlbumID, s.DateListened
	order by s.DateListened DESC
	for json path

	DROP TABLE #Results
end
GO
/****** Object:  StoredProcedure [dbo].[GetPlaylistAdminwithSongs]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPlaylistAdminwithSongs](
	@accountName char(30),
	@playlistAdminID varchar(50)
)
as
begin

select pl.PlaylistID as 'PlaylistAdmin.PlaylistID',
	   pl.PlaylistName as 'PlaylistAdmin.PlaylistName',
	   pl.[Description] as 'PlaylistAdmin.Description',
	   pl.DateCreated as 'PlaylistAdmin.DateCreated',
	   pl.[Image] as 'PlaylistAdmin.Image',
	   acd.AccountName as 'Admin.AccountName',
	   ad.PersonName as 'Admin.PersonName',
	   case when exists ( SELECT * 
						FROM PlaylistAdminLiked plal 
						WHERE pl.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked,
	   count(pl.PlaylistID) as [TotalLikes],
	   (
			SELECT c.CollectionID, c.CollectionName
			FROM (SELECT *
				  FROM PlaylistAdmin_Collection plc
				  WHERE plc.PlaylistID = pl.PlaylistID) as plcn
				  inner join [Collection] c on c.CollectionID = plcn.CollectionID
			for json path
		) as [Collections],
	   (
			select  s.SongID as 'Song.SongID',
			s.SongName as 'Song.SongName',
			s.Lyric as 'Song.Lyric',
			s.ReleaseDate as 'Song.ReleaseDate',
			s.Nation as 'Song.Nation',
			s.[Image] as 'Song.Image',
			s.SongPath as 'Song.SongPath',
			s.MV as 'Song.MV',
			case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
			sum(ISNULL([Views], 0)) as [Views],
			(
				SELECT a.ArtistID, a.ArtistName, a.[Image]
				FROM (SELECT *
					  FROM Song_Artist sa
					  WHERE sa.SongID = s.SongID) as san
					  inner join Artist a on san.ArtistID = a.ArtistID
				for json path
			) as Artists
			from (select s.*
				from Song s inner join PlaylistAdmin_Song pls on s.SongID = pls.SongID
				where pls.PlaylistID = pl.PlaylistID) as s
				left join [View] v on s.SongID = v.SongID
			group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
					s.[Image], s.SongPath, s.MV, s.isVip, s.AlbumID
			for json path
	   ) as [Songs]
from (select *
	  from PlaylistAdmin pl
	  where pl.PlaylistID = @playlistAdminID and pl.isPublic = 1) as pl
	  inner join AccountAdmin acd on acd.AccountName = pl.AccountName
	  inner join [Admin] ad on acd.PersonID = ad.PersonID
	  inner join PlaylistAdminLiked plal on pl.PlaylistID = plal.PlaylistID 
group by pl.PlaylistID, pl.PlaylistName, pl.[Description], pl.DateCreated, pl.[Image], acd.AccountName,ad.PersonName
for json path, WITHOUT_ARRAY_WRAPPER
end
GO
/****** Object:  StoredProcedure [dbo].[GetPlaylistLiked]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPlaylistLiked](
	@pageIndex int,
	@pageSize int,
	@accountName char(30)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT pl.PlaylistID, pl.PlaylistName, pl.[Image], pl.isPublic, pl.AccountName, ad.PersonName, KindofPlaylist = 1,
				case when exists ( SELECT * 
									FROM PlaylistAdminLiked plal 
									WHERE pl.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
				else 0 end as Liked
		INTO #Results11
		FROM PlaylistAdmin pl inner join AccountAdmin acu on acu.AccountName = pl.AccountName
									inner join [Admin] ad on acu.PersonID = ad.PersonID
									inner join PlaylistAdminLiked ald on pl.PlaylistID = ald.PlaylistID
		WHERE pl.isPublic = 1 and ald.AccountName = @accountName

		SELECT pl.PlaylistID, pl.PlaylistName, pl.[Image], pl.isPublic, pl.AccountName, u.PersonName, KindofPlaylist = 2,
				case when exists ( SELECT * 
									FROM PlaylistUserLiked plal 
									WHERE pl.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
				else 0 end as Liked
		INTO #Results21
		FROM PlaylistUser pl inner join AccountUser acu on acu.AccountName = pl.AccountName
								inner join [User] u on acu.PersonID = u.PersonID
								inner join PlaylistUserLiked ald on pl.PlaylistID = ald.PlaylistID
		WHERE pl.isPublic = 1 and pl.AccountName != @accountName and ald.AccountName = @accountName
		
		SELECT *, ROW_NUMBER() OVER (ORDER BY pn.KindofPlaylist) AS RowNum
		INTO #Results0
		FROM (SELECT * FROM #Results11
				UNION ALL
				SELECT * FROM #Results21) AS pn
	
		DROP TABLE #Results11
		DROP TABLE #Results21

		SELECT COUNT(*) AS totalCount
		FROM #Results0

		SELECT * FROM #Results0 s
		WHERE s.RowNum BETWEEN @Start AND @End

		DROP TABLE #Results0
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPlaylistListened]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPlaylistListened](
	@pageIndex int,
	@pageSize int,
	@accountName char(30)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT pl.PlaylistID, pl.PlaylistName, pl.[Image], pl.isPublic, pl.AccountName, ad.PersonName, KindofPlaylist = 1,
				case when exists ( SELECT * 
									FROM PlaylistAdminLiked plal 
									WHERE pl.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
				else 0 end as Liked
		INTO #Results11
		FROM PlaylistAdmin pl inner join AccountAdmin acu on acu.AccountName = pl.AccountName
									inner join [Admin] ad on acu.PersonID = ad.PersonID
									inner join PlaylistAdminListened ald on pl.PlaylistID = ald.PlaylistID
		WHERE pl.isPublic = 1 and ald.AccountName = @accountName

		SELECT pl.PlaylistID, pl.PlaylistName, pl.[Image], pl.isPublic, pl.AccountName, u.PersonName, KindofPlaylist = 2,
				case when exists ( SELECT * 
									FROM PlaylistUserLiked plal 
									WHERE pl.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
				else 0 end as Liked
		INTO #Results21
		FROM PlaylistUser pl inner join AccountUser acu on acu.AccountName = pl.AccountName
								inner join [User] u on acu.PersonID = u.PersonID
								inner join PlaylistUserListened ald on pl.PlaylistID = ald.PlaylistID
		WHERE pl.isPublic = 1 and pl.AccountName != @accountName and ald.AccountName = @accountName
		
		SELECT *, ROW_NUMBER() OVER (ORDER BY pn.KindofPlaylist) AS RowNum
		INTO #Results0
		FROM (SELECT * FROM #Results11
				UNION ALL
				SELECT * FROM #Results21) AS pn
	
		DROP TABLE #Results11
		DROP TABLE #Results21

		SELECT COUNT(*) AS totalCount
		FROM #Results0

		SELECT * FROM #Results0 s
		WHERE s.RowNum BETWEEN @Start AND @End

		DROP TABLE #Results0
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPlaylistsByCollectionPage]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPlaylistsByCollectionPage](
	@pageIndex int,
	@pageSize int,
	@collectionID varchar(50),
	@accountName char(30)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT pl.*, ad.PersonName, ROW_NUMBER() OVER (ORDER BY pl.DateCreated DESC) AS RowNum
		INTO #Results
		FROM PlaylistAdmin pl inner join PlaylistAdmin_Collection pc on pl.PlaylistID = pc.PlaylistID
							  inner join AccountAdmin acd on acd.AccountName = pl.AccountName
							  inner join [Admin] ad on acd.PersonID = ad.PersonID
		WHERE pc.CollectionID = @collectionID AND pl.isPublic = 1

		SELECT COUNT(*) AS totalCount
		FROM #Results

		if(@accountName = '')
		begin
			SELECT *, Liked = 0
			FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End
		end
		else
		begin
			SELECT s.*,
					case when exists ( SELECT * 
									   FROM PlaylistAdminLiked plal 
									   WHERE s.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked
			FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End
		end

		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPlaylistsByCollectionsPage]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPlaylistsByCollectionsPage](
	@pageIndex int,
	@pageSize int,
	@genre varchar(50),
	@mood varchar(50),
	@scene varchar(50),
	@topic varchar(50),
	@accountName char(30)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1
		
		if(@genre != '' and @mood = '' and @scene = '' and @topic = '')
		begin
			SELECT pl.*, ad.PersonName, ROW_NUMBER() OVER (ORDER BY pl.DateCreated DESC) AS RowNum
			INTO #ResultNew1
			FROM PlaylistAdmin pl inner join PlaylistAdmin_Collection pc on pl.PlaylistID = pc.PlaylistID
							      inner join AccountAdmin acd on acd.AccountName = pl.AccountName
							      inner join [Admin] ad on acd.PersonID = ad.PersonID
			WHERE pc.CollectionID = @genre

			SELECT COUNT(*) AS totalCount
			FROM #ResultNew1

			if(@accountName ='')
			begin
				SELECT *, Liked = 0
				FROM #ResultNew1 s
				WHERE s.RowNum BETWEEN @Start AND @End
			end
			else
			begin
				SELECT *,
					case when exists ( SELECT * 
									   FROM PlaylistAdminLiked plal 
									   WHERE s.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked
				FROM #ResultNew1 s 
				WHERE s.RowNum BETWEEN @Start AND @End
			end

			DROP TABLE #ResultNew1
		end
		else if(@genre != '' and @mood != '' and @scene = '' and @topic = '')
		begin
			SELECT pl.*
			INTO #Results1
			FROM PlaylistAdmin pl inner join PlaylistAdmin_Collection pc on pl.PlaylistID = pc.PlaylistID
			WHERE pc.CollectionID = @genre
				
			SELECT pl.*, ad.PersonName, ROW_NUMBER() OVER (ORDER BY pl.DateCreated DESC) AS RowNum
			INTO #ResultNew2
			FROM #Results1 pl inner join PlaylistAdmin_Collection pc on pl.PlaylistID = pc.PlaylistID
							  inner join AccountAdmin acd on acd.AccountName = pl.AccountName
							  inner join [Admin] ad on acd.PersonID = ad.PersonID
			WHERE pc.CollectionID = @mood

			DROP TABLE #Results1

			SELECT COUNT(*) AS totalCount
			FROM #ResultNew2

			if(@accountName ='')
			begin
				SELECT *, Liked = 0
				FROM #ResultNew2 s
				WHERE s.RowNum BETWEEN @Start AND @End
			end
			else
			begin
				SELECT *,
					case when exists ( SELECT * 
									   FROM PlaylistAdminLiked plal 
									   WHERE s.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked
				FROM #ResultNew2 s
				WHERE s.RowNum BETWEEN @Start AND @End
			end

			DROP TABLE #ResultNew2
		end
		else if(@genre != '' and @mood != '' and @scene != '' and @topic = '')
		begin
			SELECT pl.*
			INTO #Results11
			FROM PlaylistAdmin pl inner join PlaylistAdmin_Collection pc on pl.PlaylistID = pc.PlaylistID
			WHERE pc.CollectionID = @genre
				
			SELECT rs1.*
			INTO #Results2
			FROM #Results11 rs1 inner join PlaylistAdmin_Collection pc on rs1.PlaylistID = pc.PlaylistID
			WHERE pc.CollectionID = @mood

			DROP TABLE #Results11

			SELECT pl.*, ad.PersonName, ROW_NUMBER() OVER (ORDER BY pl.DateCreated DESC) AS RowNum
			INTO #ResultNew3
			FROM #Results2 pl inner join PlaylistAdmin_Collection pc on pl.PlaylistID = pc.PlaylistID
							  inner join AccountAdmin acd on acd.AccountName = pl.AccountName
							  inner join [Admin] ad on acd.PersonID = ad.PersonID
			WHERE pc.CollectionID = @scene

			DROP TABLE #Results2

			SELECT COUNT(*) AS totalCount
			FROM #ResultNew3

			if(@accountName ='')
			begin
				SELECT *, Liked = 0
				FROM #ResultNew3 s
				WHERE s.RowNum BETWEEN @Start AND @End
			end
			else
			begin
				SELECT *,
					case when exists ( SELECT * 
									   FROM PlaylistAdminLiked plal 
									   WHERE s.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked
				FROM #ResultNew3 s
				WHERE s.RowNum BETWEEN @Start AND @End
			end

			DROP TABLE #ResultNew3
		end
		else if(@genre != '' and @mood != '' and @scene != '' and @topic != '')
		begin
			SELECT pl.*
			INTO #Results111
			FROM PlaylistAdmin pl inner join PlaylistAdmin_Collection pc on pl.PlaylistID = pc.PlaylistID
			WHERE pc.CollectionID = @genre
				
			SELECT rs1.*
			INTO #Results22
			FROM #Results111 rs1 inner join PlaylistAdmin_Collection pc on rs1.PlaylistID = pc.PlaylistID
			WHERE pc.CollectionID = @mood
			DROP TABLE #Results111

			SELECT rs2.*
			INTO #Results3
			FROM #Results22 rs2 inner join PlaylistAdmin_Collection pc on rs2.PlaylistID = pc.PlaylistID
			WHERE pc.CollectionID = @scene
			DROP TABLE #Results22

			SELECT pl.*, ad.PersonName, ROW_NUMBER() OVER (ORDER BY pl.DateCreated DESC) AS RowNum
			INTO #ResultNew4
			FROM #Results3 pl inner join PlaylistAdmin_Collection pc on pl.PlaylistID = pc.PlaylistID
							  inner join AccountAdmin acd on acd.AccountName = pl.AccountName
							  inner join [Admin] ad on acd.PersonID = ad.PersonID
			WHERE pc.CollectionID = @topic
			DROP TABLE #Results3

			SELECT COUNT(*) AS totalCount
			FROM #ResultNew4

			if(@accountName ='')
			begin
				SELECT *, Liked = 0
				FROM #ResultNew4 s
				WHERE s.RowNum BETWEEN @Start AND @End
			end
			else
			begin
				SELECT *,
					case when exists ( SELECT * 
									   FROM PlaylistAdminLiked plal 
									   WHERE s.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked
				FROM #ResultNew4 s
				WHERE s.RowNum BETWEEN @Start AND @End
			end

			DROP TABLE #ResultNew4
		end
		else
		begin
			SELECT pl.*, ad.PersonName, ROW_NUMBER() OVER (ORDER BY pl.DateCreated DESC) AS RowNum
			INTO #ResultNew5
			FROM PlaylistAdmin pl inner join AccountAdmin acd on acd.AccountName = pl.AccountName
							      inner join [Admin] ad on acd.PersonID = ad.PersonID

			SELECT COUNT(*) AS totalCount
			FROM #ResultNew5

			if(@accountName ='')
			begin
				SELECT *, Liked = 0
				FROM #ResultNew5 s
				WHERE s.RowNum BETWEEN @Start AND @End
			end
			else
			begin
				SELECT *,
					case when exists ( SELECT * 
									   FROM PlaylistAdminLiked plal 
									   WHERE s.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked
				FROM #ResultNew5 s
				WHERE s.RowNum BETWEEN @Start AND @End
			end

			DROP TABLE #ResultNew5
		end
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPlaylistsForMana]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPlaylistsForMana]
AS
	BEGIN
		select pl.PlaylistID as 'PlaylistID',
	   pl.PlaylistName as 'PlaylistName',
	   pl.[Description] as 'Description',
	   pl.DateCreated as 'DateCreated',
	   pl.[Image] as 'Image',
	   pl.isPublic as 'isPublic',
	   acd.AccountName as 'AccountName',
	   ad.PersonName as 'PersonName',
	   count(plal.PlaylistID) as [TotalLikes],
	   (
			SELECT c.CollectionID, c.CollectionName
			FROM (SELECT *
				  FROM PlaylistAdmin_Collection plc
				  WHERE plc.PlaylistID = pl.PlaylistID) as plcn
				  inner join [Collection] c on c.CollectionID = plcn.CollectionID
			for json path
		) as [Collections],
	   (
			select  s.SongID as 'SongID',
			s.SongName as 'SongName',
			s.[Image] as 'Image',
			(
				SELECT a.ArtistID, a.ArtistName, a.[Image]
				FROM (SELECT *
					  FROM Song_Artist sa
					  WHERE sa.SongID = s.SongID) as san
					  inner join Artist a on san.ArtistID = a.ArtistID
				for json path
			) as Artists
			from (select s.*
				from Song s inner join PlaylistAdmin_Song pls on s.SongID = pls.SongID
				where pls.PlaylistID = pl.PlaylistID) as s
			for json path
	   ) as [Songs]
		from PlaylistAdmin pl
			inner join AccountAdmin acd on acd.AccountName = pl.AccountName
			inner join [Admin] ad on acd.PersonID = ad.PersonID
			left join PlaylistAdminLiked plal on pl.PlaylistID = plal.PlaylistID 
		group by pl.PlaylistID, pl.PlaylistName, pl.[Description], pl.DateCreated, pl.[Image], pl.isPublic,acd.AccountName,ad.PersonName
		for json path
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPlaylistsLiked]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPlaylistsLiked](
	@pageIndex int,
	@pageSize int,
	@accountName char(30)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		if (@accountName = '')
		begin
			SELECT pl.PlaylistID, pl.PlaylistName, pl.[Image], pl.isPublic, pl.AccountName, ad.PersonName, KindofPlaylist = 1, Liked = 0
			INTO #Results1
			FROM PlaylistAdmin pl  inner join AccountAdmin acu on acu.AccountName = pl.AccountName
									 inner join [Admin] ad on acu.PersonID = ad.PersonID
									  inner join PlaylistAdminLiked ald on pl.PlaylistID = ald.PlaylistID
			WHERE pl.isPublic = 1 and ald.AccountName = @accountName

			SELECT pl.PlaylistID, pl.PlaylistName, pl.[Image], pl.isPublic, pl.AccountName, u.PersonName, KindofPlaylist = 2, Liked = 0
			INTO #Results2
			FROM PlaylistUser pl inner join AccountUser acu on acu.AccountName = pl.AccountName
									inner join [User] u on acu.PersonID = u.PersonID
									inner join PlaylistAdminLiked ald on pl.PlaylistID = ald.PlaylistID
			WHERE pl.isPublic = 1 and pl.AccountName != @accountName and ald.AccountName = @accountName
		
			SELECT *, ROW_NUMBER() OVER (ORDER BY pn.KindofPlaylist, pn.[RANK] DESC) AS RowNum
			INTO #Results
			FROM (SELECT * FROM #Results1
				  UNION ALL
				  SELECT * FROM #Results2) AS pn
	
			DROP TABLE #Results1
			DROP TABLE #Results2

			SELECT COUNT(*) AS totalCount
			FROM #Results

			SELECT * FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End

			DROP TABLE #Results
		end
		else
		begin
			SELECT pl.PlaylistID, pl.PlaylistName, pl.[Image], pl.isPublic, pl.AccountName, ad.PersonName, KindofPlaylist = 1,
					case when exists ( SELECT * 
									   FROM PlaylistAdminLiked plal 
									   WHERE pl.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked
			INTO #Results11
			FROM PlaylistAdmin pl inner join AccountAdmin acu on acu.AccountName = pl.AccountName
									 inner join [Admin] ad on acu.PersonID = ad.PersonID
									 inner join PlaylistAdminLiked ald on pl.PlaylistID = ald.PlaylistID
			WHERE pl.isPublic = 1 and ald.AccountName = @accountName

			SELECT pl.PlaylistID, pl.PlaylistName, pl.[Image], pl.isPublic, pl.AccountName, u.PersonName, KindofPlaylist = 2,
					case when exists ( SELECT * 
									   FROM PlaylistUserLiked plal 
									   WHERE pl.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked
			INTO #Results21
			FROM PlaylistUser pl inner join AccountUser acu on acu.AccountName = pl.AccountName
									inner join [User] u on acu.PersonID = u.PersonID
									inner join PlaylistUserLiked ald on pl.PlaylistID = ald.PlaylistID
			WHERE pl.isPublic = 1 and pl.AccountName != @accountName and ald.AccountName = @accountName
		
			SELECT *, ROW_NUMBER() OVER (ORDER BY pn.KindofPlaylist, pn.[RANK] DESC) AS RowNum
			INTO #Results0
			FROM (SELECT * FROM #Results11
				  UNION ALL
				  SELECT * FROM #Results21) AS pn
	
			DROP TABLE #Results11
			DROP TABLE #Results21

			SELECT COUNT(*) AS totalCount
			FROM #Results0

			SELECT * FROM #Results0 s
			WHERE s.RowNum BETWEEN @Start AND @End

			DROP TABLE #Results0
		end
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPlaylistsSearch]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPlaylistsSearch](
	@pageIndex int,
	@pageSize int,
	@textSearch nvarchar(100),
	@accountName char(30)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		if (@accountName = '')
		begin
			SELECT pl.PlaylistID, pl.PlaylistName, pl.[Image], pl.isPublic, pl.AccountName, ad.PersonName, KEY_TBL.RANK, KindofPlaylist = 1, Liked = 0
			INTO #Results1
			FROM PlaylistAdmin pl INNER JOIN FREETEXTTABLE (PlaylistAdmin, PlaylistName, @textSearch) AS KEY_TBL ON pl.PlaylistID = KEY_TBL.[KEY]
									 inner join AccountAdmin acu on acu.AccountName = pl.AccountName
									 inner join [Admin] ad on acu.PersonID = ad.PersonID
			WHERE pl.isPublic = 1

			SELECT pl.PlaylistID, pl.PlaylistName, pl.[Image], pl.isPublic, pl.AccountName, u.PersonName, KEY_TBL.RANK, KindofPlaylist = 2, Liked = 0
			INTO #Results2
			FROM PlaylistUser pl INNER JOIN FREETEXTTABLE (PlaylistUser, PlaylistName, @textSearch) AS KEY_TBL ON pl.PlaylistID = KEY_TBL.[KEY]
									inner join AccountUser acu on acu.AccountName = pl.AccountName
									inner join [User] u on acu.PersonID = u.PersonID
			WHERE pl.isPublic = 1 and pl.AccountName != @accountName
		
			SELECT *, ROW_NUMBER() OVER (ORDER BY pn.KindofPlaylist, pn.[RANK] DESC) AS RowNum
			INTO #Results
			FROM (SELECT * FROM #Results1
				  UNION ALL
				  SELECT * FROM #Results2) AS pn
	
			DROP TABLE #Results1
			DROP TABLE #Results2

			SELECT COUNT(*) AS totalCount
			FROM #Results

			SELECT * FROM #Results s
			WHERE s.RowNum BETWEEN @Start AND @End

			DROP TABLE #Results
		end
		else
		begin
			SELECT pl.PlaylistID, pl.PlaylistName, pl.[Image], pl.isPublic, pl.AccountName, ad.PersonName, KEY_TBL.RANK, KindofPlaylist = 1,
					case when exists ( SELECT * 
									   FROM PlaylistAdminLiked plal 
									   WHERE pl.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked
			INTO #Results11
			FROM PlaylistAdmin pl INNER JOIN FREETEXTTABLE (PlaylistAdmin, PlaylistName, @textSearch) AS KEY_TBL ON pl.PlaylistID = KEY_TBL.[KEY]
									 inner join AccountAdmin acu on acu.AccountName = pl.AccountName
									 inner join [Admin] ad on acu.PersonID = ad.PersonID
			WHERE pl.isPublic = 1

			SELECT pl.PlaylistID, pl.PlaylistName, pl.[Image], pl.isPublic, pl.AccountName, u.PersonName, KEY_TBL.RANK, KindofPlaylist = 2,
					case when exists ( SELECT * 
									   FROM PlaylistUserLiked plal 
									   WHERE pl.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked
			INTO #Results21
			FROM PlaylistUser pl INNER JOIN FREETEXTTABLE (PlaylistUser, PlaylistName, @textSearch) AS KEY_TBL ON pl.PlaylistID = KEY_TBL.[KEY]
									inner join AccountUser acu on acu.AccountName = pl.AccountName
									inner join [User] u on acu.PersonID = u.PersonID
			WHERE pl.isPublic = 1 and pl.AccountName != @accountName
		
			SELECT *, ROW_NUMBER() OVER (ORDER BY pn.KindofPlaylist, pn.[RANK] DESC) AS RowNum
			INTO #Results0
			FROM (SELECT * FROM #Results11
				  UNION ALL
				  SELECT * FROM #Results21) AS pn
	
			DROP TABLE #Results11
			DROP TABLE #Results21

			SELECT COUNT(*) AS totalCount
			FROM #Results0

			SELECT * FROM #Results0 s
			WHERE s.RowNum BETWEEN @Start AND @End

			DROP TABLE #Results0
		end
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPlaylistsUser]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPlaylistsUser](
	@pageIndex int,
	@pageSize int,
	@accountName char(30)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1
		
		SELECT pl.*, ROW_NUMBER() OVER (ORDER BY pl.DateCreated DESC) AS RowNum
		INTO #Results
		FROM (SELECT *
			  FROM PlaylistUser
			  WHERE AccountName = @accountName) as pl
	
		SELECT COUNT(*) AS totalCount
		FROM #Results

		SELECT * FROM #Results s
		WHERE s.RowNum BETWEEN @Start AND @End

		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPlaylistsUserBySong]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPlaylistsUserBySong](
	@accountName char(30)
)
AS
	BEGIN
		SELECT pl.PlaylistID as 'PlaylistUser.PlaylistID',
			pl.PlaylistName as 'PlaylistUser.PlaylistName', 
			pl.isPublic as 'PlaylistUser.isPublic', 
			count(pls.SongID) as TotalSongs
		FROM (SELECT *
			  FROM PlaylistUser
			  WHERE AccountName = @accountName) as pl
			  left join PlaylistUser_Song pls on pl.PlaylistID = pls.PlaylistID
		GROUP BY pl.PlaylistID, pl.PlaylistName, pl.isPublic, pl.DateCreated
		ORDER BY pl.DateCreated DESC
		FOR JSON PATH
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPlaylistUserwithSongs]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPlaylistUserwithSongs](
	@accountName char(30),
	@playlistUserID varchar(50)
)
as
begin

select pl.PlaylistID as 'PlaylistUser.PlaylistID',
	   pl.PlaylistName as 'PlaylistUser.PlaylistName',
	   pl.[Description] as 'PlaylistUser.Description',
	   pl.DateCreated as 'PlaylistUser.DateCreated',
	   pl.[Image] as 'PlaylistUser.Image',
	   pl.AccountName as 'PlaylistUser.AccountName',
	   pl.isPublic as 'PlaylistUser.isPublic',
	   acd.AccountName as 'User.AccountName',
	   ad.PersonName as 'User.PersonName',
	  case when exists ( SELECT * 
						FROM PlaylistUserLiked plal 
						WHERE pl.PlaylistID = plal.PlaylistID and plal.AccountName = @accountName ) then 1
					else 0 end as Liked,
	   count(plal.PlaylistID) as [TotalLikes],
	   (
			select  s.SongID as 'Song.SongID',
			s.SongName as 'Song.SongName',
			s.Lyric as 'Song.Lyric',
			s.ReleaseDate as 'Song.ReleaseDate',
			s.Nation as 'Song.Nation',
			s.[Image] as 'Song.Image',
			s.SongPath as 'Song.SongPath',
			s.MV as 'Song.MV',
			case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
			sum(ISNULL([Views], 0)) as [Views],
			(
				SELECT a.ArtistID, a.ArtistName, a.[Image]
				FROM (SELECT *
					  FROM Song_Artist sa
					  WHERE sa.SongID = s.SongID) as san
					  inner join Artist a on san.ArtistID = a.ArtistID
				for json path
			) as Artists
			from (select s.*
				from Song s inner join PlaylistUser_Song pls on s.SongID = pls.SongID
				where pls.PlaylistID = pl.PlaylistID) as s
				left join [View] v on s.SongID = v.SongID
			group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
					s.[Image], s.SongPath, s.MV, s.isVip, s.AlbumID
			for json path
	   ) as [Songs]
from (select *
	  from PlaylistUser pl
	  where pl.PlaylistID = @playlistUserID) as pl
	  inner join AccountUser acd on acd.AccountName = pl.AccountName
	  inner join [User] ad on acd.PersonID = ad.PersonID
	  left join PlaylistUserLiked plal on pl.PlaylistID = plal.PlaylistID 
group by pl.PlaylistID, pl.PlaylistName, pl.[Description], pl.DateCreated, pl.[Image],pl.AccountName, pl.isPublic, acd.AccountName,ad.PersonName, plal.AccountName, plal.PlaylistID
for json path, WITHOUT_ARRAY_WRAPPER
end
GO
/****** Object:  StoredProcedure [dbo].[GetRankSongsofDay]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetRankSongsofDay](
	@accountName char(30),
	@quantity int,
	@nation int,
	@date date
)
as
begin
select s.SongID, v.[Date],
    ROW_NUMBER() OVER (PARTITION BY v.[Date] ORDER BY  sum(isnull([Views], 0)) DESC) as [Rank]
into #Result
from Song s inner join [View] v on v.SongID = s.SongID
where s.Nation = @nation
group by s.SongID, v.[Date]

select *
into #Result2
from #Result
where [Rank] between 1 and @quantity
drop table #Result 

select  s.SongID as 'Song.SongID',
		s.SongName as 'Song.SongName',
		s.Lyric as 'Song.Lyric',
		s.ReleaseDate as 'Song.ReleaseDate',
		s.Nation as 'Song.Nation',
		s.[Image] as 'Song.Image',
		s.SongPath as 'Song.SongPath',
		s.MV as 'Song.MV',
		case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
		sum(ISNULL([Views], 0)) as [Views],
		(
			SELECT a.ArtistID, a.ArtistName, a.[Image]
			FROM (SELECT *
				  FROM Song_Artist sa
				  WHERE sa.SongID = s.SongID) as san
				  inner join Artist a on san.ArtistID = a.ArtistID
			for json path
		) as Artists,
		RT.[Date] as 'RankDetail.Date',
		RT.[Rank] as 'RankDetail.RankCurrent',
		json_query
		((
			SELECT min(s.[Rank]) as 'Max', count(s.SongID) as 'Count'
			FROM #Result2 s
			where s.SongID = RT.SongID
			group by s.SongID
			for json path, without_array_wrapper
		)) as 'RankDetail.MaxACount',
		json_query
		((
			SELECT s.[Rank]
			FROM #Result2 s
			where s.SongID = RT.SongID and s.[Date] = DATEADD(day, -1, @date)
			for json path,  without_array_wrapper
		)) as'RankDetail.RankPrev'
from  Song s
	  left join [View] v on s.SongID = v.SongID
	  inner join (select *
				  from #Result2
				  where [Date] = @date) as RT on RT.SongID = s.SongID
group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
		 s.[Image], s.SongPath, s.MV, s.AlbumID, RT.SongID, RT.[Date], RT.[Rank]
order by RT.[Rank]
for json path

drop table #Result2 
end
GO
/****** Object:  StoredProcedure [dbo].[GetRankSongsofWeek]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetRankSongsofWeek](
	@accountName char(30),
	@quantity int,
	@nation int,
	@week int,
	@year int
)
as
begin
select s.SongID,
	DATEPART ( ISO_WEEK, [Date] ) as [Week],
    ROW_NUMBER() OVER (PARTITION BY DATEPART(ISO_WEEK, [Date]) ORDER BY  sum(isnull([Views], 0)) DESC) as [Rank]
into #Result
from Song s inner join [View] v on v.SongID = s.SongID
where year([Date]) = @year and s.Nation = @nation
group by s.SongID, DATEPART (ISO_WEEK, [Date])

select *
into #Result2
from #Result
where [Rank] between 1 and @quantity
drop table #Result 

select  s.SongID as 'Song.SongID',
		s.SongName as 'Song.SongName',
		s.Lyric as 'Song.Lyric',
		s.ReleaseDate as 'Song.ReleaseDate',
		s.Nation as 'Song.Nation',
		s.[Image] as 'Song.Image',
		s.SongPath as 'Song.SongPath',
		s.MV as 'Song.MV',
		case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
		sum(ISNULL([Views], 0)) as [Views],
		(
			SELECT a.ArtistID, a.ArtistName, a.[Image]
			FROM (SELECT *
				  FROM Song_Artist sa
				  WHERE sa.SongID = s.SongID) as san
				  inner join Artist a on san.ArtistID = a.ArtistID
			for json path
		) as Artists,
		RT.[Week] as 'RankDetail.Week',
		RT.[Rank] as 'RankDetail.RankCurrent',
		json_query
		((
			SELECT min(s.[Rank]) as 'Max', count(s.SongID) as 'Count'
			FROM #Result2 s
			where s.SongID = RT.SongID
			group by s.SongID
			for json path, without_array_wrapper
		)) as 'RankDetail.MaxACount',
		json_query
		((
			SELECT s.[Rank]
			FROM #Result2 s
			where s.SongID = RT.SongID and [Week] = @week - 1
			for json path,  without_array_wrapper
		)) as'RankDetail.RankPrev'
from  Song s
	  left join [View] v on s.SongID = v.SongID
	  inner join (select *
				  from #Result2
				  where [Week] = @week) as RT on RT.SongID = s.SongID
group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
		 s.[Image], s.SongPath, s.MV, s.AlbumID, RT.SongID, RT.[Week], RT.[Rank]
order by RT.[Rank]
for json path

drop table #Result2 
end
GO
/****** Object:  StoredProcedure [dbo].[GetSong]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetSong](
	@accountName char(30),
	@songID varchar(50)
)
as
begin
select  s.SongID as 'Song.SongID',
		s.SongName as 'Song.SongName',
		s.Lyric as 'Song.Lyric',
		s.ReleaseDate as 'Song.ReleaseDate',
		s.Nation as 'Song.Nation',
		s.[Image] as 'Song.Image',
		s.SongPath as 'Song.SongPath',
		s.MV as 'Song.MV',
		al.AlbumID as 'Song.Album.AlbumID',
		al.AlbumName as 'Song.Album.AlbumName',
		case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
		sum(ISNULL([Views], 0)) as [Views],
		s.TotalLikes,
        (
			SELECT c.CollectionID, c.CollectionName
			FROM (SELECT *
				  FROM Song_Collection sc
				  WHERE sc.SongID = s.SongID) as scn
				  inner join [Collection] c on c.CollectionID = scn.CollectionID
			for json path
		) as [Collections],
		(
			SELECT a.ArtistID, a.ArtistName, a.[Image]
			FROM (SELECT *
				  FROM Song_Artist sa
				  WHERE sa.SongID = s.SongID) as san
				  inner join Artist a on san.ArtistID = a.ArtistID
			for json path
		) as Artists
from (select  s.SongID ,
				s.SongName,
				s.Lyric,
				s.ReleaseDate,
				s.Nation,
				s.[Image],
				s.SongPath,
				s.MV,
				s.AlbumID,
				count(sl.AccountName) as [TotalLikes]
	  from Song s left join SongLiked sl on s.SongID = sl.SongID
	  where s.SongID = @songID
	  group by s.SongID, s.SongName,s.Lyric,
				s.ReleaseDate,
				s.Nation,
				s.[Image],
				s.SongPath,
				s.MV, s.AlbumID) as s
	  left join [View] v on s.SongID = v.SongID
	  left join Album al on s.AlbumID = al.AlbumID
group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
		 s.[Image], s.SongPath, s.MV, s.AlbumID, s.TotalLikes, al.AlbumID, al.AlbumName
for json path, WITHOUT_ARRAY_WRAPPER
end
GO
/****** Object:  StoredProcedure [dbo].[GetSongsByArtistPage]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetSongsByArtistPage] (
	@pageIndex int,
	@pageSize int,
	@artistID varchar(50),
	@accountName char(30)
)
as
begin
	DECLARE @Start int, @End int
	SET @Start = @pageSize * (@pageIndex - 1) + 1
	SET @End = @Start + @pageSize - 1

	SELECT s.*, ROW_NUMBER() OVER (ORDER BY s.ReleaseDate DESC) AS RowNum
	INTO #Results
	FROM (SELECT s.* 
		  FROM Song s inner join 
		  (SELECT * 
		   FROM Song_Artist sa
		   WHERE sa.ArtistID = @artistID) as sa on s.SongID = sa.SongID) as s
					  
	SELECT COUNT(*) AS totalCount
	FROM #Results s

	select top 100 s.SongID as 'Song.SongID',
			s.SongName as 'Song.SongName',
			s.Lyric as 'Song.Lyric',
			s.ReleaseDate as 'Song.ReleaseDate',
			s.Nation as 'Song.Nation',
			s.[Image] as 'Song.Image',
			s.SongPath as 'Song.SongPath',
			s.MV as 'Song.MV',
			case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
			sum(ISNULL([Views], 0)) as [Views],
			(
				SELECT a.ArtistID, a.ArtistName, a.[Image]
				FROM (SELECT *
					  FROM Song_Artist sa
					  WHERE sa.SongID = s.SongID) as san
					  inner join Artist a on san.ArtistID = a.ArtistID
				for json path
			) as Artists
	from (select s.*
		  from #Results s
		  WHERE s.RowNum BETWEEN @Start AND @End) as s
		  left join [View] v on s.SongID = v.SongID
	group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
			 s.[Image], s.SongPath, s.MV, s.AlbumID
	ORDER BY s.ReleaseDate DESC
	for json path

	DROP TABLE #Results
end
GO
/****** Object:  StoredProcedure [dbo].[GetSongsByCollectionPage]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetSongsByCollectionPage] (
	@pageIndex int,
	@pageSize int,
	@collectionID varchar(50),
	@nation int,
	@accountName char(30)
)
as
begin
	DECLARE @Start int, @End int
	SET @Start = @pageSize * (@pageIndex - 1) + 1
	SET @End = @Start + @pageSize - 1

	SELECT s.*, ROW_NUMBER() OVER (ORDER BY s.ReleaseDate DESC) AS RowNum
	INTO #Results
	FROM (SELECT * 
		  FROM Song s
		  WHERE s.Nation = @nation) as s
		  inner join (SELECT *
					  FROM Song_Collection sc
					  WHERE sc.CollectionID = @collectionID) as sc on s.SongID = sc.SongID

					  
	SELECT COUNT(*) AS totalCount
	FROM #Results s

	select  s.SongID as 'Song.SongID',
			s.SongName as 'Song.SongName',
			s.Lyric as 'Song.Lyric',
			s.ReleaseDate as 'Song.ReleaseDate',
			s.Nation as 'Song.Nation',
			s.[Image] as 'Song.Image',
			s.SongPath as 'Song.SongPath',
			s.MV as 'Song.MV',
			case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
			sum(ISNULL([Views], 0)) as [Views],
			(
				SELECT a.ArtistID, a.ArtistName, a.[Image]
				FROM (SELECT *
					  FROM Song_Artist sa
					  WHERE sa.SongID = s.SongID) as san
					  inner join Artist a on san.ArtistID = a.ArtistID
				for json path
			) as Artists
	from (select s.*
		  from #Results s
		  WHERE s.RowNum BETWEEN @Start AND @End) as s
		  left join [View] v on s.SongID = v.SongID
	group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
			 s.[Image], s.SongPath, s.MV, s.AlbumID
	ORDER BY s.ReleaseDate DESC
	for json path

	DROP TABLE #Results
end
GO
/****** Object:  StoredProcedure [dbo].[GetSongsForMana]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetSongsForMana]
as
begin
	select s.SongID as 'SongID',
			s.SongName as 'SongName',
			s.Lyric as 'Lyric',
			s.ReleaseDate as 'ReleaseDate',
			s.Nation as 'Nation',
			s.[Image] as 'Image',
			s.SongPath as 'SongPath',
			s.MV as 'MV',
			json_query
			((
				select a.AlbumID as 'AlbumID',
						a.AlbumName as 'AlbumName',
						a.[Image] as 'ALImage',
						ar.ArtistID as 'ArtistID',
						ar.ArtistName as 'ArtistName',
						ar.[Image] as 'ATImage'
				from (select * from Album a
					   where a.AlbumID = s.AlbumID) as a inner join Artist ar on a.ArtistID = ar.ArtistID
				for json path, without_array_wrapper
			)) as Album,
			sum(ISNULL([Views], 0)) as [Views],
			count(sl.SongID) as [TotalLikes],
			(
				SELECT c.CollectionID, c.CollectionName
				FROM (SELECT *
						FROM Song_Collection sc
						WHERE sc.SongID = s.SongID) as scn
						inner join [Collection] c on c.CollectionID = scn.CollectionID
				for json path
			) as [Collections],
			(
				SELECT a.ArtistID, a.ArtistName, a.[Image]
				FROM (SELECT *
						FROM Song_Artist sa
						WHERE sa.SongID = s.SongID) as san
						inner join Artist a on san.ArtistID = a.ArtistID
				for json path
			) as Artists
	from Song as s
		  left join SongLiked sl on s.SongID = sl.SongID
		  left join [View] v on s.SongID = v.SongID
		  left join Album al on s.AlbumID = al.AlbumID
	group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
			 s.[Image], s.SongPath, s.MV, s.AlbumID, al.AlbumID, al.AlbumName
	for json path
end
GO
/****** Object:  StoredProcedure [dbo].[GetSongsForManaPlaylistAdmin]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetSongsForManaPlaylistAdmin]
AS
	BEGIN
		select  s.SongID as 'Song.SongID',
		s.SongName as 'Song.SongName',
		s.[Image] as 'Song.Image',
		(
			SELECT a.ArtistID, a.ArtistName, a.[Image]
			FROM (SELECT *
				  FROM Song_Artist sa
				  WHERE sa.SongID = s.SongID) as san
				  inner join Artist a on san.ArtistID = a.ArtistID
			for json path
		) as Artists
		from Song  as s
		for json path
	END
GO
/****** Object:  StoredProcedure [dbo].[GetSongsNewAHot]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetSongsNewAHot] (
	@pageIndex int,
	@pageSize int,
	@accountName char(30),
	@time int
)
as
begin
	DECLARE @Start int, @End int
	SET @Start = @pageSize * (@pageIndex - 1) + 1
	SET @End = @Start + @pageSize - 1

	SELECT s.*, sum(ISNULL([Views], 0)) as [Views]
	INTO #Results0
	FROM Song s inner join Song_Collection sc on s.SongID = sc.SongID
				left join [View] v on s.SongID = v.SongID
	WHERE s.ReleaseDate <= GetDate() and s.ReleaseDate >= dateadd(day, @time, getdate())
	group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
			 s.[Image], s.SongPath, s.MV, s.AlbumID

	SELECT s.*, ROW_NUMBER() OVER (ORDER BY s.[Views] DESC, s.ReleaseDate DESC) AS RowNum
	INTO #Results
	FROM #Results0 s
	DROP TABLE #Results0
	
	SELECT COUNT(*) AS totalCount
	FROM #Results

	select s.SongID as 'Song.SongID',
			s.SongName as 'Song.SongName',
			s.Lyric as 'Song.Lyric',
			s.ReleaseDate as 'Song.ReleaseDate',
			s.Nation as 'Song.Nation',
			s.[Image] as 'Song.Image',
			s.SongPath as 'Song.SongPath',
			s.MV as 'Song.MV',
			case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
			s.[Views],
			(
				SELECT a.ArtistID, a.ArtistName, a.[Image]
				FROM (SELECT *
					  FROM Song_Artist sa
					  WHERE sa.SongID = s.SongID) as san
					  inner join Artist a on san.ArtistID = a.ArtistID
				for json path
			) as Artists
	from (select s.*
		  from #Results s
		  WHERE s.RowNum BETWEEN @Start AND @End) as s
	group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
			 s.[Image], s.SongPath, s.MV, s.AlbumID, s.[Views]
	ORDER BY s.[Views] DESC, s.ReleaseDate DESC
	for json path

	DROP TABLE #Results
end
GO
/****** Object:  StoredProcedure [dbo].[GetSongsSearch]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetSongsSearch] (
	@pageIndex int,
	@pageSize int,
	@textSearch nvarchar(100),
	@accountName char(30)
)
as
begin
	DECLARE @Start int, @End int
	SET @Start = @pageSize * (@pageIndex - 1) + 1
	SET @End = @Start + @pageSize - 1

	SELECT s.*, ROW_NUMBER() OVER (ORDER BY KEY_TBL.RANK DESC) AS RowNum, KEY_TBL.RANK
	INTO #Results
	FROM Song s INNER JOIN FREETEXTTABLE (Song, SongName, @textSearch) AS KEY_TBL ON s.SongID = KEY_TBL.[KEY]
					  
	SELECT COUNT(*) AS totalCount
	FROM #Results s

	select s.SongID as 'Song.SongID',
			s.SongName as 'Song.SongName',
			s.Lyric as 'Song.Lyric',
			s.ReleaseDate as 'Song.ReleaseDate',
			s.Nation as 'Song.Nation',
			s.[Image] as 'Song.Image',
			s.SongPath as 'Song.SongPath',
			s.MV as 'Song.MV',
			case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
			sum(ISNULL([Views], 0)) as [Views],
			(
				SELECT a.ArtistID, a.ArtistName, a.[Image]
				FROM (SELECT *
					  FROM Song_Artist sa
					  WHERE sa.SongID = s.SongID) as san
					  inner join Artist a on san.ArtistID = a.ArtistID
				for json path
			) as Artists
	from (select s.*
		  from #Results s
		  WHERE s.RowNum BETWEEN @Start AND @End) as s
		  left join [View] v on s.SongID = v.SongID
	group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
			 s.[Image], s.SongPath, s.MV, s.AlbumID, s.RANK
	ORDER BY s.RANK DESC
	for json path

	DROP TABLE #Results
end
GO
/****** Object:  StoredProcedure [dbo].[GetTop100Songs]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTop100Songs](
	@accountName char(20),
	@collectionID varchar(50),
	@nation int
)
as
begin
select top 100 s.SongID as 'Song.SongID',
		s.SongName as 'Song.SongName',
		s.Lyric as 'Song.Lyric',
		s.ReleaseDate as 'Song.ReleaseDate',
		s.Nation as 'Song.Nation',
		s.[Image] as 'Song.Image',
		s.SongPath as 'Song.SongPath',
		s.MV as 'Song.MV',
		case when exists ( SELECT * 
								FROM SongLiked sl 
								WHERE s.SongID = sl.SongID and sl.AccountName = @accountName ) then 1
					else 0 end as Liked,
		sum(ISNULL([Views], 0)) as [Views],
		(
			SELECT a.ArtistID, a.ArtistName, a.[Image]
			FROM (SELECT *
				  FROM Song_Artist sa
				  WHERE sa.SongID = s.SongID) as san
				  inner join Artist a on san.ArtistID = a.ArtistID
			for json path
		) as Artists
from (select s.*
	  from Song s inner join Song_Collection sc on s.SongID = sc.SongID
	  where s.Nation = @nation and sc.CollectionID = @collectionID) as s
	  left join [View] v on s.SongID = v.SongID
group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation,
		 s.[Image], s.SongPath, s.MV, s.AlbumID
order by [Views] DESC
for json path
end
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUser](
	@AccountName char(30),
	@PassWord char(20))
as
	begin
		select a.*, u.PersonName, u.Gender, u.Email, u.Phone from AccountUser a left join [User] u on a.PersonID = u.PersonID
		where a.AccountName=@AccountName and a.[Password]=@PassWord
	end
GO
/****** Object:  StoredProcedure [dbo].[IncreaseViews]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[IncreaseViews](
	@songID varchar(50)
)
AS
BEGIN
	IF(EXISTS(SELECT SongID 
			  FROM [View] 
			  WHERE SongID = @songID AND CAST([Date] AS DATE) = CAST(GETDATE() AS DATE)))
	BEGIN
		UPDATE [View]
		SET [Views] = [Views] + 1
		WHERE SongID = @songID AND CAST([Date] AS DATE) = CAST(GETDATE() AS DATE)
	END
	ELSE
	BEGIN
		INSERT INTO [View]
		VALUES (1, @songID, GETDATE())
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ListenedAlbum]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ListenedAlbum](
	@albumID varchar(50),
	@accountName char(30)
)
AS
BEGIN
	IF(EXISTS(SELECT AlbumID 
			  FROM AlbumListened 
			  WHERE AlbumID = @albumID AND AccountName = @accountName))
	BEGIN
		UPDATE AlbumListened
		SET DateListened = GETDATE()
		WHERE AlbumID = @albumID AND AccountName = @accountName
	END
	ELSE
	BEGIN
		INSERT INTO AlbumListened
		VALUES (@accountName, @albumID, GETDATE())
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ListenedPlaylist]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ListenedPlaylist](
	@playlistID varchar(50),
	@accountName char(30),
	@kind int
)
AS
BEGIN
	
	IF(@kind = 1)
	BEGIN
		IF(EXISTS(SELECT PlaylistID 
				  FROM PLaylistAdminListened 
				  WHERE PlaylistID = @playlistID AND AccountName = @accountName))
		BEGIN
			UPDATE PLaylistAdminListened
			SET DateListened = GETDATE()
			WHERE PlaylistID = @playlistID AND AccountName = @accountName
		END
		ELSE
		BEGIN
			INSERT INTO PLaylistAdminListened
			VALUES (@accountName, @playlistID, GETDATE())
		END
	END
	ELSE
	BEGIN
		IF(EXISTS(SELECT PlaylistID 
				  FROM PLaylistUserListened 
				  WHERE PlaylistID = @playlistID AND AccountName = @accountName))
		BEGIN
			UPDATE PLaylistUserListened
			SET DateListened = GETDATE()
			WHERE PlaylistID = @playlistID AND AccountName = @accountName
		END
		ELSE
		BEGIN
			INSERT INTO PLaylistUserListened
			VALUES (@accountName, @playlistID, GETDATE())
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ListenedSong]    Script Date: 1/7/2022 1:32:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ListenedSong](
	@songID varchar(50),
	@accountName char(30)
)
AS
BEGIN
	IF(EXISTS(SELECT SongID 
			  FROM SongListened 
			  WHERE SongID = @songID AND AccountName = @accountName))
	BEGIN
		UPDATE SongListened
		SET DateListened = GETDATE()
		WHERE SongID = @songID AND AccountName = @accountName
	END
	ELSE
	BEGIN
		INSERT INTO SongListened
		VALUES (@accountName, @songID, GETDATE())
	END
END
GO
USE [master]
GO
ALTER DATABASE [Music] SET  READ_WRITE 
GO

alter PROC [dbo].[AddAlbum] (
	@jsonAlbum nvarchar(max)
)
AS
BEGIN
	SET XACT_ABORT ON;
	set nocount on;
    BEGIN TRAN;
	BEGIN TRY
		INSERT INTO Album
			([AlbumID],
			[AlbumName],
			[Description],
			[Image],
			[ArtistID],
			[ReleasedDate])
		SELECT 
			[AlbumID],
			[AlbumName],
			[Description],
			[Image],
			[ArtistID],
			[ReleasedDate]
		FROM OPENJSON(@jsonAlbum)
		WITH (
			[AlbumID] [varchar](50),
			[AlbumName] [nvarchar](50),
			[Description] [nvarchar](max),
			[Image] [varchar](50),
			[ArtistID][varchar](50),
			[ReleasedDate] [date]
		)
		
	END TRY
	BEGIN CATCH
		select ERROR_MESSAGE();
	END CATCH
	COMMIT TRAN;
END





