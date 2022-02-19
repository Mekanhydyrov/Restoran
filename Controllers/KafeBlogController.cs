using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TokatRestoran.Models.Entity;

namespace TokatRestoran.Controllers
{
    public class KafeBlogController : Controller
    {
        // GET: KafeBlog
        KafeVTEntities1 db = new KafeVTEntities1();

        public ActionResult Blog()
        {
            var deger = db.TBLBlog.Where(k => k.Durum == true).ToList();
            return View(deger);
        }
        public ActionResult BlogDetay(int id)
        {
            var deger = db.TBLBlog.Where(x => x.id == id).ToList();

            return View(deger);
        }
        public PartialViewResult YorumListele(int id)
        {
            var YorumDeger = db.TBLYorum.Where(x => x.Blogid == id).ToList();
            return PartialView(YorumDeger);
        }

        [HttpGet]
        public PartialViewResult YorumYap(int id)
        {
            ViewBag.deger = id;
            return PartialView("YorumYap");
        }

        [HttpPost]
        public PartialViewResult YorumYap(TBLYorum y)
        {
            db.TBLYorum.Add(y);
            db.SaveChanges();
            return PartialView();
        }
        public PartialViewResult SonYorumlar()
        {
            var deger = db.TBLYorum.OrderByDescending(x => x.id).Take(5).ToList();
            return PartialView(deger);
        }
    }
}