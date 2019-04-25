using CodeChallenge.Models;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;

namespace CodeChallenge.Controllers
{
    public class HomeController : Controller
    {
        ModelContext db = new ModelContext();
        public ActionResult Index()
        {
            List<User> UserList = db.Users.ToList();

            ViewBag.UserList = new SelectList(UserList, "Id", "FullName");

            return View();
        }

        [HttpGet]
        public JsonResult GetTableData(int userId)
        {
            //query by UserId and return new object
            var results = (from u in db.UserProjects
                           where u.UserId == userId                           
                           select new 
                           {
                               ProjectId = u.ProjectId,
                               StartDate = u.Project.StartDate,
                               TimeToStart = DbFunctions.DiffDays(u.Project.StartDate, u.AssignedDate),
                               EndDate = u.Project.EndDate,
                               Credits = u.Project.Credits,
                               Status = u.IsActive,
                           }).ToList();              
            
            return Json(results, JsonRequestBehavior.AllowGet);
        }

    }
}