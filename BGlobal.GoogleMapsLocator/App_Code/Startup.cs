using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BGlobal.GoogleMapsLocator.Startup))]
namespace BGlobal.GoogleMapsLocator
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
