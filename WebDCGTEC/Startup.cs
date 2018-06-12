using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebDCGTEC.Startup))]
namespace WebDCGTEC
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
