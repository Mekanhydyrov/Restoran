using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TokatRestoran.Models.Entity;

namespace TokatRestoran.Controllers
{
    public class DugunSalonBlogController : Controller
    {
        KafeVTEntities1 db = new KafeVTEntities1();
        // GET: DugunSalonBlog
        public ActionResult Blog()
        {
            var dugunblog = db.TBLSalonBlog.Where(l => l.Durum == true).OrderByDescending(x => x.id).ToList();
            return View(dugunblog);
        }
        public ActionResult BlogDetay(int id)
        {
            var deger = db.TBLSalonBlog.Where(x => x.id == id).ToList();

            return View(deger);
        }

        public PartialViewResult YorumListele(int id)
        {
            var YorumDeger = db.TBLSalonYorum.Where(x => x.SalonBlogid == id).ToList();
            return PartialView(YorumDeger);
        }


        [HttpGet]
        public PartialViewResult YorumYap(int id)
        {
            ViewBag.deger = id;
            return PartialView("YorumYap");
        }

        [HttpPost]
        public PartialViewResult YorumYap(TBLSalonYorum s)
        {
            db.TBLSalonYorum.Add(s);
            db.SaveChanges();
            return PartialView();
        }
        public PartialViewResult SonYorumlar()
        {
            var deger = db.TBLSalonYorum.OrderByDescending(x => x.id).Take(5).ToList();
            return PartialView(deger);
        }
    }
}