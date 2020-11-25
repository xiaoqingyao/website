using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllPower.WEB.SysAdmin.Template
{
    public partial class CreateLable : AllPower.Web.Admin.AdminPage 

    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                AllPower.BLL.Template.Lable lableBll = new AllPower.BLL.Template.Lable();
                string path = AllPower.Template.LabelUtils.GetTemplateProjectPath(SiteID);  //当前模板的位置
                lableBll.CreateDiscoverLable(path + "/LabelTemp", SiteID.ToString());
            }
        }

        protected void bntCreate_Click(object sender, EventArgs e)
        {
            AllPower.BLL.Template.Lable lableBll = new AllPower.BLL.Template.Lable();
            string path= AllPower.Template.LabelUtils.GetTemplateProjectPath(SiteID);  //当前模板的位置
            lableBll.CreateDiscoverLable(path + "/LabelTemp", SiteID.ToString ());
        }
    }
}
