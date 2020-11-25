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

public partial class HuiFu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string SQL = "";
        bool iRet = false;
        if (Request["ID"] != null)
        {
            int ID = int.Parse(Request["ID"].ToString());
            SQL = "update TB_LiuYan set HuiFuNeiRong='" + this.WebEditor1.Text + "',HuiFuTime='" + DateTime.Now + "' where MessageID=" + ID;
            iRet = DBHelper.ExecSql(SQL);
            if (iRet)
            {
                Response.Redirect("LiuYanMangager.aspx");
                
            }
            else
            {
                Response.Write("<script>alert('对不起，操作失败！');document.location=document.location;</script>");
            }
        }

    }
}
