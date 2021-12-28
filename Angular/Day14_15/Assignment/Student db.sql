
create database StudentDB; 

USE [StudentDB]  
GO  
  
/****** Object:  Table [dbo].[student]    Script Date: 22-12-2021 12:12:31 ******/  
SET ANSI_NULLS ON  
GO  
  
SET QUOTED_IDENTIFIER ON  
GO  
  
CREATE TABLE [dbo].[student](  
    [id] [int] IDENTITY(1,1) NOT NULL,  
    [name] [varchar](50) NULL,  
    [email] [varchar](50) NULL,  
    [phone] [varchar](50) NULL,  
    [gender] [varchar](10) NULL,  
    [course] [varchar](10) NULL,  
    [sendUpdates] [bit] NULL,  
    [street] [varchar](50) NULL,  
    [city] [varchar](50) NULL,  
    [state] [varchar](50) NULL  
) ON [PRIMARY]  
GO  