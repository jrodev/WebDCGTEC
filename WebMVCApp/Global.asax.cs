using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebMVCApp
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            RazorViewEngine re = ViewEngines.Engines.OfType<RazorViewEngine>().FirstOrDefault();
            if (re != null)
            {
                var newsPaths = new[] {
                    "~/Areas/{2}/Views/Pages/{1}/{0}.cshtml"//,"~/Areas/{2}/Views/Shared/Partials/{0}.cshtml"
                };
                //re.PartialViewLocationFormats = re.PartialViewLocationFormats.Union(newsPaths).ToArray();
                re.AreaViewLocationFormats = re.AreaViewLocationFormats.Union(newsPaths).ToArray();
            }
        }
    }
}
