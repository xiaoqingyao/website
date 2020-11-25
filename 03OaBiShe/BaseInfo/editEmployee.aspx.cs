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
using System.IO;

public partial class BaseInfo_editEmployee : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true);
        GridView1.DataSource = bc.GetDataSet("select * from employee", "employee");
            GridView1.DataKeyNames = new String[] { "id" };
            GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //获取要清除相片文件的名称（服务器）
        DataSet ds = bc.GetDataSet("select * from employee where id=" + this.GridView1.DataKeys[e.RowIndex].Value.ToString() + "", "employee");
        DataRow[] row = ds.Tables[0].Select();
        
        //清除数据
        if (bc.ExecSQL("delete from employee where id=" + this.GridView1.DataKeys[e.RowIndex].Value.ToString() + ""))
        {
            GridView1.DataSource = bc.GetDataSet("select * from employee", "employee");
            GridView1.DataKeyNames = new String[] { "id" };
            GridView1.DataBind();
            //开始删除文件
            foreach (DataRow rs in row)  //将检索到的数据逐一,循环添加到Listbox1中
            {
                FileInfo file = new FileInfo(Server.MapPath(rs["photoPath"].ToString()));
                file.Delete();
            }
        }
        else
        {
            Response.Write(bc.MessageBox("本数据与其他数据表存在关系暂时不能清除!"));
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataKeyNames = new String[] { "id" };
        GridView1.DataBind();
        
    }
}
