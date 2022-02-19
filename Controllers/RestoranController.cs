using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TokatRestoran.Models.Entity;

namespace TokatRestoran.Controllers
{
    public class RestoranController : Controller
    {
        // GET: Restoran
        KafeVTEntities1 db = new KafeVTEntities1();
        public ActionResult Index()
        {
            var deger = db.TBLKafe.ToList();
            return View(deger);
        }
        public ActionResult Hakkimizda()
        {
            var deger = db.TBLHakkimizda.ToList();
            return View(deger);
        }
        public PartialViewResult Memnunyet()
        {
            var deger = db.TBLYetenek.ToList();
            return PartialView(deger);
        }
        [HttpGet]
        public ActionResult iletisim()
        {
            return View();
        }

        [HttpPost]
        public ActionResult iletisim(TBLiletisim k)
        {
            db.TBLiletisim.Add(k);
            db.SaveChanges();
            return RedirectToAction("Index","Restoran");
        }

        public PartialViewResult iletisimAdres()
        {
            var iltadrs = db.TBLAdres.ToList();
            return PartialView(iltadrs);
        }

        public PartialViewResult iletisimAcikAdres()
        {
            var iltadrs = db.TBLAdres.ToList();
            return PartialView(iltadrs);
        }
        public PartialViewResult Yonetici()
        {
            var deger = db.TBLYonetici.ToList();
            return PartialView(deger);
        }
        public PartialViewResult KafeAltBlog()
        {
            var deger = db.TBLBlog.OrderByDescending(x=>x.id).Where(g=>g.Durum==true).Take(8).ToList();
            return PartialView(deger);
        }
        public PartialViewResult AdresLaut()
        {
            var deger = db.TBLAdres.ToList();
            return PartialView(deger);
        }
       public PartialViewResult AnaSlayder()
        {
            var deger = db.TBLBlog.Where(x=>x.Durum==true).ToList();
            return PartialView(deger);
        }
    }
}