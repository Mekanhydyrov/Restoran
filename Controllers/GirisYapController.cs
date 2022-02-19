using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TokatRestoran.Models.Entity;

namespace TokatRestoran.Controllers
{
    public class GirisYapController : Controller
    {
        // GET: GirisYap
        KafeVTEntities1 db = new KafeVTEntities1();  
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(TBLAdmin p)
        {
            var admngirs = db.TBLAdmin.FirstOrDefault(f => f.Mail == p.Mail
              && f.Sifre == p.Sifre);
            if (admngirs != null)
            {
                System.Web.Security.FormsAuthentication.SetAuthCookie(admngirs.Mail, false);
                Session["Mail"] = admngirs.Mail.ToString();
                return RedirectToAction("Index", "Admin");
            }
            else
            {
                return View();
            }
        }
    }
}