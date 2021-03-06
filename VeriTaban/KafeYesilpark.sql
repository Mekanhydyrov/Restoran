USE [master]
GO
/****** Object:  Database [KafeVT]    Script Date: 15.02.2021 05:56:34 ******/
CREATE DATABASE [KafeVT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KafeVT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\KafeVT.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KafeVT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\KafeVT_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KafeVT] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KafeVT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KafeVT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KafeVT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KafeVT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KafeVT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KafeVT] SET ARITHABORT OFF 
GO
ALTER DATABASE [KafeVT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KafeVT] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [KafeVT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KafeVT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KafeVT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KafeVT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KafeVT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KafeVT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KafeVT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KafeVT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KafeVT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KafeVT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KafeVT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KafeVT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KafeVT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KafeVT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KafeVT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KafeVT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KafeVT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KafeVT] SET  MULTI_USER 
GO
ALTER DATABASE [KafeVT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KafeVT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KafeVT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KafeVT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [KafeVT]
GO
/****** Object:  Table [dbo].[TBLAdmin]    Script Date: 15.02.2021 05:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLAdmin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAd] [varchar](50) NULL,
	[Sifre] [varchar](50) NULL,
	[Mail] [varchar](70) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_TBLAdmin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLAdres]    Script Date: 15.02.2021 05:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLAdres](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Aciklama] [varchar](max) NULL,
	[Telefon] [varchar](50) NULL,
	[Mail] [varchar](150) NULL,
	[AcikAdres] [varchar](900) NULL,
 CONSTRAINT [PK_TBLAdres] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLBlog]    Script Date: 15.02.2021 05:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLBlog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [varchar](300) NULL,
	[Aciklama] [varchar](max) NULL,
	[Resim] [varchar](500) NULL,
	[Gun] [varchar](5) NULL,
	[Ay] [varchar](20) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_TBLBlog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLHakkimizda]    Script Date: 15.02.2021 05:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLHakkimizda](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Baslik] [varchar](50) NULL,
	[KafeAciklama] [varchar](max) NULL,
	[DugunAciklama] [varchar](max) NULL,
 CONSTRAINT [PK_TBLHakkimizda] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLiletisim]    Script Date: 15.02.2021 05:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLiletisim](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](90) NULL,
	[Mail] [varchar](50) NULL,
	[Mesaj] [varchar](max) NULL,
 CONSTRAINT [PK_TBLiletisim] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLKafe]    Script Date: 15.02.2021 05:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLKafe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [varchar](50) NULL,
	[AltBaslik] [varchar](160) NULL,
	[Aciklama] [varchar](max) NULL,
	[Resim] [varchar](500) NULL,
 CONSTRAINT [PK_TBLKafe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLSalon]    Script Date: 15.02.2021 05:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLSalon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [varchar](50) NULL,
	[AltBaslik] [varchar](250) NULL,
	[Aciklama] [varchar](max) NULL,
	[Resim] [varchar](500) NULL,
 CONSTRAINT [PK_TBLSalon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLSalonBlog]    Script Date: 15.02.2021 05:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLSalonBlog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [varchar](50) NULL,
	[Aciklama] [varchar](max) NULL,
	[Resim] [varchar](500) NULL,
	[Tarih] [varchar](50) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_TBLSalonBlog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLSalonYorum]    Script Date: 15.02.2021 05:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLSalonYorum](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](70) NULL,
	[Mail] [varchar](70) NULL,
	[Yorum] [varchar](max) NULL,
	[SalonBlogid] [int] NULL,
 CONSTRAINT [PK_TBLSalonYorum] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLSosyalMedya]    Script Date: 15.02.2021 05:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLSosyalMedya](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NULL,
	[Uaznti] [varchar](500) NULL,
	[MediyaAdi] [varchar](50) NULL,
 CONSTRAINT [PK_TBLSosyalMedya] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLYetenek]    Script Date: 15.02.2021 05:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLYetenek](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[YetenekAd] [varchar](90) NULL,
	[Derece] [tinyint] NULL,
	[Aciklama] [varchar](5000) NULL,
 CONSTRAINT [PK_TBLYetenek] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLYonetici]    Script Date: 15.02.2021 05:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLYonetici](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](90) NULL,
	[Bilgi] [varchar](150) NULL,
	[Mail] [varchar](90) NULL,
	[Facebook] [varchar](250) NULL,
	[instagram] [varchar](250) NULL,
	[Resim] [varchar](5000) NULL,
 CONSTRAINT [PK_TBLYonetici] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLYorum]    Script Date: 15.02.2021 05:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLYorum](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](60) NULL,
	[Mail] [varchar](70) NULL,
	[Mesaj] [varchar](max) NULL,
	[Blogid] [int] NULL,
 CONSTRAINT [PK_TBLYorum] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TBLAdmin] ON 

INSERT [dbo].[TBLAdmin] ([id], [KullaniciAd], [Sifre], [Mail], [Durum]) VALUES (1, N'İbrahimGuzey', N'İbrahimGuzey123', N'ibrahimguzey.gmail.com', 1)
INSERT [dbo].[TBLAdmin] ([id], [KullaniciAd], [Sifre], [Mail], [Durum]) VALUES (2, N'Emre Güzey', N'Emre123', N'emreguzey.gmail.com', 1)
INSERT [dbo].[TBLAdmin] ([id], [KullaniciAd], [Sifre], [Mail], [Durum]) VALUES (3, N'KisaKodlar', N'KisaKodlar2021', N'kisakodlar.gmail.com', 0)
SET IDENTITY_INSERT [dbo].[TBLAdmin] OFF
SET IDENTITY_INSERT [dbo].[TBLAdres] ON 

INSERT [dbo].[TBLAdres] ([id], [Aciklama], [Telefon], [Mail], [AcikAdres]) VALUES (1, N'Tokat Yeşilpark Kafe Restorant & Dügün salon web sitemize hoş heldiniz', N'+212 302 0121', N'TokatYesilPark@gmail.com', N'Tokat Merkez Karşıyaka Yeşilpark Kafe Restorant & Dügün Salonu  siz gelin ben sizi alarım deneme')
SET IDENTITY_INSERT [dbo].[TBLAdres] OFF
SET IDENTITY_INSERT [dbo].[TBLBlog] ON 

INSERT [dbo].[TBLBlog] ([id], [Baslik], [Aciklama], [Resim], [Gun], [Ay], [Durum]) VALUES (1, N'Canlı Müzik Keyfi', N'Durun beyle canlı muzuk keyfine hoş geldiniz. Sizleri ağrlamaktan onur duyuruz Sevgilerimizle.', N'https://im0-tub-tr.yandex.net/i?id=efd57f43c5731955a9061e0c77b16b19&n=13', N'21.03', N'Ock', 1)
INSERT [dbo].[TBLBlog] ([id], [Baslik], [Aciklama], [Resim], [Gun], [Ay], [Durum]) VALUES (2, N'Öğle Yemke Keyfi', N'Tokat kabımızdan tatmanızı önereriz efendim. afiyet olsun', N'https://tokatkebabimangali.com/images/tokatkebab%C4%B1.JPG', N'01', N'Ock', 1)
INSERT [dbo].[TBLBlog] ([id], [Baslik], [Aciklama], [Resim], [Gun], [Ay], [Durum]) VALUES (3, N'Çaymızda indirim', N'Bu güne özel 2tl olamak üzere çayımız tavran kanıdır sizleri aramızda görmek isterim', N'https://itkv.tmgrup.com.tr/album/2019/04/08/1554704994941.jpg', N'03', N'Ock', 1)
INSERT [dbo].[TBLBlog] ([id], [Baslik], [Aciklama], [Resim], [Gun], [Ay], [Durum]) VALUES (4, N'İndirim Kampanyası', N'sevgili müşterilerimiz yine sizler için indirim kapanyasını başlatıyoruz. 1kg tokat kebabı alan müşterilerimize büyük semamerimiz sadece 25tl ', N'https://www.reklamzamani.net/dosyalar/dosya/1684766663.jpg', N'05', N'Mart', 1)
INSERT [dbo].[TBLBlog] ([id], [Baslik], [Aciklama], [Resim], [Gun], [Ay], [Durum]) VALUES (5, N'Canlı Müzik', N'Sevgili müşterilerimiz önmizdeki hafta Ozan hoca sahnemizde yer alacaktır', N'https://imgrosetta.mynet.com/file/10239056/640xauto.jpg', N'10', N'Şub', 1)
INSERT [dbo].[TBLBlog] ([id], [Baslik], [Aciklama], [Resim], [Gun], [Ay], [Durum]) VALUES (6, N'Duyuru', N'Sevgilim Müşterilerimiz salı günü canlı muzigimiz olmıycaktır. Sevgilerinizle', N'https://pbs.twimg.com/media/D3N4zJ0X4AEZEqE.jpg:large', N'12', N'Şub', 1)
INSERT [dbo].[TBLBlog] ([id], [Baslik], [Aciklama], [Resim], [Gun], [Ay], [Durum]) VALUES (7, N'Günün Yemeği', N'Sevgili Müşterilerimiz bu güne özel Balık çeşitlerimiz vardır. Sizleri aramızda görmekten memnun oluruz', N'https://iasbh.tmgrup.com.tr/9ebbbc/0/0/0/0/0/0?u=http://i.sabah.com.tr/sb/album/2017/07/04/1499165512782.jpg&mw=752&mh=700', N'05', N'Mart', 1)
INSERT [dbo].[TBLBlog] ([id], [Baslik], [Aciklama], [Resim], [Gun], [Ay], [Durum]) VALUES (8, N'Önemli Duyuru', N'Perşembe günü canlı muzik konugumuz Murat Hoca olacaktır. ', N'https://im0-tub-tr.yandex.net/i?id=6e77362206f664d4d58d1c29b4bb802e&n=13', N'04', N'Mart', 1)
SET IDENTITY_INSERT [dbo].[TBLBlog] OFF
SET IDENTITY_INSERT [dbo].[TBLHakkimizda] ON 

INSERT [dbo].[TBLHakkimizda] ([id], [Baslik], [KafeAciklama], [DugunAciklama]) VALUES (1, N'Hakkımızda', N'Türkçeye İngilizceden geçen kafeterya sözcüğü de bazen kafe anlamında, bazen de kantin anlamında kullanılır.
Avrupa''da kahvenin tüketilmeye başlaması, alkol almayan insanlara, sosyal faaliyetleri için, barlara alternatif olacak bir mekan sağladı. Buraya Yazı Ekle', N'Düğün tarihinin aylar öncesinden belirlenmesi eksiklerin giderilmesi ve hazırlıkların tamamlanması açısından önemlidir.
Gelin ve damadın yakınlarına düğünden önce hediyeler getirilmesi yaygın adetlerdendir.Düğün haftasının başında oğlan evinin damına bayrak dikilir.
Böylece düğün olacak ev belirlenmiş ve ilan edilmiş olur.')
SET IDENTITY_INSERT [dbo].[TBLHakkimizda] OFF
SET IDENTITY_INSERT [dbo].[TBLiletisim] ON 

INSERT [dbo].[TBLiletisim] ([id], [AdSoyad], [Mail], [Mesaj]) VALUES (1, N'Guvanç Yazgulyyev', N'guga@gmail.com', N'Merhaba Hizmetiniz yetersiz.!!!!!')
SET IDENTITY_INSERT [dbo].[TBLiletisim] OFF
SET IDENTITY_INSERT [dbo].[TBLKafe] ON 

INSERT [dbo].[TBLKafe] ([id], [Baslik], [AltBaslik], [Aciklama], [Resim]) VALUES (1, N'Yeşil Park Kafe & Restorant', N'Kafemize Hoş Geldiniz', N'Kafemiz her gün sabah 10:00 dan akşam 23:00 kadar hizmetinizdeyiz. Sizleri aramızda görmekten mutluluk duyuruz. Kahve Bahane Söhbet Şahane', N'https://www.iqpro.com.tr/wp-content/uploads/2019/02/Natura-FredWatford04-edit-780x398.jpg')
SET IDENTITY_INSERT [dbo].[TBLKafe] OFF
SET IDENTITY_INSERT [dbo].[TBLSalon] ON 

INSERT [dbo].[TBLSalon] ([id], [Baslik], [AltBaslik], [Aciklama], [Resim]) VALUES (1, N'Safir & Gold', N'Dügün Salonumuza Hoş Geldiniz!', N'Merhaba Sevgili vatandaşlarımız. Sizlere Kafe Restoran & Dügün Salonu olarak hizmet vermekten mutluluk duyuyoruz. Gold Dügün salonumuz 500 Kişilik Kapasiteye sahip olmakla en çok kına için tercih edilmektedir. Safir dügün salonumuz ise 1000 Kişilik kapasiteye sahip olmakla en çok Büyük Dügünler için tercih edilmektedir. Maalesef şu an bütün dünyayı etki altına alan COVID-19  bizide kötü etkilemektedir. 500 Kişilik Dügün salonumuz 250 Kişi, 1000 Kişilik Dügün salonumuz 500 Kişiyr inmiştir!', N'http://malatyareyyan.com/userfiles/images/slider-2.jpg')
SET IDENTITY_INSERT [dbo].[TBLSalon] OFF
SET IDENTITY_INSERT [dbo].[TBLSalonBlog] ON 

INSERT [dbo].[TBLSalonBlog] ([id], [Baslik], [Aciklama], [Resim], [Tarih], [Durum]) VALUES (1, N'COVID-19 Tedbiri', N'Sevgili vatandaşlarımız Heryerde COVID-19 hijyenine önem verdigi gibi bizde bu konuda çok hassasız. Salonumuzda her masada El dezenfekteni ve en az 1 metre mesafeye çok dikkat etmekteyiz. Sağlıcakla Kalın.', N'https://i.ytimg.com/vi/ESciUcntVnk/maxresdefault.jpg', N'12.02.2021', 1)
INSERT [dbo].[TBLSalonBlog] ([id], [Baslik], [Aciklama], [Resim], [Tarih], [Durum]) VALUES (2, N'Hazırlık', N'Sevgili vatandaşlarımız Yasaklar Kalkar Kalkmaz Sügün Salonumuzu Açmaktayız,Sevgili vatandaşlarımız Yasaklar Kalkar Kalkmaz Sügün Salonumuzu Açmaktayız,Sevgili vatandaşlarımız Yasaklar Kalkar Kalkmaz Sügün Salonumuzu Açmaktayız,Sevgili vatandaşlarımız Yasaklar Kalkar Kalkmaz Sügün Salonumuzu Açmaktayız,Sevgili vatandaşlarımız Yasaklar Kalkar Kalkmaz Sügün Salonumuzu Açmaktayız', N'https://c.pxhere.com/photos/1c/d5/affection_bride_couple_girl_groom_happy_love_man-1538669.jpg!d', N'14.02.2021', 1)
SET IDENTITY_INSERT [dbo].[TBLSalonBlog] OFF
SET IDENTITY_INSERT [dbo].[TBLSalonYorum] ON 

INSERT [dbo].[TBLSalonYorum] ([id], [AdSoyad], [Mail], [Yorum], [SalonBlogid]) VALUES (1, N'Guvanç Yazgulyyev', N'guga@gmail.com', N'Hizmetinizi Çok Begendim.', 1)
INSERT [dbo].[TBLSalonYorum] ([id], [AdSoyad], [Mail], [Yorum], [SalonBlogid]) VALUES (2, N'Mekan Hydyrov', N'mekanhydyrov@hotmail.com', N'bu bir efsane dostum :)', 1)
INSERT [dbo].[TBLSalonYorum] ([id], [AdSoyad], [Mail], [Yorum], [SalonBlogid]) VALUES (4, N'Beyaz Öztürk', N'Beyaz@gmail.com', N'Ben ne zaman evlenicem', NULL)
SET IDENTITY_INSERT [dbo].[TBLSalonYorum] OFF
SET IDENTITY_INSERT [dbo].[TBLSosyalMedya] ON 

INSERT [dbo].[TBLSosyalMedya] ([id], [Ad], [Uaznti], [MediyaAdi]) VALUES (1, N'İbrahim', N'facebook.com', N'Facebook')
INSERT [dbo].[TBLSosyalMedya] ([id], [Ad], [Uaznti], [MediyaAdi]) VALUES (2, N'Yeşil Park', N'Tokatyesilpark@gmail.com', N'Mail')
SET IDENTITY_INSERT [dbo].[TBLSosyalMedya] OFF
SET IDENTITY_INSERT [dbo].[TBLYetenek] ON 

INSERT [dbo].[TBLYetenek] ([id], [YetenekAd], [Derece], [Aciklama]) VALUES (1, N'Müşteri Memnunyet', 97, N'Her bir çalışanımız güler yüzlü ve iyecek içeceklerimizde nefis eller tarafından hazırlanıyor sizleride bekleriz efendim!')
INSERT [dbo].[TBLYetenek] ([id], [YetenekAd], [Derece], [Aciklama]) VALUES (2, N'Garson', 96, N'Her bir garsonmuzu özenle seçerek alıyoruz bunun güzelliginide sizlerle beraber görüyoruz :)')
SET IDENTITY_INSERT [dbo].[TBLYetenek] OFF
SET IDENTITY_INSERT [dbo].[TBLYonetici] ON 

INSERT [dbo].[TBLYonetici] ([id], [AdSoyad], [Bilgi], [Mail], [Facebook], [instagram], [Resim]) VALUES (1, N'İbrahim Güzey', N'Ben kafemizin yonetim muduruyum sizleri agırlamaktan onur duyurum. saygılarımla gel buraya', N'ibo@gmail.com', N'https://tr-tr.facebook.com/ibrahim.guzey.33', N'https://www.instagram.com/kivancyazgu/?hl=tr', N'https://im0-tub-tr.yandex.net/i?id=e0ea68d9ccc3d21288a24b0f71bce0d8&n=13')
INSERT [dbo].[TBLYonetici] ([id], [AdSoyad], [Bilgi], [Mail], [Facebook], [instagram], [Resim]) VALUES (2, N'Emre Güzey', N'Ben Patron Oğluyum iyerim içerim karılarla gezerim. Bizimle çalışmak isterseniz beklerim', N'Emre@gmail.com', NULL, NULL, N'https://i02.fotocdn.net/s111/196d2c13b36b6a2d/user_l/2475639210.jpg')
INSERT [dbo].[TBLYonetici] ([id], [AdSoyad], [Bilgi], [Mail], [Facebook], [instagram], [Resim]) VALUES (5, N'Guvanç Yazgulyyev', N'ad asdfasdfasd df adfa sdfsadf sdf adfas dfasdf sdf dfa sdfsadfa df asdfa sdfasdf asdf asdf asdf asdf sdf fasdf asdfa sfasdf asdf afr werewasdfas', N'Mr.Yazgulyyev@gmail.com', N'https://tr-tr.facebook.com/guwanch.yazgulyyew', N'https://www.instagram.com/kivancyazgu/?hl=tr', N'https://sun1-83.userapi.com/impf/c830209/v830209482/7d9dc/0IE3N0ZlZPU.jpg?size=400x0&quality=96&crop=0,0,900,900&sign=8e1d6fb0996046ac3a3fc00ebb0f3bcf&ava=1')
SET IDENTITY_INSERT [dbo].[TBLYonetici] OFF
SET IDENTITY_INSERT [dbo].[TBLYorum] ON 

INSERT [dbo].[TBLYorum] ([id], [AdSoyad], [Mail], [Mesaj], [Blogid]) VALUES (1, N'Mekan Hydyrov', N'Mekanhydyrov@gmail.com', N'Tokatta 6 sene yaşadım ama hiç yemedim güzel olduğunu çok duydum İnşallah bir gün:)', 2)
INSERT [dbo].[TBLYorum] ([id], [AdSoyad], [Mail], [Mesaj], [Blogid]) VALUES (2, N'Guvanç Yazgulyyev', N'Yazgulyyev@gmail.com', N'Gerçekten çok güzeldi tavsiye ederim', 2)
INSERT [dbo].[TBLYorum] ([id], [AdSoyad], [Mail], [Mesaj], [Blogid]) VALUES (3, N'Ayşe Kaya', N'ayse_ky@gmail.com', N'Merhaba Hizmetinizi Begendim, Verdiginiz Hizmet için teşekkür ederim :)', 2)
INSERT [dbo].[TBLYorum] ([id], [AdSoyad], [Mail], [Mesaj], [Blogid]) VALUES (4, N'Ayşe Kaya', N'ayse_ky@gmail.com', N'uuhu', 2)
INSERT [dbo].[TBLYorum] ([id], [AdSoyad], [Mail], [Mesaj], [Blogid]) VALUES (5, N'Cemal Kara', N'cemal_kr@gmail.com', N'Gerçekten tercih ereriim burayı', 1)
INSERT [dbo].[TBLYorum] ([id], [AdSoyad], [Mail], [Mesaj], [Blogid]) VALUES (8, N'fg', N'guga@gmail.com', N'fdfds', 2)
SET IDENTITY_INSERT [dbo].[TBLYorum] OFF
ALTER TABLE [dbo].[TBLSalonYorum]  WITH CHECK ADD  CONSTRAINT [FK_TBLSalonYorum_TBLSalonBlog] FOREIGN KEY([SalonBlogid])
REFERENCES [dbo].[TBLSalonBlog] ([id])
GO
ALTER TABLE [dbo].[TBLSalonYorum] CHECK CONSTRAINT [FK_TBLSalonYorum_TBLSalonBlog]
GO
ALTER TABLE [dbo].[TBLYorum]  WITH CHECK ADD  CONSTRAINT [FK_TBLYorum_TBLBlog] FOREIGN KEY([Blogid])
REFERENCES [dbo].[TBLBlog] ([id])
GO
ALTER TABLE [dbo].[TBLYorum] CHECK CONSTRAINT [FK_TBLYorum_TBLBlog]
GO
USE [master]
GO
ALTER DATABASE [KafeVT] SET  READ_WRITE 
GO
