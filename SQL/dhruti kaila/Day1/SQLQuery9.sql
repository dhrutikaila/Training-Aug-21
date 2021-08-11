USE [dhruti]
GO

/****** Object:  Table [dbo].[Emp1]    Script Date: 11-08-2021 17:06:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Emp11](
	[Id] [int] NOT NULL,
	[FName] [varchar](35) NOT NULL,
	[LName] [varchar](35) NOT NULL,
	[PhoneNumber] [varchar](11) NULL,
	[ManagerId] [int] NULL,
	[DepartmentId] [int] NOT NULL,
	[Salary] [int] NOT NULL,
	[HireDate] [datetime] NOT NULL,
	[email] [nchar](10) NULL,
	[commission_pct][decimal] NOT NULL
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Emp1]  WITH CHECK ADD FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Emp1] ([Id])
GO


