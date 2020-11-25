using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

public partial class LanEmail_LanEmailShou : System.Web.UI.Page
{
    public List<ERPLanEmail> EmailList = new List<ERPLanEmail>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview();
        }
    }
    public void DataBindToGridview()
    {
        DataEntityDataContext context = new DataEntityDataContext();
        ZWL.BLL.ERPLanEmail MyLanEmail = new ZWL.BLL.ERPLanEmail();
       var T= context.ERPLanEmail.Where(p => p.ToUser == ZWL.Common.PublicMethod.GetSessionValue("UserName") && (p.EmailState == "未读" || p.EmailState == "已读")).OrderByDescending(p => p.ID);
        EmailList=T.ToList();
    }
  
    protected void GVData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ZWL.Common.PublicMethod.GridViewRowDataBound(e);
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        DataBindToGridview();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("LanEmailAdd.aspx");
    }


}
