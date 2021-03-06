USE [CharityAPI]
GO
/****** Object:  Table [dbo].[Avid_WebApiExceptionLog]    Script Date: 14-12-2021 13:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebApiExceptionLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[SiteId] [int] NULL,
	[Message] [ntext] NULL,
	[StackTrace] [ntext] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[IpAddress] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avid_WebApiRequestLog]    Script Date: 14-12-2021 13:06:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebApiRequestLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[LogDescription] [ntext] NULL,
	[SiteId] [int] NULL,
	[RequestUri] [nvarchar](500) NULL,
	[ControllerName] [nvarchar](300) NULL,
	[ActionName] [nvarchar](100) NULL,
	[StartTime] [time](7) NULL,
	[Timespan] [time](7) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[IpAddress] [nvarchar](50) NULL,
 CONSTRAINT [PK__WebApiRe__5E54864822104AD2] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
