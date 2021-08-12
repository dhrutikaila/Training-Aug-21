use dhruti


CREATE TABLE [dbo].[jobs](
	[job id] [nchar](10) NOT NULL UNIQUE,
	[job title] [nchar](35) NOT NULL DEFAULT  '',
	[min salary] [decimal](6, 0) DEFAULT 8000,
	[max salary] [decimal](6, 0) DEFAULT NULL,
)	