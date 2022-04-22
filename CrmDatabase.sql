USE [master]
GO
/****** Object:  Database [CrmDatabase]    Script Date: 22.04.2022 22:28:46 ******/
CREATE DATABASE [CrmDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CrmDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CrmDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CrmDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CrmDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CrmDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CrmDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CrmDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CrmDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CrmDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CrmDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CrmDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [CrmDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CrmDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CrmDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CrmDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CrmDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CrmDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CrmDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CrmDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CrmDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CrmDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CrmDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CrmDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CrmDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CrmDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CrmDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CrmDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CrmDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CrmDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [CrmDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [CrmDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CrmDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CrmDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CrmDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CrmDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CrmDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CrmDatabase', N'ON'
GO
ALTER DATABASE [CrmDatabase] SET QUERY_STORE = OFF
GO
USE [CrmDatabase]
GO
/****** Object:  Table [dbo].[AccountContactRoles]    Script Date: 22.04.2022 22:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountContactRoles](
	[AccountContactRoleID] [int] IDENTITY(1,1) NOT NULL,
	[ContactID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_AccountContactRoles] PRIMARY KEY CLUSTERED 
(
	[AccountContactRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 22.04.2022 22:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [varchar](40) NOT NULL,
	[AccountDescription] [varchar](40) NOT NULL,
	[AccountPhone] [int] NOT NULL,
	[BilingAddress] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampaignMembers]    Script Date: 22.04.2022 22:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampaignMembers](
	[CampaignMemberID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignID] [int] NOT NULL,
	[LeadID] [int] NOT NULL,
	[ContactID] [int] NOT NULL,
 CONSTRAINT [PK_CampaignMember] PRIMARY KEY CLUSTERED 
(
	[CampaignMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaigns]    Script Date: 22.04.2022 22:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaigns](
	[CampaignID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignName] [varchar](40) NOT NULL,
	[CampaignObjectives] [varchar](40) NOT NULL,
	[CampaignSponsor] [varchar](40) NOT NULL,
	[CampaignStartDate] [date] NOT NULL,
	[CampaignEndDate] [date] NOT NULL,
	[CampaignOtherDetails] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Campaigns] PRIMARY KEY CLUSTERED 
(
	[CampaignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cases]    Script Date: 22.04.2022 22:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cases](
	[CaseID] [int] IDENTITY(1,1) NOT NULL,
	[ContactID] [int] NOT NULL,
 CONSTRAINT [PK_Cases] PRIMARY KEY CLUSTERED 
(
	[CaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 22.04.2022 22:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[ContactAddress] [varchar](40) NOT NULL,
	[ContactContactDetails] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 22.04.2022 22:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[ContractStatus] [varchar](40) NOT NULL,
	[ContractApproval] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leads]    Script Date: 22.04.2022 22:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leads](
	[LeadID] [int] IDENTITY(1,1) NOT NULL,
	[LeadFirestname] [varchar](40) NOT NULL,
	[LeadSurname] [varbinary](50) NOT NULL,
	[LeadOtherDetails] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Leads] PRIMARY KEY CLUSTERED 
(
	[LeadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opportunities]    Script Date: 22.04.2022 22:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opportunities](
	[OpportunityID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[OpportunityDescription] [varbinary](50) NOT NULL,
	[OpportunityDetails] [varchar](50) NOT NULL,
	[OpportunityStage] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Opportunities] PRIMARY KEY CLUSTERED 
(
	[OpportunityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpportunityContactRoles]    Script Date: 22.04.2022 22:28:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpportunityContactRoles](
	[OpportunityContactRoleID] [int] IDENTITY(1,1) NOT NULL,
	[ContactID] [int] NOT NULL,
	[OpportunityID] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[OtherDetails] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OpportunityContactRole] PRIMARY KEY CLUSTERED 
(
	[OpportunityContactRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountContactRoles]  WITH CHECK ADD  CONSTRAINT [FK_AccountContactRoles_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[AccountContactRoles] CHECK CONSTRAINT [FK_AccountContactRoles_Accounts]
GO
ALTER TABLE [dbo].[AccountContactRoles]  WITH CHECK ADD  CONSTRAINT [FK_AccountContactRoles_Contacts] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contacts] ([ContactID])
GO
ALTER TABLE [dbo].[AccountContactRoles] CHECK CONSTRAINT [FK_AccountContactRoles_Contacts]
GO
ALTER TABLE [dbo].[CampaignMembers]  WITH CHECK ADD  CONSTRAINT [FK_CampaignMembers_Campaigns] FOREIGN KEY([CampaignID])
REFERENCES [dbo].[Campaigns] ([CampaignID])
GO
ALTER TABLE [dbo].[CampaignMembers] CHECK CONSTRAINT [FK_CampaignMembers_Campaigns]
GO
ALTER TABLE [dbo].[CampaignMembers]  WITH CHECK ADD  CONSTRAINT [FK_CampaignMembers_Contacts] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contacts] ([ContactID])
GO
ALTER TABLE [dbo].[CampaignMembers] CHECK CONSTRAINT [FK_CampaignMembers_Contacts]
GO
ALTER TABLE [dbo].[CampaignMembers]  WITH CHECK ADD  CONSTRAINT [FK_CampaignMembers_Leads] FOREIGN KEY([LeadID])
REFERENCES [dbo].[Leads] ([LeadID])
GO
ALTER TABLE [dbo].[CampaignMembers] CHECK CONSTRAINT [FK_CampaignMembers_Leads]
GO
ALTER TABLE [dbo].[Cases]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Contacts] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contacts] ([ContactID])
GO
ALTER TABLE [dbo].[Cases] CHECK CONSTRAINT [FK_Cases_Contacts]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_Accounts]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Accounts] FOREIGN KEY([ContractID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Accounts]
GO
ALTER TABLE [dbo].[Opportunities]  WITH CHECK ADD  CONSTRAINT [FK_Opportunities_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Opportunities] CHECK CONSTRAINT [FK_Opportunities_Accounts]
GO
ALTER TABLE [dbo].[OpportunityContactRoles]  WITH CHECK ADD  CONSTRAINT [FK_OpportunityContactRoles_Contacts] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contacts] ([ContactID])
GO
ALTER TABLE [dbo].[OpportunityContactRoles] CHECK CONSTRAINT [FK_OpportunityContactRoles_Contacts]
GO
ALTER TABLE [dbo].[OpportunityContactRoles]  WITH CHECK ADD  CONSTRAINT [FK_OpportunityContactRoles_Opportunities] FOREIGN KEY([OpportunityID])
REFERENCES [dbo].[Opportunities] ([OpportunityID])
GO
ALTER TABLE [dbo].[OpportunityContactRoles] CHECK CONSTRAINT [FK_OpportunityContactRoles_Opportunities]
GO
USE [master]
GO
ALTER DATABASE [CrmDatabase] SET  READ_WRITE 
GO
