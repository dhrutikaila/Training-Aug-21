USE [Training]
GO

/****** Object:  Table [dbo].[Jobs]    Script Date: 8/10/2021 5:29:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Jobs](
	[JobId] [int] Primary key NOT NULL,
	[JobTitle] [char](10) NOT NULL,
	[MinSalary] [money] NOT NULL,
	[MaxSalary] [money] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Jobs] ADD  CONSTRAINT [DF_Jobs_MinSalary]  DEFAULT ((8000)) FOR [MinSalary]
GO

ALTER TABLE [dbo].[Jobs] ADD  CONSTRAINT [DF_Jobs_JobTitle]  DEFAULT (' ') FOR [JobTitle]
GO
