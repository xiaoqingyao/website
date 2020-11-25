using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class PicList : System.Web.UI.Page
{
    protected string tid = string.Empty, key = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        tid = Request.QueryString["tid"];
        key = Request.QueryString["key"];
        if (!IsPostBack)
        {
            string where = " where 1=1";
            
            if (!string.IsNullOrEmpty(tid))
            {
                where += " and PicClassId=" + tid;
            }

            if (!string.IsNullOrEmpty(key))
            {
                where += " and PicName like '%" + key + "%'";
                ltlArea.Text = "搜索：" + key;
            }
            
            //产品列表
            rptList.DataSource = DB.getDataTable("select * from Pic " + where + " order by PicId desc");
            rptList.DataBind();

        }
    }
}
