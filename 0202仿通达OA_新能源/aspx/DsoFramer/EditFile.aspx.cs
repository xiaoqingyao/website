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

namespace OA.aspx.DsoFramer{ 
 public partial class EditFile: System.Web.UI.Page
{
    public string FileType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            this.HyperLink1.NavigateUrl = "../UpLoadFile/" + Request.QueryString["FilePath"].ToString();
            this.HyperLink1.Text = "[" + FTD.DBUnit.DbHelperSQL.GetSHSL("select OldName from ERPSaveFileName where NowName='" + Request.QueryString["FilePath"].ToString().Replace("MailAttachments/", "") + "'") + "]";
            FileType = Request.QueryString["FilePath"].ToString().Remove(0, Request.QueryString["FilePath"].ToString().LastIndexOf('.') + 1);
            //if (FileType.ToLower().Trim() == "doc" || FileType.ToLower().Trim() == "xls" || FileType.ToLower().Trim() == "ppt")
            //{

            //}
            //else
            //{
            //    Response.Write("<script>alert('该文件格式不能进行在线编辑！');window.close();</script>");
            //}
        }
        catch
        {
            Response.Write("<script>alert('该文件格式不能进行在线编辑！');window.close();</script>");
        }
    }
}
}