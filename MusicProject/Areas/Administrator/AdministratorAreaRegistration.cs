using System.Web.Mvc;

namespace MusicProject.Areas.Administrator
{
    public class AdministratorAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Administrator";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Administrator_default",
                "Administrator/{controller}/{action}/{id}",
                new { controller="DashBoard", action = "Index", id = UrlParameter.Optional },
                new[] { "MusicProject.Areas.Administrator.Controllers" }
            );
        }
    }
}