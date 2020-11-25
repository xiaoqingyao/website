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

public partial class fileManage_inceptFile : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true);
        if (Session["loginName"] == string.Empty)
        {
            bc.MessageBox("该用户在线20分钟,没有操作任何动作,即将返回到系统主页!");
            Response.Redirect("../Index.aspx");
        }
        if (!IsPostBack)
        {
            if (Session["loginName"].ToString() == "admin")
            {
                DataList1.DataSource = bc.GetDataSet("select * from [file] order by fileTime desc", "file");
                DataList1.DataKeyField = "fileid";
                DataList1.DataBind();
                RadioButton2.Enabled = false;
                RadioButton1.Enabled =false;
                return; 
            }
            else
            {
                DataList1.DataSource = bc.GetDataSet("select * from [file] where examine='已接收' and fileAccepter='" + Session["loginName"].ToString() + "' order by fileTime desc", "file");
                DataList1.DataKeyField = "fileid";
                DataList1.DataBind();
            }
        }
        if (RadioButton1.Checked)
        {
            DataList1.DataSource = bc.GetDataSet("select * from [file] where examine='未接收' and fileAccepter='" + Session["loginName"].ToString() + "' order by fileTime desc", "file");
            DataList1.DataKeyField = "fileid";
            DataList1.DataBind();
        }
        if (RadioButton2.Checked)
        {
            DataList1.DataSource = bc.GetDataSet("select * from [file] where examine='已接收' and fileAccepter='" + Session["loginName"].ToString() + "' order by fileTime desc", "file");
            DataList1.DataKeyField = "fileid";
            DataList1.DataBind();
        }
    }
    protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
    {
        bc.ExecSQL("UPDATE [file] SET examine = '已接收' WHERE fileID ='" + (int)DataList1.DataKeys[e.Item.ItemIndex] + "'");
        DataList1.DataSource = bc.GetDataSet("select * from [file] where fileAccepter='" + Session["loginName"].ToString() + "' order by fileTime desc", "file");
        DataList1.DataKeyField = "fileid";
        DataList1.DataBind();
    }
}
