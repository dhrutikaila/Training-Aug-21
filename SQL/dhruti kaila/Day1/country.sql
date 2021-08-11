USE [dhruti]
GO

/****** Object:  Table [dbo].[Country]    Script Date: 11-08-2021 14:49:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Country](
	[COUNTRY_ID] [varchar](2) NULL,
	[COUNTRY_NAME] [varchar](40) NULL,
	[REGION_ID] [decimal](10, 0) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Country]  WITH CHECK ADD CHECK  (([COUNTRY_NAME]='China' OR [COUNTRY_NAME]='India' OR [COUNTRY_NAME]='Italy'))
GO

