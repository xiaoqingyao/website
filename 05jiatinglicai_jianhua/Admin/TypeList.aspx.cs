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

public partial class Admin_TypeList : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            InitData();
        }
    }
    protected void InitData()
    {
        SqlHelper mydata = new SqlHelper();
        GridView1.DataSource = mydata.GetDataReader("select * from MoenyClass");
        GridView1.DataBind();
    }
    //GridView控件RowDeleting事件
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlHelper mydata = new SqlHelper();

        string ID = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
        try
        {
            mydata.RunSql("delete  from MoenyClass  where  id=" + ID);


            Label4.Text = "删除成功！";
            GridView1.EditIndex = -1;
            InitData();
        }
        catch
        {


            Label4.Text = "删除失败！";
        }

    }
    //GridView控件RowUpdating事件
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlHelper mydata = new SqlHelper();
        string ID = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
        try
        {
            mydata.RunSql("update MoenyClass  set name ='" + ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName")).Text + "'  where id=" + ID);



            Label4.Text = "修改成功！";
            GridView1.EditIndex = -1;
            InitData();
        }
        catch
        {
            Label4.Text = "修改失败！";
        }

    }
    //GridView控件RowCanceling事件
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        InitData();
    }
    //GridView控件RowEditing事件
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        InitData();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string name = txtUser.Text.Trim();


        if (name.Length < 1)
        {

            alert.Alertjs("长度不能小于1位");

            return;
        }

        data.RunSql("insert into MoenyClass(name)values('" + txtUser.Text + "')");
        Label4.Text = "添加成功！";

        txtUser.Text = "";

        InitData();
    }
}



