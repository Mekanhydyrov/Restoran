using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TokatRestoran.Models.Entity;

namespace TokatRestoran.Controllers
{
    public class DugunSalonController : Controller
    {
        KafeVTEntities1 db = new KafeVTEntities1();
        // GET: DugunSalon
        public ActionResult Index()
        {
            var dugunsln = db.TBLSalon.ToList();
            return View(dugunsln);
        }

        public PartialViewResult SonBlogDugun()
        {
            var deger = db.TBLSalonBlog.Where(x => x.Durum == true).OrderByDescending(g => g.id).Take(1).ToList();
            return PartialView(deger);
        }

        public PartialViewResult SalonSonBlog()
        {
            var deger = db.TBLSalonBlog.Where(x => x.Durum == true).OrderByDescending(h => h.id).Take(8).ToList();             
                return PartialView(deger);
            
        }
    }
}