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

namespace OA.aspx.Moa.Work{ 
 public partial class TongXunLu: System.Web.UI.Page
{
    public List<ERPTongXunLu> EmailList = new List<ERPTongXunLu>();
    public string type = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            DataBindToGridview();
        }
    }
    public void DataBindToGridview()
    {
        DataEntityDataContext context = new DataEntityDataContext();
        FTD.BLL.ERPTongXunLu MyLanEmail = new FTD.BLL.ERPTongXunLu();
        type = Request.QueryString["TypeStr"].ToString().Trim();

        if (Request.QueryString["TypeStr"].ToString().Trim() == "公共通讯簿")
        {
            var T = context.ERPTongXunLu.Where(p => p.TypeStr == Request.QueryString["TypeStr"].ToString().Trim()).OrderByDescending(p => p.ID);
            EmailList = T.ToList();
        }
        else if (Request.QueryString["TypeStr"].ToString().Trim() == "个人通讯簿")
        {
            var T = context.ERPTongXunLu.Where(p => p.TypeStr == Request.QueryString["TypeStr"].ToString().Trim() && p.UserName == FTD.Unit.PublicMethod.GetSessionValue("UserName")).OrderByDescending(p => p.ID);
            EmailList = T.ToList();
        }
        else
        {
            //所有共享的通讯录
            var T = context.ERPTongXunLu.Where(p => p.IfShare == "是").OrderByDescending(p => p.ID);
            EmailList = T.ToList();
        }
    }

    protected void iButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("TongXunLuAdd.aspx?TypeStr=" + Request.QueryString["TypeStr"].ToString());
    }

}}