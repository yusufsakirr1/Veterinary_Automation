SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TedaviSonucu](
	[Sonuc_ID] [int] IDENTITY(1,1) NOT NULL,
	[SonucDurumu] [varchar](50) NULL,
	[HayvanDurumu] [nvarchar](50) NOT NULL,
	[Tedavi_ID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TedaviSonucu] ADD PRIMARY KEY CLUSTERED 
(
	[Sonuc_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TedaviSonucu]  WITH CHECK ADD FOREIGN KEY([Tedavi_ID])
REFERENCES [dbo].[Tedaviler] ([Tedavi_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TedaviSonucu]  WITH CHECK ADD CHECK  (([HayvanDurumu]='Tedavi Ediliyor' OR [HayvanDurumu]='Iyilesmistir' OR [HayvanDurumu]='Olmustur'))
GO
