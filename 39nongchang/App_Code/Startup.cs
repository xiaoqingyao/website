using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(田园农场.Startup))]
namespace 田园农场
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
