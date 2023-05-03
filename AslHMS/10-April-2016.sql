USE [asl-hms]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ASL_DELETE]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASL_DELETE](
	[Asl_DeleteID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NULL,
	[USERID] [bigint] NULL,
	[DELSLNO] [bigint] NULL,
	[DELDATE] [nvarchar](max) NULL,
	[DELTIME] [nvarchar](max) NULL,
	[DELIPNO] [nvarchar](max) NULL,
	[DELLTUDE] [nvarchar](max) NULL,
	[TABLEID] [nvarchar](max) NULL,
	[DELDATA] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ASL_DELETE] PRIMARY KEY CLUSTERED 
(
	[Asl_DeleteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ASL_LOG]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASL_LOG](
	[Asl_LOGid] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NULL,
	[USERID] [bigint] NULL,
	[LOGTYPE] [nvarchar](max) NULL,
	[LOGSLNO] [bigint] NULL,
	[LOGDATE] [datetime] NULL,
	[LOGTIME] [nvarchar](max) NULL,
	[LOGIPNO] [nvarchar](max) NULL,
	[LOGLTUDE] [nvarchar](max) NULL,
	[TABLEID] [nvarchar](max) NULL,
	[LOGDATA] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ASL_LOG] PRIMARY KEY CLUSTERED 
(
	[Asl_LOGid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ASL_MENU]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASL_MENU](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MODULEID] [nvarchar](max) NULL,
	[SERIAL] [bigint] NULL,
	[MENUTP] [nvarchar](max) NULL,
	[MENUID] [nvarchar](max) NULL,
	[MENUNM] [nvarchar](max) NULL,
	[ACTIONNAME] [nvarchar](max) NULL,
	[CONTROLLERNAME] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ASL_MENU] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ASL_MENUMST]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASL_MENUMST](
	[MODULEID] [nvarchar](128) NOT NULL,
	[MODULENM] [nvarchar](max) NOT NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ASL_MENUMST] PRIMARY KEY CLUSTERED 
(
	[MODULEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ASL_ROLE]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASL_ROLE](
	[ASL_ROLEId] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[USERID] [bigint] NOT NULL,
	[MODULEID] [nvarchar](max) NOT NULL,
	[SERIAL] [bigint] NULL,
	[MENUTP] [nvarchar](max) NOT NULL,
	[MENUID] [nvarchar](max) NULL,
	[STATUS] [nvarchar](max) NULL,
	[INSERTR] [nvarchar](max) NULL,
	[UPDATER] [nvarchar](max) NULL,
	[DELETER] [nvarchar](max) NULL,
	[MENUNAME] [nvarchar](max) NULL,
	[ACTIONNAME] [nvarchar](max) NULL,
	[CONTROLLERNAME] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ASL_ROLE] PRIMARY KEY CLUSTERED 
(
	[ASL_ROLEId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AslCompanies]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AslCompanies](
	[AslCompanyId] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NULL,
	[COMPNM] [nvarchar](max) NOT NULL,
	[ADDRESS] [nvarchar](max) NOT NULL,
	[CONTACTNO] [nvarchar](max) NOT NULL,
	[EMAILID] [nvarchar](max) NOT NULL,
	[WEBID] [nvarchar](max) NULL,
	[STATUS] [nvarchar](max) NOT NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AslCompanies] PRIMARY KEY CLUSTERED 
(
	[AslCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AslUsercoes]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AslUsercoes](
	[AslUsercoId] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NULL,
	[USERID] [bigint] NULL,
	[USERNM] [nvarchar](max) NOT NULL,
	[DEPTNM] [nvarchar](max) NULL,
	[OPTP] [nvarchar](max) NOT NULL,
	[ADDRESS] [nvarchar](max) NOT NULL,
	[MOBNO] [nvarchar](max) NOT NULL,
	[EMAILID] [nvarchar](max) NULL,
	[LOGINBY] [nvarchar](max) NOT NULL,
	[LOGINID] [nvarchar](max) NOT NULL,
	[LOGINPW] [nvarchar](max) NOT NULL,
	[TIMEFR] [nvarchar](max) NOT NULL,
	[TIMETO] [nvarchar](max) NOT NULL,
	[STATUS] [nvarchar](max) NOT NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NOT NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NOT NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AslUsercoes] PRIMARY KEY CLUSTERED 
(
	[AslUsercoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GL_ACCHART]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GL_ACCHART](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[HEADTP] [bigint] NOT NULL,
	[ACCOUNTCD] [bigint] NOT NULL,
	[CONTROLCD] [bigint] NOT NULL,
	[ACCOUNTNM] [nvarchar](max) NULL,
	[BRANCHID] [bigint] NOT NULL,
	[HLEVELCD] [bigint] NOT NULL,
	[HDRCRTP] [nvarchar](1) NULL,
	[HPOSTTP] [nvarchar](1) NULL,
	[HSTATUS] [nvarchar](1) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NOT NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NOT NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.GL_ACCHART] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[HEADTP] ASC,
	[ACCOUNTCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_BILL]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_BILL](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[BILLDT] [datetime] NULL,
	[BILLYY] [bigint] NOT NULL,
	[BILLNO] [bigint] NOT NULL,
	[PATIENTYY] [bigint] NULL,
	[PATIENTYYID] [bigint] NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[BILLSL] [bigint] NULL,
	[BILLID] [bigint] NOT NULL,
	[AMOUNT] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NOT NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NOT NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_BILL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_BILLMST]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_BILLMST](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[BILLDT] [datetime] NULL,
	[BILLYY] [bigint] NOT NULL,
	[BILLNO] [bigint] NOT NULL,
	[PATIENTYY] [bigint] NULL,
	[PATIENTYYID] [bigint] NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[DISCHGDT] [datetime] NULL,
	[DISCHGTM] [datetime] NULL,
	[TOTAMT] [decimal](18, 2) NULL,
	[SCHARGE] [decimal](18, 2) NULL,
	[VATAMT] [decimal](18, 2) NULL,
	[GROSSAMT] [decimal](18, 2) NULL,
	[ADVAMT] [decimal](18, 2) NULL,
	[DISCOUNT] [decimal](18, 2) NULL,
	[NETAMT] [decimal](18, 2) NULL,
	[PAIDAMT] [decimal](18, 2) NULL,
	[BALAMT] [decimal](18, 2) NULL,
	[DISCID] [bigint] NULL,
	[DUEHID] [bigint] NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NOT NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NOT NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_BILLMST] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_CBIRTH]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_CBIRTH](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSYY] [bigint] NOT NULL,
	[TRANSNO] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[PATIENTTP] [nvarchar](7) NULL,
	[PATIENTYY] [bigint] NOT NULL,
	[PATIENTYYID] [bigint] NOT NULL,
	[PATIENTID] [nvarchar](10) NULL,
	[BABYNM] [nvarchar](max) NULL,
	[GENDER] [nvarchar](6) NULL,
	[BIRTHDT] [datetime] NULL,
	[BIRTHTM] [nvarchar](max) NULL,
	[FILENO] [nvarchar](10) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NOT NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NOT NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_CBIRTH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[TRANSYY] ASC,
	[TRANSNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_CDEATH]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_CDEATH](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSYY] [bigint] NOT NULL,
	[TRANSNO] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[PATIENTTP] [nvarchar](7) NULL,
	[PATIENTYY] [bigint] NOT NULL,
	[PATIENTYYID] [bigint] NOT NULL,
	[PATIENTID] [nvarchar](10) NULL,
	[DEATHDT] [datetime] NULL,
	[DEATHTM] [nvarchar](max) NULL,
	[DCONSULTID] [nvarchar](15) NULL,
	[DDOCTORID] [nvarchar](15) NULL,
	[DCAUSE_A] [nvarchar](max) NULL,
	[DCAUSE_B] [nvarchar](max) NULL,
	[DCAUSE_C] [nvarchar](max) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NOT NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NOT NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_CDEATH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[TRANSYY] ASC,
	[TRANSNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_CDISCHG]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_CDISCHG](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSYY] [bigint] NOT NULL,
	[TRANSNO] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[PATIENTTP] [nvarchar](7) NULL,
	[PATIENTYY] [bigint] NOT NULL,
	[PATIENTYYID] [bigint] NOT NULL,
	[PATIENTID] [nvarchar](10) NULL,
	[DISCHGDT] [datetime] NULL,
	[DISCHGTM] [nvarchar](max) NULL,
	[DIAGNOSIS] [nvarchar](100) NULL,
	[OPNOTE] [nvarchar](max) NULL,
	[TREATMENT] [nvarchar](max) NULL,
	[ADVICE] [nvarchar](max) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NOT NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NOT NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_CDISCHG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[TRANSYY] ASC,
	[TRANSNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_DEPT]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_DEPT](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[DEPTID] [bigint] NOT NULL,
	[DEPTNM] [nvarchar](max) NULL,
	[DEPTTP] [nvarchar](max) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_DEPT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[DEPTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_GENDOS]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_GENDOS](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[GDID] [bigint] NOT NULL,
	[GDTP] [nvarchar](max) NULL,
	[GDNM] [nvarchar](max) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NOT NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NOT NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_GENDOS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[GDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_HEADIO]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_HEADIO](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[HEADTP] [nvarchar](max) NULL,
	[HEADID] [bigint] NULL,
	[HEADNM] [nvarchar](max) NULL,
	[RATE] [decimal](18, 2) NULL,
	[HEADFOR] [nvarchar](max) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_HEADIO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_ICB]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_ICB](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[PATIENTYY] [bigint] NOT NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[PATIENTYYID] [bigint] NULL,
	[BILLID] [bigint] NULL,
	[CBTP] [nvarchar](max) NULL,
	[CBID] [bigint] NULL,
	[EFDT] [datetime] NULL,
	[EFTM] [nvarchar](max) NULL,
	[ETDT] [datetime] NULL,
	[ETTM] [nvarchar](max) NULL,
	[TOTHOUR] [decimal](18, 2) NULL,
	[TOTDAYS] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_ICB] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_IPD]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_IPD](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[PATIENTYY] [bigint] NOT NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[PATIENTYYID] [bigint] NULL,
	[PATIENTNM] [nvarchar](max) NULL,
	[GUARDIANNM] [nvarchar](max) NULL,
	[GENDER] [nvarchar](max) NULL,
	[AGE] [nvarchar](max) NULL,
	[DOB] [datetime] NULL,
	[MSTATUS] [nvarchar](max) NULL,
	[RELIGION] [nvarchar](max) NULL,
	[OCCUPATION] [nvarchar](max) NULL,
	[TELNO] [nvarchar](max) NULL,
	[MOBNO] [nvarchar](max) NULL,
	[ADDRPRE] [nvarchar](max) NULL,
	[ADDRPER] [nvarchar](max) NULL,
	[ADMITDT] [datetime] NULL,
	[ADMITTM] [nvarchar](max) NULL,
	[DOCTORID] [bigint] NULL,
	[REFERID] [bigint] NULL,
	[PCNTR] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_IPD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_MEDICARE]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_MEDICARE](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[MCATID] [bigint] NOT NULL,
	[MEDIID] [bigint] NOT NULL,
	[MEDINM] [nvarchar](max) NULL,
	[GENERICID] [bigint] NULL,
	[DOSAGEFID] [bigint] NULL,
	[PHARMAID] [bigint] NULL,
	[UNIT] [nvarchar](10) NULL,
	[BUYRT] [decimal](18, 2) NULL,
	[SALRT] [decimal](18, 2) NULL,
	[STKMIN] [decimal](18, 2) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NOT NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NOT NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_MEDICARE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[MCATID] ASC,
	[MEDIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_MEDIMST]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_MEDIMST](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[MCATID] [bigint] NOT NULL,
	[MCATNM] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NOT NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NOT NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_MEDIMST] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[MCATID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_MGT]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_MGT](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[MGTID] [bigint] NOT NULL,
	[MGTNM] [nvarchar](max) NULL,
	[DESIG] [nvarchar](max) NULL,
	[ADDRESS] [nvarchar](max) NULL,
	[MOBNO1] [nvarchar](max) NULL,
	[MOBNO2] [nvarchar](max) NULL,
	[EMAILID] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_MGT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[MGTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_MGTRF]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_MGTRF](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[MGTID] [bigint] NOT NULL,
	[REFERID] [bigint] NULL,
	[RFPCNT] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_MGTRF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[MGTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_OPD]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_OPD](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[TRANSMY] [nvarchar](max) NULL,
	[TRANSNO] [nvarchar](max) NULL,
	[PATIENTYY] [bigint] NOT NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[PATIENTYYID] [bigint] NULL,
	[REFERID] [bigint] NULL,
	[BILLID] [bigint] NOT NULL,
	[TESTSL] [bigint] NULL,
	[TCATID] [bigint] NULL,
	[TESTID] [bigint] NULL,
	[AMOUNT] [decimal](18, 2) NULL,
	[PCNTR] [decimal](18, 2) NULL,
	[PCNTD] [decimal](18, 2) NULL,
	[DISCR] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_OPD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_OPDMST]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_OPDMST](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[TRANSMY] [nvarchar](max) NULL,
	[TRANSNO] [nvarchar](max) NULL,
	[PATIENTYY] [bigint] NOT NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[PATIENTYYID] [bigint] NULL,
	[PATIENTNM] [nvarchar](max) NULL,
	[GENDER] [nvarchar](max) NULL,
	[AGE] [nvarchar](max) NULL,
	[MOBNO] [nvarchar](max) NULL,
	[ADDRESS] [nvarchar](max) NULL,
	[DOCTORID] [bigint] NULL,
	[REFERID] [bigint] NULL,
	[RFPCNT] [decimal](18, 2) NULL,
	[DVDT] [datetime] NULL,
	[DVTM] [nvarchar](max) NULL,
	[TOTAMT] [decimal](18, 2) NULL,
	[DISCREF] [decimal](18, 2) NULL,
	[DISCHOS] [decimal](18, 2) NULL,
	[DISCNET] [decimal](18, 2) NULL,
	[NETAMT] [decimal](18, 2) NULL,
	[RCVAMT] [decimal](18, 2) NULL,
	[DUEAMT] [decimal](18, 2) NULL,
	[DUEHID] [bigint] NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_OPDMST] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_OPDRCV]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_OPDRCV](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[TRANSMY] [nvarchar](max) NULL,
	[TRANSNO] [bigint] NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[PATIENTYY] [bigint] NULL,
	[PATIENTYYID] [bigint] NULL,
	[DUEAMTP] [decimal](18, 2) NULL,
	[DISCHOS] [decimal](18, 2) NULL,
	[NETAMT] [decimal](18, 2) NULL,
	[RCVAMT] [decimal](18, 2) NULL,
	[DUEAMT] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_OPDRCV] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_OPHEAD]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_OPHEAD](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[OPHCID] [bigint] NULL,
	[OPHID] [bigint] NULL,
	[OPHNM] [nvarchar](max) NULL,
	[OPHRT] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_OPHEAD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_OPHMST]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_OPHMST](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[OPHCID] [bigint] NULL,
	[OPHCNM] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_OPHMST] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_OT]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_OT](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[TRANSYY] [bigint] NOT NULL,
	[TRANSNO] [bigint] NULL,
	[PATIENTTP] [nvarchar](max) NULL,
	[PATIENTYY] [bigint] NULL,
	[PATIENTYYID] [bigint] NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[BILLID] [bigint] NULL,
	[OPHID] [bigint] NULL,
	[OTPTP] [nvarchar](max) NULL,
	[OTPID] [bigint] NULL,
	[OTPAMT] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_OT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_OTMST]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_OTMST](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[TRANSYY] [bigint] NOT NULL,
	[TRANSNO] [bigint] NULL,
	[PATIENTTP] [nvarchar](max) NULL,
	[PATIENTYY] [bigint] NULL,
	[PATIENTYYID] [bigint] NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[OPHID] [bigint] NULL,
	[OPTMFR] [nvarchar](max) NULL,
	[OPTMTO] [nvarchar](max) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_OTMST] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_PATHOLOGY]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_PATHOLOGY](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[TRANSMY] [nvarchar](max) NULL,
	[TRANSNO] [bigint] NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[PATIENTYY] [bigint] NULL,
	[PATIENTYYID] [bigint] NULL,
	[BILLID] [bigint] NULL,
	[TESTSL] [bigint] NULL,
	[TESTID] [bigint] NULL,
	[AMOUNT] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_PATHOLOGY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_PATHOMST]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_PATHOMST](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[TRANSMY] [nvarchar](max) NULL,
	[TRANSNO] [bigint] NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[PATIENTYY] [bigint] NULL,
	[PATIENTYYID] [bigint] NULL,
	[DVDT] [datetime] NULL,
	[DVTM] [datetime] NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_PATHOMST] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_PCHGOTC]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_PCHGOTC](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[PATIENTTP] [nvarchar](max) NULL,
	[TRANSDT] [datetime] NULL,
	[PATIENTYY] [bigint] NOT NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[PATIENTYYID] [bigint] NULL,
	[TRANSSL] [bigint] NULL,
	[CHARGEID] [bigint] NULL,
	[AMOUNT] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_PCHGOTC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_PCONSULT]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_PCONSULT](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[PATIENTTP] [nvarchar](max) NULL,
	[TRANSDT] [datetime] NULL,
	[PATIENTYY] [bigint] NOT NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[PATIENTYYID] [bigint] NULL,
	[BILLID] [bigint] NULL,
	[TRANSSL] [bigint] NULL,
	[DOCTORID] [bigint] NULL,
	[AMOUNT] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_PCONSULT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_PHARMA]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_PHARMA](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[PHARMAID] [bigint] NOT NULL,
	[PHARMAGID] [bigint] NULL,
	[PHARMANM] [nvarchar](max) NULL,
	[ADDRESS] [nvarchar](max) NULL,
	[CONTACT] [nvarchar](max) NULL,
	[STATUS] [nvarchar](1) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NOT NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NOT NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_PHARMA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[PHARMAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_PHARMACY]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_PHARMACY](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSTP] [nvarchar](128) NOT NULL,
	[TRANSMY] [nvarchar](6) NOT NULL,
	[TRANSNO] [bigint] NOT NULL,
	[ITEMSL] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[DEPTFR] [bigint] NULL,
	[DEPTTO] [bigint] NULL,
	[PATIENTTP] [nvarchar](7) NULL,
	[PATIENTYY] [bigint] NULL,
	[PATIENTYYID] [bigint] NULL,
	[PATIENTID] [nvarchar](10) NULL,
	[SUPPLIERID] [bigint] NULL,
	[MEDIID] [bigint] NULL,
	[QTY] [decimal](18, 2) NULL,
	[RATE] [decimal](18, 2) NULL,
	[AMOUNT] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NOT NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NOT NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_PHARMACY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[TRANSTP] ASC,
	[TRANSMY] ASC,
	[TRANSNO] ASC,
	[ITEMSL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_PHARMMST]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_PHARMMST](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSTP] [nvarchar](128) NOT NULL,
	[TRANSMY] [nvarchar](6) NOT NULL,
	[TRANSNO] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[DEPTFR] [bigint] NULL,
	[DEPTTO] [bigint] NULL,
	[PATIENTTP] [nvarchar](7) NULL,
	[PATIENTYY] [bigint] NULL,
	[PATIENTYYID] [bigint] NULL,
	[PATIENTID] [nvarchar](10) NULL,
	[SUPPLIERID] [bigint] NULL,
	[TOTAMT] [decimal](18, 2) NULL,
	[VATAMT] [decimal](18, 2) NULL,
	[DISCOUNT] [decimal](18, 2) NULL,
	[NETAMT] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NOT NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NOT NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
	[BILLID] [bigint] NULL,
 CONSTRAINT [PK_dbo.HMS_PHARMMST] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[TRANSTP] ASC,
	[TRANSMY] ASC,
	[TRANSNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_PINVESTN]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_PINVESTN](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[PATIENTTP] [nvarchar](max) NULL,
	[TRANSDT] [datetime] NULL,
	[PATIENTYY] [bigint] NOT NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[PATIENTYYID] [bigint] NULL,
	[BILLID] [bigint] NULL,
	[TRANSSL] [bigint] NULL,
	[INVESTNID] [bigint] NULL,
	[AMOUNT] [decimal](18, 2) NULL,
	[SERVICEID] [bigint] NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_PINVESTN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_REFER]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_REFER](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[REFERID] [bigint] NOT NULL,
	[REFERGID] [bigint] NULL,
	[REFERNM] [nvarchar](max) NULL,
	[TITLE] [nvarchar](max) NULL,
	[ADDRESS] [nvarchar](max) NULL,
	[MOBNO1] [nvarchar](max) NULL,
	[MOBNO2] [nvarchar](max) NULL,
	[EMAILID] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_REFER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[REFERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_RESULT]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_RESULT](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TRANSDT] [datetime] NULL,
	[PATIENTTP] [nvarchar](max) NULL,
	[PATIENTID] [nvarchar](max) NULL,
	[PATIENTYYID] [bigint] NULL,
	[TESTID] [bigint] NULL,
	[RESTID] [bigint] NULL,
	[RESULT] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_RESULT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_RFPCNT]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_RFPCNT](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[REFERID] [bigint] NOT NULL,
	[TCATID] [bigint] NULL,
	[RFPCNT] [decimal](18, 2) NULL,
	[REMARKS] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_RFPCNT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[REFERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_SIGNBY]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_SIGNBY](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[SIGNID] [bigint] NOT NULL,
	[AUTHNM] [nvarchar](max) NULL,
	[TITLE] [nvarchar](max) NULL,
	[DEPTNM] [nvarchar](max) NULL,
	[INSTITUTE] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_SIGNBY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[SIGNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_TEST]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_TEST](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TCATID] [bigint] NOT NULL,
	[TESTID] [bigint] NOT NULL,
	[IPDID] [bigint] NOT NULL,
	[OPDID] [bigint] NOT NULL,
	[TESTNM] [nvarchar](max) NULL,
	[RATE] [decimal](18, 2) NULL,
	[PCNTD] [decimal](18, 2) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_TEST] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[TCATID] ASC,
	[TESTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_TESTMST]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_TESTMST](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TCATID] [bigint] NOT NULL,
	[TCATNM] [nvarchar](max) NULL,
	[IPDID] [bigint] NOT NULL,
	[OPDID] [bigint] NOT NULL,
	[TOPYN] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_TESTMST] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[TCATID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_TESTNV]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_TESTNV](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TESTID] [bigint] NOT NULL,
	[RESTID] [bigint] NULL,
	[RESTNM] [nvarchar](max) NULL,
	[RESTGR] [nvarchar](max) NULL,
	[RESTMU] [nvarchar](max) NULL,
	[SHOWTP] [nvarchar](max) NULL,
	[LENGTH] [bigint] NULL,
	[DECIML] [bigint] NULL,
	[NVALUE] [nvarchar](max) NULL,
	[RESTSL] [bigint] NULL,
	[RESTGRV] [nvarchar](max) NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_TESTNV] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[TESTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HMS_TESTV]    Script Date: 4/10/2016 4:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HMS_TESTV](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMPID] [bigint] NOT NULL,
	[TCATID] [bigint] NOT NULL,
	[TESTID] [bigint] NOT NULL,
	[TVACID] [bigint] NOT NULL,
	[USERPC] [nvarchar](max) NULL,
	[INSUSERID] [bigint] NULL,
	[INSTIME] [datetime] NULL,
	[INSIPNO] [nvarchar](max) NULL,
	[INSLTUDE] [nvarchar](max) NULL,
	[UPDUSERID] [bigint] NULL,
	[UPDTIME] [datetime] NULL,
	[UPDIPNO] [nvarchar](max) NULL,
	[UPDLTUDE] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HMS_TESTV] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[COMPID] ASC,
	[TCATID] ASC,
	[TESTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201603190755352_InitialCreate', N'AslHMS.Migrations.Configuration', 0x1F8B0800000000000400ED7DDD72A33C97EEF954ED7B48F968CFC1743ABD67BE79BFB7D233850163EAE5EF03D95D39EAA26D92B8C6C6D98674755FDB3E984B9A5BD8127F76F8B1252130B6D759B2B01E8110CFB324AD25FDCFFFFBEFC7FFFCB559DFFD0C76D16A1B7E1D3D7CFA3CBA0BC2C576B90A5FBE8EDEE3E77FF963F49FFFF1BFFEE9515D6E7EDDCDF3DFFD1FF23B5C328CBE8E5EE3F8EDCFFBFB68F11A6CFCE8D366B5D86DA3ED73FC69B1DDDCFBCBEDFD97CF9FFF7EFFF0701F608811C6BABB7B74DFC378B509927FF0BFF2365C046FF1BBBF36B7CB601D65767CC54B50EF2C7F13446FFE22F83A92A2F5D4F43EA53F1CDD49EB958F6FC20BD6CFA33B3F0CB7B11FE35BFC7316055EBCDB862FDE1B36F86BF4FB2DC0BF7BF6D75190DDFA9FFB9FD33EC5E72FE429EEF705B95A61543C1F7E4215B744FC9BDC5EF294C903CADBCD9B1FFE3EFC1DFEE55FC1EF0F066C7276DBB76017FF7683E74A697D39BABBFF88705F8628006A4B939BFA3AD2C3F86FFF3ABAB3DED76BFFC73A28DAF0A0B1BD78BB0BB4200C767E1C2C1D3F8E831D6E537D19240F57B98F52ADB26D3ABA52AAEF7411CBCC8BE0378DFBEBE8CEF47F1941F812BF7E1DE13F477793D5AF60995BB2DB9E852BDCBD71A178F71ED43CD6F17A25457155CFEBBF62D9B6902423CBEEBF6AD5947463FF7EFAABF89B3A1652EDF15A3C24A1D919DEE8CC535D47EEFCF174CB2335317E5FB814D24D352FA3E0EF1A61C2A628A63B42FAE8C97A0C3453D4CE2B9A390A47EBE1523CAD878BF5D27AB89E2E5AEFF17EAF65C715CE33BE2BAAA1229553E1BE2BC13A8803F2563814EEA0F480158EA3DBE136F58C7DFFA12DA348A8FB0F09D773F84974594F2FDF10AEA71F0642D2D8507B90C1B42348DD934F17B2C7443D86ADF1F20E2EBAE273ABF3A2D7C538F8A1D093D3FD4780EB6166365CE690D96845983C521F4485EBE985A8703DD74554E97BBD05A232556BC6C3543C23FF3EC7FBA6ADCC7AE92A84D024838935489B23A7F33B23D5F4D000A41A21D32427664564A4DB9625F5409B641EC4B50D43757BA90E06E9373D7666A66BD3433C8CBD674456DEA6E0D2872F7F74317F95D67C8E4958F828E1A3A4FD28B156F0CD326565B956510ECA9E75BCC7F15DB5C510E8DB31D67C4E678FB591FAF1FE84AD6C9CA42ED5456E1FD485C7F3DDD7934E4D775F4FE29CF7E1C4827B0E9EC08D7B02D17A1605BBC59673E2372DCC1951B12F7C5D93BFA4C839DC7F4575500F931AB6730ED7E06C0126A63DBEECE092D3D3EDD6F8A9FF074C2A3E873F9C54EC7CEBBF62A20F1311EE1347BDE80C5DF846038818EF76E0DED0D9238A585FFE90FCB0E185188D57EB35D7D259650AB6F667B983C5BCCA76EE9823C65E36D60D4341AC9D8C947A7A6A5F7365C19F11C39190AE5AA8722B94A518DDE1AC5C0FBE0C691B8F6DA68B1469DB1924D39E59FBCE102C561B7F3DBA7376F8AF2C7DE08FD19DB7F009E29753682EF6FCDCBFBA9F9D0295049504954CCCB52A69FA11D615D04AD0CAABD44A45F7E4A9C6FE5ED272C8642D876C2499C24412DF83E46AAA28B8B924F2E634D7F63C817892321788465EA0487FC55245B69D23E98A40B8B164086E3AD6D483993A652C020E60030C3880E000F6E4002AC19BBF8B37D849EADD01ACFD2959DAB9055F317FCEB6183D2C83916A7A0888BE113500F2BF91D084E171FD34F097BA0D03FDD6E43D5525A5074624D5307E01A4480F92E01EA6D5B51C6B905B9ED8DD07DB81BE80BE80BE74A92FFAE207884B6B71699A87E583E9618295770AB87645F244FB8E7B905D79CC7857EA847D76599DA0EE655A451C37867AB83164A3A93D7345B910184E919E3C5170E02980A7009E42A79EC2DB123C85D69E027225CB6367F89B7130B2723D8C87B599E42ABA64F551956A293DA4A6495AF7D4AAD863D6BE6BF694D1E8AA86AEE9B6D57945B62CCF483FEDA12AA41A3D488BA82C925391028AEBB8DD77D1A49E3E3E37C5D4399CF5A4580FFEBA62CBC866F5815C75C2EC3739B285840D0BC08F073F1EFCF82EFD78D30FFD976038D103A67613C103D963B684E82574C0D3B55E445A4CC62C856BF3D04F355FBA9F1CEC29EF16D411D4F1D6D5D19D803E5E963EF20C5EDC0919BEC0E8A5BE0F013F033F0F8B9F6D588538DF2A4452CC14B11D0B453D3D74E69B5955E1514611C9E748F51063CE3B92A5AA2370BA16C62262B3E285CE801230451418490A83B9D9FA6AC0BB01EF6678DE0D64F6838F033ECEB02347AE279CA3BF95FF3E26FB7B5BF2163B6BA4CC3976BA98F713F22B788302DCD822E1A6B6B000620267A903DD78C295856EB23153C5A2C1261230908081C4C006126EB008563F031849DCD84862605B79F5BB45592A6DCE407D8CDB710A40E141E141E1BB5578B23508A87B6B75B79D29EBBE79B8087B895E0E3F99BA40E10DDD12281C287C6814FE0AAB3D676571B90752067E037EBB4D7EC32C74066EABFD69B1C873ED3C58BF9AC503A2F1ACA3F5C0A7484746F78400F949909F049A0A9A3A3C4D8DDED7FD67EE5E9F50B6DB88A7872DED861F71C51177ED72159919082405240524A5AB619A13ECA26D286FC3D85F0C645B0818B131A9197BD60C64BE024D034D5F0E4D7BAB9770FC7B18E4ECE99A750BDC9C3F671B0C6986FA58FBED675AACA7E38B12224533D40355819E809EDCA49EA0201A88AB9F3BAF343FCDE60FAE5D786AFD798EE4FBB618BA533DCD887965BE350479920B3B214968163F881488D4ED8AD49962A418A40AF4A709A38FB1C23024CA769EBADF0E1E840084E07685C09A0F44046E6510226000C1B7E0DB8BB78FABD1FA38C2D443E6ACF36ABCA9FDAD87A00443B53434657A9D8A2AEB26DB1E70D65C3266DD13B5CBBE3B5DDA69E620F420F420F49D09FD50741EE625873A2F89E65235DD871103381638F6363976BCDAC5AF03E15812864B3607A1FD2D793D57CFB279A3B406A96C0B339C28E97F1FDCE6963501D01DEC92F9F059C0838FA5F1D31076BAFC9B8867D15D3465EF6349B11E36419CE878D07B4C1384BCD01B899F645D7E062FE8A817C4EAF1825B74CC2D52021FDC22708BC02DBA58B74851251E572229D6C791CCB26D9164B6E30DF16F226A2A6F85DD5945B28495E9BBD443DB25158DFBAAA87B1F095CBE061870F9C0E5EBCBE55B458B577FF7D2FF36C9E0F681DB076E9F20B78F6CD3AC71F87D49B93E1C3F5DD22CDBD38F89FDC367114D6163D6EE216D0AB9D86536D57DFE70871B31CD75B9FB070267AC01069C3170C67A72C6B09BB1DC46C3F0C434E516C239B4D671EF5875BB8F3AD4945EE241410140011ADF1A28400F0A6006CB95ECEF06321A37E9E3FF4C55D16F41304C01F17F795BB5C5E827FE017FF3AC1B8B2BB62769EA84B19433955C53620D74B3F463433031B126B32771A74A789221100CFD65EA9628341066106610E6C45C2BCCE650F60BA9D76510DB268CEB3FE402B813B8F3583DE73DE607C176DD673D83B59BB5C3F66B7E62BA77BF07ACF6B72BF958370CC69BE338970F393DBC225C0BFB7DC169AC8DDC0519751D883E687C2B8D8793FC40E941E9396356D88FD345E6A4FBBD5B4835A87BF2027906790679EE529E1D3909F2ED3FB6E4FAE4B93FB96B176D2B280AB607F9E33E7E8BB40FE3FE55F254723595B122C9B46770524CD3F70B6A076A3734B5DB86E494483F84832241F0AE47F03866847934B29C3A0B1A091A595F0F68E4E56A241E106EFCC540CE534B688A280CED6FCD5639A2F54F85549330E5B5EB79D1D6CD51935FFEA0EA783C159B4F472AA6DB4DEB1C99AF79E738C3C43E39726E3FD74BB9E5B48390F859FC2E7374CF37872F2446D89B398EA1338B546D28F8F122FF404FC2BC2C81E73D81FFC7E1FF41D81E84ED1DAB67001EE230FCC37D6EC8B57B670D59305C281A57064E0FD1D292A2B8AAD73DBDCBB68524B9FB3D1A3C24A1D9D1BD2D40AB40AB40ABBAD5AAC1E4E7F43C9B717D2208531430BD00D30BEDA717908D0446D1CF25916864EF31915306962AF2EE6002A201069C3A70EAFA72EAF4F06710C5AB97C42F81480E88E480480EB6480EDD9A93B364CF1ACA8179926C60C9780F37A2BF20B71000722E75F5E3D7ED7AFBD27F04C8F5096B9B94BDA3B30D02D5982FABAF4F0DED65C8CEA3BCECC764D71EF10A0BE8A09FA09F57A79F90F80E2ADA54E65A555499732C34CCF7074DD096011903190319132E63F2368CFD15E6FADCF78CD653D393DE56E442F0ABBC8C9E16F28278FF7379BB79F3C3DFCA0F6C1DDDEDEBC20F10AC9F3FED7F5179FE1A3025580771D088E519DF15D55049ACEA692C63FB720CC8B0351A143308DF8FC198AA35A3C5D944F12928D3433468EE767DB4955CDBA06AA35914EC16DB23EF2EFDC149A8F16ABD6E4221D7A80052F7E9184CE6609D02C33DF83B5999AE415182377F176FB02B438532552545B76B70A681BFD4ABF1177518FAE247D333E14B74106FCB4688B7251584A9D53587E987FE4B40DD1C18C49D1C85219729806C47A981B1299F05974EBE933A00862E82615C795E0FE3068B60F5B3CAD9F538A49BD4E2906E428BD1F448AF0C8FE4AA1372487D05050F21A811C8B1ACB51024919A0E63E2C8563DC6B313ECA26D98C8CE820ECDD3356BFC5483E6AD5EC2F1695921186416A606010511DD3D90F2F5EF874030BC200264D5F53982432E5062344150206CA2F16A17BF36F32CBE4883929C11DE84921E204E83921F3BD988549C4B4981969E9BD404959DAA4481939FBED184549CCE418965362B7FBE9F3805928D9A40ECD35E43523EEFA93500B49D7813655B0835DD4BB1C3101554B13F43540BB5DFBE81062DCB646DBCB33CD3951AEB381235CE91D75FC4ABD2606561106123D8C738895390C5C455235EB132440D75DC892B4F95D58E548A314971EDF1DE5BBC061B3F333CDEE39F2C82B7F8DD5F9B78D8B38EF20BA6FFF686074DD1BE6466B9F3DEFC05BE0BF95FBCD1DDAFCD3A8CBE8E5EE3F8EDCFFBFB28818E3E6D568BDD36DA3EC79F16DBCDBDBFDCDE7FF9FCF9EFF70F0FF79B14E37EF161D7ACF208AAA829DEEEB03754BA8AABC6773A59ED7057F063FF874F866DF27253F919ED082CAFAE7E20569E4BDCBF89BC1CF9FB70CCF7296DC9C3015B0964DF9A13FC80C4DB4B9E35286EE9F036AA857171B266E1EFCACB1D45191DFB4AF276FDBE09EBAE94E7479B11F329C843ACA6A0EDE3282403A68C426CF4284582CB8707CB8D2C779324B09079888F375498E9B15453D28D720315467A9C6FEAB88C9299E831F284994390DC468F92CFDA1DA2E4367A948349B943A0033313563AD954424A8D4C38E9EC5309273532E164B34B25A0CCCAD0D6FBC9B70FCDBD373361555BA93032E1545BA93032E1D4B4D2DE5A457ABC2F71629979EF2BD45B5ABC29333A2DDF1FCE95B5A0FBFD9C1A07DD1F297C84EEBFA7B75EEE411FAFF44DF7B57D9AB943E3D6F08C72472C8C4C384A92935FC2498D4C38D50FAC3032E1543FB0C2C88453F381EDADF448481A1B6AF9851546D69696EA5A5AEA4E82CE471BC5B4783BCE20D3E77C84515BF2185BE002ABAA67989B2F9327F0CDA327A7F4191446269C2ADF1446269C2ADF1446B6E7AAF04D6164C2A9F24D6164C2A9E19BBDB57FBE491B55AA6BE9ABE49BFD025A3BC24916DAF818A7BE68A3A75CE21AB6B1A7692BB36A3FD95B194646985324A33432CA6C0CF7839F9DA4797CB89BCCC6865279A6CCC686521E51E7368611B58C74DBB2A432CB1CDAD9C6D5AE6D18AA5B452C5F83F1A8B8F1E8358C22CF4BAA4534417B5E254B5BFCD45A5BBA7B7E4CCB54F8A4B0C2D70A5FEB0794B37DADFB689D769F6A12D5C3F79DD6176D94D8AC446542FEC07E99E32E70CF8E3C9190A978CC2EAA8BDC0AE5A446A6CF1B8F3DDDCAE79D1A99E677D40A4E6164745E2B2EE2DE0A0E2C48224822AD241E069EB65AABCE0254B996AA9BCA1E998C4C8BD42C54EF2F5CA6309212655F3AB7B190AD83CA28B98D1EC576CA92985AFA5F7537ED71F973CA4CFDAFB693D9CF2410B23C259A181971CAF7531819719C6F3538C4C830B18A496E52D2E7DCC68682EC2A0A627A57108D701207A21168706E2B1A619FFEC1AFE5499A08BB8CD7176BEC77E58FE90C810664DF019233798892DBD8509E9EAA284F4C5A404A943B6A6EA34739C8383D043A307360951BFAC30566BC0634F637E719D5D6AA9E15730AA57C3BB98DC1C3C93689F8E0E064367A9422ABF610A63082E281E251E3DC9EE21D86BAB7D3BDBA8D2312181AF56B2A0C1A488F021A483DC2D73D79AA95DFDDDECA8A84CAB305859561EC976D6EFC61EC97D918C67EE989D0A5C15F6EA4C7C937473E84C96DF4289A6B7B5E05676F65990B995770721BDBDBAA7A1C7B2B3D52BE3DF3214E6E63E9D3BA5281298C0C5FBF645460721B5BEB943FAFDCC6803253A71594CC063E1DF874D458E0D3F1F874C5B611FCCEDCC1F612ECCEDCB1C24376E6489B55682BB3F5BD74901C48E15451D8960F80422970804269706E8F42B33D73F84934DB5B879D409B0A0E993C496B95092BB7B1A194EF25B7B1A1942938B7319067258FC4654C2221754E6CB77A238911681C689C1A0B689C97C68B6DCBF8899C6C6FC6CEE2B5A5864CE11D4CFD0999AA133D8D2866E14A1E97E52EB5B02054DE19E3A613EAA43C81995A5810CA1397A985010155EE0131DE03AADC03629E389DDAB372EC4D6E64C251A427AF82931A41B041B0A9B140B0B9053BDF24B48560BF2D7904BBAED49005BBD85EFE035DE54610FE06BCF2D0F0C0CCB0AE35935C4597AC32D8A19D014DB594726E476E6358212BAFFA496C2B7E8A3D2ECD3812037D79B32EECD4648F3B755543D774DB2AEB676EA547B26579465E6F19EBD0CEF0BDA99505F6CCC4D0460222B14900B8E396DF756E64C42977BBC2C88263EA152FB03032E2947DC1C2C8D28F656457947C6F65E98993AA4B5018199847B6CAA96499099C4A702AA9B1C0A9E4752AC9B6F1FCFEE4C1F6F2EC6EE5B1C243F62E719355727135460F0E17A86C6CA0312F857ABA565E094D4C6C4A272C8FEAA146BE1F9851BED4A0540EC13B86222A1F0BF4800207F48006E7A2F4C09D0851842A0C9326D415BF765510E555E7E7737C80C96CE057038F5263018FF2F2283900899F456DAE79DADA5243E64C51F3B4C5B9A0151C93698EB638F7B38273F65C9141CE1B8BD22B310BCFF9E1DD1FA721531B038A2C551A3BB7B1DD4B0525B3318CCE84E4808A98632305CA7D2635318C57754F2E6FD3949AC027019F841A0B7C92163E49CD569E6C6E097726EB91B2E0A2808B72114BDB83588C16B5502A62DA77780B8A62A63ED243EF3F3CD39C31F9795E497C9E9F23E939F1B0D4498DDBA5564EF23D8533B5BD2A4E6264C3B1D49A2CE3C4488F2326C9D895ABA9D3B98DE199666A0525B731A14072F0712C709069B0C0416EE1209303C35B39C8F9C1E25C1E7263617091CFE6228B756BC5B9DBC25CE454AACA39D5B9B17F17E1FAA41D44990207449906E71645996406B712659237CE25C8F505872CC6B8B52A1B15E53626941A10668CF2AC4B6662C2705105C305F205F205F23DB8DE25F9B65D32786DB164D058F6262858AEE14F194E3E03D202D23A4A5AC9B2410BCE7283672EBE6A283764AE12B6EC428A68B5401A075299F80A23C32C908E8C5277CD4CFD2F93417604280B28CB55288B3733DAB8C36E10BDAF7992E59A0A0E595C046FC3509EA23E305F47AC8A98A051B706C5E541213DBD8C92D840244024A8716E5024D270A356E30F27D845DB50DE86B1BFE0938B531043160E51A31231B1FC904D77120B2895060B289597523D5D2387A0F253AAB77A09C7BF3988B4A9E090E993B4561925B7314C7ECC5065012FB7F53B0D23E6E4808491D0ACBC77F58119481848981AE7F648980C455B50300A221E4FB6BED890E9774819A4BA5339362033B1AC4456306C560C72E7650ACF6D0C3E74EB930744E4B102F953E000F9D3E05C16F9B78B042144CE1D0A72ACF00D68012E5161CFCC76815A603B4FA56D6733137030703035CE6D72B0D5263D89B0681580927EEB0A0E9A7A87B59A56217097DDFDC52534B78AA2316EA182957C564521368639A6A9FDADBC209BDBE8510CD5D2D0F4234A6E63991F9275B3B4F14F6EA347B1E692312B11416E636BDDF226442EF32644E95B9DD7BDEA39C824C824C8E409996CAB92BC2279691A39A0A92A34972A61F3B90D180F188F1AE7C6186F138D57BBF8B5EDD150090807EB35941B34EB9110C4722A7E6164C411B0D1C080E32407B96181C818CEB1347E2A8FCC721B3D8A989DC1C6BA8BA6E57E50181971CADB4F15467A9C898EC762A5EE9DDB20F009949D1A0B949D53D995C06FAFEC090887B2379403650765BF04655754A9AAA6859111A7B299636E64C0916D8BE44F941FEED0CE80D6B0F526CFDE9B8A2C615AFF2E95EF2BB73223954FCB2CACCC48722D1293E283FF418103FE070DCEEDF91FAB68F1EAEF5E82D63E480EC4E3873497055F047C918BF045C82E885AC51929ACAC481577A4B0B220499A657B7A65C3C6C2CC121664D9E5D0CCDCC6D243B15765AAE55CAB03333D96A4CC75B9BCD17A6603DF017C076A2CF01D387D072D0897DBA8ADE390A270780D4D0587EC326895E04A8D31B612AB8953466093644D294F87A716204D204D6A2C204D4ED23483E54AF677ADC75B390ECF11BC8D45874C9D664D248BC91CC962AA8A5E41C96C6C2895D3DD331BD39A22FEF22A21310766065FDFF6244D9D54660BF7668671D154724DA9322C2AAC0C1FA6A5975CFDD4C2B0D2397B2AEF0F9C99E8313CC928636426060CF497A997721A721B081E081E35CE4D0A9E19C522F4CEE4CA2F6E2C79036A5793566632A795016B51E0006BD1E05C0C6BD9A82D61D995545A0AAEAA2B34649A127A32D480965260098423D052C819EF420E26414EF9CD6526268CCA7D20D673029053395B2AB7C16C1BC8383516C838B78CD7EF29C1A4E3FCC79B3416054D074DBF044D17734C1832276E1924B5B1A120BB8A82205501B414B4F4E07A575AEAC842020533189E15FFE6A243D65391BA2338C44FA47E09D11BE1072E90A629EFD65118197AC2547235B5D2170A2B43D89A69CFCAF16FB90D740C748C1A0B748C5BC7B621396AC70FE38A9230E95801C32565474A839A819A7537C32A4A131BF2D338D2D340134F628126D2608126F26A221E586DFCC5EFD683BB0C8747111B8B0E590E13DE2C8B616164C431EB264BCDB34C96EA4835CB1A91DBFA1778721648790A31B7B1A194A710731B4C2377E9087933C731F42ACF1FDA19A29A84C4F0FE03955A3D3130B81BAD8F2A00B7E72416B83D3458E0F6B4727BC4383DDC2ECF65393CE29203D2329523E50FCCAC58E550D7BD958194059D082FDB169264546EEECCC8209D4842B3D2EDE436207720776A9CDB2477019907390E2FC15F5CEEC1B58E6961344A8505A351B6AFC5469520DFDC468F3297AA28B98DA14FE99E5C1D53EEADF448965ABD9FDC066353705FA8B1C07DE1755FF4F06710C5ABB0B5FF9201BDF8F16A1BF27831270086ECCBC072352C57E75C3827E77155D9BF30F73D738BE9946C57567143F666505A505A6A2C505A1EA575FCF875BBDEBEB45FFACE817814B6B9EC90C55568A6D080260A3A11D5010EAA050974CD818888F9404431478CC192EA492C10531A2C10D356629AE6BD0A9354EE0CDC930820AF20AF5DC9AB32AFEC073E675C699857F6019FB3ED010E52468103524683738D52965F94B761ECAFC26057FE49517B6629FE8F7203911CFF2548256B5FCE5BBC061B3F79EAE8CD5F1001C0BF98AC7651ACF8B1FFC38F82F427A33BDC443F57CB60F775E4FDC62AB5F9447EF0C9FBBF6B79BDC2CFBBFF81E987ABE7208AD1F6BF82F0EBE8CBE7872FA33B69BDF2235C34583F8FEE7E6DD621FEE7358EDFFEBCBF8F920AA24F9BD562B78DB6CFF1A7C57673EF2FB7F75F3E7FFEFBFDC3C37DB0DCDC47D1727D288C07029D7BD5D15ADE6EDEFCB0343E7DFC2BF85D7E1BF9FB7683E74A697D597EC18FF76588C75287F9589ADCD4D7D18FD5CB8AB44BA2F65A805F9B1F074BACF558E271BBE8CB207982D19DF5BE5EFB3FD6B8C8B3BF8E824AED0DB2FDB1963D48BC7BA7C22011472946F8D3DF91A34DFEF7C6FFF5CFCCF753841D8900CB628FC8E72A020E4B886EEC1BAB1DD837754C0145D3FC79689488BBCAF54DC06D1D285C9BCE55C85B0AB2C4DD3E5E6D020E9894B7C53C5946DD02C00E24AE4D3315FAD6AE990A7913F364BCCD742870C769DA33BE2BAAA1229593A6BF2BC13A8883AA874145D307A5874FD322BA196E6BCFD8F70F6E1025C91B10D0C930D661BF6F8B25ACF3632C711C81A4B1A10A528BB4F125315F38AF5A307DDF86ADF17EDCB8E88ACF01CB8BDEC6678D1F163D39623A2BC66A4F1118E4902278E58C3C972876C058C2D801630D931DD276BF247630556BC6430F3C03B3EE8763A6ADCC84BD4C420C92D1EE4324CD4B428604DC0E8112F464048A62C4490385C787BA6D5992209620434ED7360CD515060963B21B1A4631739FE9211EFADB130D2B093651D4E8CEF47F1941F812BF7E1D3D7CF98393FB444D24C157035F4DFD5783E9996FB6202BCB35A57B50F6BC430AEA8FA73508B52F4385D6A33343F774E2BC19CA095C4A72505DE48A22073C04138395CED189C14A9C3F51CE15B87F2064172964D17A1605BBC596736A2C2DCCB93AB92F7C1BD3630443945F4AF25D050D5D6D479498095D7535ED71DF2BAEB4F377D6F849CC8D2560A25C9B04CCF926068CF0D7E4B4D052632141AFF27257A9A96E69809AD8F73235DDAB3BB7C29E679D7ABC5AAFB966A96B22DF6A7E561F684B31A17DF6856B2A1092A041A248DBF51982F2F424E0568E2D6E51811C84EAB6714B3EC4E80A001224B4A489BC9623F53C25A75533E7593059B70916AB8DBF26A185F8AF68B5C5DDFAE10FDCE3173E41FCC27A8B4544F1C58DF140D040D044085A5D8209C81AC8DA75CA1AD95268AAB57F5F290E32DBE2E41B2E75A36E5E7AD04F57F0F93E4FDDA06BAEED791DE24BCABC43F4FDDE55DDE0E77B5A7583EE48BAD221FC58323A6EFAD621B23375DA16037C4BF02D6FD7B75482377F1793BCB7DE7DCBDA9F9229FB2B7643F3C76B0D22685923D911544CC8E1E5F2E885AEC3426AD46058741AF84BDD86D1392FA34D554911444304AA6D2F26188208D63DCCAC10EC4193DB9CD862027D80BD81BD6F95BDF5C50FA0EE0E27225970044D200A9BD73CB5384615A83816A46DF2B8EDADA893F693AAEA0489D1461509B81924E866908DA6F6CCED4AAB31BC223D795DC1837C837CDFAC7CBF2D41BE7965B7D8EFAF5D9FB9722F2003123426D46692ABE892250A4EB51441E91E922686D0147BDCB647990233755CD5D035DDB68480D9B23C23FD41101C520D415C4B170B4EB7E6AAB88E2BA62B2458A2BAA762EA027CC6044690DBA8D832B25B2BB7AB4EDACBBF235BA833FF151C4C70306FD5C134FDD07F0986B3466A6AD7BC449A3D5D5B0C610BA49EAE0913429ABC2F6AA97F1007F545CC7C8EC00C32D008D088CBD40877022A71192A21C4EB7627C4EF06B71B281528552CA5DA30AFCBCF6D82E6758B635C44CC74E547B9889CD9BDCEF96621CA2424AF333F69ADCD8D20593A2AD674D3A45E6B8C6E73543B9D7E23E04A57E0241303260EC183A96B71F060DA793090B70B7ECCEDFA3182D7CD87B7D02D76CD55D4F4F0801625BB9D1E490F3C6C470DE991872278A1D324F1C44953275DC24FEDCEE21309BCA55E689AB52B779A823E53BB45BFE10C6970E1C1856FEDC2BBC12258FD0CC087BF5E1F7E087BDE0C6D479F54979C0B7538C02368BC77507350F39B557392A90F4ACEABE4B6336DBD6713C61000216C5BF7A90B4C0B4C5BD7E2C0B4AD98F615963E0641B6B220AA04060206BA2406C23C7106F6A9FD69B19272A54C7572A5881E4513B26A2588F2908E0C319F32247F80D480D45CAFD444EFEBFE9303AF463FC46E422168B3A58186D488088475C560CC0C04740F747F8374FFEC04BB681BCADB30F61703C90A87410695D408C84580943F60D6C61607666DC1ACDEEA251CFF1E069F7ABA665D319DE68FD70A449A21512B71E2E65A041E8F90B0159A2141DC006C0C6C7C416C8C826820BE6DEEB5D1FC341BDB5E296D9FF25FA9937A5B83E8CED17316289738DB639087B980C31A3ACDE005650165B934653953780883BE8068944144B9D543910EDB7912B38B2F103010F0A511B0351F08F95EB9C72EC2D916B46227CC51C6509AA883C73C64CE84407953FB9BA0C55F43B534346DD7DE8A2AEB66CBAD93ACB964CCC410A62B6027A7F4BDCF413241326F523287A298301D36B8E93034978E46EBD31D420E9C089C78419C385EEDE2D7817022892124C9F3B4BF25CD7CADAC98B7457B94637B240C22B6737467FABF8C207C895FBF8EFE9D3B2CB3E553528577B6DBC9EDC3833E7C667DD2B1347EEA741FB60FF7F737E6DBD35D346DDF4D121841FB794D743C0AAC7071CBD770B9D15D748B82E02ED0397AB7E92F28810FFE02F80BE02F0CDF5F50544984202730A2CE5A946D8B249D9C7AD67F63062E6F982A0A5796B05A7C97043D7D0236160926C679009F067C9A1BF6695611817CE97F8348F06BC0AF01BF8655F9C8BE939A00C726C111E5D9E89266D99E5ED1D0D2C3323FAD8D995450F60272B12B67AAFBC4B7961B62CC7559D4C236B81FE07EDCAAFB813577B98D86E17B68CA152F356BEDE34DB1EC88094FD21461815CC09DC09DB7CA9D66B05CC9FE6E202337933EAAC75415FD8AA9D61411D593B7516B1071ABA6F84B6DBDA3A7627B92A64EDAC23853C935A5D6612F965E190EB45DA79E3D75B723B327191D82A3BF4CDDEA0A1DD415D4F5F2D4D51C4A0679BDB8826296412E72B368602B60ABB66C6523D8BF7308077C75BF5CD36A99A5DDE69F426E4AD8B1BC82B6361DEB86D1F68E441C0A831C41AF0B2309B81938C20B524EEA5B1C524E5AE9349C2B036A0D6ACD2D6E228E5F43E6444CF63F814262C807441144F15645D1919308C4FEC300AE4614C54A88D8603F515179821444DC5116A495DA6E49224F255753DBDE8A64DA33D8D21DA4A9B6C5419A5A49D33624A723F9211C9004EA74046768EA24625A5388C29593D340E140E140E106A470186FE32F06726C4942394428687F6BB6CA15AB7F2AA49A84F5AE548D8B263E16F8F6E50F3E5CF3E928EEDFF8505BA7AFE5AF740833CFE48097FDFC23EFE69C0E425D4D3B779E8B378CF9E796919EDECC710CBDBDEC9C0AF4A5C1F8077AEACC35EAF0500970EA2020ACB9C92120ACBD5B370CA76E1FAD7FA52ED5E9740406184D4C7284A0505849515CD513C3A2B26D2149169381ED2109CD4E249C03CB03CBDF00CB0F264BA1E7C1FBD5C8C72D8EC861300D8369F1836964A30E0397E75297E8644B9E2EC7C396DAE5DDC3681BFCB01BF6C3F4F06710C5AB173FC65F12440A40A440330E440A34F5516B4ECE781B76A8002649B2F55BDB9BBC5CB984880388386829967EFCBA5D6F5FFA0F39B81A9D149904559D20E0175B41A950A2257220A367214A2BE01CCC5327C69D5F65411E411E6F5E1E21531844B20EE4BA4552990B581598EF7736E7C500090209BA290992B761ECAF3085E71CBC5D0693D52E8A153FF67FF851799FD9B49417C4B94718ADE5EDE6CD0F31DDEFEBF93AF282F5F3A7C38BDEE235D8F8B8357F6CF143A4375B5C5F0551A5052A3579C677453554129958ADE9E0626D4D07D729EA316CADA192E44A530DC9450A7853B5660DF8E9A5A60AD2AB9435981E3A524972F5583DC90F28AA726DA3E98DA4979A2A49AF9EAA215ACFA260B7D8D677AFFC5A43EF4A2F5374AEF16ABDAEA92135D7814F4DEF3B19D95121673E5D3D7E7EF1582D34EF4209DEFC5DBC0908DF552A3ABCD8541159113F59CB34F097BA5D53437EA1097DAA4A8A5E8DE628E3EB8B1F35E089B5095997C7A761DF9675B0C4DA08EB549DE432ACE987FE4BD0D0E687179B2A31B5D34DBEC7712747AB21978F54442E9FA8CAAE6D26FB5833D914CD84011A3F81836B47AAA0F90030921B2C82D5CFA0BE9AE2E2917A5C794E510FE9EBB575A4179AF1C9474081FF7AA4B55E4FB7D694A6B5F080B0B686CCDE84EEAA13728CF24970923E5D8B9E5E6886278725D2DCBC13ECA26D98B82F8BFA9ACA3F69AC73E2C8D6E93ABDD54B38AEF372F20B4DF89EAE59E34ACC5B051F0551DD73A4E6266C32A94785DCD8A30E2F1EAB85A64F112C6BDE5009B970AC02EBF49747609AE04FA09F061FAF76F16BAD4627F626703939BE9B429DFD5AF4CCDE889E9C457A1ABD38CFAFA686FDB5E65A9283C14E56939DDB53AD23BFD05401397DDDF64E2B5D7EB6458DCA15971A154E557459724FBB94F91EDFF59598C73E3752079514D579DE7683C39D90360D66B32AA093A240F5FD165B3255ABD85F6AAAC2C13DC846324525FBCD35EAEA39B8DA5C557AA8EEE9BAF234E79A8A8A4B8DB5241915F269E6CEB26E9AEA3855031D7E7D8FDD5F3A5A07D5CBFF18CD545357E9078D3566211DA76B2C96846B2ADB5F6BAC0733A38D87DC142FA834B97EA4BA531F525269A539F339966236A5B8F6789F226506FC6FBCDD617FDDDC2E837594581FEFDDF7904C30A5FF2941841D8A02E2116386C18234F91E34FF8D1E3E6FF39922FCB8877794FFA434916406B1BFF4635FDAC5AB67EC16E1CB8B208A56E1CBE86EEEAFDFF14FD4CD8F60A987F67BFCF61E4B51146C7EAC7F1F3EEFE3FDF1FA1FEF2BF7FC68BF91FF22118F806F7345E6E4EC70FCBE5A2F8BFB9E5497079A20C82C57B67081EFCA8BC90206E96A1992B50D2981B2E6C3C36BAC8078088682CDDB1A834576E8F964ACD1746FA7DBF0638B3D2A2BFF65E76FA20C635F1EFF8BBBDF72F3EB3FFE3FC2F9AEC83AB60300, N'6.0.0-20911')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201603200609231_InitialCreate1', N'AslHMS.Migrations.Configuration', 0x1F8B0800000000000400ED7DDD72A33C97EEF954ED7B48F968CFC1743ABD67BE79BFB7D233850163EAE5EF03D95D39EAA26D92B8C6C6D98674755FDB3E984B9A5BD8127F76F8B1252130B6D759B2B01E8110CFB324AD25FDCFFFFBEFC7FFFCB559DFFD0C76D16A1B7E1D3D7CFA3CBA0BC2C576B90A5FBE8EDEE3E77FF963F49FFFF1BFFEE9515D6E7EDDCDF3DFFD1FF23B5C328CBE8E5EE3F8EDCFFBFB68F11A6CFCE8D366B5D86DA3ED73FC69B1DDDCFBCBEDFD97CF9FFF7EFFF0701F608811C6BABB7B74DFC378B509927FF0BFF2365C046FF1BBBF36B7CB601D65767CC54B50EF2C7F13446FFE22F83A92A2F5D4F43EA53F1CDD49EB958F6FC20BD6CFA33B3F0CB7B11FE35BFC7316055EBCDB862FDE1B36F86BF4FB2DC0BF7BF6D75190DDFA9FFB9FD33EC5E72FE429EEF705B95A61543C1F7E4215B744FC9BDC5EF294C903CADBCD9B1FFE3EFC1DFEE55FC1EF0F066C7276DBB76017FF7683E74A697D39BABBFF88705F8628006A4B939BFA3AD2C3F86FFF3ABAB3DED76BFFC73A28DAF0A0B1BD78BB0BB4200C767E1C2C1D3F8E831D6E537D19240F57B98F52ADB26D3ABA52AAEF7411CBCC8BE0378DFBEBE8CEF47F1941F812BF7E1DE13F477793D5AF60995BB2DB9E852BDCBD71A178F71ED43CD6F17A25457155CFEBBF62D9B6902423CBEEBF6AD5947463FF7EFAABF89B3A1652EDF15A3C24A1D919DEE8CC535D47EEFCF174CB2335317E5FB814D24D352FA3E0EF1A61C2A628A63B42FAE8C97A0C3453D4CE2B9A390A47EBE1523CAD878BF5D27AB89E2E5AEFF17EAF65C715CE33BE2BAAA1229553E1BE2BC13A8803F2563814EEA0F480158EA3DBE136F58C7DFFA12DA348A8FB0F09D773F84974594F2FDF10AEA71F0642D2D8507B90C1B42348DD934F17B2C7443D86ADF1F20E2EBAE273ABF3A2D7C538F8A1D093D3FD4780EB6166365CE690D96845983C521F4485EBE985A8703DD74554E97BBD05A232556BC6C3543C23FF3EC7FBA6ADCC7AE92A84D024838935489B23A7F33B23D5F4D000A41A21D32427664564A4DB9625F5409B641EC4B50D43757BA90E06E9373D7666A66BD3433C8CBD674456DEA6E0D2872F7F74317F95D67C8E4958F828E1A3A4FD28B156F0CD326565B956510ECA9E75BCC7F15DB5C510E8DB31D67C4E678FB591FAF1FE84AD6C9CA42ED5456E1FD485C7F3DDD7934E4D775F4FE29CF7E1C4827B0E9EC08D7B02D17A1605BBC59673E2372DCC1951B12F7C5D93BFA4C839DC7F4575500F931AB6730ED7E06C0126A63DBEECE092D3D3EDD6F8A9FF074C2A3E873F9C54EC7CEBBF62A20F1311EE1347BDE80C5DF846038818EF76E0DED0D9238A585FFE90FCB0E185188D57EB35D7D259650AB6F667B983C5BCCA76EE9823C65E36D60D4341AC9D8C947A7A6A5F7365C19F11C39190AE5AA8722B94A518DDE1AC5C0FBE0C691B8F6DA68B1469DB1924D39E59FBCE102C561B7F3DBA7376F8AF2C7DE08FD19DB7F009E29753682EF6FCDCBFBA9F9D0295049504954CCCB52A69FA11D615D04AD0CAABD44A45F7E4A9C6FE5ED272C8642D876C2499C24412DF83E46AAA28B8B924F2E634D7F63C817892321788465EA0487FC55245B69D23E98A40B8B164086E3AD6D483993A652C020E60030C3880E000F6E4002AC19BBF8B37D849EADD01ACFD2959DAB9055F317FCEB6183D2C83916A7A0888BE113500F2BF91D084E171FD34F097BA0D03FDD6E43D5525A5074624D5307E01A4480F92E01EA6D5B51C6B905B9ED8DD07DB81BE80BE80BE74A92FFAE207884B6B71699A87E583E9618295770AB87645F244FB8E7B905D79CC7857EA847D76599DA0EE655A451C37867AB83164A3A93D7345B910184E919E3C5170E02980A7009E42A79EC2DB123C85D69E027225CB6367F89B7130B2723D8C87B599E42ABA64F551956A293DA4A6495AF7D4AAD863D6BE6BF694D1E8AA86AEE9B6D57945B62CCF483FEDA12AA41A3D488BA82C925391028AEBB8DD77D1A49E3E3E37C5D4399CF5A4580FFEBA62CBC866F5815C75C2EC3739B285840D0BC08F073F1EFCF82EFD78D30FFD976038D103A67613C103D963B684E82574C0D3B55E445A4CC62C856BF3D04F355FBA9F1CEC29EF16D411D4F1D6D5D19D803E5E963EF20C5EDC0919BEC0E8A5BE0F013F033F0F8B9F6D588538DF2A4452CC14B11D0B453D3D74E69B5955E1514611C9E748F51063CE3B92A5AA2370BA16C62262B3E285CE801230451418490A83B9D9FA6AC0BB01EF6678DE0D64F6838F033ECEB02347AE279CA3BF95FF3E26FB7B5BF2163B6BA4CC3976BA98F713F22B788302DCD822E1A6B6B000620267A903DD78C295856EB23153C5A2C1261230908081C4C006126EB008563F031849DCD84862605B79F5BB45592A6DCE407D8CDB710A40E141E141E1BB5578B23508A87B6B75B79D29EBBE79B8087B895E0E3F99BA40E10DDD12281C287C6814FE0AAB3D676571B90752067E037EBB4D7EC32C74066EABFD69B1C873ED3C58BF9AC503A2F1ACA3F5C0A7484746F78400F949909F049A0A9A3A3C4D8DDED7FD67EE5E9F50B6DB88A7872DED861F71C51177ED72159919082405240524A5AB619A13ECA26D286FC3D85F0C645B0818B131A9197BD60C64BE024D034D5F0E4D7BAB9770FC7B18E4ECE99A750BDC9C3F671B0C6986FA58FBED675AACA7E38B12224533D40355819E809EDCA49EA0201A88AB9F3BAF343FCDE60FAE5D786AFD798EE4FBB618BA533DCD887965BE350479920B3B214968163F881488D4ED8AD49962A418A40AF4A709A38FB1C23024CA769EBADF0E1E840084E07685C09A0F44046E6510226000C1B7E0DB8BB78FABD1FA38C2D443E6ACF36ABCA9FDAD87A00443B53434657A9D8A2AEB26DB1E70D65C3266DD13B5CBBE3B5DDA69E620F420F420F49D09FD50741EE625873A2F89E65235DD871103381638F6363976BCDAC5AF03E15812864B3607A1FD2D793D57CFB279A3B406A96C0B339C28E97F1FDCE6963501D01DEC92F9F059C0838FA5F1D31076BAFC9B8867D15D3465EF6349B11E36419CE878D07B4C1384BCD01B899F645D7E062FE8A817C4EAF1825B74CC2D52021FDC22708BC02DBA58B74851251E572229D6C791CCB26D9164B6E30DF16F226A2A6F85DD5945B28495E9BBD443DB25158DFBAAA87B1F095CBE061870F9C0E5EBCBE55B458B577FF7D2FF36C9E0F681DB076E9F20B78F6CD3AC71F87D49B93E1C3F5DD22CDBD38F89FDC367114D6163D6EE216D0AB9D86536D57DFE70871B31CD75B9FB070267AC01069C3170C67A72C6B09BB1DC46C3F0C434E516C239B4D671EF5875BB8F3AD4945EE241410140011ADF1A28400F0A6006CB95ECEF06321A37E9E3FF4C55D16F41304C01F17F795BB5C5E827FE017FF3AC1B8B2BB62769EA84B19433955C53620D74B3F463433031B126B32771A74A789221100CFD65EA9628341066106610E6C45C2BCCE650F60BA9D76510DB268CEB3FE402B813B8F3583DE73DE607C176DD673D83B59BB5C3F66B7E62BA77BF07ACF6B72BF958370CC69BE338970F393DBC225C0BFB7DC169AC8DDC0519751D883E687C2B8D8793FC40E941E9396356D88FD345E6A4FBBD5B4835A87BF2027906790679EE529E1D3909F2ED3FB6E4FAE4B93FB96B176D2B280AB607F9E33E7E8BB40FE3FE55F254723595B122C9B46770524CD3F70B6A076A3734B5DB86E494483F84832241F0AE47F03866847934B29C3A0B1A091A595F0F68E4E56A241E106EFCC540CE534B688A280CED6FCD5639A2F54F85549330E5B5EB79D1D6CD51935FFEA0EA783C159B4F472AA6DB4DEB1C99AF79E738C3C43E39726E3FD74BB9E5B48390F859FC2E7374CF37872F2446D89B398EA1338B546D28F8F122FF404FC2BC2C81E73D81FFC7E1FF41D81E84ED1DAB67001EE230FCC37D6EC8B57B670D59305C281A57064E0FD1D292A2B8AAD73DBDCBB68524B9FB3D1A3C24A1D9D1BD2D40AB40AB40ABBAD5AAC1E4E7F43C9B717D2208531430BD00D30BED567E386724908D0406DECF25916864BB3291B30C962AF2EE60CEA20106FC40F003FBF203F5F06710C5AB97C49581E00F08FE80E00FB6E00FDD9A93E367CF1AFD817992EC79C9780F37A2BF20B71033722E75F5E3D7ED7AFBD27FD0C8F5096B9B2CBFA3131402D5982F11B04F0DED6594CFA3BCEC276BD79E0A0B6BEEA09FA09F57A79F902B0F2ADA54E65A55549973AC4DCCF76753D096011903190319132E63F2368CFD15E6FADCF78CD653D393DE56E442F0ABBCF29E16F28278FF7379BB79F3C3DFCA0F6C1DDDEDEBC20F10AC9F3FED7F5179FE1A3025580771D088E519DF15D5504978EB692C63FB720CC8B0351A143308DF8FC198AA35A3C5D944F12928D3433468EE767DB4955CDBA06AA35914EC16DB23EF2EFDC149A8F16ABD6E4221D7A80052F7E9184CE6609D02C33DF83B59CCAE415182377F176FB02B438532552545B76B70A681BFD4AB211B7518FAE247D333E14B74106FCB4688B7251584A9D53587E987FE4B40DD1C18C49D1C85219729806C47A981B1299F05974EBE933A00862E82615C795E0FE3068B60F5B3CAD9F538A49BD4E2906E428BD1F448AF0C8FE4AA1372AE7D05050F21A811C849AEB51024F79A0E63E2C8563DC6B313ECA26D98C8CE820ECDD3356BFC5483E6AD5EC2F1695921186416A606010511DD3D90F2F5EF874030BC200264D5F53982432E5062344150206CA2F16A17BF36F32CBE4883921C2BDE84929E394E83929F54D988541C654981961EB5D404951DC44481931FD8D184541CE8418965362B7FBE053905928D9A40ECD35E43523EEFA93500B49D781365BB0E35DD4BB129111554B1A543540BB5DFF181062D4B7E6DBCB33C39961AEB381235CE91D75F84B8D2606561106123D8C738895390C5C455235EB132440D75DC892B4F95D58E548A314971EDF1DE5BBC061B3F333CDEE39F2C82B7F8DD5F9B78D8B38EF20BA6FFF686074DD1BE6466B9F3DEFC05BE0BF95FBCD1DDAFCD3A8CBE8E5EE3F8EDCFFBFB28818E3E6D568BDD36DA3EC79F16DBCDBDBFDCDE7FF9FCF9EFF70F0FF79B14E37EF161A3ADF208AAA829DEEEB03754BA8AABC6773A59ED7057F063FF874F866DF27253F919ED082CAFAE7E20569E4BDCBF89BC1CF9FB70CCF7296DC9C3015B0964DF9A13FC80C4DB4B9E35286EE9F036AA857171B266E1EFCACB1D45191DFB4AF276FDBE09EBAE94E7479B11F329C843ACA638EFE3282469A68C426CF428454ECC8707CB8D2C7793E4BC9079888F375498E9B15453D28D720315467A9C6FEAB88C9299E831F21C9B4390DC468F92CFDA1DA2E4367A948349B943A0033313563AD954424A8D4C38E9EC5309273532E164B34B25A0CCCAD0D6FBC9B70FCDBD373361555BA93032E1545BA93032E1D4B4D2DE5A457ABC2F71629979EF2BD45B5ABC29333A2DDF1FCE95B5A0FBFD9C1A07DD1F297C84EEBFA7B75EEE411FAFF44DF7B57D9AB943E3D6F08C72472C8C4C384A92C65FC2498D4C38D50FAC3032E1543FB0C2C88453F381EDADF448481A1B6AF9851546D69696EA5A5AEA4E82CE471BC5B4783BCE20D3E77C84515BF2185BE002ABAA67989B2F9327F0CDA327A7F4191446269C2ADF1446269C2ADF1446B6E7AAF04D6164C2A9F24D6164C2A9E19BBDB57FBE491B55AA6BE9ABE49BFD025A3BC24916DAF818A7BE68A3A75CE21AB6B1A7692BB36A3FD95B194646985324A33432CA6C0CF7839F9DA4797CB89BCCC6865279A6CCC686521E51E7368611B58C74DBB2A432CB1CDAD9C6D5AE6D18AA5B452C5F83F1A8B8F1E8358C22CF4BAA4534417B5E254B5BFCD45A5BBA7B7E4CCB54F8A4B0C2D70A5FEB0794B37DADFB689D769F6A12D5C3F79DD6176D94D8AC446542FEC07E99E32E70CF8E3C9190A978CC2EAA8BDC0AE5A446A6CF1B8F3DDDCAE79D1A99E677D40A4E6164745E2B2EE2DE0A0E2C48224822AD241E069EB65AABCE0254B996AA9BCA1E998C4C8BD42C54EF2F5CA6309212655F3AB7B190AD83CA28B98D1EC576CA92985AFA5F7537ED71F973CA4CFDAFB693D9CF2410B23C259A181971CAF7531819719C6F3538C4C830B18A496E52D2E7DCC68682EC2A0A627A57108D701207A21168706E2B1A619FFEC1AFE5499A08BB8CD7176BEC77E58FE90C810664DF019233798892DBD8509E9EAA284F4C5A404A943B6A6EA34739C8383D043A307360951BFAC30566BC0634F637E719D5D6AA1E2F730AA57C3BB98DC1C3C93689F8E0E064367A9422ABF610A63082E281E251E3DC9EE21D86BAB7D3BDBA8D2312181AF56B2A0C1A488F021A483DC2D73D79AA95DFDDDECA8A84CAB305859561EC976D6EFC61EC97D918C67EE921D2A5C15F6EA4C7C937473E84C96DF4289A6B7B5E05676F65990B995770721BDBDBAA7A1C7B2B3D52BE3DF3214E6E63E9D3BA5281298C0C5FBF645460721B5BEB943FAFDCC6803253A71594CC063E1DF874D458E0D3F1F874C5B611FCCEDCC1F612ECCEDCB1C24376E6489B55682BB3F5BD74909C61E15451D8960F80422970804269706E8F42B33D73F84934DB5B879D409B0A0E993C496B95092BB7B1A194EF25B7B1A1942938B7319067258FC4654C2221754E6CB77A238911681C689C1A0B689C97C68B6DCBF8899C6C6FC6CEE2B5A5864CE11D4CFD0999AA133D8D2866E14A1E97E52EB5B02054DE19E3A613EAA43C81995A5810CA1397A985010155EE0131DE03AADC03629E389DDAB372EC4D6E64C251A427AF82931A41B041B0A9B140B0B9053BDF24B48560BF2D7904BBAED49005BBD85EFE035DE54610FE06BCF2D0F0C0CCB0AE35935C4597AC32D8A19D014DB594726E476E6358212BAFFA496C2B7E8A3D2ECD3812037D79B32EECD4648F3B755543D774DB2AEB676EA547B26579465E6F19EBD0CEF0BDA99505F6CCC4D0460222B14900B8E396DF756E64C42977BBC2C88263EA152FB03032E2947DC1C2C8D28F656457947C6F65E98993AA4B5018199847B6CAA96499099C4A702AA9B1C0A9E4752AC9B6F1FCFEE4C1F6F2EC6EE5B1C243F62E719355727135460F0E17A86C6CA0312F857ABA565E094D4C6C4A272C8FEAA146BE1F9851BED4A0540EC13B86222A1F0BF4800207F48006E7A2F4C09D0851842A0C9326D415BF765510E555E7E7737C80C96CE057038F5263018FF2F2283900899F456DAE79DADA5243E64C51F3B4C5B9A0151C93698EB638F7B38273F65C9141CE1B8BD22B310BCFF9E1DD1FA721531B038A2C551A3BB7B1DD4B0525B3318CCE84E4808A98632305CA7D2635318C57754F2E6FD3949AC027019F841A0B7C92163E49CD569E6C6E097726EB91B2E0A2808B72114BDB83588C16B5502A62DA77780B8A62A63ED243EF3F3CD39C31F9795E497C9E9F23E939F1B0D4498DDBA5564EF23D8533B5BD2A4E6264C3B1D49A2CE3C4488F2326C9D895ABA9D3B98DE199666A0525B731A14072F0712C709069B0C0416EE1209303C35B39C8F9C1E25C1E7263617091CFE6228B756BC5B9DBC25CE454AACA39D5B9B17F17E1FAA41D44990207449906E71645996406B712659237CE25C8F505872CC6B8B52A1B15E53626941A10668CF2AC4B6662C2705105C305F205F205F23DB8DE25F9B65D32786DB164D058F6262858AEE14F194E3E03D202D23A4A5AC9B2410BCE7283672EBE6A283764AE12B6EC428A68B5401A075299F80A23C32C908E8C5277CD4CFD2F93417604280B28CB55288B3733DAB8C36E10BDAF7992E59A0A0E595C046FC3509EA23E305F47AC8A98A051B706C5E541213DBD8C92D840244024A8716E5024D270A356E30F27D845DB50DE86B1BFE0938B531043160E51A31231B1FC904D77120B2895060B289597523D5D2387A0F253AAB77A09C7BF3988B4A9E090E993B4561925B7314C7ECC5065012FB7F53B0D23E6E4808491D0ACBC77F58119481848981AE7F648980C455B50300A221E4FB6BED890E9774819A4BA5339362033B1AC4456306C560C72E7650ACF6D0C3E74EB930744E4B102F953E000F9D3E05C16F9B78B042144CE1D0A72ACF00D68012E5161CFCC76815A603B4FA56D6733137030703035CE6D72B0D5263D89B0681580927EEB0A0E9A7A87B59A56217097DDFDC52534B78AA2316EA182957C564521368639A6A9FDADBC209BDBE8510CD5D2D0F4234A6E63991F9275B3B4F14F6EA347B1E692312B11416E636BDDF226442EF32644E95B9DD7BDEA39C824C824C8E409996CAB92BC2279691A39A0A92A34972A61F3B90D180F188F1AE7C6186F138D57BBF8B5EDD150090807EB35941B34EB9110C4722A7E6164C411B0D1C080E32407B96181C818CEB1347E2A8FCC721B3D8A989DC1C6BA8BA6E57E50181971CADB4F15467A9C898EC762A5EE9DDB20F009949D1A0B949D53D995C06FAFEC090887B2379403650765BF04655754A9AAA6859111A7B299636E64C0916D8BE44F941FEED0CE80D6B0F526CFDE9B8A2C615AFF2E95EF2BB73223954FCB2CACCC48722D1293E283FF418103FE070DCEEDF91FAB68F1EAEF5E82D63E480EC4E3873497055F047C918BF045C82E885AC51929ACAC481577A4B0B220499A657B7A65C3C6C2CC121664D9E5D0CCDCC6D243B15765AAE55CAB03333D96A4CC75B9BCD17A6603DF017C076A2CF01D387D072D0897DBA8ADE390A270780D4D0587EC326895E04A8D31B612AB8953466093644D294F87A716204D204D6A2C204D4ED23483E54AF677ADC75B390ECF11BC8D45874C9D664D248BC91CC962AA8A5E41C96C6C2895D3DD331BD39A22FEF22A21310766065FDFF6244D9D54660BF7668671D154724DA9322C2AAC0C1FA6A5975CFDD4C2B0D2397B2AEF0F9C99E8313CC928636426060CF497A997721A721B081E081E35CE4D0A9E19C522F4CEE4CA2F6E2C79036A5793566632A795016B51E0006BD1E05C0C6BD9A82D61D995545A0AAEAA2B34649A127A32D480965260098423D052C819EF420E26414EF9CD6526268CCA7D20D673029053395B2AB7C16C1BC8383516C838B78CD7EF29C1A4E3FCC79B3416054D074DBF044D17734C1832276E1924B5B1A120BB8A82205501B414B4F4E07A575AEAC842020533189E15FFE6A243D65391BA2338C44FA47E09D11BE1072E90A629EFD65118197AC2547235B5D2170A2B43D89A69CFCAF16FB90D740C748C1A0B748C5BC7B621396AC70FE38A9230E95801C32565474A839A819A7537C32A4A131BF2D338D2D340134F628126D2608126F26A221E586DFCC5EFD683BB0C8747111B8B0E590E13DE2C8B616164C431EB264BCDB34C96EA4835CB1A91DBFA1778721648790A31B7B1A194A710731B4C2377E9087933C731F42ACF1FDA19A29A84C4F0FE03955A3D3130B81BAD8F2A00B7E72416B83D3458E0F6B4727BC4383DDC2ECF65393CE29203D2329523E50FCCAC58E550D7BD958194059D082FDB169264546EEECCC8209D4842B3D2EDE436207720776A9CDB2477019907390E2FC15F5CEEC1B58E6961344A8575F5A35131D3E862C7B4C8469550E1DC468F3297AA28B98DA167EA9E5C1D99EEADF448965ABD9FDC06235C7082A8B1C009E27582F4F06710C5ABB0B5179401BDF8F16A1BF2F842270086EC11C1A2372C7AE75C3827A77A55D9BF30F73DFF8BE9946C7A567143F666505A505A6A2C505A1EA575FCF875BBDEBEB45F40CF817814B6B9EC90C55568BED180A61B3A11D5010ECD050974CDB18A88F95845310795C1C2EC492C10531A2C10D356629A66CF0A9354EE3CDE930820AF20AF5DC9AB32AFEC2A3E675CAF985776139FB3ED240E52468103524683738D52965F94B761ECAFC26057FE49517B6629FE8F7203911CFF2548256B5FCE5BBC061B3F79EAE8CD5F1001C0BF98AC7651ACF8B1FFC38F82F427A33BDC443F57CB60F775E4FDC62AB5F9447EF0C9FBBF6B79BDC2CFBBFF81E987ABE7208AD1F6BF82F0EBE8CBE7872FA33B69BDF2235C34583F8FEE7E6DD621FEE7358EDFFEBCBF8F920AA24F9BD562B78DB6CFF1A7C57673EF2FB7F75F3E7FFEFBFDC3C37DB0DCDC47D1727D288C07029D7BD5D15ADE6EDEFCB0343E7DFC2BF85D7E1BF9FB7683E74A697D597EC18FF76588C75287F9589ADCD4D7D18FD5CB8AB44BA2F65A805F9B1F074BACF558E271BBE8CB207982D19DF5BE5EFB3FD6B8C8B3BF8E824AED0DB2FDB1963D48BC7BA7C220714B2946F8D3DF910352FEF7C6FFF5CFCCF753042F8900CB2298C8E72A020E4B886EEC1BAB1DD837754C0145D3FC79809588BBCAF54DC06D1D285C9BCE55C85B0AB2C4DD3E5E6D020E9894B7C53C5946DD02C00E24AE4D3315FAD6AE990A7913F364BCCD742870C769DA33BE2BAAA1229593A6BF2BC13A8883AA874145D307A5874FD322BA196E6BCFD8F70F6E1025C93E10D0C930D661BF6F8B25ACF3632C711C81A4B1A10A528BB4F125315F38AF5A307DDF86ADF17EDCB8E88ACF01CB8BDEC6678D1F163D39623A2BC66A4F1118E4902278E58C3C972876C058C2D801630D931DD276BF247630556BC6430F3C03B3EE8763A6ADCC84BD4C420C92D1EE4324CD4B428604DC0E8112F464048A62C4490385C787BA6D5992209620434ED7360CD515060963B21B1A4631739FE9211EFADB130D2B093651D4E8CEF47F1941F812BF7E1D3D7CF98393FB444D24C157035F4DFD5783E9996FB6202BCB35A57B50F6BC430AEA8FA73508B52F4385D6A33343F774E2BC19CA095C4A72505DE48A22073C04138395CED189C14A9C3F51CE15B87F2064172964D17A1605BBC596736A2C2DCCB93AB92F7C1BD3630443945F4AB266050D5D6D479498095D7535ED71DF2BAEB4F377D6F849CC8D2560A25C9B04CCF926068CF0D7E4B4D052632141AFF27257A9A96E69809AD8F73235DDAB3BB7C29E679D7ABC5AAFB966A96B22DF6A7E561F684B31A17DF6856B2A1092A041A248DBF51982F2F424E0568E2D6E51811C84EAB6714B3EC4E80A001224B4A489BC9623F53C25A75533E7593059B70916AB8DBF26A185F8AF68B5C5DDFAE10FDCE3173E41FCC27A8B4544F1C58DF140D040D044085A5D8209C81AC8DA75CA1AD95268AAB57F5F290E32DBE2E41B2E75A36E5E7A5C5057F0F93E4FDDA06BAEED791DE24BCABC43F4FDDE55DDE0E77B5A7583EE48BAD221FC58323A6EFAD621B23375DA16037C4BF02D6FD7B75482377F1793BCB7DE7DCBDA9F9229FB2B7643F3C76B0D22685923D957544CC8E1E5F2E885AEC3426AD46058741AF84BDD86D1392FA34D554911444304AA6D2F26188208D63DCCAC10EC4193DB9CD862027D80BD81BD6F95BDF5C50FA0EE0E27225970044D200A9BD73CB5384615A83816A46DF2B8EDADA893F693AAEA0489D1461509B81924E866908DA6F6CCED4AAB31BC223D795DC1837C837CDFAC7CBF2D41BE7965B7D8EFAF5D9FB9722F2003123426D46692ABE892250A4EB51441E91E922686D0147BDCB647990233755CD5D035DDB68480D9B23C23FD41101C520D415C4B170B4EB7E6AAB88E2BA62B2458A2BAA762EA027CC6044690DBA8D832B25B2BB7AB4EDACBBF235BA833FF151C4C70306FD5C134FDD07F0986B3466A6AD7BC449A3D5D5B0C610BA49EAE0913429ABC2F6AA97F1007F545CC7C8EC00C32D008D088CBD40877022A71192A21C4EB7627C4EF06B71B281528552CA5DA30AFCBCF6D82E6758B635C44CC74E547B9889CD9BDCEF96621CA2424AF333F69ADCD8D20593A2AD674D3A45E6B8C6E73543B9D7E23E04A57E0241303260EC183A96B71F060DA793090B70B7ECCEDFA3182D7CD87B7D02D76CD55D4F4F0801625BB9D1E490F3C6C470DE991872278A1D324F1C44953275DC24FEDCEE21309BCA55E689AB52B779A823E53BB45BFE10C6970E1C1856FEDC2BBC12258FD0CC087BF5E1F7E087BDE0C6D479F54979C0B7538C02368BC77507350F39B557392A90F4ACEABE4B6336DBD6713C61000216C5BF7A90B4C0B4C5BD7E2C0B4AD98F615963E0641B6B220AA04060206BA2406C23C7106F6A9FD69B19272A54C7572A5881E4513B26A2588F2908E0C319F32247F80D480D45CAFD444EFEBFE9303AF463FC46E422168B3A58186D488088475C560CC0C04740F747F8374FFEC04BB681BCADB30F61703C90A87410695D408C84580943F60D6C61607666DC1ACDEEA251CFF1E069F7ABA665D319DE68FD70A449A21512B71E2E65A041E8F90B0159A2141DC006C0C6C7C416C8C826820BE6DEEB5D1FC341BDB5E296D9FF25FA9937A5B83E8CED17316289738DB639087B980C31A3ACDE005650165B934653953780883BE8068944144B9D543910EDB7912B38B2F103010F0A511B0351F08F95EB9C72EC2D916B46227CC51C6509AA883C73C64CE84407953FB9BA0C55F43B534346DD7DE8A2AEB66CBAD93ACB964CCC410A62B6027A7F4BDCF413241326F523287A298301D36B8E93034978E46EBD31D420E9C089C78419C385EEDE2D7817022892124C9F3B4BF25CD7CADAC98B7457B94637B240C22B6737467FABF8C207C895FBF8EFE9D3B2CB3E553528577B6DBC9EDC3833E7C667DD2B1347EEA741FB60FF7F737E6DBD35D346DDF4D121841FB794D743C0AAC7071CBD770B9D15D748B82E02ED0397AB7E92F28810FFE02F80BE02F0CDF5F50544984202730A2CE5A946D8B249D9C7AD67F63062E6F982A0A5796B05A7C97043D7D0236160926C679009F067C9A1BF6695611817CE97F8348F06BC0AF01BF8655F9C8BE939A00C726C111E5D9E89266D99E5ED1D0D2C3323FAD8D995450F60272B12B67AAFBC4B7961B62CC7559D4C236B81FE07EDCAAFB813577B98D86E17B68CA152F356BEDE34DB1EC88094FD21461815CC09DC09DB7CA9D66B05CC9FE6E202337933EAAC75415FD8AA9D61411D593B7516B1071ABA6F84B6DBDA3A7627B92A64EDAC23853C935A5D6612F965E190EB45DA79E3D75B723B327191D82A3BF4CDDEA0A1DD415D4F5F2D4D51C4A0679BDB8826296412E72B368602B60ABB66C6523D8BF7308077C75BF5CD36A99A5DDE69F426E4AD8B1BC82B6361DEB86D1F68E441C0A831C41AF0B2309B81938C20B524EEA5B1C524E5AE9349C2B036A0D6ACD2D6E228E5F43E6444CF63F814262C807441144F15645D1919308C4FEC300AE4614C54A88D8603F515179821444DC5116A495DA6E49224F255753DBDE8A64DA33D8D21DA4A9B6C5419A5A49D33624A723F9211C9004EA74046768EA24625A5388C29593D340E140E140E106A470186FE32F06726C4942394428687F6BB6CA15AB7F2AA49A84F5AE548D8B263E16F8F6E50F3E5CF3E928EEDFF8505BA7AFE5AF740833CFE48097FDFC23EFE69C0E425D4D3B779E8B378CF9E796919EDECC710CBDBDEC9C0AF4A5C1F8077AEACC35EAF0500970EA2020ACB9C92120ACBD5B370CA76E1FAD7FA52ED5E9740406184D4C7284A0505849515CD513C3A2B26D2149169381ED2109CD4E249C03CB03CBDF00CB0F264BA1E7C1FBD5C8C72D8EC861300D8369B1AB15A206E4C8461D063FCFA52ED1C9B63E5D8EA92DB5CBBB87113BF87237ECCBE9E1CF208A572F7E8CBF248836806883661C883668EAA3D69C9C1337EC70034C9264FBB8B63779B97209510B10B5D0522CFDF875BBDEBEF41FB670353A293291AA3AC9C02FB682D2A9444BE44046E0429456C0599AA74E9D3BBFCA823C823CDEBC3C42B63188641DC8758BA43217B0B230DFEF8ECE8B01120412745312246FC3D85F610ACF3978BB0C26AB5D142B7EECFFF0A3F25EB569292F88738F305ACBDBCD9B1F62BADFD7F375E405EBE74F8717BDC56BB0F1716BFED8E287486FB6B8BE0AA24A0B546AF28CEF8A6AA824BAB15AD3C1C5DA9A0EAE53D463D85A4325C995A61A928B14F0A66ACD1AF0D34B4D15A457296B303D74A492E4EAB17A921F5054E5DA46D31B492F3555925E3D5543B49E45C16EB1ADEF5EF9B586DE955EA6E85CE3D57A5D53436AAE039F9ADE7732B2A342CE7CBA7AFCFCE2B15A68DE8512BCF9BB781310BEAB547478B1A922B2AA7EB29669E02F75BBA686FC4213FA549514BD1A1152C6D7173F6AC0136B13B22E8F4FC3BE2DEB6089B511D6A93AC96558D30FFD97A0A1CD0F2F3655626AA79B7C8FE34E8E56432E1FA9885C3E51955DDB4CF6B166B2299A0903347E0207D78E5441F3016024375804AB9F417D35C5C523F5B8F29CA21ED2D76BEB482F34E3938F8002FFF5486BBD9E6EAD294D6BE101616D0D99BD09DD5527E428E693E02405BB163DBDD00C4F0E5CA4B97927D845DB30715F16F535957FD258E7C491ADD3757AAB97705CE7E5E4179AF03D5DB3C695B8B90A3E0AA2BAE748CD4DD864528F0AB9B1471D5E3C560B4D9F2258D6BCA11272E15805D6E92F8FC034C19F403F0D3E5EEDE2D75A8D4EEC4DE072720438853AFBB5E899BD113D39CFF4347A7126604D0DFB6BCDB524878B9DAC263BFBA75A477EA1A9027282BBED9D56BAFC7C8C1A952B2E352A9CAAE8B2E49E7629F37DC2EB2B318F7D6EA40E2A29AAF3BCED06873B216D1ACC665540274581EAFB2DB675AA56B1BFD45485837B908D648A4AF61B74D4D57370B5B9AAF460DED375E5A9D2351515971A6B49B232E4D3CC9D65EE34D571AA063AFCFA1EBBBF74B40EAA97FF319AA9A6AED20F1A6BCC423A4ED7582C09D754B6BFD6580F66461B0FB9295E506972FD4875A73EA4A4D24A73E6732CC56C4A71EDF13E45CA0CF8DF78BBC3FEBAB95D06EB28B13EDEBBEF2199604AFF5382083B1405C423C60C830569F23D68FE1B3D7CDEE63345F8710FEF28FF496922C90C627FE9C7BEB48B57CFD82DC297174114ADC297D1DDDC5FBFE39FA89B1FC1520FEDF7F8ED3D96A228D8FC58FF3E7CDEC7FBE3F53FDE57EEF9D17E23FF45221E01DFE68ACCC9D9E1F87DB55E16F73DA92E0F34419059AE6CE102DF951793050CD2D532246B1B520265CD8787D75801F1100C059BB735068BECD0F3C958A3E9DE4EB7E1C7167B5456FECBCEDF4419C6BE3CFE1777BFE5E6D77FFC7F989BD1A7F7B60300, N'6.0.0-20911')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201604090923549_InitialCreate1', N'AslHMS.Migrations.Configuration', 0x1F8B0800000000000400ED7DCB72E3BA96E5BC22FA1F1C1A750D2A9DCEAEBA75EE096755502445310E5F978494E1510653A26D45E9E116E98CCC6FEB417D52FD42037C89E643024090A2A43DB33785051204D7DA003636FEE7FFFDF7E37FFEDAACEF7E06FB70B5DB7E1D3D7CFA3CBA0BB68BDD72B57DF93A7A8F9EFFE58FD17FFEC7FFFAA74775B9F97537CF7EF77FC8EF70C96DF875F41A456F7FDEDF878BD760E3879F36ABC57E17EE9EA34F8BDDE6DE5FEEEEBF7CFEFCF7FB8787FB00438C30D6DDDDA3FBBE8D569B20FE07FF2BEFB68BE02D7AF7D7E66E19ACC3D48EAF7831EA9DE56F82F0CD5F045F4752B89E9ADEA7E487A33B69BDF2F14D78C1FA7974E76FB7BBC88FF02DFE390B032FDAEFB62FDE1B36F86BF4FB2DC0BF7BF6D76190DEFA9F879FD33EC5E72FE429EE0F05B95A61943F1F7E4215B744F49BDC5EFC94F103CABBCD9BBFFD5DFC1DFEE55FC1EF0F066C72F6BBB7601FFD7683E74A697D39BABBFF88705F86C8016A4B939BFA3AD2B7D1DFFE757467BDAFD7FE8F7590B761A1B1BD68B70FB4601BECFD28583A7E14057BDCA6FA32881FAE721FA55A65DB7474A554DFE922969915C16F1AF7D7D19DE9FF3282ED4BF4FA7584FF1CDD4D56BF826566496F7BB65DE1EE8D0B45FBF7A0E6B18ED72B298AAB7A5EFF15CBB68524195976FF55ABA6A41B87F7D35FC5DFD4B1906A8FD7E22109CDCEF046679EEA3A72E78FA75B1EA989F1FBC2A5906EAA5919057FD70813364531DD11D2474FD663A099A2765ED1CC51385A0F97E2693D5CAC97D6C3F574D17A8FF7072D3BAE709EF15D510D15A99C0AF75D09D6411490B7C2A17085D20356388E6E87DBD4330EFD87B68C22A1EE3F245C4FF193E8B29E5EBE215C4F3F0C84A4B1A1F62083494790BA279F2E648F897A0C5BE3E51D5C74C5E7566745AF8B71F043A127A7FB8F00D7C3CC6CB84C91D96845983C521F4485EBE985A8703DD74554C97BBD05A232556BC6C3543C23FF3EC7FBA6ADCC7AE92A84D024838935489B23A7F33B23D5F4D000A41A21D32427664564A4DB9625F5409B641EC4B50D43757BA90E06E9373D7666A66BD3433C8C7D604456DEA6E0D2872F7F74317F95D47C8E4958F828E1A3A4FD28B156F0CD32A565B956510A65CF3ADEE3F8AEDA6208F4ED186B3EA7B3C7DA48FD787FC256364E5297EA22B70FEAC2E3F9EEEB49A6A6BBAF2776CEFB7062C13D074FE0C63D81703D0B83FD62C739F19B14E68CA83814BEAEC95F52E41CEEBFA23AA887490DDB39876B70B60013D31E5F7670C9E9E9766BFCD4FF03C6159FC31F8E2B76BEF55F31D1878908F789A35E74862E7CA301448C773B706FE8EC1145AC2F7F487ED8F0428CC6ABF59A6BE9AC32055BFBB3CCC1625E653B77CC11632F1BEB86A120D64E464A3D3DB5AFB9B2E0CF88E14848572D54B915CA528CEE705AAE075F86B48DC736D3458AB4ED0C9269CFAC43670816AB8DBF1EDD397BFC57BA7DE08FD19DB7F009E29753682EF6FCDCBFBA9F9D0295049504958CCDB52A69FA21D615D04AD0CAABD44A45F7E4A9C6FE5E9272C8642D876C2499C24412DF83E46AAA28B8B924F2E634D7F63C817892321788465EA0487FC55245B69D23E98A40B8B164086E3AD6AD073375CA58041CC006187000C101ECC901D48CEF924C34862B6AAD950358FBD3A92A2964D585E2A7F8BE09BDCB37E05966ADD26AF07E68AE3630E9FA7E5B98F46E7A58C51BBB922557A589F50D18EA5C6DFDD453C595DDA38B8A0F029E78EAD81EEABE9693AB1E226A01ED06ED06ED8ECD15ED5682377F1F6DB00C0D43BB4958C62DCCF364CFD916A307F123D5F4B099E946467240FE371256383CAE9F06FE52B761925EF050AAB3FE42AA61FC0248911E24C12D6E896F394F486E7962771F280FFA02FA02FAD2A5BEE88B1F202EADC5A5690D950FA687C551DEE5DBDA68A213ED3BEE4176E531E35DA913F695617582BA97691571DC18EAE1C6908DA6F6CC15E5426038457AF244C181A7009E02780A9D7A0A6F4BF0145A7B0AC8952C8F9DE16FC6C148CBF5301ED66692ABE892D54755AAA5F4B0AD5CD2BAA756C51EB3F65DB3A76C04AE6AE89A6E5B9D5764CBF28CF4D31EAA42AAD183B488DA017A2ACA4F711DB7FB2E1AD7D3C7E7A6983A87B31E17EBC15F576C19D9AC3E90AB4E98FD2647B690B06101F8F1E0C7831FDFA51F6FFA5BFF25184EF480A9DD44F040FA982D217A091DF074AD17911693ED82C2B579E8A79A2FDD4F0EF6943303D411D4F1D6D5D19D803E5E963EF20C5EDC0919BEC0E8A5BE0F013F033F0F8B9F6D588538DF2A445CCC14914A8DA29E1E3AF3CDACAAF028A388C43148F51063BE1A244B5547E0742D8C45C466B4113A034AC0145160644337CCCDD65703DE0D7837C3F36E202B0FF838E0E30C3B72E47AC239FA5BF9EF63B2BFB7256FB1B346CA9C234BD5BC9F905FC1C98570638B849BDAC20288099CA50E3469942B0B4D903553C5A24102281848C04062600309375804AB9F018C246E6C2431B0349CFDA6174DA4CD19A88F713B4E01283C283C287CB70A4F528380BAB75677DB99B2E6BCC545D84BF47270D9D4050A6FE89640E140E143A3F05758ED392B8BCB3D9032F01BF0DB6DF21B66A133705BED4FF3459E6BE7C1FAD52C1E108D671DAD073E453A32BA2704D89F04FB934053415387A7A9E1FBBAFF9DBBD72794ED12F1F490D26EF811571C71D72E57919981405240524052BA1AA639C13EDC6DE5DD36F21703490B012336263563DF35033B5F81A681A62F87A6BDD5CB76FC7B18E4ECE99A750BDC9C3D671B0C6986FA58FBED675AACA7E38B62224533D40355819E809EDCA49EA0201C88AB9F39AF343F4DE70FAE5D786AFD798ECDF76D3174A77A9A11F3CA7C6B08F22417764292D05DFC20522052B72B52678A9162902AD09F268C3EC60AC39028DB79EA3E1D3C080108C1ED0A81351F8808DCCA2044C000826FC1B7176F1F57A3F57184A987CC59E7D57853FB5B0F4109866A6968CAF43A1555D64DB61C70D65C3266DD13B5CB9E9D2EE93473107A107A10FACE847E283A0FF392439D974473A9BADD871103381638F6363976BCDA47AF03E15812864B9283D0FE96BC9EAB67D9AC515A8354D2C20C274AFADF0797DCB22600BA832C990F9F053CF8581A3F0D21D3E5DF443C8BEEA2297B1F8B8BF5900471A2E341EF314D10F2426F247E9275F919BCA0A35E10ABC70B6ED131B748097C708BC02D02B7E862DD224595785C89B8581F4732CBB64536B31D6F887F1351533915766715C91256A6EF520F6D175734EEABA2EE7D2470F91A60C0E50397AF2F976F152E5EFDFD4BFF6992C1ED03B70FDC3E416E1F49D3AC71F87D71B93E1C3F5DD22CDBD38F89FDC367114D6163D6EE61DB1472B1CB6CAA87FDC31D26629AEB72F70F04CE58030C3863E08CF5E48C613763B90B87E18969CA2D847368ADE3DEB1EA761F75A829BDC4838202800234BE3550801E14C00C962BD9DF0F64346ED2C7FF99AAA2DF82609802E2FFB2B66A8BD14FFC03FEE659138B2BB62769EA84B19433955C53620D74B3F463433031B126B32771A74A789221100CFD65EA9628341066106610E6D85C2BCCE650F285D4EB32886D13C6F51F7201DC09DC79AC9EF31EF383205DF759CF60ED66EDB0FD9A9F98EEDDEF01ABFD65251FEB86C178731CE7F221A78757846B61BF2F388DB591BB60475D07A20F1ADF4AE3E1243F507A507ACE9815F6E3749139E93E770BA906754F5E20CF20CF20CF5DCAB323C741BEFDC7965C9F3CF72777EDA26D0545C1F6207FDCC76F91F661CC5F254F255753192B924C7B0627C5347DBFA076A0764353BBDD969C12E96FE1A04810BCEB113C8E19611E8D2C6F9D058D048DACAF0734F27235120F0837FE6220E7A9C534451486F6B766AB3DA2F54F85549330E5B5EB79DED6CD51935FFEA0EA783C159B4F472AA6CBA6758E9DAF59E738C3C43E3972EE30D74B9972DA4148FC2C7E977B74CF37872F2446D89B398EA1338B546D28F8F122FF404FC2BC2C81E73D81FFC7E1FF41D81E84ED1DAB67001EE230FCC3C3DE906BF7CE1A76C170A1685C3B707A88969614C555BDEEE95DB62D24C9DDE768F090846647735B80568156815675AB5583D99FD3F36CC6F589204C51C0F4024C2FB45BF9E19C9140361218783F9744A29174652267192C55E4DDC19C45030CF881E007F6E507EADB9F4118AD5E625706823F20F803823FD8823F746B4E8E9F3D6BF407E64992F392F11E6E447F416E2166E45CEAEA47AFBBF5EEA5FFA091EB13D636BBFC8E4E50085463BE8D807D6A682FA37C1EE5653F59BBF65458587307FD04FDBC3AFD84BDF2A0A24D65AE55459539C7DAC4FC7036056D19903190319031E13226EFB691BFC25C9FF99EE17A6A7AD2DB8A5C087E9557DE93425E101D7E2EEF366FFEF6B7F2035B477787BAF00304EBE74F875F549EBF064C09D64114346279C67745355412DE7A1ACBD8BD1C03326C8D06C50CB6EFC7604CD59AD1E26CC2E81494E9211A3477B73EDA4AAE6D50B5D12C0CF68BDD917797FCE024D478B55E37A1906B540089FB740C2675B04E81696B69418E3F6B6C6DCDF82EC964CFF8E9C6C65FC377B2305E83A2046FB88E0D768BA850A6AAA4E8760DCE34F0977A35FCA30E435FFC687A267C890EE26DD908F1B6A48230B5BAE630FDADFF125037070671274761C8650A20DB516A606CCA67C1A5E36FAE0E80B2BBA530AE3CAF87718345B0FA59E5FF7A1CD24D6A714837A1C5687AA457864772D589EAD6A0E0E10835023915B61682ECE3A6C39838B2558FF1EC04FB70B78D256C4187E6E99A357EAA41F3562FDBF1698922186446A706010521DD3D90F2F5EF874030BC200264D5F53982432E5062344150206CC2F16A1FBD367336BE4883121F51DE84929C5F4E83929D7AD988941F8B4981961CDBD42821C9A14E1438D9E11F4D48F9E120945866B31791A533A740B25113884D218AA47CD6536B00683BF1264C331835DD4B9EE0880A2A4F0F11D6421DB247D0A0A51B691BEF2CDB684B8D751C891AE7C8EBCFC36569B0D2908A6D23D8C7988B5390F92458235EBECA440D75DC212C4FBBD58E7AF2F14D7EEDF1DE5BBC061B3F353CDEE39F2C82B7E8DD5F9B7808B50EB30BA6FFF6860760E1A1646AB9F3DEFC05BE0BF95FBCD1DDAFCD7A1B7E1DBD46D1DB9FF7F7610C1D7EDAAC16FB5DB87B8E3E2D769B7B7FB9BBFFF2F9F3DFEF1F1EEE3709C6FDE243D2AEF2682CAF29DAEDB13754BA8AABC6773A59ED7157F023FF874F8680F27253F919ED682EABAE7E50579E973CBC89AC1CF9BB387EFC94B46471F0570239B4E6043F20F1F6E2670DF25B2ADE46B5302E4ED63FFC7D79E9242FA3635F49DEADDF37DBBA2BE5B9D666C46C3AB388D514337E1C856CC029A3101B3D4ABEBFE6C383654696BB89F7CF90398D8F37949BE9B15453D28D7203E5467A9C6FEAB88C929AE831B2FD3A4590CC468F92CD001651321B3D4A6182AF085430336125135725A4C4C88493CC6495701223134E3A5355024AAD0C6D7D98C8FBD0DC07331356B5957223134EB5957223134E4D2B1DAC55A4C7FB12279699F7BE42BDA585A032A3D3F27D71DEAD05DD1FE6E738E8FE48E12374FF3DB9F5720FFA78A56FBAAFEDD3CC1D1AB78667943B626E64C251E29400259CC4C88453FDC07223134EF503CB8D4C38351FD8C14A8F84A4B1A1965F586E646D69A9AEA5A5EE24E87CB4914FB1B7E30C3215CF4718B5258FB1052EB0AA7A8699F9327902DF3C7A724A9F416E64C2A9F24D6E64C2A9F24D6E647BAE0ADFE446269C2ADFE446269C1ABE3958FBE79BA451A5BA96BE4ABE392CC6B5239C78D18E8F71EA8B367ACA25AE611B7B9AB632ABF69383956164843945324A23A3D4C6703FF8D9C996910F7793DAD8502ACF94DAD850CA23EACCC630A296916E5B96546699A29D6D5CEDDA86A1BA55C4F235188F8A1B8F5EC328F2BCA49A4726B4E755B2B4C54FADB5A5BBE7C7A44C854F722B7CADF0B57E4039DBD77A88FC69F7A9C611427CDF697DD146894D4B5426E40BF6CB1C77817B76E489844CC56376515DE456282731327DDE78ECE9563EEFC4C834BFA356707223A3F35A71110F567060411241126925B118C4DA6AAD3A0D76E55AAA6E2A7B6432322952B3507DB87099C2484A947DE9CCC642B60E2AA364367A14DB294B6262E97FD5DDB4C7E5CF2935F5BFDA4E663FE340C8F294686C64C429DF4F6E64C471BED5E01023C3C42A26B949499F331B1B0AB2AB2888E95D4134C2491C8846A0C1B9AD6884C356127E2D8FB79CB0CB787DB1C67E57FE98CE106840721890FD974594CCC686F2F454457962D20252A2DC51331B3D4A61F76A11A860E6C02A37F4870BCC780D68EC6FCE33AAAD553DAAE6144AF976321B838793269CF8E0E0A4367A947C876E11263782E281E251E3DC9EE21543DDDBE95E5D128A188646FD9A0A8306D2A38006528FF0754F9E6AE57777B0B222A1F26C416E6518FBA589923F8CFD521BC3D82F3990BA34F8CB8CF43859A2E5224C66A347D15CDBF32A38072BCB5CC8BC8293D9D8DE56D5E33858E991B254CF459CCCC6D2A775A502931B19BE7EC9A8C06436B6D6297F5E998D0165A64E2B28A90D7C3AF0E9A8B1C0A7E3F1E94A2928F85DBA42AA0A7697EE58E121BB7424074279DA3EB3B1AC8DC67A2297B7861CCCCC2BA365AC8299F9BECA6B1B053383E4B892255788FE60656873439DAB95073C5819901457762BAF2F3332E038B6872A38999101A76E267E0A53F120622062C9E50611CB731FF1CB57214712BB7C1D2B3C64F9226D56F1BD535BDFEBDFF1A14E4E15858D42611C408103144A83737B149A267EE327D134411C3B8136151C32798AF1FDE3362FFBB2A98D0DA54CC1998D813C2B9B215DC69D90A4CE89ED566F2436028D038D5363018DF3D2789E7B939FC8498E4E7616AF2D35640AEF60FD4AC87A93E8B53031D117F2B82C77898505A1F2CE183327A993F22A5C62614128AFBE2516060454B907C4780FA8720F8879F56F6ACFCA01A499910947919EBC0A4E6204C106C1A6C602C1E616EC2CD3750BC17E5BF208765DA9210B767EDECA07BACA8C20FC0D78E5A161C1CC109C31935C4597AC3258D1CE80A65A4A798362666358A12A87AE486C612B8A3D2ECD3812037D79B36EC5C6645FB1715543D774DB2AEB6766A547B26579465E6F19AB6867F8DED44A94586A62682301DB89C82E26C72DBFEBCCC88853EE76B99105C7D42B5E606E64C429FB82B991A51FCBC8AE28F9C1CAD213275597203732308F6C95F743A726702AC1A9A4C602A792D7A924679FF0FB93853352D8DDCA638587EC5DE226AB2494D0183D385CA0929D47635E0AF574ADBC121A9BD8944ED866E0871AF97E6046F95283523915F6188AA84DC5A0071438A007343817A507EE44882254619834A1AEF8B5AB8228AF3A3B64EA034C6A03BF1A78941A0B78949747C9297EFC2C6A73CDD3D6961A32678A9AA7CD0FCAAEE0984C73B4F941D8159CB36F781CE4BCB128BD12B3F04CCEFE2BA720C86C0C28B25469ECCCC6762F1594D4C6303A1392C840C41C1B2950EE33898961BCAA7B7239D76062029F047C126A2CF0495AF82435F9A8D9DC12EE740C47CA828B022ECA452C6D0F62315AD442A98869DFE12D288A99FA50E6952C1E73C60C1EF34AF68EF9393277C41E963AA971BBD4CA71F4A770A6B657C5898D6C38965A932A2336D2E388C994E1CAD5FC1F998DE199666A0525B331A140868BE358E020D3608183DCC241C65F7F3B07D90D16C1EA67C0E72137160617F96C2EB258B7569CBB2DCC454EA4AABCA73A33F6EF225C9FB4832853E08028D3E0DCA228939DC1AD4499EC1BE712E4FA82431663DC5A956C7B998D09A5068419A33CEB929A98305C54C170817C817C817C0BD7BB24DFB64B06AF2D960C1ACBDE0405CB35FC29C3F19D405A405A47492B5E3668C1596EF0CCC5570DE586CC55C2965D4811AD1648E3402A135F6E649805D29151EAAEA9A9FF6532D81D01CA02CA7215CAE2CD8C36EEB01B84EF6B9ECD724D05872C2E82D33094A7A80BE6EB8855111334EAD6A0B83C28A4A79751621B8804880435CE0D8A44126ED46AFCE104FB70B79577DBC85FF0C9C52988210B87A8518998587ED84D77120B2895060B289597523D5D232779F353AAB77AD98E7F73106953C121D32769AD324A666398FC98A1CA025E66EB771A46CCC9013123A159397775C10C240C244C8D737B244C86A22D281805218F275B5F6CC8F43BA41DA4BA5339362035B1AC4456306C560C72E7650ACF6C0C3E74EB930744EC6305F2A7C001F2A7C1B92CF26F170942889C3B14E458E11BD0025CA2C29EA9ED02B5C0769E4A696753137030703035CE6D72B0D5667B1261D12A0025FDD6151C34F50E6B35AD42E02EBBFB8B4B686E1545634CA182957C564521368639A6A9FDADBC209BD9E8510CD5D2D0F4234A6663991F9275B394F827B3D1A35873C998958820B3B1B56E390991CB9C842879ABF3BA573D0799049904993C21936D559257242F4D2307345585E652256C3EB301E301E351E3DC18E36DC2F16A1FBDB63D1A2A06E160BD867283663D128258DE8A9F1B197104241A18709CE4201316888CE11C4BE3A7F2C82CB3D1A388C90C36D65D342DF783DCC888534E3F951BE971263A1E8B95BA776683C02750766A2C50764E655702BFBDB2C7201CCADE500E941D94FD12945D51A5AA9AE646469C4A32C7CCC88023DB16D93F517EB8A29D01AD21F5264FEE4D459630AD7F97CAF795599991CAA765E6566624B9168949F1C1FFA0C001FF8306E7F6FC8F55B878F5F72F416B1F2403E2F1439ACB822F02BEC845F822240BA2567146722B2B52C51DC9AD2C489266D99E5E49D8989B59C2822CBB1C9A99D9587A28F6AA4CB5BCD7AA60A6C79294B92E9713ADA736F01DC077A0C602DF81D377D082ED7217B6751C12140EAFA1A9E0905D06AD125CA931C656623571CA086C92AC29E5E9F0C402A409A4498D05A4C9499A66B05CC9FEBEF5782BC3E13982B7B1E890A9D3AC8964319923594C55D12B28A98D0DA572BA7B6A635A53C45F5E2524A66066F0F56D4FD2D44965B6F0606618174D25D7942AC3A2DCCAF0615A7AC9D54F2C0C2B9DB3A7727EE0D4448FE149461923353160A0BF4CBDB4A721B381E081E051E3DCA4E099612442EF4CAEFDC58D256F40ED6AB69599CCDBCA80B5287080B568702E86B56CD496B0ECCA565A0AAEAA2B34649A127A32D480965260098423D052C819EF420E26414EF9CDA526268CCA7D20D673029053395B2AB3C16C1BC8383516C838B78CD7E79460D271FEE34D1A8B82A683A65F82A68B39260C9913B70C92D8D850905D4541B05501B414B4B470BD2B2D7564218182290CCF8A7F73D121EBA948DD111CE22752BF84E88DF0031748D394B375E446869E30955C4DADF485DCCA10B666DAB372FC5B66031D031DA3C6021DE3D6B1DD961CB5E36FA38A9230E9580EC32565474A839A819A7537C32A4A131BF6A7716C4F034D3C89059A4883059AC8AB897860B5F117BF5B0FEE521C1E456C2C3A64398C79B32C86B99111C7AC9B2C35CF3259AA23D52C6B4466EB5FE0C95920E529C4CCC686529E42CC6C308DDCA523E4CD1CC7D0AB3C5FB43344350989E1FD072AB57A6C6070375A1F55006ECF492C707B68B0C0ED69E5F688717AB85D9ECB7278C46D0E48CA548E942F9859B1CAA1AE072B03290B3A115EB62D24C9A8DCDCA991413A918466A5DBC96C40EE40EED438B749EE02761E6438BC047F717B0FAE754C0BA3512AACAB1F8D8A9946173BA64536AA840A67367A94B95445C96C0C3D53F7E4EAC8F460A547B2D4EAFD643618E18213448D054E10AF13A46F7F0661B4DAB6F68252A0173F5AEDB63CBED00980217B44B0E80D8BDE1917CEC9A95E55F6CFCD7DCFFF623A2549CF2A6EC8C10C4A0B4A4B8D054ACBA3B48E1FBDEED6BB97F60BE819108FC236971DB2B80ADD6F34A0E9864E447580437341025D73AC22623E5651CC4165B0307B120BC494060BC4B4959826BB6785492AF73EDE930820AF20AF5DC9AB32AF64159F33AE57CC2BD9C4E76C99C441CA287040CA6870AE51CAB28BF26E1BF9AB6DB02FFF24AF3DB5E4FF879981488EFF1224927528E72D5E838D1F3F75F8E62F8800E05F4C56FB3052FCC8FFE18741F293D11D6EA29FAB65B0FF3AF27E6395DA7C223FF8E4FDDFB5BC5EE1E73DFCC0F4B7ABE7208CD0EEBF82EDD7D197CF0F5F4677D27AE587B868B07E1EDDFDDAACB7F89FD7287AFBF3FE3E8C2B083F6D568BFD2EDC3D479F16BBCDBDBFDCDD7FF9FCF9EFF70F0FF7C172731F86CB7551180B029D79D5E15ADE6DDEFC6D697CFAF857F0BBFC36B2F7ED06CF95D2FAB2FC821FEFCB108FA50EF3B134B9A9AFA31FAB9715699758EDB500BF363F0A9658EBB1C4E376D19741FC04A33BEB7DBDF67FAC7191677F1D0695DA1B64FB632D079068FF4E8541E296128CED4F7F4F0E48F9DF1BFFD73F33DF4F1EBC24022C8D60229FAB08382C21BA7168AC7660DFD43105144DF367015622EE2AD33701B75550B8369D2B97B7046489BB7DB4DA041C30096F8B79B294BA05801524AE4D33E5FAD6AE99727913F364BCCD5414B8E334ED19DF15D55091CA49D3DF95601D4441D5C3A0A2E942E9E1D3B4886E86DBDA330EFD831B4489771F08E86418ABD8EFDB6209EBFC184B1C4720696CA882D422697C49CC17CEAB164CDFB7616BBC1F372EBAE273C0B2A2B7F159E387454F8E98CE8AB1DA530406295204AF9C91E712C50E184B183B60AC61B243D2EE97C40EA66ACD78E8816760D6FD70CCB49599B09749884132DA7D88A47949C89080DB2150829E8C40518C3869A0F0F850B72D4B12C41264C8E9DA86A1BAC220614C7643C32866EE333DC4437F07A26125C1268A1ADD99FE2F23D8BE44AF5F470F5FFEE0E43E511349F0D5C05753FFD5607AE69B2D48CB724DE916CA9E774841FDF1B406A1F665A8D07A7466E89E4E9C374339814B490EAA8B5C51E480876062B092393A3158B1F327CAB902F70F84EC22852C5CCFC260BFD8714E8D25853957270F856F637A8C6088F24BC9AE59414357DB11256642575D4D7BDCF78A2BEDFC9D357E127363319828D7260673BE890123FC35392DB4D45848D0ABBCDC556AAA5B1AA026F6BD4C4DF7EACEADB0E759A71EAFD66BAE59EA9AC8B79A9FD507DA524C689F7DE19A0A846CD02051A4EDFA0C41797A12702BC716B7A8400AA1BA6DDC920F31BA028004092D6922AFE5483DDB92D3AA99B35D3069B70916AB8DBF26A185F8AF70B5C3DDFAE10FDCE3173E41FCC27A8B7944F1C58DF140D040D044085ADD0613903590B5EB9435925268AAB57F5F090E32DBE2640997BA51372F392EA82BF82CCF5337E89A6B7B5E87F89232EF10FD90BBAA1BFC2CA75537E88EA42B1DC28F25A3E3A66F1D223B53A76D31C0B704DFF2767D4BCDF82EC9447FB8225B5AF996B53F9DAA92529736AB6E65458EA95BBE5EA7356B8C7623F34333B5C249975B5BE3A4F723685D66EC4A967C5403E85ADA50E76AFB679B2AAEEC56178A3E866BB13EE2D4B13D241CB47E8DA01D28C81FC8DF65C99F12BCF9FB886CFB1E86FC9115EB2B9E85C91EAF358820F588D36A8B89B8BFDC61C4858621C1CEE0C1B0E834F097BA0D93D362FCFC56AF9B40B5EDC5044310C1BAC58D85822790C86D4E6C3171AEC0DEC0DEB7CADEFAE207507787EB702C3882D6CF842DEB9D8A0DA18AD31F0BD23679DCF656D449FB35457582C468A38A04DC0C127433C846537BE676A5D5185E919EBCAEE041BE41BE6F56BEDF9620DFBCB29BA7BB6DD767AEDC0B4881048D09B599E42ABA648982532D45D06E47491343688A3D6EDBA34C811B555DD5D035DDB68480D9B23C23FD41101C520D415C4BB7158A2EE448711D574C5788B144754FC5D405F88C318C20B751B16564B7566E579DB4977F47B65067FE2B3898E060DEAA8369FA5BFF2518CE1AA9A95DF31269FA746D31842D907ABA264C0869B63D534BFD8338A82F62E673046EA0068D008DB84C8D7027A01297A11242BC6E7742FC6E70BB81528152C552AA0DF3BAFCDC26685E373FC54CC44C57769299C899DDEB9C6F16A24C42D21A64078DB6B911244B47C59A6E9AD46B8DD16D8A864EA7DF08B8D21538D988081387E0C1D4B5387830ED3C18485B017ECCEDFA3182D7CD87B7D02D76CD55D4F4F0801625BB9D1E49CEFB6D470DC989BF2278A1D31C29B193A64EBA849FDA9DC52712784BBDD02C23AEDC69069699DA2DFA0D270801171E5CF8D62EBC1B2C82D5CF007CF8EBF5E18790F26D6809ED125D722ED4E1008FA0F1DE41CD41CD6F56CDC94E7D50725E25B79D69EB948518430084B0534DA62E302D306D5D8B03D3B662DA5758FA1804D9CA82A812180818E8921808F3C419D8A7F6A7F94ACA9532D5C995227A144DC8AA9520CA433A32C47CCAB0F903A406A4E67AA5267C5FF7BF39F06AF4436C120A41C996061A52232210D61583313310D03DD0FD0DD2FDB313ECC3DD56DE6D237F31905DE130C8A0921A017B1160CB1F306B638B03B3B660566FF5B21DFF1E069F7ABA665D319D668FD70A449A21512B71E2E65A041E8F10B3159A2141DC006C0C6C7C416C8C827020BE6DE6B5D1FC341DDB5E296D9FF25FA937F5B606D19DA3E72C502E71B6C7200F7301873574BA8317940594E5D294E54CE1210CFA02A2510611E5560F453A6CE7494C165F206020E04B23606B3E10F2BD728F5D84B32D68C54E98A38CA13451078F79C89C0981F2A6F637418BBF866A6968DAAEBD1555D6CD96A993ACB964CCC410A62B209353F2DEE72099209937299943514C980E1BDC74189A4B47A3F5E90E21074E044EBC204E1CAFF6D1EB403891C41092CDF3B4BF25CD7CADAC98B5457B946339120611DB39BA33FD5F46B07D895EBF8EFE9D3B2CB3E553528577B6CBE4F6E1411F3EB33EE9581A3F759A87EDC3FDFD8DF9F674174DDB77931846503EAF898E4781152E6EF91A2E37BA8B6E5110DC053A47EF36FD0525F0C15F007F01FC85E1FB0B8A2A8910E41846D4598BB26D914D27A79EF5DF9881CB095345E1CA12568BEF92A0A78FC1C622C1C4380FE0D3804F73C33ECD2A24902FFD278804BF06FC1AF06B58958FE49DD4043836318E28CF469734CBF6F48A86961E96F9696DCCA482762F2017BB72A67AD8F8D63221C65C97452D6C83FB01EEC7ADBA1F587397BB7018BE87A65CF152B3D63EDE14CB8E98F0244D1116C805DC09DC79ABDC6906CB95ECEF07327233E9A37A4C55D1AF986A4D11513D591BB50611B76A8ABFD4D6193D15DB933475D216C6994AAE29B50E7BB1F4CA70A0ED3AF5ECA9BB8CCC9E6474088EFE3275AB2B74505750D7CB535773283BC8EBC51514B30C7291C9A281AD80ADDAB2958D207FE7100EF8EA7EB9A6D5324BBBE49F426E4AD8B1BC82529B8E75C3687B47220E85418EA0D7859104DC0C1CE1055B4EEA5B1CB69CB4D269385706D41AD49A5BDC441CBF86CC8998DDFF040A89211F104510C55B1545478E2310FB0F03B81A51142B216283FD4445E509521071475990566A9B92449E4AAEA6B6BD15C9B46790D21DA4A9B6C5419A5A49D36E4B4E47F2B7704012A8D3119CA1A99388694D210A57DE9C060A070A070A372085C3781B7F3190634B62CA214241FB5BB3D55EB1FAA742AA4958EF4AD5386FE263816F5FFEE0C3359F8EE2FE8D0FB5F5F6B5EC950E61E6991CF072987FE44DCEE920D4D5B473E77BF18631FFDC32D2D39B398EA1B7979D5381BE3418FF404F9DB9461D1E2A014E1D04843537390484B577EB86E1D41DA2F5AFD4A53ABD1D81014613B339425028ACA428AEEA896151D9B690248BD981ED2109CD4E6C3807960796BF01961FCC2E859E07EF57231FB7382287C1340CA6C5AE56881A90231B7518FC3C97BA4427697DBA1C535B6A97770F2376F0E56ED897D3B73F83305ABDF811FE9220DA00A20D9A7120DAA0A98F5A73724EDCB0C30D304992F4716D6FF272E512A216206AA1A558FAD1EB6EBD7BE93F6CE16A7452E446AAEA2403BFD80ADA4E255A2207320217A2B402CED23C75EADCF95516E411E4F1E6E511761B8348D6815CB7482A73012B0BF34376745E0C902090A09B922079B78DFC15A6F08C8377CB60B2DA8791E247FE0F3F2CE7AA4D4A7941947984E15ADE6DDEFC2DA6FB433D5F475EB07EFE54BCE82D5E838D8F5BF3C70E3F4472B3F9F55510565AA05293677C57544325D18DD59A0A176B6B2A5CA7A8C7B0B5864AE22B4D35C41729E04DD59A35E027979A2A48AE52D6607AE84825F1D563F5C43FA0A8CAB58DA637925C6AAA24B97AAA86703D0B83FD6257DFBDB26B0DBD2BB94CD1B9C6ABF5BAA686C45C073E35BDEF646447859CFA74F5F8D9C563B5D0BC0BCDF82EC9647772DD5B2F5EACABA878FD443D4AF0E6EFA34D4078B5524FF162D30391D5FB93B54C037FA9DB353564179AD0A7AAA4E8D5C89332BEBEF851031E5B9B9075797C1AF66D59074BAC8DB04ED5192FC39AFED67F091ADABC78B1A912533BDDE4071C7772B41A72F94845E4F289AAECDA66B28F35934DD14C18A0F1532B5C3B5205CD878691DC6011AC7E06F5D5E4178FD4E3CA738A7A485FAFAD23B9D08C4F3E020AFCD723ADF57ABAB5A634AD85079EB535A4F62674579D90239F4F8293ADDEB5E8C985667872B023CDCD3BC13EDC6D633769515F53F9278D754E1CD93A5DA7B77AD98EEBBCA9EC4213BEA76BD6B8129F57C1474158F71C89B9099B4C1E522137F6A8E2C563B5D0F4298265CD1B2A21178E55609DFEF2084C13FC09F4D3E0E3D53E7AADF505627B13B81C1F354EA1CE7E2D7A6A6F448FCF4D3D8D9E9F3D5853C3E15A732DF12166A75D99E48CA11A3726BDD054013929DEF64E2B5D760E478DCAE5971A154E557459724FBBAE593EF2FA4ACC639F1BA9834A8AEA7C3DBBC1C78B499B06B35915D04951A0FA7EF3F451D52A0E979AAA70700FB2914C51C92111485D3D85ABCD552507009FAE2BDB925D53517EA9B19678F7877C9AB9D31D424D759CAA810EBFBEC71E2E1DAD83EAE57F8C9AAAA9ABF483C61AD3D091D335E64BCF35951DAE35D68399D1C6437B8A17549AC43F52DDA90F29AEB4D29CD95C4E3E6B935F7BBC4F905203FE37DAEDB1BF6EEE96C13A8CAD8FF7EEFB964C6425FF2941881D8A1CE211636E830569F20368F61B7DFBBCCB66A4F0E316EF28FB4969C2CA0C227FE947BEB48F56CFD82DC297174118AEB62FA3BBB9BF7EC73F51373F82A5BEB5DFA3B7F7480AC360F363FDBBF8BC8FF7C7EB7FBCAFDCF3A3FD46FE0B453C02BECD1599FBB3B7E3F7D57A99DFF7A4BA0CD1044166D3D205127C575E44164A48574B91ACDD9612286D3E3CBCC60A88876028D8BCAD3158686F3D9F8C359AEEED741B7E6CB14765E5BFECFD4D98621CCAE37F71F75B6E7EFDC7FF07619E94222BCD0300, N'6.0.0-20911')
SET IDENTITY_INSERT [dbo].[ASL_DELETE] ON 

INSERT [dbo].[ASL_DELETE] ([Asl_DeleteID], [COMPID], [USERID], [DELSLNO], [DELDATE], [DELTIME], [DELIPNO], [DELLTUDE], [TABLEID], [DELDATA], [USERPC]) VALUES (1, 101, 10101, 1, N'24-Mar-2016', N'11:22:08 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_CBIRTH', N'Birth Certificate Entry Page. Transaction No: 16000001,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Baby Name: Master Shafiqul Hoque,
Baby Gender: MALE,
Birth Date: 24-Mar-2016,
Birth Time: 02:05,
File NO: 101,
Remarks: Test.', N'WS8')
INSERT [dbo].[ASL_DELETE] ([Asl_DeleteID], [COMPID], [USERID], [DELSLNO], [DELDATE], [DELTIME], [DELIPNO], [DELLTUDE], [TABLEID], [DELDATA], [USERPC]) VALUES (2, 101, 10101, 2, N'24-Mar-2016', N'11:25:49 AM', N'204.9.187.75', N'22.3601151,91.8274064', N'HMS_CDEATH', N'Death Certificate Entry Page. Transaction No: 16000001,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Death Date: 31-Mar-2016,
Death Time: 18:04,
Consult Name: Arifur Rahman,
Doctor Name: Arifur Rahman,
Cause A: A,
Cause B: B,
Cause C: C,
Remarks: D.', N'WS8')
SET IDENTITY_INSERT [dbo].[ASL_DELETE] OFF
SET IDENTITY_INSERT [dbo].[ASL_LOG] ON 

INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100574, 101, 10101, N'LOG IN', 1, CAST(N'2016-01-10 00:00:00.000' AS DateTime), N'01:11:44 PM', N'192.168.0.79', N'22.3600945,91.8271286', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100575, 1, 10001, N'LOG IN', 1, CAST(N'2016-01-10 00:00:00.000' AS DateTime), N'01:35:38 PM', N'192.168.0.79', N'22.3600945,91.8271286', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100576, 1, 10001, N'LOG IN', 2, CAST(N'2016-01-10 00:00:00.000' AS DateTime), N'02:46:58 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100577, 1, 10001, N'LOG IN', 3, CAST(N'2016-01-10 00:00:00.000' AS DateTime), N'03:13:12 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100578, 101, 10101, N'LOG IN', 2, CAST(N'2016-01-10 00:00:00.000' AS DateTime), N'03:24:37 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100579, 1, 10001, N'LOG IN', 4, CAST(N'2016-01-10 00:00:00.000' AS DateTime), N'03:25:08 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100580, 101, 10101, N'LOG IN', 3, CAST(N'2016-01-10 00:00:00.000' AS DateTime), N'03:25:38 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100581, 1, 10001, N'LOG IN', 5, CAST(N'2016-01-10 00:00:00.000' AS DateTime), N'03:53:45 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100582, 101, 10101, N'LOG IN', 4, CAST(N'2016-01-10 00:00:00.000' AS DateTime), N'03:56:16 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100583, 1, 10001, N'LOG IN', 6, CAST(N'2016-01-10 00:00:00.000' AS DateTime), N'04:59:47 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100584, 101, 10101, N'LOG IN', 5, CAST(N'2016-01-11 00:00:00.000' AS DateTime), N'11:27:43 AM', N'192.168.0.79', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100585, 101, 10101, N'LOG IN', 6, CAST(N'2016-01-11 00:00:00.000' AS DateTime), N'12:02:33 PM', N'192.168.0.79', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100586, 101, 10101, N'LOG IN', 7, CAST(N'2016-01-11 00:00:00.000' AS DateTime), N'12:35:56 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100587, 101, 10101, N'LOG IN', 8, CAST(N'2016-01-11 00:00:00.000' AS DateTime), N'12:57:53 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100588, 101, 10101, N'LOG IN', 9, CAST(N'2016-01-11 00:00:00.000' AS DateTime), N'01:24:33 PM', N'192.168.0.79', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100589, 101, 10101, N'LOG IN', 10, CAST(N'2016-01-11 00:00:00.000' AS DateTime), N'01:43:40 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100590, 101, 10101, N'LOG IN', 11, CAST(N'2016-01-11 00:00:00.000' AS DateTime), N'02:19:28 PM', N'192.168.0.79', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100591, 1, 10001, N'LOG IN', 7, CAST(N'2016-01-11 00:00:00.000' AS DateTime), N'02:43:13 PM', N'192.168.0.79', NULL, N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100592, 101, 10101, N'LOG IN', 12, CAST(N'2016-01-11 00:00:00.000' AS DateTime), N'02:45:29 PM', N'192.168.0.79', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (100593, 101, 10101, N'LOG IN', 13, CAST(N'2016-01-11 00:00:00.000' AS DateTime), N'03:52:31 PM', N'192.168.0.79', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (110576, 101, 10101, N'LOG IN', 14, CAST(N'2016-01-12 00:00:00.000' AS DateTime), N'04:10:06 PM', N'192.168.0.79', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (110577, 101, 10101, N'LOG IN', 15, CAST(N'2016-01-12 00:00:00.000' AS DateTime), N'04:15:29 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (110578, 101, 10101, N'Insert', 16, CAST(N'2016-01-12 00:00:00.000' AS DateTime), N'04:16:57 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_DEPT', N'Department Name: Example,
Remarks: ', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (110579, 101, 10101, N'Insert', 17, CAST(N'2016-01-12 00:00:00.000' AS DateTime), N'04:17:23 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_TESTMST', N'Category Name: ABCD,
Department Name: Example,
Top Yes/No: Y', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (110580, 101, 10101, N'Insert', 18, CAST(N'2016-01-12 00:00:00.000' AS DateTime), N'04:17:34 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_TEST', N'Category Name: ABCD,
Department Name: Example,
Test Name: ABCD 1,
Rate: 100,
Discount(%): 1', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (110581, 101, 10101, N'LOG IN', 19, CAST(N'2016-01-12 00:00:00.000' AS DateTime), N'04:55:34 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (110582, 101, 10101, N'LOG IN', 20, CAST(N'2016-01-12 00:00:00.000' AS DateTime), N'05:23:29 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (110583, 101, 10101, N'LOG IN', 21, CAST(N'2016-01-12 00:00:00.000' AS DateTime), N'05:31:30 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (110584, 101, 10101, N'LOG IN', 22, CAST(N'2016-01-12 00:00:00.000' AS DateTime), N'05:35:12 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (110585, 101, 10101, N'LOG IN', 23, CAST(N'2016-01-12 00:00:00.000' AS DateTime), N'05:43:31 PM', N'192.168.0.79', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120576, 101, 10101, N'LOG IN', 24, CAST(N'2016-01-14 00:00:00.000' AS DateTime), N'12:20:29 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120577, 1, 10001, N'LOG IN', 8, CAST(N'2016-01-14 00:00:00.000' AS DateTime), N'12:21:17 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120578, 101, 10101, N'LOG IN', 25, CAST(N'2016-01-14 00:00:00.000' AS DateTime), N'12:21:55 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120579, 101, 10101, N'LOG IN', 26, CAST(N'2016-01-14 00:00:00.000' AS DateTime), N'12:41:57 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120580, 101, 10101, N'LOG IN', 27, CAST(N'2016-01-14 00:00:00.000' AS DateTime), N'01:01:28 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120581, 101, 10101, N'LOG IN', 28, CAST(N'2016-01-14 00:00:00.000' AS DateTime), N'01:20:09 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120582, 101, 10101, N'LOG IN', 29, CAST(N'2016-01-14 00:00:00.000' AS DateTime), N'03:06:33 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120583, 101, 10101, N'LOG IN', 30, CAST(N'2016-01-17 00:00:00.000' AS DateTime), N'11:18:15 AM', N'192.168.0.79', N'22.3600095,91.8269803', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120584, 101, 10101, N'LOG IN', 31, CAST(N'2016-01-17 00:00:00.000' AS DateTime), N'11:42:13 AM', N'192.168.0.79', N'22.3600095,91.8269803', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120585, 101, 10101, N'LOG IN', 32, CAST(N'2016-01-17 00:00:00.000' AS DateTime), N'01:06:05 PM', N'192.168.0.79', N'22.3600095,91.8269803', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120586, 101, 10101, N'LOG IN', 33, CAST(N'2016-01-17 00:00:00.000' AS DateTime), N'01:31:55 PM', N'192.168.0.79', N'22.3600095,91.8269803', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120587, 101, 10101, N'LOG IN', 34, CAST(N'2016-01-17 00:00:00.000' AS DateTime), N'02:19:11 PM', N'192.168.0.79', N'22.3600095,91.8269803', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120588, 101, 10101, N'LOG IN', 35, CAST(N'2016-01-17 00:00:00.000' AS DateTime), N'03:22:55 PM', N'192.168.0.79', N'22.3600095,91.8269803', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (120589, 101, 10101, N'LOG IN', 36, CAST(N'2016-01-17 00:00:00.000' AS DateTime), N'03:59:16 PM', N'192.168.0.79', N'22.3600095,91.8269803', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (130576, 101, 10101, N'LOG IN', 37, CAST(N'2016-01-17 00:00:00.000' AS DateTime), N'04:45:40 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (130577, 101, 10101, N'LOG IN', 38, CAST(N'2016-01-17 00:00:00.000' AS DateTime), N'04:56:28 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (140576, 101, 10101, N'LOG IN', 39, CAST(N'2016-01-20 00:00:00.000' AS DateTime), N'11:19:25 AM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (140577, 101, 10101, N'LOG IN', 40, CAST(N'2016-01-20 00:00:00.000' AS DateTime), N'12:09:41 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (140578, 1, 10001, N'LOG IN', 9, CAST(N'2016-01-20 00:00:00.000' AS DateTime), N'12:39:10 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (140579, 1, 10001, N'LOG IN', 10, CAST(N'2016-01-20 00:00:00.000' AS DateTime), N'12:56:38 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (140580, 101, 10101, N'LOG IN', 41, CAST(N'2016-01-20 00:00:00.000' AS DateTime), N'01:26:21 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150576, 1, 10001, N'LOG IN', 11, CAST(N'2016-01-21 00:00:00.000' AS DateTime), N'01:10:30 PM', N'192.168.0.79', N'22.3600124,91.8269859', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150577, 101, 10101, N'LOG IN', 42, CAST(N'2016-01-21 00:00:00.000' AS DateTime), N'01:11:54 PM', N'192.168.0.79', N'22.3600124,91.8269859', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150578, 101, 10101, N'LOG IN', 43, CAST(N'2016-01-21 00:00:00.000' AS DateTime), N'04:19:53 PM', N'192.168.0.79', N'22.3600124,91.8269859', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150579, 101, 10101, N'LOG IN', 44, CAST(N'2016-01-21 00:00:00.000' AS DateTime), N'05:01:49 PM', N'192.168.0.79', N'22.3600124,91.8269859', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150580, 101, 10101, N'LOG IN', 45, CAST(N'2016-01-23 00:00:00.000' AS DateTime), N'12:11:37 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150581, 101, 10101, N'LOG IN', 46, CAST(N'2016-01-23 00:00:00.000' AS DateTime), N'12:47:38 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150582, 101, 10101, N'LOG IN', 47, CAST(N'2016-01-23 00:00:00.000' AS DateTime), N'01:18:03 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150583, 101, 10101, N'LOG IN', 48, CAST(N'2016-01-23 00:00:00.000' AS DateTime), N'02:04:11 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150584, 101, 10101, N'LOG IN', 49, CAST(N'2016-01-23 00:00:00.000' AS DateTime), N'04:08:12 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150585, 101, 10101, N'LOG IN', 50, CAST(N'2016-01-23 00:00:00.000' AS DateTime), N'04:24:31 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150586, 101, 10101, N'LOG IN', 51, CAST(N'2016-01-23 00:00:00.000' AS DateTime), N'04:28:37 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150587, 101, 10101, N'LOG IN', 52, CAST(N'2016-01-23 00:00:00.000' AS DateTime), N'05:22:25 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150588, 1, 10001, N'LOG IN', 12, CAST(N'2016-01-23 00:00:00.000' AS DateTime), N'05:30:26 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150589, 101, 10101, N'LOG IN', 53, CAST(N'2016-01-23 00:00:00.000' AS DateTime), N'05:36:01 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150590, 101, 10101, N'LOG IN', 54, CAST(N'2016-01-24 00:00:00.000' AS DateTime), N'11:24:16 AM', N'192.168.0.79', N'22.3600073,91.8269828', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150591, 101, 10101, N'LOG IN', 55, CAST(N'2016-01-24 00:00:00.000' AS DateTime), N'12:43:32 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150592, 101, 10101, N'LOG IN', 56, CAST(N'2016-01-24 00:00:00.000' AS DateTime), N'01:19:13 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150593, 101, 10101, N'LOG IN', 57, CAST(N'2016-01-24 00:00:00.000' AS DateTime), N'01:32:49 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150594, 101, 10101, N'LOG IN', 58, CAST(N'2016-01-24 00:00:00.000' AS DateTime), N'02:03:39 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150595, 101, 10101, N'LOG IN', 59, CAST(N'2016-01-24 00:00:00.000' AS DateTime), N'03:40:55 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150596, 101, 10101, N'LOG IN', 60, CAST(N'2016-01-24 00:00:00.000' AS DateTime), N'04:36:56 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150597, 101, 10101, N'LOG IN', 61, CAST(N'2016-01-25 00:00:00.000' AS DateTime), N'04:55:37 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150598, 101, 10101, N'LOG IN', 62, CAST(N'2016-02-01 00:00:00.000' AS DateTime), N'11:16:24 AM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (150599, 101, 10101, N'LOG IN', 63, CAST(N'2016-02-01 00:00:00.000' AS DateTime), N'12:44:33 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (160576, 101, 10101, N'LOG IN', 64, CAST(N'2016-02-01 00:00:00.000' AS DateTime), N'01:41:10 PM', N'192.168.0.79', N'22.3600167,91.8269957', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (160577, 101, 10101, N'LOG IN', 65, CAST(N'2016-02-01 00:00:00.000' AS DateTime), N'02:02:27 PM', N'192.168.0.79', N'22.3600167,91.8269957', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (160578, 101, 10101, N'LOG IN', 66, CAST(N'2016-02-01 00:00:00.000' AS DateTime), N'02:10:37 PM', N'192.168.0.79', N'22.3600167,91.8269957', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (160579, 101, 10101, N'LOG IN', 67, CAST(N'2016-02-03 00:00:00.000' AS DateTime), N'12:42:52 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (160580, 101, 10101, N'LOG IN', 68, CAST(N'2016-02-03 00:00:00.000' AS DateTime), N'01:03:07 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (160581, 101, 10101, N'LOG IN', 69, CAST(N'2016-02-03 00:00:00.000' AS DateTime), N'01:03:34 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (160582, 101, 10101, N'LOG IN', 70, CAST(N'2016-02-03 00:00:00.000' AS DateTime), N'01:18:53 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (170576, 101, 10101, N'LOG IN', 71, CAST(N'2016-02-04 00:00:00.000' AS DateTime), N'01:13:44 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (170577, 101, 10101, N'LOG IN', 72, CAST(N'2016-02-04 00:00:00.000' AS DateTime), N'03:40:54 PM', N'192.168.0.79', N'22.3600125,91.8269874', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (170578, 101, 10101, N'LOG IN', 73, CAST(N'2016-02-04 00:00:00.000' AS DateTime), N'04:09:24 PM', N'192.168.0.79', N'22.3600125,91.8269874', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (170579, 101, 10101, N'LOG IN', 74, CAST(N'2016-02-06 00:00:00.000' AS DateTime), N'12:18:08 PM', N'192.168.0.79', N'22.3600131,91.82699009999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (170580, 101, 10101, N'LOG IN', 75, CAST(N'2016-02-06 00:00:00.000' AS DateTime), N'12:53:46 PM', N'192.168.0.79', N'22.3600131,91.82699009999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (170581, 101, 10101, N'LOG IN', 76, CAST(N'2016-02-06 00:00:00.000' AS DateTime), N'01:26:32 PM', N'192.168.0.79', N'22.3600131,91.82699009999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (170582, 101, 10101, N'LOG IN', 77, CAST(N'2016-02-06 00:00:00.000' AS DateTime), N'01:33:05 PM', N'192.168.0.79', N'22.3600131,91.82699009999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (170583, 101, 10101, N'LOG IN', 78, CAST(N'2016-02-06 00:00:00.000' AS DateTime), N'01:41:44 PM', N'192.168.0.79', N'22.3600131,91.82699009999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180576, 101, 10101, N'LOG IN', 79, CAST(N'2016-02-09 00:00:00.000' AS DateTime), N'04:20:28 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180577, 101, 10101, N'LOG IN', 80, CAST(N'2016-02-09 00:00:00.000' AS DateTime), N'05:10:41 PM', N'192.168.0.79', N'22.3601232,91.8273182', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180578, 101, 10101, N'LOG IN', 81, CAST(N'2016-02-09 00:00:00.000' AS DateTime), N'05:21:10 PM', N'192.168.0.79', N'22.3601232,91.8273182', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180579, 101, 10101, N'LOG IN', 82, CAST(N'2016-02-09 00:00:00.000' AS DateTime), N'05:29:16 PM', N'192.168.0.79', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180580, 101, 10101, N'LOG IN', 83, CAST(N'2016-02-11 00:00:00.000' AS DateTime), N'01:09:57 PM', N'192.168.0.79', N'22.360195299999997,91.8273368', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180581, 101, 10101, N'LOG IN', 84, CAST(N'2016-02-11 00:00:00.000' AS DateTime), N'01:48:33 PM', N'192.168.0.79', N'22.360195299999997,91.8273368', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180582, 101, 10101, N'LOG IN', 85, CAST(N'2016-02-11 00:00:00.000' AS DateTime), N'03:29:46 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180583, 101, 10101, N'LOG IN', 86, CAST(N'2016-02-11 00:00:00.000' AS DateTime), N'04:07:10 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180584, 101, 10101, N'LOG IN', 87, CAST(N'2016-02-11 00:00:00.000' AS DateTime), N'04:28:06 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
GO
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180585, 101, 10101, N'Insert', 88, CAST(N'2016-02-11 00:00:00.000' AS DateTime), N'04:36:30 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_TESTMST', N'Category Name: ABCD,
Top Yes/No: Y', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180586, 101, 10101, N'LOG IN', 89, CAST(N'2016-02-11 00:00:00.000' AS DateTime), N'05:18:59 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180587, 101, 10101, N'Insert', 90, CAST(N'2016-02-11 00:00:00.000' AS DateTime), N'05:23:32 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_TEST', N'Category Name: ABCD,
Test Name: ABCD 1,
Rate: 100,
Discount(%): 2', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180588, 101, 10101, N'Insert', 91, CAST(N'2016-02-11 00:00:00.000' AS DateTime), N'05:28:22 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_TEST', N'Category Name: ABCD,
Test Name: abcd 1,
Rate: 100,
Discount(%): 23', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180589, 101, 10101, N'LOG IN', 92, CAST(N'2016-02-11 00:00:00.000' AS DateTime), N'05:50:50 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180590, 101, 10101, N'LOG IN', 93, CAST(N'2016-02-11 00:00:00.000' AS DateTime), N'05:59:23 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180591, 101, 10101, N'LOG IN', 94, CAST(N'2016-02-13 00:00:00.000' AS DateTime), N'12:49:51 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180592, 101, 10101, N'LOG IN', 95, CAST(N'2016-02-13 00:00:00.000' AS DateTime), N'01:16:04 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180593, 101, 10101, N'LOG IN', 96, CAST(N'2016-02-14 00:00:00.000' AS DateTime), N'01:14:44 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180594, 101, 10101, N'LOG IN', 97, CAST(N'2016-02-14 00:00:00.000' AS DateTime), N'02:04:48 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180595, 101, 10101, N'LOG IN', 98, CAST(N'2016-02-15 00:00:00.000' AS DateTime), N'01:25:18 PM', N'192.168.0.79', N'22.3601916,91.827332', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180596, 101, 10101, N'LOG IN', 99, CAST(N'2016-02-16 00:00:00.000' AS DateTime), N'01:05:14 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180597, 101, 10101, N'LOG IN', 100, CAST(N'2016-02-16 00:00:00.000' AS DateTime), N'03:53:17 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180598, 101, 10101, N'LOG IN', 101, CAST(N'2016-02-16 00:00:00.000' AS DateTime), N'04:13:47 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180599, 101, 10101, N'LOG IN', 102, CAST(N'2016-02-16 00:00:00.000' AS DateTime), N'05:00:59 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180600, 101, 10101, N'LOG IN', 103, CAST(N'2016-02-16 00:00:00.000' AS DateTime), N'05:18:28 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180601, 101, 10101, N'LOG IN', 104, CAST(N'2016-02-16 00:00:00.000' AS DateTime), N'05:18:29 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180602, 101, 10101, N'LOG IN', 105, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'11:53:51 AM', N'192.168.0.79', N'22.360147299999998,91.8274114', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180603, 101, 10101, N'Insert', 106, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'12:04:03 PM', N'192.168.0.79', N'22.360147299999998,91.8274114', N'HMS_TEST', N'Category Name: ABCD,
Test Name: test example 1,
Rate: 100,
Discount(%): 1', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180604, 101, 10101, N'LOG IN', 107, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'12:20:33 PM', N'192.168.0.79', N'22.360147299999998,91.8274114', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180605, 101, 10101, N'LOG IN', 108, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'01:40:19 PM', N'192.168.0.79', N'22.360147299999998,91.8274114', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180606, 0, 10101, N'Insert', 1, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'02:03:10 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-002,
Patient Name: omul,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 1,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180607, 101, 10101, N'LOG IN', 109, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'02:15:43 PM', N'192.168.0.79', N'22.360147299999998,91.8274114', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180608, 101, 10101, N'LOG IN', 110, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'02:25:40 PM', N'192.168.0.79', N'22.360147299999998,91.8274114', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180609, 101, 10101, N'LOG IN', 111, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'03:24:11 PM', N'192.168.0.79', N'22.360147299999998,91.8274114', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180610, 101, 10101, N'LOG IN', 112, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'03:32:32 PM', N'192.168.0.79', N'22.360147299999998,91.8274114', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180611, 101, 10101, N'LOG IN', 113, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'03:49:38 PM', N'192.168.0.79', N'22.360147299999998,91.8274114', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180612, 101, 10101, N'Insert', 114, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'03:58:41 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-010,
Patient Name: sdfsdfsdf,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 4,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180613, 101, 10101, N'LOG IN', 115, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:09:04 PM', N'192.168.0.79', N'22.360147299999998,91.8274114', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180614, 101, 10101, N'Insert', 116, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:12:53 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-012,
Patient Name: w,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 1,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180615, 101, 10101, N'Insert', 117, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:13:14 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-012,
Patient Name: w,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 1,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180616, 101, 10101, N'Insert', 118, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:16:12 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-013,
Patient Name: qqqqq,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 1,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180617, 101, 10101, N'Insert', 119, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:16:39 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-013,
Patient Name: qqqqq,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 1,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180618, 101, 10101, N'Insert', 120, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:19:16 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-014,
Patient Name: kkr,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 6,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180619, 101, 10101, N'Insert', 121, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:19:28 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-014,
Patient Name: kkr,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 6,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180620, 101, 10101, N'Insert', 122, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:23:00 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-015,
Patient Name: uuuu,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 8,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180621, 101, 10101, N'Insert', 123, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:23:08 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-015,
Patient Name: uuuu,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 8,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180622, 101, 10101, N'Insert', 124, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:28:55 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-016,
Patient Name: ahmed,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 2,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180623, 101, 10101, N'Insert', 125, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:29:07 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-016,
Patient Name: ahmed,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 2,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180624, 101, 10101, N'Insert', 126, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:35:01 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-017,
Patient Name: ssdsadasd,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 7,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180625, 101, 10101, N'Insert', 127, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:35:05 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-017,
Patient Name: ssdsadasd,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 7,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180626, 101, 10101, N'Insert', 128, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:36:57 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-018,
Patient Name: uuuuu,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 5,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180627, 101, 10101, N'Insert', 129, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:37:08 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-018,
Patient Name: uuuuu,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 5,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180628, 101, 10101, N'Insert', 130, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:39:28 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-001,
Patient Name: shimul,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 1,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180629, 101, 10101, N'Insert', 131, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:44:10 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-001,
Patient Name: shimul,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 1,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180630, 101, 10101, N'LOG IN', 132, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:49:30 PM', N'192.168.0.79', N'22.360147299999998,91.8274114', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180631, 101, 10101, N'Insert', 133, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:50:27 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-002,
Patient Name: aaaa,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 2,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180632, 101, 10101, N'Insert', 134, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:50:57 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-002,
Patient Name: aaaa,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 2,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180633, 101, 10101, N'LOG IN', 135, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:57:20 PM', N'192.168.0.79', N'22.360147299999998,91.8274114', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180634, 101, 10101, N'Insert', 136, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:58:01 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-003,
Patient Name: ooooo,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 22,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180635, 101, 10101, N'Insert', 137, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'04:58:09 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-003,
Patient Name: ooooo,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 22,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180636, 101, 10101, N'LOG IN', 138, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'05:05:47 PM', N'192.168.0.79', N'22.360147299999998,91.8274114', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180637, 101, 10101, N'Insert', 139, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'05:06:53 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-004,
Patient Name: hhhh,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 9,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180638, 101, 10101, N'Insert', 140, CAST(N'2016-02-17 00:00:00.000' AS DateTime), N'05:07:02 PM', NULL, N'22.360147299999998,91.8274114', N'HMS_OPD', N'Patient ID: 170216-004,
Patient Name: hhhh,
Transaction Date: 2/17/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 9,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180639, 101, 10101, N'LOG IN', 141, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'12:45:21 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180640, 101, 10101, N'Insert', 142, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'12:46:49 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-001,
Patient Name: rashed,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 1,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180641, 101, 10101, N'Insert', 143, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'12:51:59 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-002,
Patient Name: rabbi,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 1,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180642, 101, 10101, N'Insert', 144, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'12:53:41 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-002,
Patient Name: rabbi,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 1,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180643, 101, 10101, N'LOG IN', 145, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'01:00:27 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180644, 101, 10101, N'Insert', 146, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'01:03:51 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-003,
Patient Name: yonus,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 2,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180645, 101, 10101, N'Insert', 147, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'01:03:59 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-003,
Patient Name: yonus,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 2,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180646, 101, 10101, N'Insert', 148, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'01:16:29 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-005,
Patient Name: iii,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 9,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180647, 101, 10101, N'Insert', 149, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'01:16:37 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-005,
Patient Name: iii,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 9,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180648, 101, 10101, N'Insert', 150, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'01:25:43 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-006,
Patient Name: monju,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 2,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180649, 101, 10101, N'Insert', 151, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'01:25:51 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-006,
Patient Name: monju,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 2,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180650, 101, 10101, N'Insert', 152, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'01:55:41 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-007,
Patient Name: abul,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 2,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180651, 101, 10101, N'Insert', 153, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'01:55:49 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-007,
Patient Name: abul,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 2,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180652, 101, 10101, N'Insert', 154, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'01:58:38 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-008,
Patient Name: harun,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 2,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180653, 101, 10101, N'Insert', 155, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'01:58:41 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-008,
Patient Name: harun,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 2,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180654, 101, 10101, N'LOG IN', 156, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'02:09:26 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180655, 101, 10101, N'Insert', 157, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'02:12:44 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-009,
Patient Name: fgfdghfhgf,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 6,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180656, 101, 10101, N'Insert', 158, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'02:12:48 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-009,
Patient Name: fgfdghfhgf,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 6,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180657, 101, 10101, N'LOG IN', 159, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'02:20:18 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180658, 101, 10101, N'Insert', 160, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'02:22:01 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-010,
Patient Name: uuuu,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 2,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (180659, 101, 10101, N'Insert', 161, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'02:22:05 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 200216-010,
Patient Name: uuuu,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 2,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190655, 101, 10101, N'LOG IN', 162, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'03:52:37 PM', N'192.168.0.79', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190656, 101, 10101, N'Insert', 163, CAST(N'2016-02-20 00:00:00.000' AS DateTime), N'03:56:16 PM', NULL, N'22.3601505,91.8274102', N'HMS_OPD', N'Patient ID: 200216-011,
Patient Name: ami valo chele,
Transaction Date: 2/20/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 6,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190657, 101, 10101, N'LOG IN', 164, CAST(N'2016-02-24 00:00:00.000' AS DateTime), N'05:16:32 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190658, 101, 10101, N'Insert', 165, CAST(N'2016-02-24 00:00:00.000' AS DateTime), N'05:17:19 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 240216-001,
Patient Name: abcd,
Transaction Date: 2/24/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 1,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190659, 101, 10101, N'LOG IN', 166, CAST(N'2016-02-24 00:00:00.000' AS DateTime), N'05:27:56 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190660, 101, 10101, N'Insert', 167, CAST(N'2016-02-24 00:00:00.000' AS DateTime), N'05:29:59 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 240216-002,
Patient Name: aaaaa,
Transaction Date: 2/24/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 1,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190661, 101, 10101, N'Insert', 168, CAST(N'2016-02-24 00:00:00.000' AS DateTime), N'05:30:09 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 240216-002,
Patient Name: aaaaa,
Transaction Date: 2/24/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 1,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190662, 101, 10101, N'LOG IN', 169, CAST(N'2016-02-25 00:00:00.000' AS DateTime), N'12:59:39 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190663, 101, 10101, N'Insert', 170, CAST(N'2016-02-25 00:00:00.000' AS DateTime), N'01:00:21 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 240216-002,
Patient Name: aaaaa,
Transaction Date: 2/24/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 3,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 1,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190664, 101, 10101, N'LOG IN', 171, CAST(N'2016-02-25 00:00:00.000' AS DateTime), N'01:20:56 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190665, 101, 10101, N'Insert', 172, CAST(N'2016-02-25 00:00:00.000' AS DateTime), N'01:38:24 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 240216-002,
Patient Name: aaaaa,
Transaction Date: 2/24/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: test example 1,
Amount :100,
Pcntd: 1,
Pcntr: 1,
Discr: ,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190666, 101, 10101, N'Insert', 173, CAST(N'2016-02-25 00:00:00.000' AS DateTime), N'01:38:34 PM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 240216-002,
Patient Name: aaaaa,
Transaction Date: 2/24/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: ,
Amount :1000.00,
Pcntd: 0,
Pcntr: 1,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190667, 101, 10101, N'LOG IN', 174, CAST(N'2016-02-25 00:00:00.000' AS DateTime), N'01:53:58 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190668, 101, 10101, N'Update', 175, CAST(N'2016-02-25 00:00:00.000' AS DateTime), N'01:55:02 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_OPDMST', N'Patient ID: 240216-002,
Patient Name: aaaaa,
Transaction Date: 2/24/2016 12:00:00 AM,
Gender: ,
Age: ,
Mobile No: ,
Address: ,
RF(%): 1,
Delivery Date: 2/25/2016 12:00:00 AM,
Delivery Time: 07:30 PM,
Total AMount: 1100,
Doctor Name: ,
Refer Name: ,
Discount Refer: 0,
Discount Lab: 2,
Discount Net: 2,
Net Amount :1098,
Paid: 100,
Due Amount: 998', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190669, 101, 10101, N'LOG IN', 176, CAST(N'2016-02-25 00:00:00.000' AS DateTime), N'03:53:07 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190670, 101, 10101, N'LOG IN', 177, CAST(N'2016-02-25 00:00:00.000' AS DateTime), N'03:57:32 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190671, 101, 10101, N'LOG IN', 178, CAST(N'2016-02-27 00:00:00.000' AS DateTime), N'12:32:31 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190672, 101, 10101, N'LOG IN', 179, CAST(N'2016-02-27 00:00:00.000' AS DateTime), N'12:42:03 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190673, 101, 10101, N'Insert', 180, CAST(N'2016-02-27 00:00:00.000' AS DateTime), N'12:44:48 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_OPDRCV', N'Transaction Date: 2/27/2016 12:00:00 AM,
Transaction Month: Feb-16,
Transaction NO: 2016020001,
Patient Id: 240216-002,
Patient Due Amount: 998,
Discount(Lab): 1,
Net Amount: 997,
Receive AMount: 100,
Due: 897,
Remarks: ', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190674, 1, 10001, N'LOG IN', 13, CAST(N'2016-02-27 00:00:00.000' AS DateTime), N'05:07:43 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190675, 101, 10101, N'LOG IN', 181, CAST(N'2016-02-27 00:00:00.000' AS DateTime), N'05:20:16 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190676, 101, 10101, N'LOG IN', 182, CAST(N'2016-02-27 00:00:00.000' AS DateTime), N'05:35:45 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190677, 101, 10101, N'LOG IN', 183, CAST(N'2016-02-29 00:00:00.000' AS DateTime), N'03:15:32 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190678, 101, 10101, N'LOG IN', 184, CAST(N'2016-02-29 00:00:00.000' AS DateTime), N'03:29:32 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190679, 101, 10101, N'LOG IN', 185, CAST(N'2016-02-29 00:00:00.000' AS DateTime), N'04:03:23 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
GO
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190680, 101, 10101, N'LOG IN', 186, CAST(N'2016-02-29 00:00:00.000' AS DateTime), N'04:41:04 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190681, 101, 10101, N'LOG IN', 187, CAST(N'2016-03-01 00:00:00.000' AS DateTime), N'11:20:38 AM', N'192.168.0.79', N'22.3601466,91.8274105', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190682, 101, 10101, N'LOG IN', 188, CAST(N'2016-03-01 00:00:00.000' AS DateTime), N'11:51:05 AM', N'127.0.0.1', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190683, 101, 10101, N'LOG IN', 189, CAST(N'2016-03-01 00:00:00.000' AS DateTime), N'01:01:59 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190684, 101, 10101, N'LOG IN', 190, CAST(N'2016-03-01 00:00:00.000' AS DateTime), N'01:30:08 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190685, 101, 10101, N'LOG IN', 191, CAST(N'2016-03-01 00:00:00.000' AS DateTime), N'01:44:19 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190686, 101, 10101, N'LOG IN', 192, CAST(N'2016-03-01 00:00:00.000' AS DateTime), N'01:47:24 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190687, 101, 10101, N'LOG IN', 193, CAST(N'2016-03-01 00:00:00.000' AS DateTime), N'01:52:09 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190688, 101, 10101, N'LOG IN', 194, CAST(N'2016-03-01 00:00:00.000' AS DateTime), N'02:00:35 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190689, 101, 10101, N'LOG IN', 195, CAST(N'2016-03-01 00:00:00.000' AS DateTime), N'02:04:34 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190690, 101, 10101, N'LOG IN', 196, CAST(N'2016-03-01 00:00:00.000' AS DateTime), N'02:08:56 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190691, 101, 10101, N'LOG IN', 197, CAST(N'2016-03-01 00:00:00.000' AS DateTime), N'03:03:48 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190692, 101, 10101, N'LOG IN', 198, CAST(N'2016-03-01 00:00:00.000' AS DateTime), N'03:48:56 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190693, 101, 10101, N'LOG IN', 199, CAST(N'2016-03-01 00:00:00.000' AS DateTime), N'04:58:17 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190694, 101, 10101, N'LOG IN', 200, CAST(N'2016-03-02 00:00:00.000' AS DateTime), N'03:03:42 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190695, 101, 10101, N'LOG IN', 201, CAST(N'2016-03-05 00:00:00.000' AS DateTime), N'10:56:45 AM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190696, 101, 10101, N'LOG IN', 202, CAST(N'2016-03-06 00:00:00.000' AS DateTime), N'12:41:09 PM', N'192.168.0.79', N'22.3601916,91.82743409999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190697, 101, 10101, N'LOG IN', 203, CAST(N'2016-03-06 00:00:00.000' AS DateTime), N'03:17:36 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190698, 101, 10101, N'LOG IN', 204, CAST(N'2016-03-06 00:00:00.000' AS DateTime), N'03:23:13 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190699, 101, 10101, N'LOG IN', 205, CAST(N'2016-03-08 00:00:00.000' AS DateTime), N'11:12:03 AM', N'192.168.0.79', N'22.3602455,91.8274248', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190700, 101, 10101, N'LOG IN', 206, CAST(N'2016-03-08 00:00:00.000' AS DateTime), N'01:20:39 PM', N'192.168.0.79', N'22.3602455,91.8274248', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190701, 101, 10101, N'LOG IN', 207, CAST(N'2016-03-08 00:00:00.000' AS DateTime), N'02:26:53 PM', N'192.168.0.79', N'22.3602455,91.8274248', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190702, 101, 10101, N'LOG IN', 208, CAST(N'2016-03-08 00:00:00.000' AS DateTime), N'02:36:38 PM', N'192.168.0.79', N'22.3602455,91.8274248', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190703, 101, 10101, N'LOG IN', 209, CAST(N'2016-03-08 00:00:00.000' AS DateTime), N'02:40:08 PM', N'192.168.0.79', N'22.3602455,91.8274248', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190704, 101, 10101, N'LOG IN', 210, CAST(N'2016-03-08 00:00:00.000' AS DateTime), N'02:43:02 PM', N'192.168.0.79', N'22.3602455,91.8274248', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190705, 101, 10101, N'LOG IN', 211, CAST(N'2016-03-08 00:00:00.000' AS DateTime), N'03:52:46 PM', N'192.168.0.79', N'22.3602455,91.8274248', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190706, 101, 10101, N'LOG IN', 212, CAST(N'2016-03-08 00:00:00.000' AS DateTime), N'04:35:40 PM', N'192.168.0.79', N'22.3602455,91.8274248', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190707, 101, 10101, N'LOG IN', 213, CAST(N'2016-03-08 00:00:00.000' AS DateTime), N'04:35:47 PM', N'192.168.0.79', N'22.3602455,91.8274248', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190708, 101, 10101, N'LOG IN', 214, CAST(N'2016-03-08 00:00:00.000' AS DateTime), N'04:52:32 PM', N'192.168.0.79', N'22.3602455,91.8274248', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190709, 101, 10101, N'LOG IN', 215, CAST(N'2016-03-08 00:00:00.000' AS DateTime), N'05:04:33 PM', N'192.168.0.79', N'22.3602455,91.8274248', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190710, 101, 10101, N'LOG IN', 216, CAST(N'2016-03-08 00:00:00.000' AS DateTime), N'05:26:46 PM', N'192.168.0.79', N'22.3602455,91.8274248', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190711, 101, 10101, N'LOG IN', 217, CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'12:13:15 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190712, 101, 10101, N'LOG IN', 218, CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'12:31:09 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190713, 101, 10101, N'LOG IN', 219, CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'12:48:22 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190714, 101, 10101, N'LOG IN', 220, CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'01:05:14 PM', N'127.0.0.1', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190715, 101, 10101, N'LOG IN', 221, CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'01:24:14 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190716, 101, 10101, N'Insert', 222, CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'01:29:57 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_TESTMST', N'Category Name: category 2,
Top Yes/No: N', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190717, 101, 10101, N'Insert', 223, CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'01:30:09 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_TEST', N'Category Name: category 2,
Test Name: test name cat2,
Rate: 900,
Discount(%): 7', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190718, 101, 10101, N'LOG IN', 224, CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'01:34:04 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190719, 101, 10101, N'LOG IN', 225, CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'01:37:58 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190720, 101, 10101, N'LOG IN', 226, CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'01:40:46 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190721, 101, 10101, N'LOG IN', 227, CAST(N'2016-03-09 00:00:00.000' AS DateTime), N'01:47:33 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190722, 1, 10001, N'LOG IN', 14, CAST(N'2016-03-12 00:00:00.000' AS DateTime), N'04:01:22 PM', N'192.168.0.79', N'22.3601961,91.8274326', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190723, 101, 10101, N'LOG IN', 228, CAST(N'2016-03-12 00:00:00.000' AS DateTime), N'04:03:37 PM', N'192.168.0.79', N'22.3601961,91.8274326', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190724, 101, 10101, N'LOG IN', 229, CAST(N'2016-03-12 00:00:00.000' AS DateTime), N'05:28:03 PM', N'192.168.0.79', N'22.3601961,91.8274326', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190725, 101, 10101, N'LOG IN', 230, CAST(N'2016-03-13 00:00:00.000' AS DateTime), N'11:09:32 AM', N'192.168.0.79', N'22.360244299999998,91.82742429999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190726, 101, 10101, N'LOG IN', 231, CAST(N'2016-03-13 00:00:00.000' AS DateTime), N'12:12:15 PM', N'192.168.0.79', N'22.360244299999998,91.82742429999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190727, 101, 10101, N'LOG IN', 232, CAST(N'2016-03-13 00:00:00.000' AS DateTime), N'12:45:52 PM', N'192.168.0.79', N'22.360244299999998,91.82742429999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190728, 101, 10101, N'LOG IN', 233, CAST(N'2016-03-13 00:00:00.000' AS DateTime), N'12:50:30 PM', N'192.168.0.79', N'22.360244299999998,91.82742429999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190729, 101, 10101, N'LOG IN', 234, CAST(N'2016-03-13 00:00:00.000' AS DateTime), N'12:54:18 PM', N'192.168.0.79', N'22.360244299999998,91.82742429999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190730, 101, 10101, N'LOG IN', 235, CAST(N'2016-03-13 00:00:00.000' AS DateTime), N'01:18:08 PM', N'192.168.0.79', N'22.360244299999998,91.82742429999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190731, 101, 10101, N'LOG IN', 236, CAST(N'2016-03-13 00:00:00.000' AS DateTime), N'01:49:41 PM', N'192.168.0.79', N'22.360244299999998,91.82742429999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190732, 101, 10101, N'LOG IN', 237, CAST(N'2016-03-13 00:00:00.000' AS DateTime), N'03:31:31 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190733, 101, 10101, N'LOG IN', 238, CAST(N'2016-03-13 00:00:00.000' AS DateTime), N'05:09:33 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190734, 101, 10101, N'LOG IN', 239, CAST(N'2016-03-13 00:00:00.000' AS DateTime), N'05:35:46 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190735, 101, 10101, N'LOG IN', 240, CAST(N'2016-03-14 00:00:00.000' AS DateTime), N'12:12:30 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190736, 101, 10101, N'LOG IN', 241, CAST(N'2016-03-14 00:00:00.000' AS DateTime), N'12:51:15 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190737, 101, 10101, N'LOG IN', 242, CAST(N'2016-03-14 00:00:00.000' AS DateTime), N'01:52:34 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190738, 101, 10101, N'LOG IN', 243, CAST(N'2016-03-14 00:00:00.000' AS DateTime), N'01:58:24 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190739, 101, 10101, N'LOG IN', 244, CAST(N'2016-03-14 00:00:00.000' AS DateTime), N'02:52:16 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190740, 101, 10101, N'LOG IN', 245, CAST(N'2016-03-14 00:00:00.000' AS DateTime), N'03:38:26 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190741, 101, 10101, N'LOG IN', 246, CAST(N'2016-03-14 00:00:00.000' AS DateTime), N'03:46:59 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190742, 101, 10101, N'LOG IN', 247, CAST(N'2016-03-14 00:00:00.000' AS DateTime), N'03:54:13 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190743, 101, 10101, N'LOG IN', 248, CAST(N'2016-03-14 00:00:00.000' AS DateTime), N'04:06:07 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190744, 101, 10101, N'LOG IN', 249, CAST(N'2016-03-14 00:00:00.000' AS DateTime), N'05:25:24 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190745, 101, 10101, N'LOG IN', 250, CAST(N'2016-03-19 00:00:00.000' AS DateTime), N'11:54:46 AM', N'192.168.0.79', N'22.3601961,91.82738250000001', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190746, 101, 10101, N'LOG IN', 251, CAST(N'2016-03-19 00:00:00.000' AS DateTime), N'12:44:04 PM', N'192.168.0.79', N'22.3600921,91.8274139', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190747, 101, 10101, N'LOG IN', 252, CAST(N'2016-03-19 00:00:00.000' AS DateTime), N'03:16:52 PM', N'192.168.0.79', N'22.3601966,91.8273828', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190748, 101, 10101, N'LOG IN', 253, CAST(N'2016-03-20 00:00:00.000' AS DateTime), N'12:25:36 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190749, 101, 10101, N'LOG IN', 254, CAST(N'2016-03-20 00:00:00.000' AS DateTime), N'01:31:18 PM', N'192.168.0.79', N'22.360121499999998,91.82740319999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190750, 101, 10101, N'LOG IN', 255, CAST(N'2016-03-20 00:00:00.000' AS DateTime), N'01:46:19 PM', N'192.168.0.79', N'22.360121499999998,91.82740319999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190751, 101, 10101, N'LOG IN', 256, CAST(N'2016-03-20 00:00:00.000' AS DateTime), N'03:22:37 PM', N'192.168.0.79', N'22.360121499999998,91.82740319999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190752, 101, 10101, N'LOG IN', 257, CAST(N'2016-03-20 00:00:00.000' AS DateTime), N'03:41:14 PM', N'192.168.0.79', N'22.360121499999998,91.82740319999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190753, 101, 10101, N'LOG IN', 258, CAST(N'2016-03-20 00:00:00.000' AS DateTime), N'03:56:53 PM', N'192.168.0.79', N'22.360121499999998,91.82740319999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190754, 101, 10101, N'LOG IN', 259, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'03:03:55 PM', N'192.168.0.79', N'22.360197199999998,91.8273821', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190755, 101, 10101, N'LOG IN', 260, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'03:27:00 PM', N'192.168.0.79', N'22.360197199999998,91.8273821', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190756, 101, 10101, N'LOG IN', 261, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'03:47:31 PM', N'192.168.0.79', N'22.360197199999998,91.8273821', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190757, 101, 10101, N'LOG IN', 262, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:14:25 PM', N'192.168.0.79', N'22.360197199999998,91.8273821', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190758, 101, 10101, N'LOG IN', 263, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:20:47 PM', N'192.168.0.79', N'22.360197199999998,91.8273821', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190759, 101, 10101, N'LOG IN', 264, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:30:30 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190760, 1, 10001, N'LOG IN', 15, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:30:50 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190761, 101, 10101, N'LOG IN', 265, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:33:27 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190762, 101, 10101, N'INSERT', 266, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:34:14 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_MEDIMST', N'Medical Category Information Page. Medical name: Category A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190763, 101, 10101, N'INSERT', 267, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:34:22 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_MEDIMST', N'Medical Category Information Page. Medical name: Category B.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190764, 101, 10101, N'INSERT', 268, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:34:50 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMA', N'Pharma Information Page. Pharma name: BBQ,
Address :Chittagong,
Contact: ,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190765, 101, 10101, N'INSERT', 269, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:34:58 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMA', N'Pharma Information Page. Pharma name: QPS,
Address :Dhaka,
Contact: ,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190766, 101, 10101, N'INSERT', 270, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:35:20 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_MEDICARE', N'Medical category wise care information page. Medical name: Napa,
Generic name: ,
Dosage name: ,
Pharma name: QPS,
Unit: 1,
Buy Rate: 900,
Sale Rate: 1000,
Stock Minimum: 0,
Create for this Category: Category A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190767, 101, 10101, N'INSERT', 271, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:35:42 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_MEDICARE', N'Medical category wise care information page. Medical name: Napa Extra,
Generic name: ,
Dosage name: ,
Pharma name: QPS,
Unit: 5,
Buy Rate: 80,
Sale Rate: 85,
Stock Minimum: 0,
Create for this Category: Category A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190768, 101, 10101, N'INSERT', 272, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:36:04 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_MEDICARE', N'Medical category wise care information page. Medical name: Glucose,
Generic name: ,
Dosage name: ,
Pharma name: BBQ,
Unit: 1,
Buy Rate: 120,
Sale Rate: 140,
Stock Minimum: 0,
Create for this Category: Category B.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190769, 101, 10101, N'Insert', 273, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:36:26 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_DEPT', N'Department Name: Pharmacy A,
Remarks: ', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190770, 101, 10101, N'Insert', 274, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:36:33 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_DEPT', N'Department Name: Pharmacy B,
Remarks: ', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190771, 101, 10101, N'INSERT', 275, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:36:48 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Sale,
Date: 21-Mar-2016,
Memo No: 16030001,
Department: Pharmacy A,
Patient Type: OUTDOOR,
Patient ID: 170216-002,
Patient Name: aaaa,
Item name: Napa,
Qty:1,
Rate:1000,
Amount:1000.00.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190772, 101, 10101, N'INSERT', 276, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:36:55 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Sale,
Date: 21-Mar-2016,
Memo No: 16030001,
Department: Pharmacy A,
Patient Type: OUTDOOR,
Patient ID: 170216-002,
Patient Name: aaaa,
Item name: Napa Extra,
Qty:8,
Rate:85,
Amount:680.00.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190773, 101, 10101, N'INSERT', 277, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:37:08 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Sale/Sale-Return/Use - Payment Information. Trasaction type: Sale,
Date: 21-Mar-2016,
Memo No: 16030001,
Department: Pharmacy A,
Patient Type: OUTDOOR,
Patient ID: 170216-002,
Patient Name: aaaa,
Total Amount: 1680,
Vate Rate: 10,
Vate Amount: 168.00,
Discount: 48,
Amount: 1800.00,
Remarks: .', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190774, 101, 10101, N'INSERT', 278, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:37:38 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Sale,
Date: 21-Mar-2016,
Memo No: 16030002,
Department: Pharmacy A,
Patient Type: OUTDOOR,
Patient ID: 170216-004,
Patient Name: hhhh,
Item name: Napa,
Qty:90,
Rate:1000,
Amount:90000.00.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190775, 101, 10101, N'INSERT', 279, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:37:43 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Sale/Sale-Return/Use - Payment Information. Trasaction type: Sale,
Date: 21-Mar-2016,
Memo No: 16030002,
Department: Pharmacy A,
Patient Type: OUTDOOR,
Patient ID: 170216-004,
Patient Name: hhhh,
Total Amount: 90000,
Vate Rate: 10,
Vate Amount: 9000.00,
Discount: 0,
Amount: 99000.00,
Remarks: .', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190776, 101, 10101, N'INSERT', 280, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:38:04 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Sale-Return,
Date: 21-Mar-2016,
Memo No: 16030001,
Department: Pharmacy A,
Patient Type: INDOOR,
Patient ID: 110116-001,
Patient Name: yeasin,
Item name: Glucose,
Qty:1,
Rate:140,
Amount:140.00.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190777, 101, 10101, N'INSERT', 281, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:38:09 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Sale-Return,
Date: 21-Mar-2016,
Memo No: 16030001,
Department: Pharmacy A,
Patient Type: INDOOR,
Patient ID: 110116-001,
Patient Name: yeasin,
Item name: Napa,
Qty:1,
Rate:1000,
Amount:1000.00.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190778, 101, 10101, N'INSERT', 282, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:38:16 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Sale-Return,
Date: 21-Mar-2016,
Memo No: 16030001,
Department: Pharmacy A,
Patient Type: INDOOR,
Patient ID: 110116-001,
Patient Name: yeasin,
Item name: Napa Extra,
Qty:8,
Rate:85,
Amount:680.00.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190779, 101, 10101, N'INSERT', 283, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:38:20 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Sale/Sale-Return/Use - Payment Information. Trasaction type: Sale-Return,
Date: 21-Mar-2016,
Memo No: 16030001,
Department: Pharmacy A,
Patient Type: INDOOR,
Patient ID: 110116-001,
Patient Name: yeasin,
Total Amount: 1820,
Vate Rate: 0,
Vate Amount: 0.00,
Discount: 0,
Amount: 1820.00,
Remarks: .', N'DESKTOP-IN7DGG9')
GO
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190780, 101, 10101, N'INSERT', 284, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:38:42 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Use,
Date: 21-Mar-2016,
Memo No: 16030001,
Department: Pharmacy B,
Patient Type: OUTDOOR,
Patient ID: 170216-004,
Patient Name: hhhh,
Item name: Napa,
Qty:800,
Rate:1000,
Amount:800000.00.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190781, 101, 10101, N'INSERT', 285, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:38:50 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Use,
Date: 21-Mar-2016,
Memo No: 16030001,
Department: Pharmacy B,
Patient Type: OUTDOOR,
Patient ID: 170216-004,
Patient Name: hhhh,
Item name: Glucose,
Qty:90000,
Rate:140,
Amount:12600000.00.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190782, 101, 10101, N'INSERT', 286, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:39:00 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Sale/Sale-Return/Use - Payment Information. Trasaction type: Use,
Date: 21-Mar-2016,
Memo No: 16030001,
Department: Pharmacy B,
Patient Type: OUTDOOR,
Patient ID: 170216-004,
Patient Name: hhhh,
Total Amount: 13400000,
Vate Rate: 10,
Vate Amount: 1340000.00,
Discount: 5000,
Amount: 14735000.00,
Remarks: .', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190783, 101, 10101, N'INSERT', 287, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:39:30 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Use,
Date: 21-Mar-2016,
Memo No: 16030002,
Department: Pharmacy B,
Patient Type: OUTDOOR,
Patient ID: 200216-002,
Patient Name: rabbi,
Item name: Glucose,
Qty:8000,
Rate:140,
Amount:1120000.00.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190784, 101, 10101, N'INSERT', 288, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:39:37 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Use,
Date: 21-Mar-2016,
Memo No: 16030002,
Department: Pharmacy B,
Patient Type: OUTDOOR,
Patient ID: 200216-002,
Patient Name: rabbi,
Item name: Napa Extra,
Qty:7000,
Rate:85,
Amount:595000.00.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190785, 101, 10101, N'INSERT', 289, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:39:46 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Sale/Sale-Return/Use - Payment Information. Trasaction type: Use,
Date: 21-Mar-2016,
Memo No: 16030002,
Department: Pharmacy B,
Patient Type: OUTDOOR,
Patient ID: 200216-002,
Patient Name: rabbi,
Total Amount: 1715000,
Vate Rate: 10,
Vate Amount: 171500.00,
Discount: 500,
Amount: 1886000.00,
Remarks: .', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190786, 101, 10101, N'INSERT', 290, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:40:09 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Use,
Date: 21-Mar-2016,
Memo No: 16030003,
Department: Pharmacy B,
Patient Type: INDOOR,
Patient ID: 110116-001,
Patient Name: yeasin,
Item name: Napa Extra,
Qty:9000,
Rate:85,
Amount:765000.00.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190787, 101, 10101, N'INSERT', 291, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:40:12 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Sale/Sale-Return/Use - Payment Information. Trasaction type: Use,
Date: 21-Mar-2016,
Memo No: 16030003,
Department: Pharmacy B,
Patient Type: INDOOR,
Patient ID: 110116-001,
Patient Name: yeasin,
Total Amount: 765000,
Vate Rate: 0,
Vate Amount: 0.00,
Discount: 0,
Amount: 765000.00,
Remarks: .', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190788, 101, 10101, N'UPDATE', 292, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:40:59 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Sale/Sale-Return/Use(Update Menu)-Payment Information. Trasaction type: Use,
Date: 3/21/2016 12:00:00 AM,
Memo No: 16030003,
Department: Pharmacy B,
Patient Type: INDOOR,
Patient ID: 110116-001,
Patient Name: yeasin,
Total Amount: 765000.00,
Vate Rate: 10,
Vate Amount: 76500.00,
Discount: 0.00,
Amount: 841500.00,
Remarks: .', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190789, 101, 10101, N'LOG IN', 293, CAST(N'2016-03-21 00:00:00.000' AS DateTime), N'04:54:59 PM', N'192.168.0.79', N'22.360197199999998,91.8273821', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190790, 101, 10101, N'LOG IN', 294, CAST(N'2016-03-22 00:00:00.000' AS DateTime), N'12:10:16 PM', N'127.0.0.1', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190791, 101, 10101, N'LOG IN', 295, CAST(N'2016-03-22 00:00:00.000' AS DateTime), N'12:44:24 PM', N'192.168.0.79', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190792, 101, 10101, N'LOG IN', 296, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'12:48:16 PM', N'192.168.0.79', N'22.3601943,91.82738239999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-IN7DGG9')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190793, 101, 10101, N'LOG IN', 297, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'03:20:26 PM', N'204.9.187.75', N'22.3601943,91.82738239999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190794, 101, 10101, N'LOG IN', 298, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'03:22:30 PM', N'204.9.187.75', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190795, 101, 10101, N'INSERT', 299, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'03:41:22 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMA', N'Pharma Information Page. Pharma name: ACI Pharmaceuticals,
Address :,
Contact: ,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190796, 101, 10101, N'INSERT', 300, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'03:41:31 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMA', N'Pharma Information Page. Pharma name: Beximco Pharmaceuticals,
Address :,
Contact: ,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190797, 101, 10101, N'Insert', 301, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'03:56:18 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_DEPT', N'Department Name: Pharmacy-Central,
Remarks: ', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190798, 101, 10101, N'Insert', 302, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'03:56:31 PM', N'204.9.187.75', N'22.3600857,91.8274189', N'HMS_DEPT', N'Department Name: OT,
Remarks: ', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190799, 101, 10101, N'Insert', 303, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'03:56:38 PM', N'204.9.187.75', N'22.360021699999997,91.8274454', N'HMS_DEPT', N'Department Name: Cabin,
Remarks: ', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190800, 101, 10101, N'Insert', 304, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'03:56:44 PM', N'204.9.187.75', N'22.360021699999997,91.8274454', N'HMS_DEPT', N'Department Name: Ward,
Remarks: ', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190801, 101, 10101, N'Insert', 305, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'03:57:02 PM', N'204.9.187.75', N'22.360021699999997,91.8274454', N'HMS_DEPT', N'Department Name: Cash,
Remarks: ', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190802, 101, 10101, N'Insert', 306, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'03:57:09 PM', N'204.9.187.75', N'22.3600857,91.8274189', N'HMS_DEPT', N'Department Name: Pathology,
Remarks: ', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190803, 101, 10101, N'Insert', 307, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'03:57:16 PM', N'204.9.187.75', N'22.360071100000003,91.82742359999999', N'HMS_DEPT', N'Department Name: X-Ray,
Remarks: ', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190804, 101, 10101, N'Insert', 308, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'03:57:22 PM', N'204.9.187.75', N'22.360077999999998,91.82742019999999', N'HMS_DEPT', N'Department Name: Ultrasonography,
Remarks: ', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190805, 101, 10101, N'Insert', 309, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'03:57:28 PM', N'204.9.187.75', N'22.360077999999998,91.82742019999999', N'HMS_DEPT', N'Department Name: E.C.G.,
Remarks: ', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190806, 101, 10101, N'LOG IN', 310, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:29:36 PM', N'204.9.187.75', N'22.360104699999997,91.82741', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190807, 101, 10101, N'Insert', 311, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:48:38 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TESTMST', N'Category Name: BIO-CHEMISTRY,
Top Yes/No: Y', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190808, 101, 10101, N'Insert', 312, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:49:15 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: BIO-CHEMISTRY,
Test Name: Bilrubin,
Rate: 130,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190809, 101, 10101, N'Insert', 313, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:49:31 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: BIO-CHEMISTRY,
Test Name: SGPT,
Rate: 205,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190810, 101, 10101, N'Insert', 314, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:49:44 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: BIO-CHEMISTRY,
Test Name: SGOT,
Rate: 205,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190811, 101, 10101, N'Insert', 315, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:50:08 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: BIO-CHEMISTRY,
Test Name: Alkaline Phosphate,
Rate: 205,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190812, 101, 10101, N'Insert', 316, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:50:28 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: BIO-CHEMISTRY,
Test Name: HBsAg (Screening),
Rate: 250,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190813, 101, 10101, N'Insert', 317, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:51:22 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TESTMST', N'Category Name: CLINICAL PATHOLOGY,
Top Yes/No: Y', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190814, 101, 10101, N'Insert', 318, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:51:35 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: CLINICAL PATHOLOGY,
Test Name: CBC,
Rate: 350,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190815, 101, 10101, N'Insert', 319, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:51:47 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: CLINICAL PATHOLOGY,
Test Name: PBF Study,
Rate: 300,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190816, 101, 10101, N'Insert', 320, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:51:57 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: CLINICAL PATHOLOGY,
Test Name: Stool R/E,
Rate: 150,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190817, 101, 10101, N'Insert', 321, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:52:12 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: CLINICAL PATHOLOGY,
Test Name: Stool C/S,
Rate: 250,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190818, 101, 10101, N'Insert', 322, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:52:24 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: CLINICAL PATHOLOGY,
Test Name: MPC,
Rate: 120,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190819, 101, 10101, N'Insert', 323, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:52:41 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TESTMST', N'Category Name: X-RAY,
Top Yes/No: Y', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190820, 101, 10101, N'Insert', 324, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:54:03 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: X-RAY,
Test Name: X-Ray of Left Kneee Joint Both View,
Rate: 300,
Discount(%): 20', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190821, 101, 10101, N'Insert', 325, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:54:19 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: X-RAY,
Test Name: X-Ray of Chest P/A View,
Rate: 300,
Discount(%): 20', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190822, 101, 10101, N'Insert', 326, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:54:36 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: X-RAY,
Test Name: X-Ray of Right Ankle Joint Both View,
Rate: 300,
Discount(%): 20', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190823, 101, 10101, N'Insert', 327, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:54:48 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: X-RAY,
Test Name: X-Ray of Pelvis A/P View,
Rate: 300,
Discount(%): 20', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190824, 101, 10101, N'Insert', 328, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:55:02 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: X-RAY,
Test Name: X-Ray of PNS Both View,
Rate: 600,
Discount(%): 20', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190825, 101, 10101, N'Insert', 329, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:55:18 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TESTMST', N'Category Name: E.C.G.,
Top Yes/No: Y', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190826, 101, 10101, N'Insert', 330, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:55:30 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: E.C.G.,
Test Name: ECG (Digital),
Rate: 250,
Discount(%): 30', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190827, 101, 10101, N'Insert', 331, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:55:46 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: E.C.G.,
Test Name: EEG (Metro),
Rate: 1750,
Discount(%): 0', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190828, 101, 10101, N'Insert', 332, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:55:59 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: E.C.G.,
Test Name: EEG (Chevron),
Rate: 1675,
Discount(%): 0', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190829, 101, 10101, N'Insert', 333, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:56:15 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TESTMST', N'Category Name: SEROLOGY,
Top Yes/No: N', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190830, 101, 10101, N'Insert', 334, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:56:27 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: SEROLOGY,
Test Name: Blood Group,
Rate: 150,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190831, 101, 10101, N'Insert', 335, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:56:39 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: SEROLOGY,
Test Name: Widal Test,
Rate: 250,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190832, 101, 10101, N'Insert', 336, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:56:59 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: SEROLOGY,
Test Name: HBsAg (Confirmatory),
Rate: 1000,
Discount(%): 30', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190833, 101, 10101, N'Insert', 337, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:57:14 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TESTMST', N'Category Name: ULTRASONOGRAPHY,
Top Yes/No: Y', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190834, 101, 10101, N'Insert', 338, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:57:35 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: ULTRASONOGRAPHY,
Test Name: USG of Lower Abdomen,
Rate: 900,
Discount(%): 30', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190835, 101, 10101, N'Insert', 339, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:57:46 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: ULTRASONOGRAPHY,
Test Name: USG of Pregnancy Profile,
Rate: 900,
Discount(%): 30', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190836, 101, 10101, N'Insert', 340, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:58:00 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: ULTRASONOGRAPHY,
Test Name: USG of Upper Abdomen,
Rate: 1000,
Discount(%): 30', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190837, 101, 10101, N'Insert', 341, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:58:16 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: ULTRASONOGRAPHY,
Test Name: USG of HBS,
Rate: 1000,
Discount(%): 30', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190838, 101, 10101, N'Insert', 342, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:58:33 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TESTMST', N'Category Name: IMMUNOLOGY,
Top Yes/No: Y', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190839, 101, 10101, N'Insert', 343, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:59:14 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: IMMUNOLOGY,
Test Name: ICT for Microbacteria,
Rate: 1000,
Discount(%): 0', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190840, 101, 10101, N'Insert', 344, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:59:27 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: IMMUNOLOGY,
Test Name: Anti Dengue Igm & IgG,
Rate: 1200,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190841, 101, 10101, N'Insert', 345, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'04:59:45 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: IMMUNOLOGY,
Test Name: ICT Salmonella IgM & IgG,
Rate: 800,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190842, 101, 10101, N'Insert', 346, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:00:03 PM', N'204.9.187.75', N'22.3600881,91.8274141', N'HMS_TEST', N'Category Name: IMMUNOLOGY,
Test Name: ICT Malaria PFT & PVT,
Rate: 650,
Discount(%): 30', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190843, 101, 10101, N'Insert', 347, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:09:52 PM', N'204.9.187.75', N'22.360088899999997,91.82741639999999', N'HMS_TESTMST', N'Category Name: BIO-CHEMISTRY,
Top Yes/No: Y', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190844, 101, 10101, N'Insert', 348, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:10:13 PM', N'204.9.187.75', N'22.360088899999997,91.82741639999999', N'HMS_TEST', N'Category Name: BIO-CHEMISTRY,
Test Name: Bilrubin (Total),
Rate: 120,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190845, 101, 10101, N'Insert', 349, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:10:26 PM', N'204.9.187.75', N'22.360088899999997,91.82741639999999', N'HMS_TEST', N'Category Name: BIO-CHEMISTRY,
Test Name: Bilrubin (Direct & Indirect),
Rate: 305,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190846, 101, 10101, N'Insert', 350, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:10:43 PM', N'204.9.187.75', N'22.360088899999997,91.82741639999999', N'HMS_TEST', N'Category Name: BIO-CHEMISTRY,
Test Name: SGOT/AST,
Rate: 205,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190847, 101, 10101, N'Insert', 351, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:10:52 PM', N'204.9.187.75', N'22.360088899999997,91.82741639999999', N'HMS_TEST', N'Category Name: BIO-CHEMISTRY,
Test Name: SGPT/ALT,
Rate: 205,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190848, 101, 10101, N'Insert', 352, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:11:10 PM', N'204.9.187.75', N'22.360088899999997,91.82741639999999', N'HMS_TEST', N'Category Name: BIO-CHEMISTRY,
Test Name: RBS & CUS,
Rate: 120,
Discount(%): 40', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190849, 101, 10101, N'Insert', 353, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:11:50 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTMST', N'Category Name: BIO-CHEMISTRY,
Test Name: Bilrubin (Total),
Vaccum Name: Niddle', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190850, 101, 10101, N'Insert', 354, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:11:55 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTMST', N'Category Name: BIO-CHEMISTRY,
Test Name: Bilrubin (Total),
Vaccum Name: Red Tube', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190851, 101, 10101, N'Insert', 355, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:12:05 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTMST', N'Category Name: BIO-CHEMISTRY,
Test Name: Bilrubin (Direct & Indirect),
Vaccum Name: Niddle', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190852, 101, 10101, N'Insert', 356, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:12:08 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTMST', N'Category Name: BIO-CHEMISTRY,
Test Name: Bilrubin (Direct & Indirect),
Vaccum Name: Red Tube', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190853, 101, 10101, N'Insert', 357, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:12:26 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTMST', N'Category Name: BIO-CHEMISTRY,
Test Name: RBS & CUS,
Vaccum Name: Niddle', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190854, 101, 10101, N'Insert', 358, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:12:29 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTMST', N'Category Name: BIO-CHEMISTRY,
Test Name: RBS & CUS,
Vaccum Name: Grey Tube', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190855, 101, 10101, N'Insert', 359, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:13:08 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTMST', N'Category Name: CLINICAL PATHOLOGY,
Test Name: CBC,
Vaccum Name: Niddle', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190856, 101, 10101, N'Insert', 360, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:13:12 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTMST', N'Category Name: CLINICAL PATHOLOGY,
Test Name: CBC,
Vaccum Name: Black Tube (ESR)', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190857, 101, 10101, N'Insert', 361, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:13:16 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTMST', N'Category Name: CLINICAL PATHOLOGY,
Test Name: CBC,
Vaccum Name: Light Blue Tube', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190858, 101, 10101, N'INSERT', 362, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:36:28 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_GENDOS', N'Gendos Information Page. Gendos type: GENERIC,
Gendos name :Ranitidine,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190859, 101, 10101, N'INSERT', 363, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:36:36 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_GENDOS', N'Gendos Information Page. Gendos type: GENERIC,
Gendos name :Aluminium Hydroxide + Magnesium Hydroxide,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190860, 101, 10101, N'INSERT', 364, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:36:44 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_GENDOS', N'Gendos Information Page. Gendos type: GENERIC,
Gendos name :Omeprazole,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190861, 101, 10101, N'INSERT', 365, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:36:49 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_GENDOS', N'Gendos Information Page. Gendos type: GENERIC,
Gendos name :Lansoprazole,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190862, 101, 10101, N'INSERT', 366, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:36:58 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_GENDOS', N'Gendos Information Page. Gendos type: GENERIC,
Gendos name :Pantoprazole,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190863, 101, 10101, N'INSERT', 367, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:37:13 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_GENDOS', N'Gendos Information Page. Gendos type: GENERIC,
Gendos name :Amoxicillin,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190864, 101, 10101, N'INSERT', 368, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:37:20 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_GENDOS', N'Gendos Information Page. Gendos type: GENERIC,
Gendos name :Ampicillin,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190865, 101, 10101, N'INSERT', 369, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:37:30 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_GENDOS', N'Gendos Information Page. Gendos type: DOSAGE,
Gendos name :Capsule,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190866, 101, 10101, N'INSERT', 370, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:37:37 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_GENDOS', N'Gendos Information Page. Gendos type: DOSAGE,
Gendos name :Tablet,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190867, 101, 10101, N'INSERT', 371, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:37:49 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_GENDOS', N'Gendos Information Page. Gendos type: DOSAGE,
Gendos name :Powder for Suspension,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190868, 101, 10101, N'INSERT', 372, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:37:59 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_GENDOS', N'Gendos Information Page. Gendos type: DOSAGE,
Gendos name :Syrup,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190869, 101, 10101, N'INSERT', 373, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:38:04 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_GENDOS', N'Gendos Information Page. Gendos type: DOSAGE,
Gendos name :Suspension,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190870, 101, 10101, N'INSERT', 374, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:44:38 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_MEDIMST', N'Medical Category Information Page. Medical name: Antacids & Antiulcerants.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190871, 101, 10101, N'INSERT', 375, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:44:47 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_MEDIMST', N'Medical Category Information Page. Medical name: Antibiotics.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190872, 101, 10101, N'INSERT', 376, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:46:49 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_MEDICARE', N'Medical category wise care information page. Medical name: MIMOX,
Generic name: Amoxicillin,
Dosage name: Tablet,
Pharma name: ACI Pharmaceuticals,
Unit: Pcs,
Buy Rate: 10,
Sale Rate: 12,
Stock Minimum: 5,
Create for this Category: Antacids & Antiulcerants.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190873, 101, 10101, N'INSERT', 377, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:47:18 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_MEDICARE', N'Medical category wise care information page. Medical name: AMPI CAP,
Generic name: Ampicillin,
Dosage name: Capsule,
Pharma name: ACI Pharmaceuticals,
Unit: Pcs,
Buy Rate: 12,
Sale Rate: 13,
Stock Minimum: 5,
Create for this Category: Antacids & Antiulcerants.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190874, 101, 10101, N'UPDATE', 378, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:48:04 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_MEDICARE', N'Medical category wise care information page. Medical name: RANITIDINE,
Generic name: Ranitidine,
Dosage name: Tablet,
Pharma name: ACI Pharmaceuticals,
Unit: Pcs,
Buy Rate: 10,
Sale Rate: 12,
Stock Minimum: 5,
Create for this Category: Antacids & Antiulcerants.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190875, 101, 10101, N'UPDATE', 379, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:48:24 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_MEDICARE', N'Medical category wise care information page. Medical name: PENTOCIL,
Generic name: Aluminium Hydroxide + Magnesium Hydroxide,
Dosage name: Suspension,
Pharma name: ACI Pharmaceuticals,
Unit: Pcs,
Buy Rate: 20,
Sale Rate: 22,
Stock Minimum: 5,
Create for this Category: Antacids & Antiulcerants.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190876, 101, 10101, N'INSERT', 380, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:48:52 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_MEDICARE', N'Medical category wise care information page. Medical name: LOTIL,
Generic name: Omeprazole,
Dosage name: Capsule,
Pharma name: ACI Pharmaceuticals,
Unit: Pcs,
Buy Rate: 30,
Sale Rate: 33,
Stock Minimum: 0,
Create for this Category: Antacids & Antiulcerants.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190877, 101, 10101, N'INSERT', 381, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:49:20 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_MEDICARE', N'Medical category wise care information page. Medical name: PANTOPRAZOLE,
Generic name: Pantoprazole,
Dosage name: Tablet,
Pharma name: Beximco Pharmaceuticals,
Unit: Pcs,
Buy Rate: 110,
Sale Rate: 120,
Stock Minimum: 10,
Create for this Category: Antacids & Antiulcerants.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190878, 101, 10101, N'INSERT', 382, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:50:29 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_MEDICARE', N'Medical category wise care information page. Medical name: MIMOX-250gm,
Generic name: Aluminium Hydroxide + Magnesium Hydroxide,
Dosage name: Capsule,
Pharma name: Beximco Pharmaceuticals,
Unit: Pcs,
Buy Rate: 11,
Sale Rate: 12,
Stock Minimum: 0,
Create for this Category: Antibiotics.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190879, 101, 10101, N'INSERT', 383, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'05:50:55 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_MEDICARE', N'Medical category wise care information page. Medical name: MIMOX-500gm,
Generic name: Aluminium Hydroxide + Magnesium Hydroxide,
Dosage name: Capsule,
Pharma name: Beximco Pharmaceuticals,
Unit: Pcs,
Buy Rate: 15,
Sale Rate: 18,
Stock Minimum: 0,
Create for this Category: Antibiotics.', N'WS8')
GO
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190880, 101, 10101, N'LOG IN', 384, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:13:11 AM', N'204.9.187.75', N'22.360200199999998,91.827382', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190881, 101, 10101, N'INSERT', 385, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:19:09 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_CBIRTH', N'Birth Certificate Entry Page. Transaction No: 16000001,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Baby Name: Master Shafiq,
Baby Gender: MALE,
Birth Date: 24-Mar-2016,
Birth Time: 02:05,
File NO: 101,
Remarks: Test.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190882, 101, 10101, N'UPDATE', 386, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:20:59 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_CBIRTH', N'Birth Certificate Entry Page. Transaction No: 16000001,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Baby Name: Master Shafiqul Hoque,
Baby Gender: MALE,
Birth Date: 24-Mar-2016,
Birth Time: 02:05,
File NO: 101,
Remarks: Test.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190883, 101, 10101, N'DELETE', 387, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:22:08 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_CBIRTH', N'Birth Certificate Entry Page. Transaction No: 16000001,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Baby Name: Master Shafiqul Hoque,
Baby Gender: MALE,
Birth Date: 24-Mar-2016,
Birth Time: 02:05,
File NO: 101,
Remarks: Test.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190884, 101, 10101, N'INSERT', 388, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:24:11 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_CDEATH', N'Death Certificate Entry Page. Transaction No: 16000001,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Death Date: 31-Mar-2016,
Death Time: 18:04,
Consult Name: Arifur Rahman,
Doctor Name: Arifur Rahman,
Cause A: A,
Cause B: B,
Cause C: C,
Remarks: D.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190885, 101, 10101, N'DELETE', 389, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:25:49 AM', N'204.9.187.75', N'22.3601151,91.8274064', N'HMS_CDEATH', N'Death Certificate Entry Page. Transaction No: 16000001,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Death Date: 31-Mar-2016,
Death Time: 18:04,
Consult Name: Arifur Rahman,
Doctor Name: Arifur Rahman,
Cause A: A,
Cause B: B,
Cause C: C,
Remarks: D.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190886, 101, 10101, N'Insert', 390, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:39:47 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTNV', N'Test Name: Blood Group,
Result Particulrs: Blood Group,
Result Group: ,
M.Unit: ,
Show Type: STRING,
Length: ,
Decimal: ,
Normal Values: Male: ABCD Female: EFGH,
Sl No: ,
Group Show: N', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190887, 101, 10101, N'Insert', 391, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:43:40 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTNV', N'Test Name: Widal Test,
Result Particulrs: TO,
Result Group: Widal Test,
M.Unit: ,
Show Type: NUMBER,
Length: 2,
Decimal: 0,
Normal Values: ,
Sl No: 1,
Group Show: Y', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190888, 101, 10101, N'Insert', 392, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:44:51 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTNV', N'Test Name: Widal Test,
Result Particulrs: TH,
Result Group: Widal Test,
M.Unit: ,
Show Type: NUMBER,
Length: 2,
Decimal: 0,
Normal Values: ,
Sl No: 1,
Group Show: Y', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190889, 101, 10101, N'Insert', 393, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:45:11 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTNV', N'Test Name: Widal Test,
Result Particulrs: AH,
Result Group: Widal Test,
M.Unit: ,
Show Type: NUMBER,
Length: 2,
Decimal: 0,
Normal Values: ,
Sl No: 3,
Group Show: Y', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190890, 101, 10101, N'Insert', 394, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:45:24 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTNV', N'Test Name: Widal Test,
Result Particulrs: BH,
Result Group: Widal Test,
M.Unit: ,
Show Type: NUMBER,
Length: 2,
Decimal: 0,
Normal Values: ,
Sl No: 4,
Group Show: Y', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190891, 101, 10101, N'Insert', 395, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:45:37 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_TESTNV', N'Test Name: Widal Test,
Result Particulrs: Opinion,
Result Group: Widal Test,
M.Unit: ,
Show Type: STRING,
Length: 2,
Decimal: 0,
Normal Values: ,
Sl No: 5,
Group Show: Y', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190892, 101, 10101, N'Insert', 396, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:50:45 AM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 240316-001,
Patient Name: Ismail Hossain,
Transaction Date: 3/24/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 1,
Category Name: ,
Test Name: ,
Amount :150.00,
Pcntd: 0,
Pcntr: 30,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190893, 101, 10101, N'Insert', 397, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:52:52 AM', NULL, N'22.3475365,91.8123324', N'HMS_OPD', N'Patient ID: 240316-001,
Patient Name: Ismail Hossain,
Transaction Date: 3/24/2016 12:00:00 AM,
Refer Name: ,
Test Serial: 2,
Category Name: ,
Test Name: CBC,
Amount :350,
Pcntd: 40,
Pcntr: 30,
Discr: 0,
Remarks: ', NULL)
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190894, 101, 10101, N'Insert', 398, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:54:56 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_OPDMST', N'Patient ID: 240316-001,
Patient Name: Ismail Hossain,
Transaction Date: 3/24/2016 12:00:00 AM,
Gender: Male,
Age: 26 Y,
Mobile No: 01911544444,
Address: Ctg,
RF(%): 30,
Delivery Date: 3/24/2016 12:00:00 AM,
Delivery Time: 07:30 PM,
Total AMount: 5450,
Doctor Name: Arifur Rahman,
Refer Name: Arifur Rahman,
Discount Refer: 0,
Discount Lab: 50,
Discount Net: 50,
Net Amount :5400,
Paid: 2400,
Due Amount: 3000', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190895, 101, 10101, N'LOG IN', 399, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:55:04 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190896, 101, 10101, N'Insert', 400, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:58:09 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_OPDRCV', N'Transaction Date: 3/24/2016 12:00:00 AM,
Transaction Month: Mar-16,
Transaction NO: 2016030001,
Patient Id: 240316-001,
Patient Due Amount: 3000,
Discount(Lab): 200,
Net Amount: 2800,
Receive AMount: 1800,
Due: 1000,
Remarks: ', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190897, 101, 10101, N'Insert', 401, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'11:58:21 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_OPDRCV', N'Transaction Date: 3/24/2016 12:00:00 AM,
Transaction Month: Mar-16,
Transaction NO: 2016030002,
Patient Id: 240316-001,
Patient Due Amount: 1000,
Discount(Lab): 0,
Net Amount: 1000,
Receive AMount: 1000,
Due: ,
Remarks: ', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190898, 101, 10101, N'INSERT', 402, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'12:03:27 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Sale,
Date: 24-Mar-2016,
Memo No: 16030001,
Department: Pharmacy-Central,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Item name: PANTOPRAZOLE,
Qty:2,
Rate:120,
Amount:240.00.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190899, 101, 10101, N'INSERT', 403, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'12:03:50 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Sale,
Date: 24-Mar-2016,
Memo No: 16030001,
Department: Pharmacy-Central,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Item name: PENTOCIL,
Qty:12,
Rate:22,
Amount:264.00.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190900, 101, 10101, N'INSERT', 404, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'12:07:51 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Sale/Sale-Return/Use - Payment Information. Trasaction type: Sale,
Date: 24-Mar-2016,
Memo No: 16030001,
Department: Pharmacy-Central,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Total Amount: 504,
Vate Rate: 4,
Vate Amount: 20.16,
Discount: 4.160,
Amount: 520.00,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190901, 101, 10101, N'INSERT', 405, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'12:11:58 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Use,
Date: 24-Mar-2016,
Memo No: 16030001,
Department: OT,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Item name: PENTOCIL,
Qty:2,
Rate:22,
Amount:44.00.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190902, 101, 10101, N'INSERT', 406, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'12:12:08 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Sale/Sale-Return/Use - Payment Information. Trasaction type: Use,
Date: 24-Mar-2016,
Memo No: 16030001,
Department: OT,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Total Amount: 44,
Vate Rate: 0,
Vate Amount: 0.00,
Discount: 0,
Amount: 44.00,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190903, 101, 10101, N'INSERT', 407, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'12:12:40 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Sale-Return,
Date: 24-Mar-2016,
Memo No: 16030001,
Department: Pharmacy-Central,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Item name: PANTOPRAZOLE,
Qty:1,
Rate:120,
Amount:120.00.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190904, 101, 10101, N'INSERT', 408, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'12:12:42 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Sale/Sale-Return/Use - Payment Information. Trasaction type: Sale-Return,
Date: 24-Mar-2016,
Memo No: 16030001,
Department: Pharmacy-Central,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Total Amount: 120,
Vate Rate: 0,
Vate Amount: 0.00,
Discount: 0,
Amount: 120.00,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190905, 101, 10101, N'INSERT', 409, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'12:13:44 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Issue. Trasaction type: Issue,
Date: 24-Mar-2016,
Memo No: 16030001,
Department From: Pharmacy-Central,
Department To: OT,
Item name: RANITIDINE,
Qty:100,
Rate:12,
Amount:1200.00.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190906, 101, 10101, N'INSERT', 410, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'12:13:54 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Issue. Trasaction type: Issue,
Date: 24-Mar-2016,
Memo No: 16030001,
Department From: Pharmacy-Central,
Department To: OT,
Item name: PENTOCIL,
Qty:100,
Rate:22,
Amount:2200.00.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190907, 101, 10101, N'INSERT', 411, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'12:13:57 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Issue - Payment Information. Trasaction type: Issue,
Date: 24-Mar-2016,
Memo No: 16030001,
Department From: Pharmacy-Central,
Department To: OT,
Total Amount: 3400,
Net Amount: 3400,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190908, 101, 10101, N'LOG IN', 412, CAST(N'2016-03-27 00:00:00.000' AS DateTime), N'04:11:29 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190909, 101, 10101, N'LOG IN', 413, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'01:20:59 PM', N'204.9.187.75', N'22.360118699999997,91.8274035', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190910, 101, 10101, N'LOG IN', 414, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'01:36:48 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190911, 101, 10101, N'LOG IN', 415, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'04:30:03 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190912, 101, 10101, N'INSERT', 416, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'04:57:34 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Buy/Buy-Return. Trasaction type: Purchase,
Date: 28-Mar-2016,
Memo No: 16030001,
Supplier: Arifur Rahman,
Department: Pharmacy-Central,
Item name: PANTOPRAZOLE,
Qty:100,
Rate:120,
Amount:12000.00.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190913, 101, 10101, N'INSERT', 417, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'04:57:46 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Buy/Buy-Return. Trasaction type: Purchase,
Date: 28-Mar-2016,
Memo No: 16030001,
Supplier: Arifur Rahman,
Department: Pharmacy-Central,
Item name: RANITIDINE,
Qty:300,
Rate:12,
Amount:3600.00.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190914, 101, 10101, N'INSERT', 418, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'04:57:53 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Buy/Buy-Return - Payment Information. Trasaction type: Purchase,
Date: 28-Mar-2016,
Memo No: 16030001,
Supplier: Arifur Rahman,
Department: Pharmacy-Central,
Total Amount: 15600,
Vate Rate: 0,
Vate Amount: 0.00,
Discount: 0,
Amount: 15600.00,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190915, 101, 10101, N'INSERT', 419, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'04:58:12 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Buy/Buy-Return. Trasaction type: Purchase,
Date: 28-Mar-2016,
Memo No: 16030002,
Supplier: Harun-ur-rashid,
Department: Pharmacy-Central,
Item name: PENTOCIL,
Qty:10,
Rate:22,
Amount:220.00.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190916, 101, 10101, N'INSERT', 420, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'04:58:28 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Buy/Buy-Return. Trasaction type: Purchase,
Date: 28-Mar-2016,
Memo No: 16030002,
Supplier: Harun-ur-rashid,
Department: Pharmacy-Central,
Item name: PANTOPRAZOLE,
Qty:20,
Rate:120,
Amount:2400.00.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190917, 101, 10101, N'INSERT', 421, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'04:58:31 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Buy/Buy-Return - Payment Information. Trasaction type: Purchase,
Date: 28-Mar-2016,
Memo No: 16030002,
Supplier: Harun-ur-rashid,
Department: Pharmacy-Central,
Total Amount: 2620,
Vate Rate: 0,
Vate Amount: 0.00,
Discount: 0,
Amount: 2620.00,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190918, 101, 10101, N'LOG IN', 422, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'05:51:13 PM', N'204.9.187.75', N'22.3601602,91.8273629', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190919, 101, 10101, N'INSERT', 423, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'05:52:56 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Buy/Buy-Return. Trasaction type: Purchase-Return,
Date: 28-Mar-2016,
Memo No: 16030001,
Supplier: Arifur Rahman,
Department: Pharmacy-Central,
Item name: PENTOCIL,
Qty:10,
Rate:22,
Amount:220.00.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190920, 101, 10101, N'INSERT', 424, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'05:53:00 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Buy/Buy-Return - Payment Information. Trasaction type: Purchase-Return,
Date: 28-Mar-2016,
Memo No: 16030001,
Supplier: Arifur Rahman,
Department: Pharmacy-Central,
Total Amount: 220,
Vate Rate: 0,
Vate Amount: 0.00,
Discount: 0,
Amount: 220.00,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190921, 101, 10101, N'UPDATE', 425, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'06:00:14 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Sale/Sale-Return/Use(Update Menu)-Payment Information. Trasaction type: Sale,
Date: 3/24/2016 12:00:00 AM,
Memo No: 16030001,
Department: Pharmacy-Central,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Total Amount: 504,
Vate Rate: 0,
Vate Amount: 0.00,
Discount: 4.16,
Amount: 499.84,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190922, 101, 10101, N'LOG IN', 426, CAST(N'2016-03-30 00:00:00.000' AS DateTime), N'04:54:57 PM', N'204.9.187.75', N'22.3601168,91.8274842', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190923, 1, 10001, N'LOG IN', 16, CAST(N'2016-03-31 00:00:00.000' AS DateTime), N'11:21:53 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190924, 101, 10101, N'LOG IN', 427, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'12:06:44 PM', N'204.9.187.75', N'22.3601163,91.8274819', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190925, 101, 10101, N'LOG IN', 428, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'01:06:52 PM', N'204.9.187.75', N'22.360201399999998,91.8274533', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190926, 101, 10101, N'LOG IN', 429, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'03:01:50 PM', N'204.9.187.75', N'22.3601214,91.8274818', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190927, 101, 10101, N'Insert', 430, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'03:25:39 PM', N'204.9.187.75', N'22.3600845,91.827461', N'HMS_MGTRF', N'Management Name: Atiqur Rahman,
Refer Name: Harun-ur-rashid,
RF(%): 20,
Remarks: ', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190928, 1, 10001, N'LOG IN', 17, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'05:52:55 PM', N'204.9.187.75', N'22.360201399999998,91.8274533', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190929, 101, 10101, N'LOG IN', 431, CAST(N'2016-04-02 00:00:00.000' AS DateTime), N'05:56:04 PM', N'204.9.187.75', N'22.360201399999998,91.8274533', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190930, 101, 10101, N'LOG IN', 432, CAST(N'2016-04-03 00:00:00.000' AS DateTime), N'04:26:52 PM', N'204.9.187.75', N'22.360011399999998,91.8274703', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190931, 101, 10101, N'LOG IN', 433, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'11:20:06 AM', N'204.9.187.75', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190932, 101, 10101, N'LOG IN', 434, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'11:52:47 AM', N'204.9.187.75', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190933, 101, 10101, N'LOG IN', 435, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'12:23:47 PM', N'204.9.187.75', N'22.360187999999997,91.8274541', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190934, 101, 10101, N'LOG IN', 436, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'12:24:03 PM', N'204.9.187.75', N'22.360210799999997,91.82745560000001', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190935, 101, 10101, N'LOG IN', 437, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'12:24:13 PM', N'204.9.187.75', N'22.3601907,91.82745419999999', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190936, 101, 10101, N'INSERT', 438, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'12:26:34 PM', N'204.9.187.75', N'22.3601907,91.82745419999999', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Sale,
Date: 04-Apr-2016,
Memo No: 16040001,
Department: Pharmacy-Central,
Patient Type: OUTDOOR,
Patient ID: 240316-001,
Patient Name: Ismail Hossain,
Item name: PENTOCIL,
Qty:10,
Rate:22,
Amount:220.00.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190937, 101, 10101, N'INSERT', 439, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'12:27:17 PM', N'204.9.187.75', N'22.3601907,91.82745419999999', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Sale,
Date: 04-Apr-2016,
Memo No: 16040001,
Department: Pharmacy-Central,
Patient Type: OUTDOOR,
Patient ID: 240316-001,
Patient Name: Ismail Hossain,
Item name: PANTOPRAZOLE,
Qty:5,
Rate:120,
Amount:600.00.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190938, 101, 10101, N'INSERT', 440, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'12:27:29 PM', N'204.9.187.75', N'22.3601907,91.82745419999999', N'HMS_PHARMMST', N'Sale/Sale-Return/Use - Payment Information. Trasaction type: Sale,
Date: 04-Apr-2016,
Memo No: 16040001,
Department: Pharmacy-Central,
Patient Type: OUTDOOR,
Patient ID: 240316-001,
Patient Name: Ismail Hossain,
Total Amount: 820,
Vate Rate: 0,
Vate Amount: 0.00,
Discount: 0,
Amount: 820.00,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190939, 101, 10101, N'UPDATE', 441, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'12:28:43 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMACY', N'Sale/Sale-Return/Use. Trasaction type: Sale,
Date: 4/4/2016 12:00:00 AM,
Memo No: 16040001,
Department: Pharmacy-Central,
Patient Type: OUTDOOR,
Patient ID: 240316-001,
Patient Name: Ismail Hossain,
Item name: PANTOPRAZOLE,
Qty:4,
Rate:120,
Amount:480.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190940, 101, 10101, N'UPDATE', 442, CAST(N'2016-04-04 00:00:00.000' AS DateTime), N'12:28:56 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'HMS_PHARMMST', N'Sale/Sale-Return/Use(Update Menu)-Payment Information. Trasaction type: Sale,
Date: 4/4/2016 12:00:00 AM,
Memo No: 16040001,
Department: Pharmacy-Central,
Patient Type: OUTDOOR,
Patient ID: 240316-001,
Patient Name: Ismail Hossain,
Total Amount: 700,
Vate Rate: 0,
Vate Amount: 0.00,
Discount: 0.00,
Amount: 700.00,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190941, 101, 10101, N'LOG IN', 443, CAST(N'2016-04-05 00:00:00.000' AS DateTime), N'12:22:50 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190942, 101, 10101, N'LOG IN', 444, CAST(N'2016-04-05 00:00:00.000' AS DateTime), N'12:52:11 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190943, 101, 10101, N'LOG IN', 445, CAST(N'2016-04-05 00:00:00.000' AS DateTime), N'01:07:29 PM', N'204.9.187.75', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190944, 101, 10101, N'INSERT', 446, CAST(N'2016-04-05 00:00:00.000' AS DateTime), N'01:11:28 PM', N'204.9.187.75', N'22.3600831,91.82746259999999', N'HMS_CBIRTH', N'Birth Certificate Entry Page. Transaction No: 16000001,
Patient Type: INDOOR,
Patient ID: 230316-001,
Patient Name: Syedul Hoque,
Baby Name: MASTER SHAFIQ,
Baby Gender: MALE,
Birth Date: 05-Apr-2016,
Birth Time: 15:10,
File NO: 1,
Remarks: .', N'WS8')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190945, 1, 10001, N'LOG IN', 18, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'11:18:48 AM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190946, 101, 10101, N'LOG IN', 447, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'11:34:26 AM', N'192.168.0.144', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190947, 101, 10101, N'LOG IN', 448, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'11:36:19 AM', N'192.168.0.144', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190948, 101, 10101, N'LOG IN', 449, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'12:11:44 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190949, 101, 10101, N'LOG IN', 450, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'12:43:06 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190950, 101, 10101, N'LOG IN', 451, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'01:16:31 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190951, 1, 10001, N'LOG IN', 19, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'01:21:18 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190952, 101, 10101, N'LOG IN', 452, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'01:21:47 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190953, 101, 10101, N'LOG IN', 453, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'01:29:44 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190954, 101, 10101, N'LOG IN', 454, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'01:58:44 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190955, 101, 10101, N'LOG IN', 455, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'04:19:14 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190956, 1, 10001, N'LOG IN', 20, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'04:38:18 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190957, 101, 10101, N'LOG IN', 456, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'04:43:24 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190958, 101, 10101, N'LOG IN', 457, CAST(N'2016-04-09 00:00:00.000' AS DateTime), N'04:48:08 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190959, 101, 10101, N'LOG IN', 458, CAST(N'2016-04-10 00:00:00.000' AS DateTime), N'01:18:10 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190960, 1, 10001, N'LOG IN', 21, CAST(N'2016-04-10 00:00:00.000' AS DateTime), N'01:19:56 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190961, 101, 10101, N'LOG IN', 459, CAST(N'2016-04-10 00:00:00.000' AS DateTime), N'01:20:55 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190962, 101, 10101, N'LOG IN', 460, CAST(N'2016-04-10 00:00:00.000' AS DateTime), N'03:33:27 PM', N'192.168.0.24', NULL, N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190963, 1, 10001, N'LOG IN', 22, CAST(N'2016-04-10 00:00:00.000' AS DateTime), N'03:34:38 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Alchemy Software(Piash),
Department Name: Admin,
Operation Type: AslSuperadmin,
Address: Goal pahar,Suborna, 203/b,Chittagong,
Mobile No: 8804444444444,
Email ID: superadmin01@gmail.com,
Login BY: EMAIL,
Login ID: superadmin01@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190964, 101, 10101, N'LOG IN', 461, CAST(N'2016-04-10 00:00:00.000' AS DateTime), N'03:36:50 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190965, 101, 10101, N'LOG IN', 462, CAST(N'2016-04-10 00:00:00.000' AS DateTime), N'03:53:40 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
INSERT [dbo].[ASL_LOG] ([Asl_LOGid], [COMPID], [USERID], [LOGTYPE], [LOGSLNO], [LOGDATE], [LOGTIME], [LOGIPNO], [LOGLTUDE], [TABLEID], [LOGDATA], [USERPC]) VALUES (190966, 101, 10101, N'LOG IN', 463, CAST(N'2016-04-10 00:00:00.000' AS DateTime), N'03:59:53 PM', N'192.168.0.24', N'22.3475365,91.8123324', N'AslUsercoes', N'User Name: Suhrid,
Department Name: Admin,
Operation Type: CompanyAdmin,
Address: 1/A, Agrabad Access Road, Chittagong.,
Mobile No: 8801925444777,
Email ID: cch@gmail.com,
Login BY: EMAIL,
Login ID: cch@gmail.com,
Time From: 00:01,
Time To: 23:59,
Status: A.', N'DESKTOP-28FFKO6')
SET IDENTITY_INSERT [dbo].[ASL_LOG] OFF
SET IDENTITY_INSERT [dbo].[ASL_MENU] ON 

INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (9, N'01', 0, N'F', N'F0101', N'User Information', N'Create', N'AslUserCo', N'User', 10001, CAST(N'2015-08-31 14:44:51.850' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (10034, N'03', 6, N'F', N'F0304', N'Birth Certificate ', N'Create', N'Birth', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-06 15:46:13.520' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-01-10 14:48:49.437' AS DateTime), N'192.168.0.79')
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (10035, N'03', 7, N'F', N'F0305', N'Death Certificate', N'Create', N'Death', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-06 15:46:34.987' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-01-10 14:49:05.097' AS DateTime), N'192.168.0.79')
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (10036, N'03', 8, N'F', N'F0306', N'Discharge Certificate', N'Create', N'Discharge', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-06 15:46:57.957' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-01-10 14:49:29.700' AS DateTime), N'192.168.0.79')
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20031, N'04', 1, N'F', N'F0401', N'Outdoor Information', N'Index', N'Opd', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:38:26.237' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20032, N'04', 2, N'F', N'F0402', N'Due Collection', N'Index', N'OpdReceive', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:38:44.610' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20033, N'03', 1, N'F', N'F0307', N'Patient-Indoor Information', N'Index', N'PatientIndoor', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:40:36.280' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20034, N'03', 2, N'F', N'F0308', N'Cabin Bed Information', N'Index', N'CabinBed', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:42:18.360' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20035, N'03', 3, N'F', N'F0309', N'Patient Consultation', N'Index', N'PatientConsult', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:49:13.363' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20036, N'03', 4, N'F', N'F0310', N'Patient Investigation', N'Index', N'PatientInvestigation', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:50:34.713' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20037, N'03', 5, N'F', N'F0311', N'Patient Other Charges', N'Index', N'PatientOCharges', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:51:08.890' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20038, N'07', 1, N'F', N'F0701', N'Test- Normal Values', N'Index', N'TestNV', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 14:57:07.377' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20039, N'07', 2, N'F', N'F0702', N'Test - Result Information', N'Index', N'Result', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 14:58:07.483' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20040, N'09', 1, N'F', N'F0901', N'OT Test Information', N'Index', N'OTTest', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:04:17.323' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20041, N'09', 2, N'F', N'F0902', N'Test Information', N'Index', N'TestMaster', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:04:58.837' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20042, N'09', 3, N'F', N'F0903', N'Test Wise Vacuum ', N'Index', N'TestV', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:05:37.120' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20043, N'09', 4, N'F', N'F0904', N'Bill Head Information', N'Index', N'HeadInformation', N'DESKTOP-IN7DGG9', 0, CAST(N'2016-01-10 15:08:22.840' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20044, N'09', 5, N'F', N'F0905', N'Department Information', N'Create', N'Department', N'DESKTOP-IN7DGG9', 0, CAST(N'2016-01-10 15:08:55.823' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20045, N'09', 6, N'F', N'F0906', N'Refer Information', N'Index', N'Refer', N'DESKTOP-IN7DGG9', 0, CAST(N'2016-01-10 15:09:17.530' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20046, N'09', 7, N'F', N'F0907', N'Management Information', N'Index', N'Mgt', N'DESKTOP-IN7DGG9', 0, CAST(N'2016-01-10 15:10:30.770' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20047, N'09', 8, N'F', N'F0908', N'Signing By(Doctor)', N'Create', N'SignBy', N'DESKTOP-IN7DGG9', 0, CAST(N'2016-01-10 15:12:41.193' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20048, N'09', 9, N'F', N'F0909', N'Pharmaceutical Information', N'Index', N'Pharma', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:16:00.173' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20049, N'09', 10, N'F', N'F0910', N'Medicine Information', N'Index', N'Medi', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:16:19.810' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20050, N'09', 11, N'F', N'F0911', N'Generic/Dosage Form', N'Index', N'Gendos', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:16:45.403' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-04-02 17:53:52.503' AS DateTime), N'204.9.187.75')
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20051, N'07', 1, N'R', N'R0701', N'Test - Normal Values', N'TestNormalValues', N'List', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:22:16.017' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20052, N'04', 1, N'R', N'R0401', N'Daily Report - Outdoor', N'Index', N'DailyReport', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:23:29.087' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30035, N'07', 2, N'R', N'R0702', N'Reports Print Parameter', N'Index', N'ReportParameter', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 12:46:09.247' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30036, N'07', 3, N'R', N'R0703', N'Pathology Report - Test', N'Index', N'CategoryWiseReport', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 12:51:55.493' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30037, N'07', 4, N'R', N'R0704', N'Pathology Report - Category', N'Index', N'Pathology', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 12:52:20.647' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30038, N'09', 1, N'R', N'R0901', N'Lists of Test', N'ListofTest', N'List', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:00:12.537' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-04-02 17:54:33.407' AS DateTime), N'204.9.187.75')
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30039, N'09', 2, N'R', N'R0902', N'Lists of Department', N'ListofDepartment', N'List', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:00:41.967' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-04-02 17:54:47.143' AS DateTime), N'204.9.187.75')
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30040, N'09', 3, N'R', N'R0903', N'Test Wise Vaccum Lists', N'VaccumInfo', N'List', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:01:05.470' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-04-02 17:55:07.520' AS DateTime), N'204.9.187.75')
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30041, N'09', 4, N'R', N'R0904', N'Management Info', N'ManagementInfo', N'List', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:01:28.283' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30042, N'04', 2, N'R', N'R0402', N'Refer Statement - All', N'Index', N'ReferStatement', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:21:24.677' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30043, N'04', 3, N'R', N'R0403', N'UserWise Collection - Summary', N'UserWiseCollectionSummary', N'UserWiseCollection', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:22:49.473' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30044, N'04', 4, N'R', N'R0404', N'UserWise Collection - Details', N'UserWiseCollectionDetails', N'UserWiseCollection', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:23:26.430' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30045, N'04', 5, N'R', N'R0405', N'Patient Wise Test Lists', N'Index', N'PatientWiseTest', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:24:04.817' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40035, N'05', 1, N'F', N'F0501', N'O.T. Information', N'Index', N'OTMaster', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-21 13:11:42.797' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-03-31 11:22:38.600' AS DateTime), N'204.9.187.75')
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40036, N'03', 9, N'F', N'F0312', N'Pathology Form', N'Index', N'PathologyMaster', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-02-27 17:19:51.137' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40037, N'03', 10, N'F', N'F0313', N'BILL INFORMATION - INDOOR', N'Index', N'Bill', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-03-12 16:03:24.237' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40038, N'06', 1, N'F', N'F0601', N'Sale/ Sale-Return / Use', N'Create', N'SaleSaleReturnUse', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-03-21 16:32:25.430' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40039, N'06', 2, N'F', N'F0602', N'Buy / Buy-Return', N'Create', N'BuyBuyReturn', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-03-21 16:32:41.437' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-03-21 16:32:53.187' AS DateTime), N'192.168.0.79')
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40040, N'06', 3, N'F', N'F0603', N'Issue', N'Create', N'Issue', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-03-21 16:33:18.260' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40041, N'06', 4, N'R', N'R0601', N'Closing Stock Details & Summary', N'Closing_Stock', N'HmsReport', N'DESKTOP-28FFKO6', 10001, CAST(N'2016-04-09 11:30:21.397' AS DateTime), N'192.168.0.24', 10001, CAST(N'2016-04-09 13:21:42.230' AS DateTime), N'192.168.0.24')
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40042, N'06', 1, N'R', N'R0602', N'Purchase/PurchaseReturn-Supplier', N'Purchase_PurchaseReturn_Supplier', N'HmsReport', N'DESKTOP-28FFKO6', 10001, CAST(N'2016-04-09 16:43:12.837' AS DateTime), N'192.168.0.24', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40043, N'06', 3, N'R', N'R0603', N'Purchase Details-Invoice', N'PurchaseDetails_Invoice', N'HmsReport', N'DESKTOP-28FFKO6', 10001, CAST(N'2016-04-10 13:20:48.657' AS DateTime), N'192.168.0.24', NULL, NULL, NULL)
INSERT [dbo].[ASL_MENU] ([Id], [MODULEID], [SERIAL], [MENUTP], [MENUID], [MENUNM], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40044, N'06', 2, N'R', N'R0604', N'Purchase Statement - Item', N'PurchaseSummary_Item', N'HmsReport', N'DESKTOP-28FFKO6', 10001, CAST(N'2016-04-10 15:36:42.730' AS DateTime), N'192.168.0.24', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ASL_MENU] OFF
INSERT [dbo].[ASL_MENUMST] ([MODULEID], [MODULENM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (N'01', N'User', N'DESKTOP-IN7DGG9', NULL, NULL, NULL, 10001, CAST(N'2016-11-01 14:45:24.000' AS DateTime), N'192.168.0.79')
INSERT [dbo].[ASL_MENUMST] ([MODULEID], [MODULENM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (N'02', N'Accounts', N'DESKTOP-IN7DGG9', 10001, CAST(N'2015-07-09 12:39:37.000' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-10-01 12:21:17.000' AS DateTime), N'192.168.0.79')
INSERT [dbo].[ASL_MENUMST] ([MODULEID], [MODULENM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (N'03', N'Indoor', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-06 15:17:18.000' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-10-01 12:21:30.000' AS DateTime), N'192.168.0.79')
INSERT [dbo].[ASL_MENUMST] ([MODULEID], [MODULENM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (N'04', N'Outdoor', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-06 17:23:42.000' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-10-01 12:21:36.000' AS DateTime), N'192.168.0.79')
INSERT [dbo].[ASL_MENUMST] ([MODULEID], [MODULENM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (N'05', N'O.T.', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-06 17:24:19.000' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-10-01 12:18:08.000' AS DateTime), N'192.168.0.79')
INSERT [dbo].[ASL_MENUMST] ([MODULEID], [MODULENM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (N'06', N'Pharmacy', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-06 17:25:37.000' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-10-01 12:21:47.000' AS DateTime), N'192.168.0.79')
INSERT [dbo].[ASL_MENUMST] ([MODULEID], [MODULENM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (N'07', N'Pathology', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-06 17:25:47.000' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-11-01 14:45:15.000' AS DateTime), N'192.168.0.79')
INSERT [dbo].[ASL_MENUMST] ([MODULEID], [MODULENM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (N'08', N'General Stock', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-06 17:25:51.000' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-10-01 12:51:17.000' AS DateTime), N'192.168.0.79')
INSERT [dbo].[ASL_MENUMST] ([MODULEID], [MODULENM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (N'09', N'Basic Info', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 12:22:27.000' AS DateTime), N'192.168.0.79', 10001, CAST(N'2016-11-01 14:44:02.000' AS DateTime), N'192.168.0.79')
SET IDENTITY_INSERT [dbo].[ASL_ROLE] ON 

INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (9, 101, 10101, N'01', 0, N'F', N'F0101', N'A', N'A', N'A', N'A', N'User Information', N'Create', N'AslUserCo', N'User', 10001, CAST(N'2015-08-31 14:44:51.850' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (10067, 101, 10101, N'03', 6, N'F', N'F0304', N'A', N'A', N'A', N'A', N'Birth Certificate ', N'Create', N'Birth', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-06 15:46:13.520' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (10069, 101, 10101, N'03', 7, N'F', N'F0305', N'A', N'A', N'A', N'A', N'Death Certificate', N'Create', N'Death', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-06 15:46:34.987' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (10071, 101, 10101, N'03', 8, N'F', N'F0306', N'A', N'A', N'A', N'A', N'Discharge Certificate', N'Create', N'Discharge', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-06 15:46:57.957' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20061, 101, 10101, N'04', 1, N'F', N'F0401', N'A', N'A', N'A', N'A', N'Outdoor Information', N'Index', N'Opd', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:38:26.237' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20062, 101, 10101, N'04', 2, N'F', N'F0402', N'A', N'A', N'A', N'A', N'Due Collection', N'Index', N'OpdReceive', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:38:44.610' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20063, 101, 10101, N'03', 1, N'F', N'F0307', N'A', N'A', N'A', N'A', N'Patient-Indoor Information', N'Index', N'PatientIndoor', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:40:36.280' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20064, 101, 10101, N'03', 2, N'F', N'F0308', N'A', N'A', N'A', N'A', N'Cabin Bed Information', N'Index', N'CabinBed', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:42:18.360' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20065, 101, 10101, N'03', 3, N'F', N'F0309', N'A', N'A', N'A', N'A', N'Patient Consultation', N'Index', N'PatientConsult', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:49:13.363' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20066, 101, 10101, N'03', 4, N'F', N'F0310', N'A', N'A', N'A', N'A', N'Patient Investigation', N'Index', N'PatientInvestigation', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:50:34.713' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20067, 101, 10101, N'03', 5, N'F', N'F0311', N'A', N'A', N'A', N'A', N'Patient Other Charges', N'Index', N'PatientOCharges', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 13:51:08.890' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20068, 101, 10101, N'07', 1, N'F', N'F0701', N'A', N'A', N'A', N'A', N'Test- Normal Values', N'Index', N'TestNV', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 14:57:07.377' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20069, 101, 10101, N'07', 2, N'F', N'F0702', N'A', N'A', N'A', N'A', N'Test - Result Information', N'Index', N'Result', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 14:58:07.483' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20070, 101, 10101, N'09', 1, N'F', N'F0901', N'A', N'A', N'A', N'A', N'OT Test Information', N'Index', N'OTTest', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:04:17.323' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20071, 101, 10101, N'09', 2, N'F', N'F0902', N'A', N'A', N'A', N'A', N'Test Information', N'Index', N'TestMaster', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:04:58.837' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20072, 101, 10101, N'09', 3, N'F', N'F0903', N'A', N'A', N'A', N'A', N'Test Wise Vacuum ', N'Index', N'TestV', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:05:37.120' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20073, 101, 10101, N'09', 4, N'F', N'F0904', N'A', N'A', N'A', N'A', N'Bill Head Information', N'Index', N'HeadInformation', N'DESKTOP-IN7DGG9', 0, CAST(N'2016-01-10 15:08:22.840' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20074, 101, 10101, N'09', 5, N'F', N'F0905', N'A', N'A', N'A', N'A', N'Department Information', N'Create', N'Department', N'DESKTOP-IN7DGG9', 0, CAST(N'2016-01-10 15:08:55.823' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20075, 101, 10101, N'09', 6, N'F', N'F0906', N'A', N'A', N'A', N'A', N'Refer Information', N'Index', N'Refer', N'DESKTOP-IN7DGG9', 0, CAST(N'2016-01-10 15:09:17.530' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20076, 101, 10101, N'09', 7, N'F', N'F0907', N'A', N'A', N'A', N'A', N'Management Information', N'Index', N'Mgt', N'DESKTOP-IN7DGG9', 0, CAST(N'2016-01-10 15:10:30.770' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20077, 101, 10101, N'09', 8, N'F', N'F0908', N'A', N'A', N'A', N'A', N'Signing By(Doctor)', N'Create', N'SignBy', N'DESKTOP-IN7DGG9', 0, CAST(N'2016-01-10 15:12:41.193' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20078, 101, 10101, N'09', 9, N'F', N'F0909', N'A', N'A', N'A', N'A', N'Pharmaceutical Information', N'Index', N'Pharma', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:16:00.173' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20079, 101, 10101, N'09', 10, N'F', N'F0910', N'A', N'A', N'A', N'A', N'Medicine Information', N'Index', N'Medi', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:16:19.810' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20080, 101, 10101, N'09', 11, N'F', N'F0911', N'A', N'A', N'A', N'A', N'Generic/Dosage Form', N'Index', N'Gendos', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:16:45.403' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20081, 101, 10101, N'07', 1, N'R', N'R0701', N'A', N'A', N'A', N'A', N'Test - Normal Values', N'TestNormalValues', N'List', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:22:16.017' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (20082, 101, 10101, N'04', 1, N'R', N'R0401', N'A', N'A', N'A', N'A', N'Daily Report - Outdoor', N'Index', N'DailyReport', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-10 15:23:29.087' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30065, 101, 10101, N'07', 2, N'R', N'R0702', N'A', N'A', N'A', N'A', N'Reports Print Parameter', N'Index', N'ReportParameter', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 12:46:09.247' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30066, 101, 10101, N'07', 3, N'R', N'R0703', N'A', N'A', N'A', N'A', N'Pathology Report - Test', N'Index', N'CategoryWiseReport', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 12:51:55.493' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30067, 101, 10101, N'07', 4, N'R', N'R0704', N'A', N'A', N'A', N'A', N'Pathology Report - Category', N'Index', N'Pathology', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 12:52:20.647' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30068, 101, 10101, N'09', 1, N'R', N'R0901', N'A', N'A', N'A', N'A', N'Lists of Test', N'ListofTest', N'List', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:00:12.537' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30069, 101, 10101, N'09', 2, N'R', N'R0902', N'A', N'A', N'A', N'A', N'Lists of Department', N'ListofDepartment', N'List', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:00:41.967' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30070, 101, 10101, N'09', 3, N'R', N'R0903', N'A', N'A', N'A', N'A', N'Test Wise Vaccum Lists', N'VaccumInfo', N'List', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:01:05.470' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30071, 101, 10101, N'09', 4, N'R', N'R0904', N'A', N'A', N'A', N'A', N'Management Info', N'ManagementInfo', N'List', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:01:28.283' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30072, 101, 10101, N'04', 2, N'R', N'R0402', N'A', N'A', N'A', N'A', N'Refer Statement - All', N'Index', N'ReferStatement', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:21:24.677' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30073, 101, 10101, N'04', 3, N'R', N'R0403', N'A', N'A', N'A', N'A', N'UserWise Collection - Summary', N'UserWiseCollectionSummary', N'UserWiseCollection', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:22:49.473' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30074, 101, 10101, N'04', 4, N'R', N'R0404', N'A', N'A', N'A', N'A', N'UserWise Collection - Details', N'UserWiseCollectionDetails', N'UserWiseCollection', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:23:26.430' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (30075, 101, 10101, N'04', 5, N'R', N'R0405', N'A', N'A', N'A', N'A', N'Patient Wise Test Lists', N'Index', N'PatientWiseTest', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-20 13:24:04.817' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40065, 101, 10101, N'05', 1, N'F', N'F0501', N'A', N'A', N'A', N'A', N'O.T. Information', N'Index', N'OTMaster', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-01-21 13:11:42.797' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40066, 101, 10101, N'03', 9, N'F', N'F0312', N'A', N'A', N'A', N'A', N'Pathology Form', N'Index', N'PathologyMaster', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-02-27 17:19:51.137' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40067, 101, 10101, N'03', 10, N'F', N'F0313', N'A', N'A', N'A', N'A', N'BILL INFORMATION - INDOOR', N'Index', N'Bill', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-03-12 16:03:24.237' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40068, 101, 10101, N'06', 1, N'F', N'F0601', N'A', N'A', N'A', N'A', N'Sale/ Sale-Return / Use', N'Create', N'SaleSaleReturnUse', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-03-21 16:32:25.430' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40069, 101, 10101, N'06', 2, N'F', N'F0602', N'A', N'A', N'A', N'A', N'Buy / Buy-Return', N'Create', N'BuyBuyReturn', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-03-21 16:32:41.437' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40070, 101, 10101, N'06', 3, N'F', N'F0603', N'A', N'A', N'A', N'A', N'Issue', N'Create', N'Issue', N'DESKTOP-IN7DGG9', 10001, CAST(N'2016-03-21 16:33:18.260' AS DateTime), N'192.168.0.79', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40071, 101, 10101, N'06', 4, N'R', N'R0601', N'A', N'A', N'A', N'A', N'Closing Stock Details & Summary', N'Closing_Stock', N'HmsReport', N'DESKTOP-28FFKO6', 10001, CAST(N'2016-04-09 11:30:21.397' AS DateTime), N'192.168.0.24', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40072, 101, 10101, N'06', 1, N'R', N'R0602', N'A', N'A', N'A', N'A', N'Purchase/PurchaseReturn-Supplier', N'Purchase_PurchaseReturn_Supplier', N'HmsReport', N'DESKTOP-28FFKO6', 10001, CAST(N'2016-04-09 16:43:12.837' AS DateTime), N'192.168.0.24', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40073, 101, 10101, N'06', 3, N'R', N'R0603', N'A', N'A', N'A', N'A', N'Purchase Details-Invoice', N'PurchaseDetails_Invoice', N'HmsReport', N'DESKTOP-28FFKO6', 10001, CAST(N'2016-04-10 13:20:48.657' AS DateTime), N'192.168.0.24', NULL, NULL, NULL)
INSERT [dbo].[ASL_ROLE] ([ASL_ROLEId], [COMPID], [USERID], [MODULEID], [SERIAL], [MENUTP], [MENUID], [STATUS], [INSERTR], [UPDATER], [DELETER], [MENUNAME], [ACTIONNAME], [CONTROLLERNAME], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [UPDUSERID], [UPDTIME], [UPDIPNO]) VALUES (40074, 101, 10101, N'06', 2, N'R', N'R0604', N'A', N'A', N'A', N'A', N'Purchase Statement - Item', N'PurchaseSummary_Item', N'HmsReport', N'DESKTOP-28FFKO6', 10001, CAST(N'2016-04-10 15:36:42.730' AS DateTime), N'192.168.0.24', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ASL_ROLE] OFF
SET IDENTITY_INSERT [dbo].[AslCompanies] ON 

INSERT [dbo].[AslCompanies] ([AslCompanyId], [COMPID], [COMPNM], [ADDRESS], [CONTACTNO], [EMAILID], [WEBID], [STATUS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, N'Care & Cure Hospital', N'1/A, Agrabad Access Road, Chittagong.', N'8801925444777', N'cch@gmail.com', NULL, N'A', N'User', 10001, CAST(N'2015-07-11 10:54:43.963' AS DateTime), N'192.168.0.79', N'22.366667,91.8', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AslCompanies] OFF
SET IDENTITY_INSERT [dbo].[AslUsercoes] ON 

INSERT [dbo].[AslUsercoes] ([AslUsercoId], [COMPID], [USERID], [USERNM], [DEPTNM], [OPTP], [ADDRESS], [MOBNO], [EMAILID], [LOGINBY], [LOGINID], [LOGINPW], [TIMEFR], [TIMETO], [STATUS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 1, 10001, N'Alchemy Software(Piash)', N'Admin', N'AslSuperadmin', N'Goal pahar,Suborna, 203/b,Chittagong', N'8804444444444', N'superadmin01@gmail.com', N'EMAIL', N'superadmin01@gmail.com', N'123', N'00:01', N'23:59', N'A', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[AslUsercoes] ([AslUsercoId], [COMPID], [USERID], [USERNM], [DEPTNM], [OPTP], [ADDRESS], [MOBNO], [EMAILID], [LOGINBY], [LOGINID], [LOGINPW], [TIMEFR], [TIMETO], [STATUS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 10101, N'Suhrid', N'Admin', N'CompanyAdmin', N'1/A, Agrabad Access Road, Chittagong.', N'8801925444777', N'cch@gmail.com', N'EMAIL', N'cch@gmail.com', N'cch', N'00:01', N'23:59', N'A', N'User', 10001, CAST(N'2015-07-11 10:55:20.773' AS DateTime), N'192.168.0.79', N'22.366667,91.8', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AslUsercoes] OFF
SET IDENTITY_INSERT [dbo].[GL_ACCHART] ON 

INSERT [dbo].[GL_ACCHART] ([ID], [COMPID], [HEADTP], [ACCOUNTCD], [CONTROLCD], [ACCOUNTNM], [BRANCHID], [HLEVELCD], [HDRCRTP], [HPOSTTP], [HSTATUS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, 1, 101201010100001, 101201010100000, N'ACUI', 0, 0, N'0', N'0', N'0', N'0', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[GL_ACCHART] ([ID], [COMPID], [HEADTP], [ACCOUNTCD], [CONTROLCD], [ACCOUNTNM], [BRANCHID], [HLEVELCD], [HDRCRTP], [HPOSTTP], [HSTATUS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (5, 101, 1, 101201010100002, 101201010100000, N'AXUGU OKPSOS', 0, 0, N'0', N'0', N'0', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GL_ACCHART] OFF
SET IDENTITY_INSERT [dbo].[HMS_BILL] ON 

INSERT [dbo].[HMS_BILL] ([ID], [COMPID], [BILLDT], [BILLYY], [BILLNO], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLSL], [BILLID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2016, 16000001, 2016, 16100001, N'230316-001', 1600000101, 101101, CAST(400.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 18:44:12.983' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_BILL] ([ID], [COMPID], [BILLDT], [BILLYY], [BILLNO], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLSL], [BILLID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2016, 16000001, 2016, 16100001, N'230316-001', 1600000102, 101102, CAST(200.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 18:44:12.983' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_BILL] ([ID], [COMPID], [BILLDT], [BILLYY], [BILLNO], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLSL], [BILLID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2016, 16000001, 2016, 16100001, N'230316-001', 1600000103, 101103, CAST(1200.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 18:44:12.983' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_BILL] ([ID], [COMPID], [BILLDT], [BILLYY], [BILLNO], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLSL], [BILLID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (4, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2016, 16000001, 2016, 16100001, N'230316-001', 1600000104, 101104, CAST(400.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 18:44:12.983' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_BILL] ([ID], [COMPID], [BILLDT], [BILLYY], [BILLNO], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLSL], [BILLID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (5, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2016, 16000001, 2016, 16100001, N'230316-001', 1600000105, 101111, CAST(150.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 18:44:12.983' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_BILL] ([ID], [COMPID], [BILLDT], [BILLYY], [BILLNO], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLSL], [BILLID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (6, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2016, 16000001, 2016, 16100001, N'230316-001', 1600000106, 101112, CAST(250.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 18:44:12.983' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_BILL] ([ID], [COMPID], [BILLDT], [BILLYY], [BILLNO], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLSL], [BILLID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (7, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2016, 16000001, 2016, 16100001, N'230316-001', 1600000107, 101113, CAST(300.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 18:44:12.983' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_BILL] ([ID], [COMPID], [BILLDT], [BILLYY], [BILLNO], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLSL], [BILLID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (8, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2016, 16000001, 2016, 16100001, N'230316-001', 1600000108, 101115, CAST(600.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 18:44:12.983' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_BILL] ([ID], [COMPID], [BILLDT], [BILLYY], [BILLNO], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLSL], [BILLID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (9, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2016, 16000001, 2016, 16100001, N'230316-001', 1600000109, 101116, CAST(300.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 18:44:12.983' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_BILL] OFF
SET IDENTITY_INSERT [dbo].[HMS_BILLMST] ON 

INSERT [dbo].[HMS_BILLMST] ([ID], [COMPID], [BILLDT], [BILLYY], [BILLNO], [PATIENTYY], [PATIENTYYID], [PATIENTID], [DISCHGDT], [DISCHGTM], [TOTAMT], [SCHARGE], [VATAMT], [GROSSAMT], [ADVAMT], [DISCOUNT], [NETAMT], [PAIDAMT], [BALAMT], [DISCID], [DUEHID], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2016, 16000001, 2016, 16100001, N'230316-001', CAST(N'2016-03-23 00:00:00.000' AS DateTime), CAST(N'2016-03-23 18:15:00.000' AS DateTime), CAST(3800.00 AS Decimal(18, 2)), CAST(760.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(4560.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(4500.00 AS Decimal(18, 2)), CAST(4000.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 101201010100002, 101201010100002, NULL, N'WS8', 10101, CAST(N'2016-03-23 18:44:12.890' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_BILLMST] OFF
SET IDENTITY_INSERT [dbo].[HMS_CBIRTH] ON 

INSERT [dbo].[HMS_CBIRTH] ([ID], [COMPID], [TRANSYY], [TRANSNO], [TRANSDT], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BABYNM], [GENDER], [BIRTHDT], [BIRTHTM], [FILENO], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 2016, 16000001, CAST(N'2016-04-05 00:00:00.000' AS DateTime), N'INDOOR', 2016, 16100001, N'230316-001', N'MASTER SHAFIQ', N'MALE', CAST(N'2016-04-05 00:00:00.000' AS DateTime), N'15:10', N'1', NULL, N'WS8', 10101, CAST(N'2016-04-05 13:11:28.003' AS DateTime), N'204.9.187.75', N'22.3600831,91.82746259999999', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_CBIRTH] OFF
SET IDENTITY_INSERT [dbo].[HMS_DEPT] ON 

INSERT [dbo].[HMS_DEPT] ([ID], [COMPID], [DEPTID], [DEPTNM], [DEPTTP], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 101201, N'Pharmacy-Central', N'PHARMACY', NULL, N'WS8', 10101, CAST(N'2016-03-23 15:56:18.130' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_DEPT] ([ID], [COMPID], [DEPTID], [DEPTNM], [DEPTTP], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 101202, N'OT', N'PHARMACY', NULL, N'WS8', 10101, CAST(N'2016-03-23 15:56:31.217' AS DateTime), N'204.9.187.75', N'22.3600857,91.8274189', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_DEPT] ([ID], [COMPID], [DEPTID], [DEPTNM], [DEPTTP], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, 101203, N'Cabin', N'PHARMACY', NULL, N'WS8', 10101, CAST(N'2016-03-23 15:56:38.817' AS DateTime), N'204.9.187.75', N'22.360021699999997,91.8274454', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_DEPT] ([ID], [COMPID], [DEPTID], [DEPTNM], [DEPTTP], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (4, 101, 101204, N'Ward', N'PHARMACY', NULL, N'WS8', 10101, CAST(N'2016-03-23 15:56:44.050' AS DateTime), N'204.9.187.75', N'22.360021699999997,91.8274454', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_DEPT] ([ID], [COMPID], [DEPTID], [DEPTNM], [DEPTTP], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (5, 101, 101205, N'Cash', N'PHARMACY', NULL, N'WS8', 10101, CAST(N'2016-03-23 15:57:02.717' AS DateTime), N'204.9.187.75', N'22.360021699999997,91.8274454', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_DEPT] ([ID], [COMPID], [DEPTID], [DEPTNM], [DEPTTP], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (6, 101, 101101, N'Pathology', N'LABORDER', NULL, N'WS8', 10101, CAST(N'2016-03-23 15:57:09.897' AS DateTime), N'204.9.187.75', N'22.3600857,91.8274189', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_DEPT] ([ID], [COMPID], [DEPTID], [DEPTNM], [DEPTTP], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (7, 101, 101102, N'X-Ray', N'LABORDER', NULL, N'WS8', 10101, CAST(N'2016-03-23 15:57:16.027' AS DateTime), N'204.9.187.75', N'22.360071100000003,91.82742359999999', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_DEPT] ([ID], [COMPID], [DEPTID], [DEPTNM], [DEPTTP], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (8, 101, 101103, N'Ultrasonography', N'LABORDER', NULL, N'WS8', 10101, CAST(N'2016-03-23 15:57:22.840' AS DateTime), N'204.9.187.75', N'22.360077999999998,91.82742019999999', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_DEPT] ([ID], [COMPID], [DEPTID], [DEPTNM], [DEPTTP], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (9, 101, 101104, N'E.C.G.', N'LABORDER', NULL, N'WS8', 10101, CAST(N'2016-03-23 15:57:28.470' AS DateTime), N'204.9.187.75', N'22.360077999999998,91.82742019999999', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_DEPT] OFF
SET IDENTITY_INSERT [dbo].[HMS_GENDOS] ON 

INSERT [dbo].[HMS_GENDOS] ([ID], [COMPID], [GDID], [GDTP], [GDNM], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 101100001, N'GENERIC', N'Ranitidine', N'', N'WS8', 10101, CAST(N'2016-03-23 17:36:28.187' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_GENDOS] ([ID], [COMPID], [GDID], [GDTP], [GDNM], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 101100002, N'GENERIC', N'Aluminium Hydroxide + Magnesium Hydroxide', N'', N'WS8', 10101, CAST(N'2016-03-23 17:36:36.657' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_GENDOS] ([ID], [COMPID], [GDID], [GDTP], [GDNM], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, 101100003, N'GENERIC', N'Omeprazole', N'', N'WS8', 10101, CAST(N'2016-03-23 17:36:44.140' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_GENDOS] ([ID], [COMPID], [GDID], [GDTP], [GDNM], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (4, 101, 101100004, N'GENERIC', N'Lansoprazole', N'', N'WS8', 10101, CAST(N'2016-03-23 17:36:49.817' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_GENDOS] ([ID], [COMPID], [GDID], [GDTP], [GDNM], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (5, 101, 101100005, N'GENERIC', N'Pantoprazole', N'', N'WS8', 10101, CAST(N'2016-03-23 17:36:58.050' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_GENDOS] ([ID], [COMPID], [GDID], [GDTP], [GDNM], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (6, 101, 101100006, N'GENERIC', N'Amoxicillin', N'', N'WS8', 10101, CAST(N'2016-03-23 17:37:13.947' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_GENDOS] ([ID], [COMPID], [GDID], [GDTP], [GDNM], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (7, 101, 101100007, N'GENERIC', N'Ampicillin', N'', N'WS8', 10101, CAST(N'2016-03-23 17:37:20.523' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_GENDOS] ([ID], [COMPID], [GDID], [GDTP], [GDNM], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (8, 101, 101200001, N'DOSAGE', N'Capsule', N'', N'WS8', 10101, CAST(N'2016-03-23 17:37:30.230' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_GENDOS] ([ID], [COMPID], [GDID], [GDTP], [GDNM], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (9, 101, 101200002, N'DOSAGE', N'Tablet', N'', N'WS8', 10101, CAST(N'2016-03-23 17:37:37.310' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_GENDOS] ([ID], [COMPID], [GDID], [GDTP], [GDNM], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (10, 101, 101200003, N'DOSAGE', N'Powder for Suspension', N'', N'WS8', 10101, CAST(N'2016-03-23 17:37:49.857' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_GENDOS] ([ID], [COMPID], [GDID], [GDTP], [GDNM], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (11, 101, 101200004, N'DOSAGE', N'Syrup', N'', N'WS8', 10101, CAST(N'2016-03-23 17:37:59.590' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_GENDOS] ([ID], [COMPID], [GDID], [GDTP], [GDNM], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (12, 101, 101200005, N'DOSAGE', N'Suspension', N'', N'WS8', 10101, CAST(N'2016-03-23 17:38:04.503' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_GENDOS] OFF
SET IDENTITY_INSERT [dbo].[HMS_HEADIO] ON 

INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, N'IPD', 101101, N'Registration Fee', CAST(400.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 15:58:16.010' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, N'IPD', 101102, N'Duty Doctor Fee', CAST(200.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 15:58:24.837' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, N'IPD', 101103, N'Seat Rent', CAST(0.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 15:58:35.287' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (4, 101, N'IPD', 101104, N'Consultant Fee', CAST(0.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 15:58:49.500' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (5, 101, N'IPD', 101105, N'Surgeon Fee', CAST(0.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 15:58:55.440' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (6, 101, N'IPD', 101106, N'Anaesthesia Fee', CAST(0.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 15:59:22.740' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (7, 101, N'IPD', 101107, N'Assistant Fee', CAST(0.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 15:59:28.430' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (8, 101, N'IPD', 101108, N'O.T. Charges', CAST(0.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 15:59:36.443' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (9, 101, N'IPD', 101109, N'Medicine-General', CAST(0.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 15:59:45.960' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (10, 101, N'IPD', 101110, N'Medicine-O.T.', CAST(0.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 15:59:54.910' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (11, 101, N'IPD', 101111, N'Pathology', CAST(0.00 AS Decimal(18, 2)), N'PATHOLOGY', N'', N'WS8', 10101, CAST(N'2016-03-23 16:00:04.787' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (12, 101, N'IPD', 101112, N'E.C.G.', CAST(0.00 AS Decimal(18, 2)), N'PATHOLOGY', N'', N'WS8', 10101, CAST(N'2016-03-23 16:00:12.410' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (13, 101, N'IPD', 101113, N'X-Ray', CAST(0.00 AS Decimal(18, 2)), N'PATHOLOGY', N'', N'WS8', 10101, CAST(N'2016-03-23 16:00:18.037' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (14, 101, N'IPD', 101114, N'Ultrasonography', CAST(0.00 AS Decimal(18, 2)), N'PATHOLOGY', N'', N'WS8', 10101, CAST(N'2016-03-23 16:00:25.300' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (15, 101, N'IPD', 101115, N'Ambulance', CAST(600.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:00:43.093' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (16, 101, N'IPD', 101116, N'Oxygen', CAST(100.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:00:55.397' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (17, 101, N'OPD', 101201, N'Outdoor Fee', CAST(150.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:35:47.533' AS DateTime), N'204.9.187.75', N'22.3601106,91.82740860000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (18, 101, N'OPD', 101202, N'Consultant Fee', CAST(0.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:35:57.923' AS DateTime), N'204.9.187.75', N'22.3601106,91.82740860000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (19, 101, N'OPD', 101203, N'Dressing', CAST(200.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:36:13.133' AS DateTime), N'204.9.187.75', N'22.3601106,91.82740860000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (20, 101, N'OPD', 101204, N'Stitch', CAST(100.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:36:22.493' AS DateTime), N'204.9.187.75', N'22.3601106,91.82740860000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (21, 101, N'OPD', 101205, N'Pathology', CAST(0.00 AS Decimal(18, 2)), N'PATHOLOGY', N'', N'WS8', 10101, CAST(N'2016-03-23 16:36:39.530' AS DateTime), N'204.9.187.75', N'22.3601106,91.82740860000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (22, 101, N'OPD', 101206, N'E.C.G.', CAST(0.00 AS Decimal(18, 2)), N'PATHOLOGY', N'', N'WS8', 10101, CAST(N'2016-03-23 16:36:45.240' AS DateTime), N'204.9.187.75', N'22.3601106,91.82740860000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (23, 101, N'OPD', 101207, N'X-Ray', CAST(0.00 AS Decimal(18, 2)), N'PATHOLOGY', N'', N'WS8', 10101, CAST(N'2016-03-23 16:36:50.630' AS DateTime), N'204.9.187.75', N'22.3601106,91.82740860000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (24, 101, N'OPD', 101208, N'Ultrasonography', CAST(0.00 AS Decimal(18, 2)), N'PATHOLOGY', N'', N'WS8', 10101, CAST(N'2016-03-23 16:36:57.870' AS DateTime), N'204.9.187.75', N'22.3601106,91.82740860000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (25, 101, N'OPD', 101209, N'Circumcision', CAST(0.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:37:39.103' AS DateTime), N'204.9.187.75', N'22.3601106,91.82740860000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (26, 101, N'ICB', 101301, N'Cabin-111', CAST(1200.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:38:06.827' AS DateTime), N'204.9.187.75', N'22.360110799999998,91.8274069', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (27, 101, N'ICB', 101302, N'Cabin-112', CAST(1200.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:38:14.687' AS DateTime), N'204.9.187.75', N'22.360110799999998,91.8274069', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (28, 101, N'ICB', 101303, N'Cabin-113', CAST(1000.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:38:23.347' AS DateTime), N'204.9.187.75', N'22.360110799999998,91.8274069', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (29, 101, N'ICB', 101304, N'Cabin-114', CAST(1000.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:38:32.410' AS DateTime), N'204.9.187.75', N'22.360110799999998,91.8274069', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (30, 101, N'ICB', 101305, N'Cabin-115', CAST(800.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:38:46.303' AS DateTime), N'204.9.187.75', N'22.360110799999998,91.8274069', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (31, 101, N'ICB', 101306, N'VIP-1', CAST(2000.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:38:54.177' AS DateTime), N'204.9.187.75', N'22.360110799999998,91.8274069', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (32, 101, N'ICB', 101307, N'GM-1', CAST(500.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:39:03.317' AS DateTime), N'204.9.187.75', N'22.360110799999998,91.8274069', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_HEADIO] ([ID], [COMPID], [HEADTP], [HEADID], [HEADNM], [RATE], [HEADFOR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (33, 101, N'ICB', 101308, N'GM-2', CAST(500.00 AS Decimal(18, 2)), N'GENERAL', N'', N'WS8', 10101, CAST(N'2016-03-23 16:39:09.227' AS DateTime), N'204.9.187.75', N'22.360110799999998,91.8274069', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_HEADIO] OFF
SET IDENTITY_INSERT [dbo].[HMS_ICB] ON 

INSERT [dbo].[HMS_ICB] ([ID], [COMPID], [PATIENTYY], [PATIENTID], [PATIENTYYID], [BILLID], [CBTP], [CBID], [EFDT], [EFTM], [ETDT], [ETTM], [TOTHOUR], [TOTDAYS], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 2016, N'230316-001', 16100001, 101103, N'PATIENT', 101301, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'06:01 PM', CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'18:01', CAST(24.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-23 18:17:17.053' AS DateTime), N'204.9.187.75', N'22.3601372,91.82739079999999', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_ICB] OFF
SET IDENTITY_INSERT [dbo].[HMS_IPD] ON 

INSERT [dbo].[HMS_IPD] ([ID], [COMPID], [TRANSDT], [PATIENTYY], [PATIENTID], [PATIENTYYID], [PATIENTNM], [GUARDIANNM], [GENDER], [AGE], [DOB], [MSTATUS], [RELIGION], [OCCUPATION], [TELNO], [MOBNO], [ADDRPRE], [ADDRPER], [ADMITDT], [ADMITTM], [DOCTORID], [REFERID], [PCNTR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, CAST(N'2016-03-23 00:00:00.000' AS DateTime), 2016, N'230316-001', 16100001, N'Syedul Hoque', N'Azimul Hoque', N'MALE', N'32 Y', CAST(N'2006-03-01 00:00:00.000' AS DateTime), N'MARRIED', N'ISLAM', N'Service', NULL, N'01911311111', N'112/A, Agrabad R/A, Chittagong', NULL, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'06:01 PM', 101201010100002, 101201010100002, NULL, NULL, N'WS8', 10101, CAST(N'2016-03-23 18:03:59.413' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_IPD] ([ID], [COMPID], [TRANSDT], [PATIENTYY], [PATIENTID], [PATIENTYYID], [PATIENTNM], [GUARDIANNM], [GENDER], [AGE], [DOB], [MSTATUS], [RELIGION], [OCCUPATION], [TELNO], [MOBNO], [ADDRPRE], [ADDRPER], [ADMITDT], [ADMITTM], [DOCTORID], [REFERID], [PCNTR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, CAST(N'2016-03-28 00:00:00.000' AS DateTime), 2016, N'280316-001', 16100002, N'Rafiqul Islam', N'Saiful Islam', N'MALE', N'22 Y', NULL, N'MARRIED', N'ISLAM', NULL, NULL, N'01912333333', NULL, NULL, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'10:10', NULL, NULL, NULL, NULL, N'WS8', 10101, CAST(N'2016-03-28 16:31:10.157' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_IPD] ([ID], [COMPID], [TRANSDT], [PATIENTYY], [PATIENTID], [PATIENTYYID], [PATIENTNM], [GUARDIANNM], [GENDER], [AGE], [DOB], [MSTATUS], [RELIGION], [OCCUPATION], [TELNO], [MOBNO], [ADDRPRE], [ADDRPER], [ADMITDT], [ADMITTM], [DOCTORID], [REFERID], [PCNTR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, CAST(N'2016-03-28 00:00:00.000' AS DateTime), 2016, N'280316-002', 16100003, N'Sajeda Begum', NULL, N'FEMALE', NULL, NULL, N'MARRIED', N'ISLAM', NULL, NULL, N'01934555555', NULL, NULL, CAST(N'2016-03-28 00:00:00.000' AS DateTime), N'10:15', NULL, NULL, NULL, NULL, N'WS8', 10101, CAST(N'2016-03-28 16:31:41.647' AS DateTime), N'204.9.187.75', N'22.360160999999998,91.827365', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_IPD] OFF
SET IDENTITY_INSERT [dbo].[HMS_MEDICARE] ON 

INSERT [dbo].[HMS_MEDICARE] ([ID], [COMPID], [MCATID], [MEDIID], [MEDINM], [GENERICID], [DOSAGEFID], [PHARMAID], [UNIT], [BUYRT], [SALRT], [STKMIN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 10101, 1010100001, N'RANITIDINE', 101100001, 101200002, 101203010100001, N'Pcs', CAST(10.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 17:46:49.350' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 10101, CAST(N'2016-03-23 17:48:04.633' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324')
INSERT [dbo].[HMS_MEDICARE] ([ID], [COMPID], [MCATID], [MEDIID], [MEDINM], [GENERICID], [DOSAGEFID], [PHARMAID], [UNIT], [BUYRT], [SALRT], [STKMIN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 10101, 1010100002, N'PENTOCIL', 101100002, 101200005, 101203010100001, N'Pcs', CAST(20.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 17:47:18.240' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 10101, CAST(N'2016-03-23 17:48:24.147' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324')
INSERT [dbo].[HMS_MEDICARE] ([ID], [COMPID], [MCATID], [MEDIID], [MEDINM], [GENERICID], [DOSAGEFID], [PHARMAID], [UNIT], [BUYRT], [SALRT], [STKMIN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, 10101, 1010100003, N'LOTIL', 101100003, 101200001, 101203010100001, N'Pcs', CAST(30.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-23 17:48:52.647' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_MEDICARE] ([ID], [COMPID], [MCATID], [MEDIID], [MEDINM], [GENERICID], [DOSAGEFID], [PHARMAID], [UNIT], [BUYRT], [SALRT], [STKMIN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (4, 101, 10101, 1010100004, N'PANTOPRAZOLE', 101100005, 101200002, 101203010100002, N'Pcs', CAST(110.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 17:49:20.470' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_MEDICARE] ([ID], [COMPID], [MCATID], [MEDIID], [MEDINM], [GENERICID], [DOSAGEFID], [PHARMAID], [UNIT], [BUYRT], [SALRT], [STKMIN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (5, 101, 10102, 1010200001, N'MIMOX-250gm', 101100002, 101200001, 101203010100002, N'Pcs', CAST(11.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-23 17:50:29.337' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_MEDICARE] ([ID], [COMPID], [MCATID], [MEDIID], [MEDINM], [GENERICID], [DOSAGEFID], [PHARMAID], [UNIT], [BUYRT], [SALRT], [STKMIN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (6, 101, 10102, 1010200002, N'MIMOX-500gm', 101100002, 101200001, 101203010100002, N'Pcs', CAST(15.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-23 17:50:55.527' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_MEDICARE] OFF
SET IDENTITY_INSERT [dbo].[HMS_MEDIMST] ON 

INSERT [dbo].[HMS_MEDIMST] ([ID], [COMPID], [MCATID], [MCATNM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 10101, N'Antacids & Antiulcerants', N'WS8', 10101, CAST(N'2016-03-23 17:44:38.903' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_MEDIMST] ([ID], [COMPID], [MCATID], [MCATNM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 10102, N'Antibiotics', N'WS8', 10101, CAST(N'2016-03-23 17:44:47.700' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_MEDIMST] OFF
SET IDENTITY_INSERT [dbo].[HMS_MGT] ON 

INSERT [dbo].[HMS_MGT] ([ID], [COMPID], [MGTID], [MGTNM], [DESIG], [ADDRESS], [MOBNO1], [MOBNO2], [EMAILID], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 101101, N'Atiqur Rahman', N'Chairman', N'1047, Golpahar, Chittagong', N'01924111222', NULL, NULL, N'WS8', 10101, CAST(N'2016-04-02 15:25:21.000' AS DateTime), N'204.9.187.75', N'22.3600845,91.827461', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_MGT] OFF
SET IDENTITY_INSERT [dbo].[HMS_MGTRF] ON 

INSERT [dbo].[HMS_MGTRF] ([ID], [COMPID], [MGTID], [REFERID], [RFPCNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 101101, 101201010100001, CAST(20.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-04-02 15:25:39.750' AS DateTime), N'204.9.187.75', N'22.3600845,91.827461', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_MGTRF] OFF
SET IDENTITY_INSERT [dbo].[HMS_OPD] ON 

INSERT [dbo].[HMS_OPD] ([ID], [COMPID], [TRANSDT], [TRANSMY], [TRANSNO], [PATIENTYY], [PATIENTID], [PATIENTYYID], [REFERID], [BILLID], [TESTSL], [TCATID], [TESTID], [AMOUNT], [PCNTR], [PCNTD], [DISCR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'Mar-16', N'16030001', 2016, N'240316-001', 16200001, 101201010100002, 101201, 1, NULL, NULL, CAST(150.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 11:50:45.373' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPD] ([ID], [COMPID], [TRANSDT], [TRANSMY], [TRANSNO], [PATIENTYY], [PATIENTID], [PATIENTYYID], [REFERID], [BILLID], [TESTSL], [TCATID], [TESTID], [AMOUNT], [PCNTR], [PCNTD], [DISCR], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'Mar-16', N'16030001', 2016, N'240316-001', 16200001, 101201010100002, 101205, 2, 10102, 10102001, CAST(350.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 11:52:52.700' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_OPD] OFF
SET IDENTITY_INSERT [dbo].[HMS_OPDMST] ON 

INSERT [dbo].[HMS_OPDMST] ([ID], [COMPID], [TRANSDT], [TRANSMY], [TRANSNO], [PATIENTYY], [PATIENTID], [PATIENTYYID], [PATIENTNM], [GENDER], [AGE], [MOBNO], [ADDRESS], [DOCTORID], [REFERID], [RFPCNT], [DVDT], [DVTM], [TOTAMT], [DISCREF], [DISCHOS], [DISCNET], [NETAMT], [RCVAMT], [DUEAMT], [DUEHID], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'Mar-16', N'16030001', 2016, N'240316-001', 16200001, N'Ismail Hossain', N'Male', N'26 Y', N'01911544444', N'Ctg', 101201010100002, 101201010100002, CAST(30.00 AS Decimal(18, 2)), CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'07:30 PM', CAST(5450.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, CAST(50.00 AS Decimal(18, 2)), CAST(5400.00 AS Decimal(18, 2)), CAST(2400.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), 101201010100001, NULL, N'WS8', 10101, CAST(N'2016-03-24 11:49:16.303' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_OPDMST] OFF
SET IDENTITY_INSERT [dbo].[HMS_OPDRCV] ON 

INSERT [dbo].[HMS_OPDRCV] ([ID], [COMPID], [TRANSDT], [TRANSMY], [TRANSNO], [PATIENTID], [PATIENTYY], [PATIENTYYID], [DUEAMTP], [DISCHOS], [NETAMT], [RCVAMT], [DUEAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'Mar-16', 2016030001, N'240316-001', 2016, 16200001, CAST(3000.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(2800.00 AS Decimal(18, 2)), CAST(1800.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 11:58:09.687' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPDRCV] ([ID], [COMPID], [TRANSDT], [TRANSMY], [TRANSNO], [PATIENTID], [PATIENTYY], [PATIENTYYID], [DUEAMTP], [DISCHOS], [NETAMT], [RCVAMT], [DUEAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), N'Mar-16', 2016030002, N'240316-001', 2016, 16200001, CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 11:58:21.600' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_OPDRCV] OFF
SET IDENTITY_INSERT [dbo].[HMS_OPHEAD] ON 

INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 10101, 10101001, N'Dressing', CAST(200.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:41:10.723' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 10101, 10101002, N'Stitch', CAST(100.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:41:17.073' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, 10101, 10101003, N'Plaster Simple', CAST(500.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:41:26.510' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (4, 101, 10101, 10101004, N'Plaster K.A', CAST(700.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:41:38.113' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (5, 101, 10101, 10101005, N'Tendon Repair L/A', CAST(800.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:42:09.593' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (6, 101, 10101, 10101006, N'Tendon G/A, S/A', CAST(1000.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:42:21.783' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (7, 101, 10101, 10101007, N'Albow Dislocation', CAST(1500.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:42:36.307' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (8, 101, 10102, 10102001, N'Optical Uretheotomy', CAST(1800.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:43:09.033' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (9, 101, 10102, 10102002, N'Ureteric Stone', CAST(1800.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:43:23.890' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (10, 101, 10102, 10102003, N'UB Stone', CAST(1500.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:43:31.447' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (11, 101, 10102, 10102004, N'Cisto Litho Lapaxy', CAST(2000.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:43:50.070' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (12, 101, 10102, 10102005, N'URS+ICPL', CAST(2300.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:44:16.350' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (13, 101, 10102, 10102006, N'Urethroplasty', CAST(2000.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:44:30.717' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (14, 101, 10103, 10103001, N'Hernia', CAST(1000.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:46:01.273' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (15, 101, 10103, 10103002, N'Hydroeele', CAST(1000.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:46:15.273' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (16, 101, 10103, 10103003, N'Hemrrhoid', CAST(1000.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:47:21.777' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHEAD] ([ID], [COMPID], [OPHCID], [OPHID], [OPHNM], [OPHRT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (17, 101, 10103, 10103004, N'Fistula', CAST(1000.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 16:47:32.010' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_OPHEAD] OFF
SET IDENTITY_INSERT [dbo].[HMS_OPHMST] ON 

INSERT [dbo].[HMS_OPHMST] ([ID], [COMPID], [OPHCID], [OPHCNM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 10101, N'ORTHOPEDICS', N'WS8', 10101, CAST(N'2016-03-23 16:39:46.490' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHMST] ([ID], [COMPID], [OPHCID], [OPHCNM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 10102, N'UROLOGY', N'WS8', 10101, CAST(N'2016-03-23 16:42:49.527' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OPHMST] ([ID], [COMPID], [OPHCID], [OPHCNM], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, 10103, N'Surgery', N'WS8', 10101, CAST(N'2016-03-23 16:45:54.927' AS DateTime), N'204.9.187.75', N'22.360099899999998,91.82741060000001', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_OPHMST] OFF
SET IDENTITY_INSERT [dbo].[HMS_OT] ON 

INSERT [dbo].[HMS_OT] ([ID], [COMPID], [TRANSDT], [TRANSYY], [TRANSNO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLID], [OPHID], [OTPTP], [OTPID], [OTPAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2016, 16000001, N'INDOOR', 2016, 16100001, N'230316-001', NULL, 10101001, N'SURGEON', 101201010100002, CAST(4000.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 11:35:19.640' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OT] ([ID], [COMPID], [TRANSDT], [TRANSYY], [TRANSNO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLID], [OPHID], [OTPTP], [OTPID], [OTPAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2016, 16000001, N'INDOOR', 2016, 16100001, N'230316-001', NULL, 10101001, N'ANESTHESIOLOGIST', 101201010100002, CAST(2000.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 11:36:09.807' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OT] ([ID], [COMPID], [TRANSDT], [TRANSYY], [TRANSNO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLID], [OPHID], [OTPTP], [OTPID], [OTPAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, CAST(N'2016-03-28 00:00:00.000' AS DateTime), 2016, 16000002, N'INDOOR', 2016, 16100002, N'280316-001', NULL, 10101001, N'SURGEON', 101201010100002, CAST(6000.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-28 16:32:42.233' AS DateTime), N'204.9.187.75', N'22.3601605,91.8273638', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OT] ([ID], [COMPID], [TRANSDT], [TRANSYY], [TRANSNO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLID], [OPHID], [OTPTP], [OTPID], [OTPAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (4, 101, CAST(N'2016-03-28 00:00:00.000' AS DateTime), 2016, 16000002, N'INDOOR', 2016, 16100002, N'280316-001', NULL, 10101001, N'ASSISTANT', 101201010100001, CAST(3000.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-28 16:33:36.313' AS DateTime), N'204.9.187.75', N'22.3601605,91.8273638', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OT] ([ID], [COMPID], [TRANSDT], [TRANSYY], [TRANSNO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLID], [OPHID], [OTPTP], [OTPID], [OTPAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (5, 101, CAST(N'2016-03-28 00:00:00.000' AS DateTime), 2016, 16000003, N'INDOOR', 2016, 16100003, N'280316-002', NULL, 10101002, N'SURGEON', 101201010100001, CAST(5000.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-28 16:38:21.673' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OT] ([ID], [COMPID], [TRANSDT], [TRANSYY], [TRANSNO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [BILLID], [OPHID], [OTPTP], [OTPID], [OTPAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (6, 101, CAST(N'2016-03-28 00:00:00.000' AS DateTime), 2016, 16000003, N'INDOOR', 2016, 16100003, N'280316-002', NULL, 10101002, N'ANESTHESIOLOGIST', 101201010100002, CAST(2500.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-28 16:38:32.110' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_OT] OFF
SET IDENTITY_INSERT [dbo].[HMS_OTMST] ON 

INSERT [dbo].[HMS_OTMST] ([ID], [COMPID], [TRANSDT], [TRANSYY], [TRANSNO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [OPHID], [OPTMFR], [OPTMTO], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 2016, 16000001, N'INDOOR', 2016, 16100001, N'230316-001', 10101001, N'10:00', N'10:30', NULL, N'WS8', 10101, CAST(N'2016-03-24 11:34:18.430' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OTMST] ([ID], [COMPID], [TRANSDT], [TRANSYY], [TRANSNO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [OPHID], [OPTMFR], [OPTMTO], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, CAST(N'2016-03-28 00:00:00.000' AS DateTime), 2016, 16000002, N'INDOOR', 2016, 16100002, N'280316-001', 10101001, N'00:01', N'00:01', NULL, N'WS8', 10101, CAST(N'2016-03-28 16:32:31.477' AS DateTime), N'204.9.187.75', N'22.3601605,91.8273638', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_OTMST] ([ID], [COMPID], [TRANSDT], [TRANSYY], [TRANSNO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [OPHID], [OPTMFR], [OPTMTO], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, CAST(N'2016-03-28 00:00:00.000' AS DateTime), 2016, 16000003, N'INDOOR', 2016, 16100003, N'280316-002', 10101002, N'00:01', N'00:01', NULL, N'WS8', 10101, CAST(N'2016-03-28 16:38:11.890' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_OTMST] OFF
SET IDENTITY_INSERT [dbo].[HMS_PATHOLOGY] ON 

INSERT [dbo].[HMS_PATHOLOGY] ([ID], [COMPID], [TRANSDT], [TRANSMY], [TRANSNO], [PATIENTID], [PATIENTYY], [PATIENTYYID], [BILLID], [TESTSL], [TESTID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'Mar-16', 2016030001, N'230316-001', 2016, 16100001, 101113, 1, 10103002, CAST(300.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-23 18:38:43.007' AS DateTime), N'204.9.187.75', N'22.360107,91.8274108', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_PATHOLOGY] ([ID], [COMPID], [TRANSDT], [TRANSMY], [TRANSNO], [PATIENTID], [PATIENTYY], [PATIENTYYID], [BILLID], [TESTSL], [TESTID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'Mar-16', 2016030001, N'230316-001', 2016, 16100001, 101111, 2, 10105001, CAST(150.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-23 18:38:46.320' AS DateTime), N'204.9.187.75', N'22.360107,91.8274108', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_PATHOLOGY] ([ID], [COMPID], [TRANSDT], [TRANSMY], [TRANSNO], [PATIENTID], [PATIENTYY], [PATIENTYYID], [BILLID], [TESTSL], [TESTID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'Mar-16', 2016030001, N'230316-001', 2016, 16100001, 101112, 3, 10104001, CAST(250.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-23 18:38:49.950' AS DateTime), N'204.9.187.75', N'22.360107,91.8274108', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_PATHOLOGY] OFF
SET IDENTITY_INSERT [dbo].[HMS_PATHOMST] ON 

INSERT [dbo].[HMS_PATHOMST] ([ID], [COMPID], [TRANSDT], [TRANSMY], [TRANSNO], [PATIENTID], [PATIENTYY], [PATIENTYYID], [DVDT], [DVTM], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, CAST(N'2016-03-23 00:00:00.000' AS DateTime), N'Mar-16', 2016030001, N'230316-001', 2016, 16100001, CAST(N'2016-03-24 00:00:00.000' AS DateTime), CAST(N'2016-03-23 20:00:00.000' AS DateTime), NULL, N'WS8', 10101, CAST(N'2016-03-23 18:37:42.110' AS DateTime), N'204.9.187.75', N'22.360107,91.8274108', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_PATHOMST] OFF
SET IDENTITY_INSERT [dbo].[HMS_PCHGOTC] ON 

INSERT [dbo].[HMS_PCHGOTC] ([ID], [COMPID], [PATIENTTP], [TRANSDT], [PATIENTYY], [PATIENTID], [PATIENTYYID], [TRANSSL], [CHARGEID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, N'INDOOR', CAST(N'2016-03-23 00:00:00.000' AS DateTime), 2016, N'230316-001', 16100001, 1610000101, 101115, CAST(600.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 18:31:33.113' AS DateTime), N'204.9.187.75', N'22.3601051,91.8274084', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_PCHGOTC] ([ID], [COMPID], [PATIENTTP], [TRANSDT], [PATIENTYY], [PATIENTID], [PATIENTYYID], [TRANSSL], [CHARGEID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, N'INDOOR', CAST(N'2016-03-23 00:00:00.000' AS DateTime), 2016, N'230316-001', 16100001, 1610000102, 101116, CAST(300.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 18:32:55.037' AS DateTime), N'204.9.187.75', N'22.3601051,91.8274084', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_PCHGOTC] OFF
SET IDENTITY_INSERT [dbo].[HMS_PCONSULT] ON 

INSERT [dbo].[HMS_PCONSULT] ([ID], [COMPID], [PATIENTTP], [TRANSDT], [PATIENTYY], [PATIENTID], [PATIENTYYID], [BILLID], [TRANSSL], [DOCTORID], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, N'INDOOR', CAST(N'2016-03-23 00:00:00.000' AS DateTime), 2016, N'230316-001', 16100001, 101104, 1610000101, 101201010100002, CAST(400.00 AS Decimal(18, 2)), N'', N'WS8', 10101, CAST(N'2016-03-23 18:17:56.377' AS DateTime), N'204.9.187.75', N'22.3601065,91.82740820000001', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_PCONSULT] OFF
SET IDENTITY_INSERT [dbo].[HMS_PHARMA] ON 

INSERT [dbo].[HMS_PHARMA] ([ID], [COMPID], [PHARMAID], [PHARMAGID], [PHARMANM], [ADDRESS], [CONTACT], [STATUS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 101203010100001, 101203010100000, N'ACI Pharmaceuticals', N'', N'', N'A', N'WS8', 10101, CAST(N'2016-03-23 15:41:22.017' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMA] ([ID], [COMPID], [PHARMAID], [PHARMAGID], [PHARMANM], [ADDRESS], [CONTACT], [STATUS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 101203010100002, 101203010100000, N'Beximco Pharmaceuticals', N'', N'', N'A', N'WS8', 10101, CAST(N'2016-03-23 15:41:31.220' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_PHARMA] OFF
SET IDENTITY_INSERT [dbo].[HMS_PHARMACY] ON 

INSERT [dbo].[HMS_PHARMACY] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [ITEMSL], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [MEDIID], [QTY], [RATE], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, N'SALE', N'MAR-16', 16030001, 1, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 101201, NULL, N'INDOOR', 2016, 16100001, N'230316-001', NULL, 1010100004, CAST(2.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(240.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 12:03:27.230' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMACY] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [ITEMSL], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [MEDIID], [QTY], [RATE], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, N'SALE', N'MAR-16', 16030001, 2, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 101201, NULL, N'INDOOR', 2016, 16100001, N'230316-001', NULL, 1010100002, CAST(12.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), CAST(264.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 12:03:50.107' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMACY] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [ITEMSL], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [MEDIID], [QTY], [RATE], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, N'IUSE', N'MAR-16', 16030001, 1, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 101202, NULL, N'INDOOR', 2016, 16100001, N'230316-001', NULL, 1010100002, CAST(2.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), CAST(44.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 12:11:58.277' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMACY] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [ITEMSL], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [MEDIID], [QTY], [RATE], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (4, 101, N'IRTS', N'MAR-16', 16030001, 1, CAST(N'2016-03-24 00:00:00.000' AS DateTime), NULL, 101201, N'INDOOR', 2016, 16100001, N'230316-001', NULL, 1010100004, CAST(1.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 12:12:40.060' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMACY] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [ITEMSL], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [MEDIID], [QTY], [RATE], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (5, 101, N'IISS', N'MAR-16', 16030001, 1, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 101201, 101202, NULL, NULL, NULL, NULL, NULL, 1010100001, CAST(100.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 12:13:44.113' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMACY] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [ITEMSL], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [MEDIID], [QTY], [RATE], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (6, 101, N'IISS', N'MAR-16', 16030001, 2, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 101201, 101202, NULL, NULL, NULL, NULL, NULL, 1010100002, CAST(100.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), CAST(2200.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 12:13:54.007' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMACY] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [ITEMSL], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [MEDIID], [QTY], [RATE], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (7, 101, N'BUY', N'MAR-16', 16030001, 1, CAST(N'2016-03-28 00:00:00.000' AS DateTime), NULL, 101201, NULL, NULL, NULL, NULL, 101201010100002, 1010100004, CAST(100.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(12000.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-28 16:57:33.997' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMACY] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [ITEMSL], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [MEDIID], [QTY], [RATE], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (8, 101, N'BUY', N'MAR-16', 16030001, 2, CAST(N'2016-03-28 00:00:00.000' AS DateTime), NULL, 101201, NULL, NULL, NULL, NULL, 101201010100002, 1010100001, CAST(300.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(3600.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-28 16:57:46.943' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMACY] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [ITEMSL], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [MEDIID], [QTY], [RATE], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (9, 101, N'BUY', N'MAR-16', 16030002, 1, CAST(N'2016-03-28 00:00:00.000' AS DateTime), NULL, 101201, NULL, NULL, NULL, NULL, 101201010100001, 1010100002, CAST(10.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), CAST(220.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-28 16:58:12.483' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMACY] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [ITEMSL], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [MEDIID], [QTY], [RATE], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (10, 101, N'BUY', N'MAR-16', 16030002, 2, CAST(N'2016-03-28 00:00:00.000' AS DateTime), NULL, 101201, NULL, NULL, NULL, NULL, 101201010100001, 1010100004, CAST(20.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(2400.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-28 16:58:28.773' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMACY] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [ITEMSL], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [MEDIID], [QTY], [RATE], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (11, 101, N'IRTB', N'MAR-16', 16030001, 1, CAST(N'2016-03-28 00:00:00.000' AS DateTime), 101201, NULL, NULL, NULL, NULL, NULL, 101201010100002, 1010100002, CAST(10.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), CAST(220.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-28 17:52:56.073' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMACY] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [ITEMSL], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [MEDIID], [QTY], [RATE], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (12, 101, N'SALE', N'APR-16', 16040001, 1, CAST(N'2016-04-04 00:00:00.000' AS DateTime), 101201, NULL, N'OUTDOOR', 2016, 16200001, N'240316-001', NULL, 1010100002, CAST(10.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), CAST(220.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-04-04 12:26:33.723' AS DateTime), N'204.9.187.75', N'22.3601907,91.82745419999999', 0, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMACY] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [ITEMSL], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [MEDIID], [QTY], [RATE], [AMOUNT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (13, 101, N'SALE', N'APR-16', 16040001, 2, CAST(N'2016-04-04 00:00:00.000' AS DateTime), 101201, NULL, N'OUTDOOR', 2016, 16200001, N'240316-001', NULL, 1010100004, CAST(4.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(480.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-04-04 12:27:17.463' AS DateTime), N'204.9.187.75', N'22.3601907,91.82745419999999', 10101, CAST(N'2016-04-04 12:28:43.657' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324')
SET IDENTITY_INSERT [dbo].[HMS_PHARMACY] OFF
SET IDENTITY_INSERT [dbo].[HMS_PHARMMST] ON 

INSERT [dbo].[HMS_PHARMMST] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [TOTAMT], [VATAMT], [DISCOUNT], [NETAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE], [BILLID]) VALUES (1, 101, N'SALE', N'MAR-16', 16030001, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 101201, NULL, N'INDOOR', 2016, 16100001, N'230316-001', NULL, CAST(504.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(4.16 AS Decimal(18, 2)), CAST(499.84 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 12:07:51.887' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 10101, CAST(N'2016-03-28 18:00:14.483' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL)
INSERT [dbo].[HMS_PHARMMST] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [TOTAMT], [VATAMT], [DISCOUNT], [NETAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE], [BILLID]) VALUES (2, 101, N'IUSE', N'MAR-16', 16030001, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 101202, NULL, N'INDOOR', 2016, 16100001, N'230316-001', NULL, CAST(44.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(44.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 12:12:08.463' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMMST] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [TOTAMT], [VATAMT], [DISCOUNT], [NETAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE], [BILLID]) VALUES (3, 101, N'IRTS', N'MAR-16', 16030001, CAST(N'2016-03-24 00:00:00.000' AS DateTime), NULL, 101201, N'INDOOR', 2016, 16100001, N'230316-001', NULL, CAST(120.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 12:12:42.840' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMMST] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [TOTAMT], [VATAMT], [DISCOUNT], [NETAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE], [BILLID]) VALUES (4, 101, N'IISS', N'MAR-16', 16030001, CAST(N'2016-03-24 00:00:00.000' AS DateTime), 101201, 101202, NULL, NULL, NULL, NULL, NULL, CAST(3400.00 AS Decimal(18, 2)), NULL, NULL, CAST(3400.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-24 12:13:57.117' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMMST] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [TOTAMT], [VATAMT], [DISCOUNT], [NETAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE], [BILLID]) VALUES (5, 101, N'BUY', N'MAR-16', 16030001, CAST(N'2016-03-28 00:00:00.000' AS DateTime), NULL, 101201, NULL, NULL, NULL, NULL, 101201010100002, CAST(15600.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(15600.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-28 16:57:53.467' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMMST] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [TOTAMT], [VATAMT], [DISCOUNT], [NETAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE], [BILLID]) VALUES (6, 101, N'BUY', N'MAR-16', 16030002, CAST(N'2016-03-28 00:00:00.000' AS DateTime), NULL, 101201, NULL, NULL, NULL, NULL, 101201010100001, CAST(2620.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2620.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-28 16:58:31.847' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMMST] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [TOTAMT], [VATAMT], [DISCOUNT], [NETAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE], [BILLID]) VALUES (7, 101, N'IRTB', N'MAR-16', 16030001, CAST(N'2016-03-28 00:00:00.000' AS DateTime), 101201, NULL, NULL, NULL, NULL, NULL, 101201010100002, CAST(220.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(220.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-03-28 17:53:00.840' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_PHARMMST] ([ID], [COMPID], [TRANSTP], [TRANSMY], [TRANSNO], [TRANSDT], [DEPTFR], [DEPTTO], [PATIENTTP], [PATIENTYY], [PATIENTYYID], [PATIENTID], [SUPPLIERID], [TOTAMT], [VATAMT], [DISCOUNT], [NETAMT], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE], [BILLID]) VALUES (8, 101, N'SALE', N'APR-16', 16040001, CAST(N'2016-04-04 00:00:00.000' AS DateTime), 101201, NULL, N'OUTDOOR', 2016, 16200001, N'240316-001', NULL, CAST(700.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), NULL, N'WS8', 10101, CAST(N'2016-04-04 12:27:29.613' AS DateTime), N'204.9.187.75', N'22.3601907,91.82745419999999', 10101, CAST(N'2016-04-04 12:28:56.570' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', 101109)
SET IDENTITY_INSERT [dbo].[HMS_PHARMMST] OFF
SET IDENTITY_INSERT [dbo].[HMS_PINVESTN] ON 

INSERT [dbo].[HMS_PINVESTN] ([ID], [COMPID], [PATIENTTP], [TRANSDT], [PATIENTYY], [PATIENTID], [PATIENTYYID], [BILLID], [TRANSSL], [INVESTNID], [AMOUNT], [SERVICEID], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, N'INDOOR', CAST(N'2016-03-23 00:00:00.000' AS DateTime), 2016, N'230316-001', 16100001, 101111, 1610000101, 10108005, CAST(200.00 AS Decimal(18, 2)), 101201010100002, N'', N'WS8', 10101, CAST(N'2016-03-23 18:24:01.410' AS DateTime), N'204.9.187.75', N'22.360087999999998,91.8274156', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_PINVESTN] ([ID], [COMPID], [PATIENTTP], [TRANSDT], [PATIENTYY], [PATIENTID], [PATIENTYYID], [BILLID], [TRANSSL], [INVESTNID], [AMOUNT], [SERVICEID], [REMARKS], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, N'INDOOR', CAST(N'2016-03-23 00:00:00.000' AS DateTime), 2016, N'230316-001', 16100001, 101113, 1610000102, 10103003, CAST(500.00 AS Decimal(18, 2)), 101201010100002, N'', N'WS8', 10101, CAST(N'2016-03-23 18:24:35.340' AS DateTime), N'204.9.187.75', N'22.360087999999998,91.8274156', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_PINVESTN] OFF
SET IDENTITY_INSERT [dbo].[HMS_REFER] ON 

INSERT [dbo].[HMS_REFER] ([ID], [COMPID], [REFERID], [REFERGID], [REFERNM], [TITLE], [ADDRESS], [MOBNO1], [MOBNO2], [EMAILID], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 101201010100001, 1012010101, N'Harun-ur-rashid', NULL, N'CMH, Chittagong', N'01911211111', N'01911211112', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_REFER] ([ID], [COMPID], [REFERID], [REFERGID], [REFERNM], [TITLE], [ADDRESS], [MOBNO1], [MOBNO2], [EMAILID], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 101201010100002, 1012010101, N'Arifur Rahman', NULL, N'Asadgonj, Chittagong', N'018112111111', N'018112111112', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_REFER] OFF
SET IDENTITY_INSERT [dbo].[HMS_TEST] ON 

INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 10101, 10101001, 101111, 101205, N'Niddle', CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 10101, 10101002, 101111, 101205, N'Black Tube (ESR)', CAST(25.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, 10101, 10101003, 101111, 101205, N'Grey Tube', CAST(15.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (4, 101, 10101, 10101004, 101111, 101205, N'Red Tube', CAST(15.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (5, 101, 10101, 10101005, 101111, 101205, N'Light Blue Tube', CAST(15.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (6, 101, 10102, 10102001, 101111, 101205, N'CBC', CAST(350.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:51:35.370' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (7, 101, 10102, 10102002, 101111, 101205, N'PBF Study', CAST(300.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:51:47.863' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (8, 101, 10102, 10102003, 101111, 101205, N'Stool R/E', CAST(150.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:51:57.647' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (9, 101, 10102, 10102004, 101111, 101205, N'Stool C/S', CAST(250.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:52:12.207' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (10, 101, 10102, 10102005, 101111, 101205, N'MPC', CAST(120.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:52:24.410' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (11, 101, 10103, 10103001, 101113, 101207, N'X-Ray of Left Kneee Joint Both View', CAST(300.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:54:03.753' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (12, 101, 10103, 10103002, 101113, 101207, N'X-Ray of Chest P/A View', CAST(300.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:54:19.397' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (13, 101, 10103, 10103003, 101113, 101207, N'X-Ray of Right Ankle Joint Both View', CAST(300.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:54:36.347' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (14, 101, 10103, 10103004, 101113, 101207, N'X-Ray of Pelvis A/P View', CAST(300.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:54:48.690' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (15, 101, 10103, 10103005, 101113, 101207, N'X-Ray of PNS Both View', CAST(600.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:55:02.823' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (16, 101, 10104, 10104001, 101112, 101206, N'ECG (Digital)', CAST(250.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:55:30.453' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (17, 101, 10104, 10104002, 101112, 101206, N'EEG (Metro)', CAST(1750.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:55:46.283' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (18, 101, 10104, 10104003, 101112, 101206, N'EEG (Chevron)', CAST(1675.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:55:59.820' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (19, 101, 10105, 10105001, 101111, 101205, N'Blood Group', CAST(150.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:56:27.037' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (20, 101, 10105, 10105002, 101111, 101205, N'Widal Test', CAST(250.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:56:39.600' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (21, 101, 10105, 10105003, 101111, 101205, N'HBsAg (Confirmatory)', CAST(1000.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:56:59.757' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (22, 101, 10106, 10106001, 101114, 101208, N'USG of Lower Abdomen', CAST(900.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:57:35.967' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (23, 101, 10106, 10106002, 101114, 101208, N'USG of Pregnancy Profile', CAST(900.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:57:46.663' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (24, 101, 10106, 10106003, 101114, 101208, N'USG of Upper Abdomen', CAST(1000.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:58:00.947' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (25, 101, 10106, 10106004, 101114, 101208, N'USG of HBS', CAST(1000.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:58:16.780' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (26, 101, 10107, 10107001, 101111, 101205, N'ICT for Microbacteria', CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:59:14.057' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (27, 101, 10107, 10107002, 101111, 101205, N'Anti Dengue Igm & IgG', CAST(1200.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:59:27.460' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (28, 101, 10107, 10107003, 101111, 101205, N'ICT Salmonella IgM & IgG', CAST(800.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 16:59:45.220' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (29, 101, 10107, 10107004, 101111, 101205, N'ICT Malaria PFT & PVT', CAST(650.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 17:00:03.757' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (30, 101, 10108, 10108001, 101111, 101205, N'Bilrubin (Total)', CAST(120.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 17:10:13.767' AS DateTime), N'204.9.187.75', N'22.360088899999997,91.82741639999999', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (31, 101, 10108, 10108002, 101111, 101205, N'Bilrubin (Direct & Indirect)', CAST(305.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 17:10:26.937' AS DateTime), N'204.9.187.75', N'22.360088899999997,91.82741639999999', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (32, 101, 10108, 10108003, 101111, 101205, N'SGOT/AST', CAST(205.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 17:10:43.203' AS DateTime), N'204.9.187.75', N'22.360088899999997,91.82741639999999', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (33, 101, 10108, 10108004, 101111, 101205, N'SGPT/ALT', CAST(205.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 17:10:52.970' AS DateTime), N'204.9.187.75', N'22.360088899999997,91.82741639999999', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TEST] ([ID], [COMPID], [TCATID], [TESTID], [IPDID], [OPDID], [TESTNM], [RATE], [PCNTD], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (34, 101, 10108, 10108005, 101111, 101205, N'RBS & CUS', CAST(120.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'WS8', 10101, CAST(N'2016-03-23 17:11:10.670' AS DateTime), N'204.9.187.75', N'22.360088899999997,91.82741639999999', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_TEST] OFF
SET IDENTITY_INSERT [dbo].[HMS_TESTMST] ON 

INSERT [dbo].[HMS_TESTMST] ([ID], [COMPID], [TCATID], [TCATNM], [IPDID], [OPDID], [TOPYN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 10101, N'INSTRUMENT', 101111, 101205, N'N', N'WS8', 10101, CAST(N'2016-03-23 16:48:38.537' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTMST] ([ID], [COMPID], [TCATID], [TCATNM], [IPDID], [OPDID], [TOPYN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 10102, N'CLINICAL PATHOLOGY', 101111, 101205, N'Y', N'WS8', 10101, CAST(N'2016-03-23 16:51:22.023' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTMST] ([ID], [COMPID], [TCATID], [TCATNM], [IPDID], [OPDID], [TOPYN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, 10103, N'X-RAY', 101113, 101207, N'Y', N'WS8', 10101, CAST(N'2016-03-23 16:52:41.563' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTMST] ([ID], [COMPID], [TCATID], [TCATNM], [IPDID], [OPDID], [TOPYN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (4, 101, 10104, N'E.C.G.', 101112, 101206, N'Y', N'WS8', 10101, CAST(N'2016-03-23 16:55:18.807' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTMST] ([ID], [COMPID], [TCATID], [TCATNM], [IPDID], [OPDID], [TOPYN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (5, 101, 10105, N'SEROLOGY', 101111, 101205, N'N', N'WS8', 10101, CAST(N'2016-03-23 16:56:15.227' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTMST] ([ID], [COMPID], [TCATID], [TCATNM], [IPDID], [OPDID], [TOPYN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (6, 101, 10106, N'ULTRASONOGRAPHY', 101114, 101208, N'Y', N'WS8', 10101, CAST(N'2016-03-23 16:57:14.733' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTMST] ([ID], [COMPID], [TCATID], [TCATNM], [IPDID], [OPDID], [TOPYN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (7, 101, 10107, N'IMMUNOLOGY', 101111, 101205, N'Y', N'WS8', 10101, CAST(N'2016-03-23 16:58:33.983' AS DateTime), N'204.9.187.75', N'22.3600881,91.8274141', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTMST] ([ID], [COMPID], [TCATID], [TCATNM], [IPDID], [OPDID], [TOPYN], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (8, 101, 10108, N'BIO-CHEMISTRY', 101111, 101205, N'Y', N'WS8', 10101, CAST(N'2016-03-23 17:09:52.017' AS DateTime), N'204.9.187.75', N'22.360088899999997,91.82741639999999', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_TESTMST] OFF
SET IDENTITY_INSERT [dbo].[HMS_TESTNV] ON 

INSERT [dbo].[HMS_TESTNV] ([ID], [COMPID], [TESTID], [RESTID], [RESTNM], [RESTGR], [RESTMU], [SHOWTP], [LENGTH], [DECIML], [NVALUE], [RESTSL], [RESTGRV], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 10105001, 1010500101, N'Blood Group', NULL, NULL, N'STRING', NULL, NULL, N'Male: ABCD Female: EFGH', NULL, N'N', N'WS8', 10101, CAST(N'2016-03-24 11:39:47.713' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTNV] ([ID], [COMPID], [TESTID], [RESTID], [RESTNM], [RESTGR], [RESTMU], [SHOWTP], [LENGTH], [DECIML], [NVALUE], [RESTSL], [RESTGRV], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 10105002, 1010500201, N'TO', N'Widal Test', NULL, N'NUMBER', 2, 0, NULL, 1, N'Y', N'WS8', 10101, CAST(N'2016-03-24 11:43:40.047' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTNV] ([ID], [COMPID], [TESTID], [RESTID], [RESTNM], [RESTGR], [RESTMU], [SHOWTP], [LENGTH], [DECIML], [NVALUE], [RESTSL], [RESTGRV], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, 10105002, 1010500202, N'TH', N'Widal Test', NULL, N'NUMBER', 2, 0, NULL, 2, N'Y', N'WS8', 10101, CAST(N'2016-03-24 11:44:51.170' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTNV] ([ID], [COMPID], [TESTID], [RESTID], [RESTNM], [RESTGR], [RESTMU], [SHOWTP], [LENGTH], [DECIML], [NVALUE], [RESTSL], [RESTGRV], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (4, 101, 10105002, 1010500203, N'AH', N'Widal Test', NULL, N'NUMBER', 2, 0, NULL, 3, N'Y', N'WS8', 10101, CAST(N'2016-03-24 11:45:11.390' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTNV] ([ID], [COMPID], [TESTID], [RESTID], [RESTNM], [RESTGR], [RESTMU], [SHOWTP], [LENGTH], [DECIML], [NVALUE], [RESTSL], [RESTGRV], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (5, 101, 10105002, 1010500204, N'BH', N'Widal Test', NULL, N'NUMBER', 2, 0, NULL, 4, N'Y', N'WS8', 10101, CAST(N'2016-03-24 11:45:24.767' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTNV] ([ID], [COMPID], [TESTID], [RESTID], [RESTNM], [RESTGR], [RESTMU], [SHOWTP], [LENGTH], [DECIML], [NVALUE], [RESTSL], [RESTGRV], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (6, 101, 10105002, 1010500205, N'Opinion', N'Widal Test', NULL, N'STRING', 2, 0, NULL, 5, N'Y', N'WS8', 10101, CAST(N'2016-03-24 11:45:37.650' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_TESTNV] OFF
SET IDENTITY_INSERT [dbo].[HMS_TESTV] ON 

INSERT [dbo].[HMS_TESTV] ([ID], [COMPID], [TCATID], [TESTID], [TVACID], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (1, 101, 10108, 10108001, 10101001, N'WS8', 10101, CAST(N'2016-03-23 17:11:50.980' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTV] ([ID], [COMPID], [TCATID], [TESTID], [TVACID], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (2, 101, 10108, 10108001, 10101004, N'WS8', 10101, CAST(N'2016-03-23 17:11:55.690' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTV] ([ID], [COMPID], [TCATID], [TESTID], [TVACID], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (3, 101, 10108, 10108002, 10101001, N'WS8', 10101, CAST(N'2016-03-23 17:12:05.283' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTV] ([ID], [COMPID], [TCATID], [TESTID], [TVACID], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (4, 101, 10108, 10108002, 10101004, N'WS8', 10101, CAST(N'2016-03-23 17:12:08.163' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTV] ([ID], [COMPID], [TCATID], [TESTID], [TVACID], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (5, 101, 10108, 10108005, 10101001, N'WS8', 10101, CAST(N'2016-03-23 17:12:26.040' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTV] ([ID], [COMPID], [TCATID], [TESTID], [TVACID], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (6, 101, 10108, 10108005, 10101003, N'WS8', 10101, CAST(N'2016-03-23 17:12:29.383' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTV] ([ID], [COMPID], [TCATID], [TESTID], [TVACID], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (7, 101, 10102, 10102001, 10101001, N'WS8', 10101, CAST(N'2016-03-23 17:13:08.943' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTV] ([ID], [COMPID], [TCATID], [TESTID], [TVACID], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (8, 101, 10102, 10102001, 10101002, N'WS8', 10101, CAST(N'2016-03-23 17:13:12.113' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
INSERT [dbo].[HMS_TESTV] ([ID], [COMPID], [TCATID], [TESTID], [TVACID], [USERPC], [INSUSERID], [INSTIME], [INSIPNO], [INSLTUDE], [UPDUSERID], [UPDTIME], [UPDIPNO], [UPDLTUDE]) VALUES (9, 101, 10102, 10102001, 10101005, N'WS8', 10101, CAST(N'2016-03-23 17:13:16.050' AS DateTime), N'204.9.187.75', N'22.3475365,91.8123324', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HMS_TESTV] OFF
