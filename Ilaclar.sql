SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ilaclar](
	[Ilac_ID] [int] IDENTITY(1,1) NOT NULL,
	[IlacAdi] [varchar](50) NOT NULL,
	[IlacFiyati] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ilaclar] ADD PRIMARY KEY CLUSTERED 
(
	[Ilac_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
