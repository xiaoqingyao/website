using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AllPower.Model;
using AllPower.Web.Admin;

namespace AllPower.WEB.SysAdmin.Template
{
    public partial class OtherType : AdminPage
    {
        public string imgUrl = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindNodeCode();
            }
            imgUrl = GetUploadImgUrl();        
        }

        private void BindNodeCode()
        {
            SelectParams parms=new SelectParams();
            parms.I1=SiteID;       
            parms.S1="K_U_Commend";
            DataTable moduleDt = new AllPower.BLL.SysManage.ModuleNode().GetList("LISTBYTABLENAME", parms); //栏目名称
            Menu.DataSource = moduleDt;
            Menu.DataValueField = "NodeCode";
            Menu.DataTextField = "NodeName";
            Menu.DataBind();
        }
    }
}
