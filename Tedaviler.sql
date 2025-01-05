SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tedaviler](
	[Tedavi_ID] [int] IDENTITY(1,1) NOT NULL,
	[TedaviBaslangicTarihi] [date] NOT NULL,
	[TedaviBitisTarihi] [date] NULL,
	[Hayvan_ID] [int] NOT NULL,
	[Veteriner_ID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tedaviler] ADD PRIMARY KEY CLUSTERED 
(
	[Tedavi_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tedaviler]  WITH CHECK ADD FOREIGN KEY([Hayvan_ID])
REFERENCES [dbo].[Hayvanlar] ([Hayvan_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tedaviler]  WITH CHECK ADD FOREIGN KEY([Veteriner_ID])
REFERENCES [dbo].[Veterinerler] ([Veteriner_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
