using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using TokatRestoran.Models.Entity;

namespace TokatRestoran.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        KafeVTEntities1 db = new KafeVTEntities1();

        // Kafe tablosunu Getirme Güncelleme Kısmı
        [Authorize]
        public ActionResult Index()
        {
            var deger = db.TBLKafe.ToList();
            return View(deger);
        }


        public ActionResult AdminKafeGetir(int id)
        {
            var kfgetr = db.TBLKafe.Find(id);
            return View("AdminKafeGetir", kfgetr);
        }

        public ActionResult KafeGuncelle(TBLKafe k)
        {
            var dd = db.TBLKafe.Find(k.id);
            dd.Baslik = k.Baslik;
            dd.Aciklama = k.Aciklama;
            dd.AltBaslik = k.AltBaslik;
            dd.Resim = k.Resim;
            db.SaveChanges();
            return RedirectToAction("Index");
        }


        // Kafeye yapılan blogları getirme ekleme silme Güncelleme Kısmı 
        [Authorize]
        public ActionResult AdminBlog()
        {
            var deger = db.TBLBlog.Where(x => x.Durum == true).ToList();
            return View(deger);
        }

        [Authorize]
        [HttpGet]
        public ActionResult BlogEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult BlogEkle(TBLBlog b)
        {
            b.Durum = true;
            db.TBLBlog.Add(b);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult BlogSil(int id)
        {
            var blsil = db.TBLBlog.Find(id);
            blsil.Durum = false;
            db.SaveChanges();
            return RedirectToAction("AdminBlog");
        }
        public ActionResult AdminKafeBlogGetir(int id)
        {
            var deger = db.TBLBlog.Find(id);
            return View("AdminKafeBlogGetir", deger);
        }

        public ActionResult AdminKafeBlogGuncelle(TBLBlog b)
        {
            var dd = db.TBLBlog.Find(b.id);
            dd.Baslik = b.Baslik;
            dd.Aciklama = b.Aciklama;
            dd.Resim = b.Resim;
            dd.Gun = b.Gun;
            dd.Ay = b.Ay;
            db.SaveChanges();
            return RedirectToAction("AdminBlog");
        }


        // Kafeye Yapılan Yorumları Getime, Silme, Güncelleme Kodları
        [Authorize]
        public ActionResult AdminKafeBlogYorum()
        {
            var deger = db.TBLYorum.ToList();
            return View(deger);
        }

        public ActionResult AdminKafeBlogYorumSil(int id)
        {
            var deger = db.TBLYorum.Find(id);
            db.TBLYorum.Remove(deger);
            db.SaveChanges();
            return RedirectToAction("AdminKafeBlogYorum");
        }

        public ActionResult AdminKafeBlogYorumGetir(int id)
        {
            var deger = db.TBLYorum.Find(id);
            return View("AdminKafeBlogYorumGetir", deger);
        }

        public ActionResult AdminKafeBlogYorumGuncelle(TBLYorum y)
        {
            var deger = db.TBLYorum.Find(y.id);
            deger.AdSoyad = y.AdSoyad;
            deger.Mesaj = y.Mesaj;
            deger.Mail = y.Mail;
            db.SaveChanges();
            return RedirectToAction("AdminKafeBlogYorum");
        }


        // Admin Hakkımızda Kısmı 
        [Authorize]
        public ActionResult AdminHakkimizda()
        {
            var deger = db.TBLHakkimizda.ToList();
            return View(deger);
        }
        public ActionResult AdminHakkimdaGetir(int id)
        {
            var deger = db.TBLHakkimizda.Find(id);
            return View("AdminHakkimdaGetir", deger);
        }

        public ActionResult AdminHakkindaGuncelle(TBLHakkimizda h)
        {
            var d = db.TBLHakkimizda.Find(h.id);
            d.Baslik = h.Baslik;
            d.DugunAciklama = h.DugunAciklama;
            d.KafeAciklama = h.KafeAciklama;
            db.SaveChanges();
            return RedirectToAction("AdminHakkimizda");
        }
        //Hakkında Yonetici Bilgileri işlemler
        [Authorize]
        public ActionResult HakkimizdaYonetici()
        {
            var deger = db.TBLYonetici.ToList();
            return View(deger);
        }
        public ActionResult HakkimizdaYoneticiGetir(int id)
        {
            var deger = db.TBLYonetici.Find(id);
            return View("HakkimizdaYoneticiGetir", deger);
        }
        public ActionResult HakkimizdaYoneticiGuncelle(TBLYonetici y)
        {
            var deger = db.TBLYonetici.Find(y.id);
            deger.AdSoyad = y.AdSoyad;
            deger.Bilgi = y.Bilgi;
            deger.Mail = y.Mail;
            deger.Facebook = y.Facebook;
            deger.instagram = y.instagram;
            deger.Resim = y.Resim;
            db.SaveChanges();
            return RedirectToAction("HakkimizdaYonetici");
        }
        [Authorize]
        [HttpGet]
        public ActionResult YoneticiEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult YoneticiEkle(TBLYonetici Y)
        {
            db.TBLYonetici.Add(Y);
            db.SaveChanges();
            return RedirectToAction("HakkimizdaYonetici");
        }
        public ActionResult YoneticiSil(int id)
        {
            var deger = db.TBLYonetici.Find(id);
            db.TBLYonetici.Remove(deger);
            db.SaveChanges();
            return RedirectToAction("HakkimizdaYonetici");
        }

        //Hakkımızda Memnunyet işlemler kısmı
        [Authorize]
        public ActionResult HakkimdaMemnunyet()
        {
            var deger = db.TBLYetenek.ToList();
            return View(deger);
        }

        [Authorize]
        [HttpGet]
        public ActionResult MemnunyetEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult MemnunyetEkle(TBLYetenek y)
        {
            db.TBLYetenek.Add(y);
            db.SaveChanges();
            return RedirectToAction("HakkimdaMemnunyet");
        }
        public ActionResult MemnunyetSil(int id)
        {
            var deger = db.TBLYetenek.Find(id);
            db.TBLYetenek.Remove(deger);
            db.SaveChanges();
            return RedirectToAction("HakkimdaMemnunyet");
        }

        public ActionResult MemnunyetGetir(int id)
        {
            var deger = db.TBLYetenek.Find(id);
            return View("MemnunyetGetir", deger);
        }

        public ActionResult MemnunyetGuncelle(TBLYetenek y)
        {
            var deger = db.TBLYetenek.Find(y.id);
            deger.YetenekAd = y.YetenekAd;
            deger.Derece = y.Derece;
            deger.Aciklama = y.Aciklama;
            db.SaveChanges();
            return RedirectToAction("HakkimdaMemnunyet");
        }

        // Dügün Salonu Kısmı 
        [Authorize]
        public ActionResult AdminSalon()
        {
            var deger = db.TBLSalon.ToList();
            return View(deger);
        }

        public ActionResult AdminSalonGetir(int id)
        {
            var dr = db.TBLSalon.Find(id);
            return View("AdminSalonGetir", dr);
        }

        public ActionResult AdminSalonGuncelle(TBLSalon s)
        {
            var d = db.TBLSalon.Find(s.id);
            d.Baslik = s.Baslik;
            d.AltBaslik = s.AltBaslik;
            d.Aciklama = s.Aciklama;
            d.Resim = s.Resim;
            db.SaveChanges();
            return RedirectToAction("AdminSalon");
        }

        // Dügün Salonu Blog Ekle Sil Güncelle kısmı
        [Authorize]
        public ActionResult AdminSalonBlog()
        {
            var deger = db.TBLSalonBlog.Where(x => x.Durum == true).ToList();
            return View(deger);
        }

        public ActionResult AdminSalonBlogSil(int id)
        {
            var deger = db.TBLSalonBlog.Find(id);
            deger.Durum = false;
            db.SaveChanges();
            return RedirectToAction("AdminSalonBlog");
        }

        [Authorize]
        [HttpGet]
        public ActionResult AdminSalonBlogEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AdminSalonBlogEkle(TBLSalonBlog s)
        {
            s.Durum = true;
            db.TBLSalonBlog.Add(s);
            db.SaveChanges();
            return RedirectToAction("AdminSalonBlog");
        }

        public ActionResult AdminSalonBlogGetir(int id)
        {
            var deger = db.TBLSalonBlog.Find(id);
            return View("AdminSalonBlogGetir", deger);
        }

        public ActionResult AdminSalonBlogGuncelle(TBLSalonBlog s)
        {
            var deger = db.TBLSalonBlog.Find(s.id);
            deger.Aciklama = s.Aciklama;
            deger.Baslik = s.Baslik;
            deger.Resim = s.Resim;
            deger.Tarih = s.Tarih;
            db.SaveChanges();
            return RedirectToAction("AdminSalonBlog");
        }

        // Dügün Salonuna yapıloan yorumları getirme Silme Güncelleme
        [Authorize]
        public ActionResult AdminSalonYorum()
        {
            var deger = db.TBLSalonYorum.ToList();
            return View(deger);
        }

        public ActionResult AdminSalonYorumSil(int id)
        {
            var deger = db.TBLSalonYorum.Find(id);
            db.TBLSalonYorum.Remove(deger);
            db.SaveChanges();
            return RedirectToAction("AdminSalonYorum");
        }

        public ActionResult AdminSalonYorumGetir(int id)
        {
            var deger = db.TBLSalonYorum.Find(id);
            return View("AdminSalonYorumGetir", deger);
        }

        public ActionResult AdminSalonYorumGuncelle(TBLSalonYorum s)
        {
            var deger = db.TBLSalonYorum.Find(s.id);
            deger.AdSoyad = s.AdSoyad;
            deger.Mail = s.Mail;
            deger.Yorum = s.Yorum;
            db.SaveChanges();
            return RedirectToAction("AdminSalonYorum");
        }

        // iletişim sayfası işlem kodları
        [Authorize]
        public ActionResult Adminiletisim()
        {
            var deger = db.TBLiletisim.ToList();
            return View(deger);
        }
        public ActionResult AdminiletisimSil(int id)
        {
            var deger = db.TBLiletisim.Find(id);
            db.TBLiletisim.Remove(deger);
            db.SaveChanges();
            return RedirectToAction("Adminiletisim");
        }

        // Adres sayfası işlemler kodu
        [Authorize]
        public ActionResult AdminAdres()
        {
            var deger = db.TBLAdres.ToList();
            return View(deger);
        }
        public ActionResult AdminAdresGetir(int id)
        {
            var deger = db.TBLAdres.Find(id);
            return View("AdminAdresGetir", deger);
        }
        public ActionResult AdminAdresGuncelle(TBLAdres a)
        {
            var deger = db.TBLAdres.Find(a.id);
            deger.Aciklama = a.Aciklama;
            deger.Telefon = a.Telefon;
            deger.Mail = a.Mail;
            deger.AcikAdres = a.AcikAdres;
            db.SaveChanges();
            return RedirectToAction("AdminAdres");
        }

        //Login İşlemleri


        // Login Güncelle Listele
        [Authorize]
        public ActionResult LoginListele()
        {
            var deger = db.TBLAdmin.Where(x => x.Durum == true).ToList();
            return View(deger);
        }

        public ActionResult LoginGetir(int id)
        {
            var deger = db.TBLAdmin.Find(id);
            return View("LoginGetir", deger);
        }

        public ActionResult LoginGuncelle(TBLAdmin a)
        {
            var deger = db.TBLAdmin.Find(a.id);
            deger.KullaniciAd = a.KullaniciAd;
            deger.Sifre = a.Sifre;
            deger.Mail = a.Mail;
            db.SaveChanges();
            return RedirectToAction("LoginListele");
        }
    }
}