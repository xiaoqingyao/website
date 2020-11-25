using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace AllPower.Web.Admin
{
    public partial class OutLinkShow : AdminPage
    {
        public string OutUrl = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                AllPower.BLL.SysManage.ModuleNode nodeObj = new AllPower.BLL.SysManage.ModuleNode();
                DataTable dt = nodeObj.GetList("LISTBYNODECODE", AllPower.Common.Utils.getOneParams(NodeCode));
                if (dt.Rows.Count > 0)
                {
                    OutUrl = dt.Rows[0]["LinkUrl"].ToString();
                }
            }
        }
    }
}
