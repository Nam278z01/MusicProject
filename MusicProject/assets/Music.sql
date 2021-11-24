USE [master]
GO
/****** Object:  Database [Music]    Script Date: 11/24/2021 2:10:12 PM ******/
CREATE DATABASE [Music]
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
/****** Object:  FullTextCatalog [album_search]    Script Date: 11/24/2021 2:10:13 PM ******/
CREATE FULLTEXT CATALOG [album_search] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  FullTextCatalog [artist_search]    Script Date: 11/24/2021 2:10:13 PM ******/
CREATE FULLTEXT CATALOG [artist_search] WITH ACCENT_SENSITIVITY = ON
GO
/****** Object:  FullTextCatalog [playlist_search]    Script Date: 11/24/2021 2:10:13 PM ******/
CREATE FULLTEXT CATALOG [playlist_search] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  FullTextCatalog [playlistus_search]    Script Date: 11/24/2021 2:10:13 PM ******/
CREATE FULLTEXT CATALOG [playlistus_search] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  FullTextCatalog [song_search]    Script Date: 11/24/2021 2:10:13 PM ******/
CREATE FULLTEXT CATALOG [song_search] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  Table [dbo].[AccountAdmin]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountAdmin](
	[AccountName] [char](20) NOT NULL,
	[Password] [char](20) NOT NULL,
	[Role] [tinyint] NOT NULL,
	[State] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[PersonID] [char](10) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AccountAdmin] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountUser]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountUser](
	[AccountName] [char](20) NOT NULL,
	[Password] [char](20) NOT NULL,
	[Role] [tinyint] NOT NULL,
	[State] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[KindofAccount] [tinyint] NOT NULL,
	[DueOn] [datetime] NULL,
	[PersonID] [char](10) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AccountUser] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[PersonID] [char](10) NOT NULL,
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
/****** Object:  Table [dbo].[Album]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[AlbumID] [char](10) NOT NULL,
	[AlbumName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Image] [nvarchar](200) NOT NULL,
	[ArtistID] [char](10) NULL,
	[ReleasedDate] [datetime] NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumLiked]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumLiked](
	[AccountName] [char](20) NOT NULL,
	[AlbumID] [char](10) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_AlbumLiked] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumListened]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumListened](
	[AccountName] [char](20) NOT NULL,
	[AlbumID] [char](10) NOT NULL,
	[DateListened] [datetime] NOT NULL,
 CONSTRAINT [PK_AlbumListened] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[ArtistID] [char](10) NOT NULL,
	[ArtistName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Image] [nvarchar](200) NOT NULL,
	[ImageBig] [nvarchar](200) NULL,
	[Nation] [int] NULL,
	[GenderorisBand] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collection]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collection](
	[CollectionID] [char](10) NOT NULL,
	[CollectionName] [nvarchar](50) NOT NULL,
	[KindofCollection] [tinyint] NOT NULL,
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED 
(
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [char](20) NOT NULL,
	[Content] [nvarchar](200) NOT NULL,
	[Date] [datetime] NOT NULL,
	[SongID] [char](10) NOT NULL,
	[AccountName] [char](20) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentHistory]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentHistory](
	[PaymentID] [char](10) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[OnSale] [tinyint] NOT NULL,
	[Total] [float] NULL,
	[Note] [nvarchar](50) NULL,
	[ServiceVipID] [char](10) NOT NULL,
	[AccountName] [char](20) NOT NULL,
 CONSTRAINT [PK_PaymentHistory] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistAdmin]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistAdmin](
	[PlaylistID] [char](10) NOT NULL,
	[PlaylistName] [nvarchar](50) NOT NULL,
	[Description] [nchar](200) NULL,
	[DateCreated] [datetime] NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[AccountName] [char](20) NOT NULL,
	[isPublic] [bit] NULL,
 CONSTRAINT [PK_PlaylistAdmin] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistAdmin_Collection]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistAdmin_Collection](
	[PlaylistID] [char](10) NOT NULL,
	[CollectionID] [char](10) NOT NULL,
 CONSTRAINT [PK_PlaylistAdmin_Collection] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC,
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistAdmin_Song]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistAdmin_Song](
	[PlaylistID] [char](10) NOT NULL,
	[SongID] [char](10) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_PlaylistAdmin_Song] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC,
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistAdminLiked]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistAdminLiked](
	[AccountName] [char](20) NOT NULL,
	[PlaylistID] [char](10) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_PlaylistAdminLiked] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistAdminListened]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistAdminListened](
	[AccountName] [char](20) NOT NULL,
	[PlaylistID] [char](10) NOT NULL,
	[DateListened] [datetime] NOT NULL,
 CONSTRAINT [PK_PlaylistAdminListened] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistUser]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistUser](
	[PlaylistID] [char](10) NOT NULL,
	[PlaylistName] [nvarchar](50) NOT NULL,
	[Description] [nchar](200) NULL,
	[DateCreated] [datetime] NOT NULL,
	[AccountName] [char](20) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[isPublic] [bit] NOT NULL,
 CONSTRAINT [PK_PlaylistUser] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistUser_Song]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistUser_Song](
	[PlaylistID] [char](10) NOT NULL,
	[SongID] [char](10) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_PlaylistUser_Song] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC,
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistUserLiked]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistUserLiked](
	[AccountName] [char](20) NOT NULL,
	[PlaylistID] [char](10) NOT NULL,
	[DateLiked] [datetime] NOT NULL,
 CONSTRAINT [PK_PlaylistUserLiked] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistUserListened]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistUserListened](
	[AccountName] [char](20) NOT NULL,
	[PlaylistID] [char](10) NOT NULL,
	[DateListened] [datetime] NOT NULL,
 CONSTRAINT [PK_PlaylistUserListened] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceVip]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceVip](
	[ServiceVipID] [char](10) NOT NULL,
	[ServiceVipName] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_ServiceVip] PRIMARY KEY CLUSTERED 
(
	[ServiceVipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song](
	[SongID] [char](10) NOT NULL,
	[SongName] [nvarchar](50) NOT NULL,
	[Lyric] [nvarchar](max) NULL,
	[ReleaseDate] [date] NULL,
	[Nation] [int] NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[SongPath] [nvarchar](200) NOT NULL,
	[MV] [nvarchar](200) NULL,
	[isVip] [bit] NOT NULL,
	[AlbumID] [char](10) NULL,
 CONSTRAINT [PK_Song] PRIMARY KEY CLUSTERED 
(
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song_Artist]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song_Artist](
	[ArtistID] [char](10) NOT NULL,
	[SongID] [char](10) NOT NULL,
	[Own] [bit] NOT NULL,
 CONSTRAINT [PK_Song_Artist] PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC,
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song_Collection]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song_Collection](
	[SongID] [char](10) NOT NULL,
	[CollectionID] [char](10) NOT NULL,
 CONSTRAINT [PK_Song_Collection] PRIMARY KEY CLUSTERED 
(
	[SongID] ASC,
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongLiked]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongLiked](
	[AccountName] [char](20) NOT NULL,
	[SongID] [char](10) NOT NULL,
	[DateLiked] [datetime] NOT NULL,
 CONSTRAINT [PK_SongLiked] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongListened]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongListened](
	[AccountName] [char](20) NOT NULL,
	[SongID] [char](10) NOT NULL,
	[DateListened] [datetime] NOT NULL,
 CONSTRAINT [PK_SongListened] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC,
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[PersonID] [char](10) NOT NULL,
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
/****** Object:  Table [dbo].[View]    Script Date: 11/24/2021 2:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View](
	[ViewID] [bigint] IDENTITY(1,1) NOT NULL,
	[Views] [int] NOT NULL,
	[SongID] [char](10) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_View] PRIMARY KEY CLUSTERED 
(
	[ViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AccountAdmin] ([AccountName], [Password], [Role], [State], [DateCreated], [PersonID], [Image]) VALUES (N'binhanvio@gmail.com ', N'0987654321          ', 2, 1, CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'P000000003', N'an.jpg')
GO
INSERT [dbo].[AccountAdmin] ([AccountName], [Password], [Role], [State], [DateCreated], [PersonID], [Image]) VALUES (N'nam278z01@gmail.com ', N'1234567890          ', 1, 1, CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'P000000001', N'nam.jpg')
GO
INSERT [dbo].[AccountUser] ([AccountName], [Password], [Role], [State], [DateCreated], [KindofAccount], [DueOn], [PersonID], [Image]) VALUES (N'binhanvio@gmail.com ', N'0987654321          ', 2, 1, CAST(N'2021-11-21T00:00:00.000' AS DateTime), 2, CAST(N'2022-11-21T00:00:00.000' AS DateTime), N'P000000003', N'an.jpg')
GO
INSERT [dbo].[AccountUser] ([AccountName], [Password], [Role], [State], [DateCreated], [KindofAccount], [DueOn], [PersonID], [Image]) VALUES (N'nam278z01@gmail.com ', N'1234567890          ', 1, 1, CAST(N'2021-11-21T00:00:00.000' AS DateTime), 1, NULL, N'P000000001', N'nam.jpg')
GO
INSERT [dbo].[AccountUser] ([AccountName], [Password], [Role], [State], [DateCreated], [KindofAccount], [DueOn], [PersonID], [Image]) VALUES (N'nam278z01v@gmail.com', N'1234567890          ', 1, 1, CAST(N'2021-11-21T00:00:00.000' AS DateTime), 1, CAST(N'2022-11-21T00:00:00.000' AS DateTime), N'P000000002', N'nam.jpg')
GO
INSERT [dbo].[Admin] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000001', N'Nguyễn Thanh Nam', 1, N'nam278z01@gmail.com', N'0328731170     ')
GO
INSERT [dbo].[Admin] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000003', N'Thái Bình An', 1, N'binhanvio@mail.com', N'0983001432     ')
GO
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000001', N'Hollywood''s Bleeding', N'Hollywood''s Bleeding is the third studio album by American rapper and singer Post Malone. It was released on September 6, 2019, by Republic Records.  ', N'Post_Malone_Hollywood''s_Bleeding.png', N'AT00000012', NULL)
GO
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000002', N'30', N'Inspired by her divorce from ex-husband Simon Konecki, Adele tackles the separation on the album, whilst discussing her motherhood and the scrutiny of fame', N'30-adele.jpg', N'AT00000001', NULL)
GO
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000003', N'Folklore ', N'Folklore is the eighth studio album by American singer-songwriter Taylor Swift. It was a surprise album, released on July 24, 2020, via Republic Records', N'Folklore (Full Album).jpg', N'AT00000013', NULL)
GO
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000004', N'EngSongOne', N'No no Yes!', N'EngSongOne.jpg', N'AT00000002', NULL)
GO
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000005', N'EngSongTwo', N'Start', N'EngSongTwo.jpg', N'AT00000003', NULL)
GO
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [Description], [Image], [ArtistID], [ReleasedDate]) VALUES (N'AB00000006', N'EngSongThree', N'Come On', N'EngSongThree.jpg', N'AT00000004', NULL)
GO
INSERT [dbo].[AlbumLiked] ([AccountName], [AlbumID], [DateAdded]) VALUES (N'nam278z01@gmail.com ', N'AB00000001', CAST(N'2021-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000001', N'Adele', NULL, N'adele.jpg', N'adele-big.jpeg', 2, 0)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000002', N'Coldplay', NULL, N'coldplay.jpg', N'coldplay-big.jpg', 2, 3)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000003', N'Ed Sheeran', NULL, N'edsheeran.jpg', N'edsheeran-big.jpg', 2, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000004', N'Lil Nas X', NULL, N'lilnasx.jpg', N'lilnasx-big.jpg', 2, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000005', N'Masew', NULL, N'masew.jpg', N'masew-big.jpg', 1, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000006', N'Bích Phương', NULL, N'bichphuong.jpg', N'bichphuong-big.jpg', 1, 0)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000007', N'Justatee', NULL, N'Justatee.jpg', N'Justatee-big.jpg', 1, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000008', N'Sơn Tùng MTP', NULL, N'sontung.jpg', N'songtung-big.jpg', 1, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000009', N'Đức Phúc', NULL, N'ducphuc.jpg', N'ducphuc-big.jpg', 1, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000010', N'Mỹ Tâm', NULL, N'mytam.jpg', N'mytam-big.jpg', 1, 0)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000011', N'BTS', NULL, N'bts.jpg', N'bts-big.jpg', 3, 3)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000012', N'Post Malone', NULL, N'postmalone.jpg', N'postmalone-big.jpg', 2, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000013', N'Taylor Swift', NULL, N'taylorswift.jpg', N'taylorswift-big.jpg', 2, 0)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000014', N'Ellie Goulding', NULL, N'elliegoulding.jpg', N'elliegouldung.jpg', 2, 0)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000015', N'Phương Ly', NULL, N'phuongly.jpg', N'phuongly-big.jpg', 1, 0)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000016', N'Morgan Wallen', NULL, N'morganwallen.jpg', N'morganwallen-big.jpg', 2, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000026', N'Maroon 5', NULL, N'maroon5.jpg', N'maroon5.jpg', 2, 3)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000027', N'The Script', NULL, N'thescript.jpg', N'thescriptjpg', 2, 3)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000028', N'Jason Mraz', NULL, N'JasonMraz.jpg', N'JasonMraz.jpg', 2, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000029', N'Fools Garden', NULL, N'FoolsGarden.jpg', N'FoolsGarden.jpg', 2, 3)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000030', N'Sia', NULL, N'sia.jpg', N'sia.jpg', 2, 0)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000031', N'Martin', NULL, N'martin.jpg', N'martin.jpg', 2, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000032', N'pitbull_kesha', NULL, N'pitbull_kesha.jpg', N'pitbull_kesha.jpg', 2, 3)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000033', N'Excuse', NULL, N'Excuse.jpg', N'Excuse.jpg', 2, 3)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000034', N'Bon Jovi', NULL, N'BonJovi.jpg', N'BonJovi.jpg', 2, 3)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000035', N'linkin park', NULL, N'linkinpark..jpg', N'linkinpark..jpg', 2, 3)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000036', N'shaun', NULL, N'shaun.jpg', N'shaun.jpg', 2, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000037', N'A Nhũng', NULL, N'aNhung.jpg', N'aNhung.jpg', 2, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000038', N'vlanobrie', NULL, N'vlanobrie.jpg', N'vlanobrie.jpg', 2, 3)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000039', N'slander', NULL, N'slander.jpg', N'slander.jpg', 2, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000040', N'passenger', NULL, N'passenger.jpg', N'passenger.jpg', 2, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000041', N'hozier', NULL, N'hozier.jpg', N'hozier.jpg', 2, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000042', N'OneRepublic', NULL, N'OneRepublic.jpg', N'OneRepublic.jpg', 2, 1)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000043', N'Rixton', NULL, N'Rixton.jpg', N'Rixton.jpg', 2, 3)
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName], [Description], [Image], [ImageBig], [Nation], [GenderorisBand]) VALUES (N'AT00000044', N'Big Bang', NULL, N'bigbang.jpg', N'bigbang.jpg', 2, 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000001', N'Nhạc Trẻ', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000002', N'Electronica/Dance', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000003', N'Pop', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000004', N'Country', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000005', N'Rock', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000006', N'Rap Việt', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000007', N'Không lời', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000008', N'Bolero', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000009', N'Cải lương', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000010', N'Indie Việt', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000011', N'Thiếu nhi', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000012', N'Cách mạng', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000013', N'Trữ tình', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000014', N'Acoustic', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000015', N'Indie', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000016', N'R&B/Hip Hop/Rap', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000017', N'Latin', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000018', N'SoundTrack', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000019', N'Guitar', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000020', N'Piano', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000021', N'Buồn', 2)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000022', N'Cô đơn', 2)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000023', N'FA', 2)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000024', N'Nhớ nhung', 2)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000025', N'Thất tình', 2)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000026', N'Hưng phấn', 2)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000027', N'Vui vẻ', 2)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000028', N'Hy vọng', 2)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000029', N'Quyết tâm', 2)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000030', N'Ngọt ngào', 2)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000031', N'Thư giãn', 2)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000032', N'Cafe', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000033', N'Du lịch', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000034', N'Buổi sáng', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000035', N'Buối tối', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000036', N'Buổi trưa', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000037', N'Lãng mạn', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000038', N'Lái xe', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000039', N'Làm việc', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000040', N'Học tập', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000041', N'Chơi game', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000042', N'Tập gym', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000043', N'Giảm stress', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000044', N'Mùa xuân', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000045', N'Mùa hạ', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000046', N'Mùa thu', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000047', N'Mùa đông', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000048', N'Trước khi ngủ', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000049', N'Hẹn hò', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000050', N'Làm việc nhà', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000051', N'Nắng', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000052', N'Mưa', 3)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000053', N'Bất hủ', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000054', N'Chill out', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000055', N'Giải thưởng âm nhạc', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000056', N'Cover', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000057', N'Mashup', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000058', N'Song ca', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000059', N'Top 100', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000060', N'Tết', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000061', N'Weekend', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000062', N'Tình bạn', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000063', N'Tình yêu', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000064', N'Quê hương', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000065', N'Gia đình', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000066', N'Thầy cô', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000067', N'Epic music', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000068', N'Đoàn - Đảng', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000069', N'Giáng sinh', 4)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000070', N'Remix Việt', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000071', N'Rock Việt', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000072', N'Blues/Jazz', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000073', N'Nhạc Hàn', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000074', N'Nhạc Hoa', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000075', N'Nhạc Thái', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000076', N'Nhạc Nhật', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000077', N'Nhạc Phim', 1)
GO
INSERT [dbo].[Collection] ([CollectionID], [CollectionName], [KindofCollection]) VALUES (N'Col0000078', N'Pop Việt', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000001', N'Nhạc trẻ gây nghiện', N'Những giai điệu nghe một lần là không thể quên của V-Pop                                                                                                                                                ', CAST(N'2021-05-11T00:00:00.000' AS DateTime), N'nhactregaynghien.jpg', N'nam278z01@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000002', N'Nhạc trẻ Remix thất tình', N'Những bài hát đầy tâm trạng, thất tình được remix lại với phong cách mới                                                                                                                                ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'nhactreremixthattinh.jpg', N'nam278z01@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000003', N'Những chuyến di dài', N'Playlist này đặc biệt dành cho những người đam mê chu du khắp mọi miền đất nước hay còn gọi là đi phượt.                                                                                                ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'nhungchuyendidai.jpg', N'nam278z01@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000004', N'Bạn thân ơi mình đi thôi', NULL, CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'ban-than-oi-minh-di-thoi.jpg', N'nam278z01@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000005', N'Song ca Âu Mỹ bất hủ', N'Những màn song ca sống mãi với thời gian                                                                                                                                                                ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'songcaaumy.jpg', N'nam278z01@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000006', N'Đỉnh cao Hip Hop', N'Tôn vinh những flow rap đỉnh nhất trong văn hóa Hip-Hop                                                                                                                                                 ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'dinhcaohiphop.jpg', N'nam278z01@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000007', N'Đỉnh cao Rock', N'Những cái tên hàng đầu giữ cho ngọn lửa Rock cháy mãi                                                                                                                                                   ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'dinhcaorock.jpg', N'nam278z01@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000008', N'Đỉnh cao R&B', N'Tôn vinh những siêu sao thống trị dòng nhạc R&B                                                                                                                                                         ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'dinhcaorb.jpg', N'nam278z01@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000009', N'Đỉnh cao Pop', N'Ở đây có những ca khúc... Top Of The POP                                                                                                                                                                ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'dinhcaopop.jpg', N'nam278z01@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000010', N'Nhẹ nhàng cùng V-Pop', N'Thả mình cùng những giai điệu V-Pop nhẹ nhàng                                                                                                                                                           ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'nhenhangcungvpop.jpg', N'nam278z01@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000011', N'Nghe gì dễ ngủ', N'Kiến tạo giấc ngủ sâu và thoải mái nhất cho bạn cùng những bản nhạc                                                                                                                                     ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'nghegidengu.jpg', N'nam278z01@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000012', N'Nhạc giáng sinh', N'Tết này buồn làm sao?                                                                                                                                                                                   ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'gianginh.jpg', N'binhanvio@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000013', N'Việt Nam Ơi', N'Tự hào về đất nước :3                                                                                                                                                                                   ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'vietnam.jpg', N'binhanvio@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000014', N'Căn phòng chỉ mình tôi', N'Cô đơn chỉ muốn một mình                                                                                                                                                                                ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'codon.jpg', N'binhanvio@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000015', N'Trái tim tan vỡ', N'Nắng tàn Mưa tan Tình ta cạn                                                                                                                                                                            ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'thattinh.jpg', N'binhanvio@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000016', N'Hiện tượng mới', N'Bản hit nổi mới nhất                                                                                                                                                                                    ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'hientuong.jpg', N'binhanvio@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000017', N'Piano', N'Nơi thể hiện trình độ âm nhạc đỉnh cao                                                                                                                                                                  ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'piano.jpg', N'binhanvio@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000018', N'Âm nhạc không gian', N'Không gian riêng với âm nhạc                                                                                                                                                                            ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'khonggian.jpg', N'binhanvio@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000019', N'Love You', N'Độc thân muốn có người yêu nghe ngay nào                                                                                                                                                                ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'yeu.jpg', N'binhanvio@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [Image], [AccountName], [isPublic]) VALUES (N'PL00000020', N'Đêm hẹn hò', N'hẹn hò nên nghe gì?                                                                                                                                                                                     ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'henho.jpg', N'binhanvio@gmail.com ', 1)
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000001', N'Col0000001')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000002', N'Col0000001')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000003', N'Col0000033')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000003', N'Col0000078')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000004', N'Col0000033')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000004', N'Col0000078')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000005', N'Col0000003')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000005', N'Col0000053')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000005', N'Col0000058')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000006', N'Col0000016')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000007', N'Col0000005')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000008', N'Col0000005')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000009', N'Col0000003')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000010', N'Col0000031')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000010', N'Col0000078')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000011', N'Col0000003')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000011', N'Col0000031')
GO
INSERT [dbo].[PlaylistAdmin_Collection] ([PlaylistID], [CollectionID]) VALUES (N'PL00000011', N'Col0000035')
GO
INSERT [dbo].[PlaylistAdminLiked] ([AccountName], [PlaylistID], [DateAdded]) VALUES (N'nam278z01@gmail.com ', N'PL00000001', CAST(N'2021-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PlaylistUser] ([PlaylistID], [PlaylistName], [Description], [DateCreated], [AccountName], [Image], [isPublic]) VALUES (N'PL00000007', N'Đỉnh cao Rock', N'Những cái tên hàng đầu giữ cho ngọn lửa Rock cháy mãi                                                                                                                                                   ', CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'nam278z01@gmail.com ', N'dinhcaohiphop.jpg', 1)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000001', N'Easy on me', N'[Verse 1]<br/>
There ain''t no gold in this river<br/>
That I''ve been washin'' my hands in forever<br/>
I know there is hope in these waters<br/>
But I can''t bring myself to swim<br/>
When I am drowning in this silence<br/>
Baby, let me in<br/><br/>

[Chorus]<br/>
Go easy on me, baby<br/>
I was still a child<br/>
Didn''t get the chance to<br/>
Feel the world around me<br/>
I had no time to choose what I chose to do<br/>
So go easy on me<br/><br/>

[Verse 2]<br/>
There ain''t no room for things to change<br/>
When we are both so deeply stuck in our ways<br/>
You can''t deny how hard I have tried<br/>
I changed who I was to put you both first<br/>
But now I give up<br/>

[Chorus]<br/>
Go easy on mе, baby<br/>
I was still a child<br/>
Didn''t get the chance to<br/>
Feel thе world around me<br/>
Had no time to choose what I chose to do<br/>
So go easy on me<br/><br/>

[Bridge]<br/>
I had good intentions<br/>
And the highest hopes<br/>
But I know right now<br/>
It probably doesn''t even show<br/><br/>

[Chorus]<br/>
Go easy on me, baby<br/>
I was still a child<br/>
I didn''t get the chance to<br/>
Feel the world around me<br/>
I had no time to choose what I chose to do<br/>
So go easy on me<br/>', CAST(N'2021-10-15' AS Date), 2, N'easy-on-me-adele.jpg', N'easy-on-me-adele.mp3', N'https://www.youtube.com/embed/U3ASj1L6_sY', 1, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000002', N'Viva La Vida', N'I used to rule the world<br/>
Seas would rise when I gave the word<br/>
Now in the morning, I sleep alone<br/>
Sweep the streets I used to own<br/><br/>
I used to roll the dice<br/>
Feel the fear in my enemy''s eyes<br/>
Listen as the crowd would sing<br/>
Now the old king is dead, long live the king<br/>
One minute I held the key<br/>
Next the walls were closed on me<br/>
And I discovered that my castles stand<br/>
Upon pillars of salt and pillars of sand<br/><br/>
I hear Jerusalem bells are ringing<br/>
Roman Cavalry choirs are singing<br/>
Be my mirror, my sword and shield<br/>
My missionaries in a foreign field<br/>
For some reason I can''t explain<br/>
Once you go there was never, never an honest word<br/>
And that was when I ruled the world<br/><br/>
It was a wicked and wild wind<br/>
Blew down the doors to let me in<br/>
Shattered windows and the sound of drums<br/>
People couldn''t believe what I''d become<br/>
Revolutionaries wait<br/>
For my head on a silver plate<br/>
Just a puppet on a lonely string<br/>
Oh, who would ever want to be king?<br/><br/>
I hear Jerusalem bells are ringing<br/>
Roman Calvary choirs are singing<br/>
Be my mirror, my sword and shield<br/>
My missionaries in a foreign field<br/>
For some reason I can''t explain<br/>
I know Saint Peter won''t call my name<br/>
Never an honest word<br/>
But that was when I ruled the world<br/><br/>
Oh-oh-oh, oh-oh, oh<br/>
Oh-oh-oh, oh-oh, oh<br/>
Oh-oh-oh, oh-oh, oh<br/>
Oh-oh-oh, oh-oh, oh<br/>
Oh-oh-oh, oh-oh, oh<br/><br/>
I hear Jerusalem bells are ringing<br/>
Roman Calvary choirs are singing<br/>
Be my mirror, my sword and shield<br/>
My missionaries in a foreign field<br/>
For some reason I can''t explain<br/>
I know Saint Peter won''t call my name<br/>
Never an honest word<br/>
But that was when I ruled the world<br/>', CAST(N'2008-04-08' AS Date), 2, N'vivalavida-coldplay.jpg', N'vivalavida-coldplay.mp3', N'https://www.youtube.com/embed/dvgZkm1xWPE', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000003', N'My Universe', N'Bài hát: My Universe - Coldplay, BTS (Bangtan Boys)<br/><br/>

You, you are my universe and<br/>
I just want to put you first<br/>
And you, you are my universe, and I<br/><br/>

In the night I lie and look up at you<br/>
When the morning comes I watch you rise<br/>
There’s a paradise they couldn’t capture<br/>
That bright infinity inside your eyes<br/>

Maeil bam nege nalaga (ga)<br/>
Kkumilan geosdo ijeun chae<br/>
Na useumyeo neoleul manna (na)<br/>
Never ending forever baby<br/><br/>

You, you are my universe and<br/>
I just want to put you first<br/>
And you, you are my universe, and<br/>
You make my world light up inside<br/><br/>

Eodumi naegen *** pyeonhaesseossji<br/>
Gileojin geulimja sogeseo (eyes)<br/><br/>

And they said that we can’t be together<br/>
Because<br/>
Because we come from different sides<br/><br/>

You, you are my universe and<br/>
I just want to put you first<br/>
And you, you are my universe, and<br/>
You make my world light up inside<br/><br/>

My universe (do do, do do)<br/>
My universe (do do, do do)<br/>
My universe (do do, do do)<br/>
(You make my world)<br/>
You make my world light up inside<br/>
Make my world light up inside<br/><br/>

Naleul balghyeojuneun geon<br/>
Neolan salangeulo su nohajin byeol<br/>
Nae ujuui neon<br/>
Tto daleun sesangeul mandeuleo juneun geol<br/><br/>

Neoneun nae byeolija naui ujunikka<br/>
Jigeum i silyeondo gyeolgugen jamsinikka<br/>
Neoneun eonjekkajina jigeumcheoleom balggeman bichnajwo<br/>
Ulineun neoleul ttala i gin bameul sunoheul geoya<br/><br/>

Neowa hamkke nalaga (ga)<br/>
When I’m without you I’m crazy<br/>
Ja eoseo nae soneul jaba (a)<br/>
We are made of each other baby<br/><br/>

You, you are my universe and<br/>
I just want to put you first<br/>
And you, you are my universe, and<br/>
You make my world light up inside<br/><br/>

My universe (you, you are)<br/>
My universe (I just want)<br/>
My universe (you, you are)<br/>
My universe and I<br/>
My universe<br/>', CAST(N'2021-09-24' AS Date), 2, N'myuniverse-coldplay.jpg', N'myuniverse-coldplay.mp3', N'https://www.youtube.com/embed/3YqPKLZF_WU', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000004', N'Old Town Road', N'Bài hát: Old Town Road - Lil Nas X<br><br>

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
I got the hor<br>', CAST(N'2021-09-24' AS Date), 2, N'oldtownroad-lilnasx.jpg', N'oldtownroad-lilnasx.mp3', N'https://www.youtube.com/embed/r7qovpFAGrQ', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000005', N'Tides', N'[Verse 1]<br/>
I have grown up, I am a father now<br/>
Everything has changed, but I am still the same somehow<br/>
You know I''ve never been afraid of death<br/>
But now I wanna see the things that haven''t happened yet<br/>
I still love getting out of my mind, I should cut it down<br/>
I still know people I don''t like and I should cut them out<br/>
I feel embarrassed ''bout the things that I did in my youth<br/>
''Cause now I have a child, I know one day that you will do<br/><br/>

[Pre-Chorus]<br/>
Freight cargo, dot stops and aeroplanes<br/>
Late-night calls, signal is in and out again<br/>
Feelin'' low, serotonin known better days<br/>
Go, go, go! But every moment you''re here with me<br/><br/>

[Chorus]<br/>
Timе stops to still<br/>
When you are in my arms, it always will<br/>
And life, lifе is changin'' tides<br/><br/>

[Verse 2]<br/>
I lost the confidence in who I was<br/>
Too busy tryna chase the high and get the numbers up<br/>
I have the same dream every night<br/>
A bullet through my brain the moment that I close my eyes<br/>
I still have to lean on a shoulder when I''ve broken down<br/>
And I have people that depend on me to sort them out<br/>
I sometimes fantasise I disappear without a trace<br/>
I''ve no regrets, but wish I did things in a different way<br/>

[Pre-Chorus]<br/>
Low fly zone, lawsuits, and film stars<br/>
Headline wrote the princess and the face scar<br/>
Broken bones, break-ins, and Babylon<br/>
Go, go, go! But every moment you''re here with me<br/><br/>

[Chorus]<br/>
Time stops to still<br/>
When you are in my arms, it always will<br/>
And life, life is changin'' tides<br/>
Time stops to still<br/>
When you are in my arms, it always will<br/>
And life, life is changin'' tides<br/>', CAST(N'2021-10-29' AS Date), 2, N'tides-edsheeran.jpg', N'tides-edsheeran.mp3', NULL, 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000006', N'Circles', N'We couldn''t turn around </br>
''Til we were upside down</br>
I''ll be the bad guy now</br>
But no, I ain''t too proud</br></br>
I couldn''t be there</br>
Even when I tried</br>
You don''t believe it</br>
We do this every time</br></br>
Seasons change and our love went cold</br>
Feed the flame ''cause we can''t let it go</br>
Run away, but we''re running in circles</br>
Run away, run away</br></br>
I dare you to do something</br>
I''m waiting on you again</br>
So I don''t take the blame</br>
Run away, but we''re running in circles</br>
Run away, run away, run away</br></br>
Let go</br>
I got a feeling that it''s time to let go</br>
I say so</br>
I knew that this was doomed from the get-go</br></br>
You thought that it was special, special</br>
But it was just the sex though, the sex though</br>
And I still hear the echoes (the echoes)</br>
I got a feeling that it''s time to let it go, let it go</br></br>
Seasons change and our love went cold</br>
Feed the flame ''cause we can''t let it go</br>
Run away, but we''re running in circles</br>
Run away, run away</br></br>
I dare you to do something</br>
I''m waiting on you again</br>
So I don''t take the blame</br>
Run away, but we''re running in circles</br>
Run away, run away, run away</br></br>
Maybe you don''t understand what I''m going through</br>
It''s only me</br>
What you got to lose?</br>
Make up your mind, tell me</br>
What are you gonna do?</br>
It''s only me</br>
Let it go</br></br>
Seasons change and our love went cold</br>
Feed the flame ''cause we can''t let it go</br>
Run away, but we''re running in circles</br>
Run away, run away</br></br>
I dare you to do something</br>
I''m waiting on you again</br>
So I don''t take the blame</br>
Run away, but we''re running in circles</br>
Run away, run away, run away</br>', CAST(N'2021-10-29' AS Date), 2, N'circles-postmalone.jpg', N'Post Malone  Circles.mp3', N'https://www.youtube.com/embed/wXhTHyIgQ_U', 0, N'AB00000001')
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000007', N'All Too Well', N'I walked through the door with you </br>
The air was cold </br>
But something about it felt like home somehow </br>
And I, left my scarf there at your sister''s house </br>
And you''ve still got it in your drawer even now </br> </br>
Oh, your sweet disposition </br>
And my wide-eyed gaze </br>
We''re singing in the car, getting lost upstate </br>
Autumn leaves falling down like pieces into place </br>
And I can picture it after all these days </br> </br>
And I know it''s long gone and that magic''s not here no more </br>
And I might be okay but I''m not fine at all </br> </br>
''Cause there we are again on that little town street </br>
You almost ran the red ''cause you were lookin'' over at me </br>
Wind in my hair, I was there </br>
I remember it all too well </br> </br>
Photo album on the counter </br>
Your cheeks were turning red </br>
You used to be a little kid with glasses in a twin-sized bed </br>
And your mother''s telling stories ''bout you on the tee-ball team </br>
You told me ''bout your past thinking your future was me </br> </br>
And I know it''s long gone and there was nothing else I could do </br>
And I forget about you long enough to forget why I needed to </br> </br>
''Cause there we are again in the middle of the night </br>
We''re dancing ''round the kitchen in the refrigerator light </br>
Down the stairs, I was there </br>
I remember it all too well, yeah </br> </br>
And maybe we got lost in translation </br>
Maybe I asked for too much </br>
But maybe this thing was a masterpiece ''til you tore it all up </br>
Running scared, I was there </br>
I remember it all too well </br> </br>
And you call me up again just to break me like a promise </br>
So casually cruel in the name of being honest </br>
I''m a crumpled up piece of paper lying here </br>
''Cause I remember it all, all, all </br>
Too well </br> </br>
Time won''t fly, it''s like I''m paralyzed by it </br>
I''d like to be my old self again </br>
But I''m still trying to find it </br>
After plaid shirt days and nights when you made me your own </br>
Now you mail back my things and I walk home alone </br>
But you keep my old scarf from that very first week </br>
''Cause it reminds you of innocence </br>
And it smells like me </br>
You can''t get rid of it </br>
''Cause you remember it all too well, yeah </br> </br>
''Cause there we are again when I loved you so </br>
Back before you lost the one real thing you''ve ever known </br>
It was rare, I was there, I remember it all too well </br> </br>
Wind in my hair, you were there, you remember it all </br>
Down the stairs, you were there, you remember it all </br>
It was rare, I was there, I remember it all too well </br>', CAST(N'2021-10-29' AS Date), 2, N'alltoowell-taylorswift.jpg', N'All Too Well - Taylor Swift.mp3', N'https://www.youtube.com/embed/tollGa3S0o8', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000008', N'Chạy ngay đi', NULL, CAST(N'2018-04-12' AS Date), 1, N'Chay_ngay_di.png', N'Chay Ngay Di Run Now_ - Son Tung M-TP_.mp3', N'https://www.youtube.com/embed/32sYGCOYJUM', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000009', N'Love me like you do', NULL, CAST(N'2015-01-22' AS Date), 2, N'Ellie_Goulding_-_Love_Me_Like_You_Do.png', N'Love Me Like You Do - Ellie Goulding.mp3', N'https://www.youtube.com/embed/AJtDXIazrMo', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000010', N'Thằng điên', NULL, CAST(N'2018-10-12' AS Date), 1, N'thang_dien.jpg', N'Thang Dien - JustaTee_ Phuong Ly.mp3', N'https://www.youtube.com/embed/HXkh7EOqcQ4', 1, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000011', N'Đã Lỡ Yêu Em Nhiều', NULL, CAST(N'2017-11-13' AS Date), 1, N'da-lo-yeu-em-nhieu.jpg', N'Da Lo Yeu Em Nhieu - JustaTee.mp3', N'https://www.youtube.com/embed/KhTCatAKVpk', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000012', N'Bùa Yêu', NULL, CAST(N'2018-05-12' AS Date), 1, N'bua-yeu.png', N'BÍCH PHƯƠNG  Bùa Yêu Official MV', N'https://www.youtube.com/embed/FkOt19CUC30', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000013', N'Hơn cả yêu', NULL, CAST(N'2020-02-11' AS Date), 1, N'honcayeu.jpg', N'HƠN CẢ YÊU  ĐỨC PHÚC  OFFICIAL MUSIC VIDEO.mp3', N'https://www.youtube.com/embed/__kGJZ-kPno', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000014', N'Túy Âm', NULL, CAST(N'2017-08-25' AS Date), 1, N'tuyam.jpg', N'Túy Âm  Xesi x Masew x Nhatnguyen.mp3', NULL, 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000015', N'Đâu chỉ riêng em', NULL, CAST(N'2017-06-17' AS Date), 1, N'dauchiriengem.jpg', N'MỸ TÂM  ĐÂU CHỈ RIÊNG EM MV ONE SHOT CLOSEUP.mp3', N'https://www.youtube.com/embed/ttd3hNNxfZw', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000016', N'Sand In My Boots', NULL, CAST(N'2021-01-08' AS Date), 2, N'sandinmyboots.jpg', N'Morgan Wallen Sand In My Boots The Dangerous Sessions.mp3', N'https://www.youtube.com/embed/FXzE9eP1U_E', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000017', N'Chúng ta của hiện tại', NULL, CAST(N'2020-12-20' AS Date), 1, N'chungtacuahientai.jpg', N'SƠN TÙNG MTP  CHÚNG TA CỦA HIỆN TẠI  OFFICIAL MUSIC VIDEO.mp3', N'https://www.youtube.com/embed/psZ1g9fMfeo', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000018', N'Muộn rồi mà sao còn', NULL, CAST(N'2021-04-17' AS Date), 1, N'muonroimasaocon.jpg', N'SƠN TÙNG MTP  MUỘN RỒI MÀ SAO CÒN  OFFICIAL MUSIC VIDEO.mp3', N'https://www.youtube.com/embed/xypzmu5mMPY', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000019', N'Look what you made me do', NULL, CAST(N'2017-08-28' AS Date), 2, N'lookwhatyoumademedo.jpg', N'Taylor Swift  Look What You Made Me Do.mp3', N'https://www.youtube.com/embed/3tmd-ClpJxA', 1, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000020', N'Shape of you', NULL, CAST(N'2017-01-30' AS Date), 2, N'Shape_of_You_cover.jpg', N'Ed Sheeran  Shape of You Official Music Video.mp3', N'https://www.youtube.com/embed/JGwWNGJdvx8', 1, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000021', N'Sugar', NULL, CAST(N'2015-01-14' AS Date), 2, N'sugar.jpg', N'Maroon 5  Sugar Official Music Video.mp3', N'https://www.youtube.com/watch?v=09R8_2nJtjg&list=RD09R8_2nJtjg&start_radio=1', 1, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000022', N'Hall Of Fame', NULL, CAST(N'2021-07-20' AS Date), 2, N'HallOfFame.jpg', N'The Script  Hall Of Fame Lyrics.p3', N'https://www.youtube.com/watch?v=3Kxf2dHlDpQ&list=RD09R8_2nJtjg&index=2', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000023', N'I''m Yours', NULL, CAST(N'2020-10-14' AS Date), 2, N'I''mYours.jpg', N'Im Yours  Jason Mraz Lyrics', N'https://www.youtube.com/watch?v=NpngifA8iRM&list=RD09R8_2nJtjg&index=4', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000024', N'Lemon Tree', NULL, CAST(N'2020-09-28' AS Date), 2, N'LemonTree.jpg', N'Lemon Tree  Fools Garden Lyrics.mp3', N'https://www.youtube.com/watch?v=l2UiY2wivTs&list=RD09R8_2nJtjg&index=6', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000025', N'Unstoppable', NULL, CAST(N'2020-05-21' AS Date), 2, N'Unstoppable.jpg', N'Sia  Unstoppable Lyrics.mp3', N'https://www.youtube.com/watch?v=h3h035Eyz5A&list=RD09R8_2nJtjg&index=7', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000026', N'So Far Away', NULL, CAST(N'2017-07-12' AS Date), 2, N'SoFarAway.jpg', N'So Far Away Acoustic.mp3', N'https://www.youtube.com/watch?v=hiRqIZcVkv4&list=RD09R8_2nJtjg&index=9', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000027', N'Timber', NULL, CAST(N'2013-11-26' AS Date), 2, N'Timber.jpg', N'Pitbull  Timber ft Keha Official Video.mp3', N'https://www.youtube.com/watch?v=hHUbLv4ThOo&list=RD09R8_2nJtjg&index=10', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000028', N'Con đường bình phàm', NULL, CAST(N'2018-05-29' AS Date), 1, N'conduongbinhpham.jpg', N'ConDuongBinhPham.mp3', N'https://www.youtube.com/watch?v=B0khI4ha4L0', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000029', N'It''s My Life', NULL, CAST(N'2009-06-17' AS Date), 2, N'It''sMyLife.jpg', N'Bon Jovi  Its My Life Official Music Video.mp3', N'https://www.youtube.com/watch?v=vx2u5uUu3DE&list=RD09R8_2nJtjg&index=11', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000030', N'In The End', NULL, CAST(N'2009-10-27' AS Date), 2, N'InTheEnd.jpg', N'In The End Official HD Music Video.mp3', N'https://www.youtube.com/watch?v=eVTXPUF4Oz4&list=RD09R8_2nJtjg&index=12', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000031', N'Way Back Home', NULL, CAST(N'2018-12-07' AS Date), 3, N'WayBackHome.jpg', N'숀 SHAUN  웨이백홈 Way Back Home Lyric Video.mp3', N'https://www.youtube.com/watch?v=amOSaNX7KJg&list=RD09R8_2nJtjg&index=13', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000032', N'Đáp án của bạn', NULL, CAST(N'2019-12-13' AS Date), 1, N'dap-an-cua-ban.jpg', N'Đáp án của bạn  A Nhũng.mp3', N'https://www.youtube.com/watch?v=R-j4Nmu0GMI&list=RD09R8_2nJtjg&index=19', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000033', N'Monsters', NULL, CAST(N'2019-05-03' AS Date), 2, N'Monsters.jpg', N'Monsters  Katie Sky Lyrics  Vietsub.mp3', N'https://www.youtube.com/watch?v=ritnXLZHgmc&list=RD09R8_2nJtjg&index=27', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000034', N'Love Is Gone', NULL, CAST(N'2019-11-14' AS Date), 2, N'LoveIsGone.jpg', N'SLANDER  Love Is Gone ft Dylan Matthew Acoustic.mp3', N'https://www.youtube.com/watch?v=hCrtcVDgCGw&list=RD09R8_2nJtjg&index=27', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000035', N'Let Her Go', NULL, CAST(N'2012-07-26' AS Date), 2, N'LetHerGo.jpg', N'Passenger  Let Her Go Official Video.mp3', N'https://www.youtube.com/watch?v=RBumgq5yVrA&list=RD09R8_2nJtjg&index=27', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000036', N'Take Me To Church', NULL, CAST(N'2020-05-21' AS Date), 2, N'TakeMeToChurch.jpg', N'Take Me To Church  Hozier Lyrics.mp3', N'https://www.youtube.com/watch?v=Td2bsJIaC5M&list=RD09R8_2nJtjg&index=28', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000037', N'Counting Stars', NULL, CAST(N'2021-06-16' AS Date), 2, N'CountingStars.jpg', N'OneRepublic  Counting Stars Extended Radio Edit.mp3', N'https://www.youtube.com/watch?v=eXjeMeNur8o&list=RD09R8_2nJtjg&index=28', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000038', N'Me and My Broken Heart', NULL, CAST(N'2014-03-27' AS Date), 2, N'MeandMyBrokenHeart.jpg', N'Rixton  Me and My Broken Heart Official Video.mp3', N'https://www.youtube.com/watch?v=7JJfJgyHYwU&list=RD09R8_2nJtjg&index=34', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000039', N'Haru Haru', NULL, CAST(N'2008-10-03' AS Date), 3, N'HaruHaru.jpg', N'BIGBANG  HARU HARU하루하루 MV.mp3', N'https://www.youtube.com/watch?v=MzCbEdtNbJ0&list=RD09R8_2nJtjg&index=34', 0, NULL)
GO
INSERT [dbo].[Song] ([SongID], [SongName], [Lyric], [ReleaseDate], [Nation], [Image], [SongPath], [MV], [isVip], [AlbumID]) VALUES (N'SG00000040', N'Apologize', NULL, CAST(N'2009-06-17' AS Date), 2, N'Apologize.jpg', N'Timbaland  Apologize ft OneRepublic.mp3', N'https://www.youtube.com/watch?v=ZSM3w1v-A_Y', 0, NULL)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000001', N'SG00000001', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000002', N'SG00000002', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000002', N'SG00000003', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000003', N'SG00000005', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000003', N'SG00000020', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000004', N'SG00000004', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000005', N'SG00000014', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000006', N'SG00000012', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000007', N'SG00000010', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000007', N'SG00000011', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000008', N'SG00000008', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000008', N'SG00000017', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000008', N'SG00000018', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000009', N'SG00000013', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000010', N'SG00000015', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000011', N'SG00000003', 0)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000012', N'SG00000006', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000013', N'SG00000007', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000013', N'SG00000019', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000014', N'SG00000009', 1)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000015', N'SG00000010', 0)
GO
INSERT [dbo].[Song_Artist] ([ArtistID], [SongID], [Own]) VALUES (N'AT00000016', N'SG00000016', 1)
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000001', N'Col0000003')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000002', N'Col0000003')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000003', N'Col0000003')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000003', N'Col0000004')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000004', N'Col0000003')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000005', N'Col0000003')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000006', N'Col0000003')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000006', N'Col0000016')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000007', N'Col0000003')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000008', N'Col0000001')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000008', N'Col0000006')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000008', N'Col0000016')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000009', N'Col0000003')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000009', N'Col0000005')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000010', N'Col0000001')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000010', N'Col0000006')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000011', N'Col0000001')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000012', N'Col0000078')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000013', N'Col0000001')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000013', N'Col0000078')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000014', N'Col0000001')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000015', N'Col0000013')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000016', N'Col0000004')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000017', N'Col0000078')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000018', N'Col0000078')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000019', N'Col0000002')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000019', N'Col0000003')
GO
INSERT [dbo].[Song_Collection] ([SongID], [CollectionID]) VALUES (N'SG00000020', N'Col0000003')
GO
INSERT [dbo].[SongLiked] ([AccountName], [SongID], [DateLiked]) VALUES (N'nam278z01@gmail.com ', N'SG00000001', CAST(N'2021-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000001', N'Nguyễn Nam', 1, N'nam278z01@gmail.com', N'0328731170     ')
GO
INSERT [dbo].[User] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000002', N'Nguyễn Nam', 1, N'nam278z01vip@gmail.com', NULL)
GO
INSERT [dbo].[User] ([PersonID], [PersonName], [Gender], [Email], [Phone]) VALUES (N'P000000003', N'Thái Bình An', 1, N'binhanvio@gmail.com', N'0983001432     ')
GO
SET IDENTITY_INSERT [dbo].[View] ON 
GO
INSERT [dbo].[View] ([ViewID], [Views], [SongID], [Date]) VALUES (1, 1312, N'SG00000001', CAST(N'2021-11-22' AS Date))
GO
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
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_SongID_Comment] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_SongID_Comment]
GO
ALTER TABLE [dbo].[PaymentHistory]  WITH CHECK ADD  CONSTRAINT [FK_AccountName_PaymentHistory] FOREIGN KEY([AccountName])
REFERENCES [dbo].[AccountUser] ([AccountName])
GO
ALTER TABLE [dbo].[PaymentHistory] CHECK CONSTRAINT [FK_AccountName_PaymentHistory]
GO
ALTER TABLE [dbo].[PaymentHistory]  WITH CHECK ADD  CONSTRAINT [FK_ServiceVipID_PaymentHistory] FOREIGN KEY([ServiceVipID])
REFERENCES [dbo].[ServiceVip] ([ServiceVipID])
GO
ALTER TABLE [dbo].[PaymentHistory] CHECK CONSTRAINT [FK_ServiceVipID_PaymentHistory]
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
/****** Object:  StoredProcedure [dbo].[GetAlbumsPage]    Script Date: 11/24/2021 2:10:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAlbumsPage](
	@pageIndex int,
	@pageSize int,
	@nation int,
	@accountName char(20)
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
				case when al.AccountName = @accountName then 1
						else 0 end as Liked
			FROM #Results s left join AlbumLiked al on s.AlbumID = al.AlbumID
			WHERE s.RowNum BETWEEN @Start AND @End
		end

		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetAlbumsSearch]    Script Date: 11/24/2021 2:10:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAlbumsSearch](
	@pageIndex int,
	@pageSize int,
	@textSearch nvarchar(100),
	@accountName char(20)
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
				case when al.AccountName = @accountName then 1
						else 0 end as Liked
			FROM #Results s inner join Artist a on s.ArtistID = a.ArtistID
							left join AlbumLiked al on s.AlbumID = al.AlbumID
			WHERE s.RowNum BETWEEN @Start AND @End
		end
		
		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetArtistsPage]    Script Date: 11/24/2021 2:10:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetArtistsSearch]    Script Date: 11/24/2021 2:10:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetArtistsSearch](
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
/****** Object:  StoredProcedure [dbo].[GetPlaylistsByCollectionPage]    Script Date: 11/24/2021 2:10:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPlaylistsByCollectionPage](
	@pageIndex int,
	@pageSize int,
	@collectionID char(10),
	@accountName char(20)
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
			SELECT *,
					case when plal.AccountName = @accountName then 1
						else 0 end as Liked
			FROM #Results s left join PlaylistAdminLiked plal on s.PlaylistID = plal.PlaylistID 
			WHERE s.RowNum BETWEEN @Start AND @End
		end

		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPlaylistsByCollectionsPage]    Script Date: 11/24/2021 2:10:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPlaylistsByCollectionsPage](
	@pageIndex int,
	@pageSize int,
	@genre char(10),
	@mood char(10),
	@scene char(10),
	@topic char(10),
	@accountName char(20)
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
					case when plal.AccountName = @accountName then 1
						else 0 end as Liked
				FROM #ResultNew1 s left join PlaylistAdminLiked plal on s.PlaylistID = plal.PlaylistID 
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
					case when plal.AccountName = @accountName then 1
						else 0 end as Liked
				FROM #ResultNew2 s left join PlaylistAdminLiked plal on s.PlaylistID = plal.PlaylistID 
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

			DROP TABLE #Results1

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
					case when plal.AccountName = @accountName then 1
						else 0 end as Liked
				FROM #ResultNew3 s left join PlaylistAdminLiked plal on s.PlaylistID = plal.PlaylistID 
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
			DROP TABLE #Results1

			SELECT rs2.*
			INTO #Results3
			FROM #Results22 rs2 inner join PlaylistAdmin_Collection pc on rs2.PlaylistID = pc.PlaylistID
			WHERE pc.CollectionID = @scene
			DROP TABLE #Results2

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
					case when plal.AccountName = @accountName then 1
						else 0 end as Liked
				FROM #ResultNew4 s left join PlaylistAdminLiked plal on s.PlaylistID = plal.PlaylistID 
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
					case when plal.AccountName = @accountName then 1
						else 0 end as Liked
				FROM #ResultNew5 s left join PlaylistAdminLiked plal on s.PlaylistID = plal.PlaylistID 
				WHERE s.RowNum BETWEEN @Start AND @End
			end

			DROP TABLE #ResultNew5
		end
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPlaylistsSearch]    Script Date: 11/24/2021 2:10:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPlaylistsSearch](
	@pageIndex int,
	@pageSize int,
	@textSearch nvarchar(100),
	@accountName char(20)
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
			WHERE pl.isPublic = 1
		
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
					case when plal.AccountName = @accountName then 1
						else 0 end as Liked
			INTO #Results11
			FROM PlaylistAdmin pl INNER JOIN FREETEXTTABLE (PlaylistAdmin, PlaylistName, @textSearch) AS KEY_TBL ON pl.PlaylistID = KEY_TBL.[KEY]
									 inner join AccountAdmin acu on acu.AccountName = pl.AccountName
									 inner join [Admin] ad on acu.PersonID = ad.PersonID
									 left join PlaylistAdminLiked plal on plal.PlaylistID = pl.PlaylistID
			WHERE pl.isPublic = 1

			SELECT pl.PlaylistID, pl.PlaylistName, pl.[Image], pl.isPublic, pl.AccountName, u.PersonName, KEY_TBL.RANK, KindofPlaylist = 2,
					case when plul.AccountName = @accountName then 1
						else 0 end as Liked
			INTO #Results21
			FROM PlaylistUser pl INNER JOIN FREETEXTTABLE (PlaylistUser, PlaylistName, @textSearch) AS KEY_TBL ON pl.PlaylistID = KEY_TBL.[KEY]
									inner join AccountUser acu on acu.AccountName = pl.AccountName
									inner join [User] u on acu.PersonID = u.PersonID
									left join PlaylistUserLiked plul on plul.PlaylistID = pl.PlaylistID
			WHERE pl.isPublic = 1
		
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
/****** Object:  StoredProcedure [dbo].[GetSongsByCollectionPage]    Script Date: 11/24/2021 2:10:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetSongsByCollectionPage](
	@pageIndex int,
	@pageSize int,
	@collectionID char(10),
	@nation int,
	@accountName char(20)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT s.*, ROW_NUMBER() OVER (ORDER BY s.ReleaseDate DESC) AS RowNum
		INTO #Results
		FROM Song s inner join Song_Collection sc on s.SongID = sc.SongID
		WHERE sc.CollectionID = @collectionID and s.Nation = @nation

		SELECT COUNT(*) AS totalCount
		FROM #Results s

		if(@accountName = '')
		begin
			SELECT sn.*, a.ArtistID, a.ArtistName, sa.Own, Liked = 0
			FROM (SELECT *
				  FROM #Results s
				  WHERE s.RowNum BETWEEN @Start AND @End) as sn
						left join Song_Artist sa on sn.SongID = sa.SongID 
						left join Artist a on sa.ArtistID = a.ArtistID
		end
		else
		begin
			SELECT sn.*, a.ArtistID, a.ArtistName, sa.Own,
					case when sl.AccountName = @accountName then 1
						else 0 end as Liked
			FROM (SELECT *
				  FROM #Results s
				  WHERE s.RowNum BETWEEN @Start AND @End) as sn
						left join Song_Artist sa on sn.SongID = sa.SongID 
						left join Artist a on sa.ArtistID = a.ArtistID
						left join SongLiked sl on sn.SongID = sl.SongID
		end
		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetSongsSearch]    Script Date: 11/24/2021 2:10:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetSongsSearch](
	@pageIndex int,
	@pageSize int,
	@textSearch nvarchar(100),
	@accountName char(20)
)
AS
	BEGIN
		DECLARE @Start int, @End int
		SET @Start = @pageSize * (@pageIndex - 1) + 1
		SET @End = @Start + @pageSize - 1

		SELECT s.*, ROW_NUMBER() OVER (ORDER BY KEY_TBL.RANK DESC) AS RowNum, KEY_TBL.RANK
		INTO #Results
		FROM Song s INNER JOIN FREETEXTTABLE (Song, SongName, @textSearch) AS KEY_TBL ON s.SongID = KEY_TBL.[KEY]
		
		SELECT COUNT(*) AS totalCount
		FROM #Results s
		
		if(@accountName = '')
		begin
			SELECT sn.*, a.ArtistID, a.ArtistName, sa.Own, Liked = 0
			FROM (SELECT *
				  FROM #Results s
				  WHERE s.RowNum BETWEEN @Start AND @End) as sn
						left join Song_Artist sa on sn.SongID = sa.SongID 
						left join Artist a on sa.ArtistID = a.ArtistID
		end
		else
		begin
			SELECT sn.*, a.ArtistID, a.ArtistName, sa.Own,
					case when sl.AccountName = @accountName then 1
						else 0 end as Liked
			FROM (SELECT *
				  FROM #Results s
				  WHERE s.RowNum BETWEEN @Start AND @End) as sn
						left join Song_Artist sa on sn.SongID = sa.SongID 
						left join Artist a on sa.ArtistID = a.ArtistID
						left join SongLiked sl on sn.SongID = sl.SongID
			ORDER BY sn.ReleaseDate DESC
		end
		DROP TABLE #Results
	END
GO
/****** Object:  StoredProcedure [dbo].[GetTop100Songs]    Script Date: 11/24/2021 2:10:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTop100Songs](
	@accountName char(20),
	@collectionID char(10),
	@nation int
)
as
	begin
		select top 100 s.*, sum(ISNULL([Views], 0)) as [Views]
		INTO #Results
		from Song s left join [View] v on s.SongID = v.SongID
					inner join Song_Collection sc on s.SongID = sc.SongID
		where s.Nation = @Nation and sc.CollectionID = @collectionID
		group by s.SongID, s.SongName, s.Lyric, s.ReleaseDate, s.Nation, s.[Image], s.SongPath, s.MV, s.isVip, s.AlbumID
		order by [Views] DESC

		if(@accountName = '')
			begin
				select sn.*, a.ArtistID, a.ArtistName, sa.Own, Liked = 0
				from #Results sn inner join Song_Artist sa on sn.SongID = sa.SongID 
							   inner join Artist a on sa.ArtistID = a.ArtistID
				group by sn.SongID, sn.SongName, sn.Lyric, sn.ReleaseDate, sn.Nation, sn.[Image], sn.SongPath, sn.MV, sn.isVip, sn.AlbumID, sn.[Views], a.ArtistID, a.ArtistName, sa.Own
			end
		else
			begin
				select sn.*, a.ArtistID, a.ArtistName, sa.Own,
					   case when sl.AccountName = @accountName then 1
					   else 0 end as Liked
				from #Results sn inner join Song_Artist sa on sn.SongID = sa.SongID 
							   inner join Artist a on sa.ArtistID = a.ArtistID
							   left join SongLiked sl on sn.SongID = sl.SongID
				group by sn.SongID, sn.SongName, sn.Lyric, sn.ReleaseDate, sn.Nation, sn.[Image], sn.SongPath, sn.MV, sn.isVip, sn.AlbumID, sn.[Views], sl.AccountName, a.ArtistID, a.ArtistName, sa.Own

			end
		DROP TABLE #Results
	end
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 11/24/2021 2:10:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUser](
	@AccountName char(50),
	@PassWord char(20))
as
	begin
		select a.*, u.PersonName, u.Gender, u.Email, u.Phone from AccountUser a left join [User] u on a.PersonID = u.PersonID
		where a.AccountName=@AccountName and a.[Password]=@PassWord
	end
GO
USE [master]
GO
ALTER DATABASE [Music] SET  READ_WRITE 
GO
