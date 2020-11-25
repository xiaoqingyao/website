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

public partial class Admin_companyManager : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    CtlCompany cc = new CtlCompany();
    EntCompany ec = new EntCompany();//实体化对象
    private static string sql;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            //判断Session是否为空
            this.pnlAddMark.Visible = true;
            sql = "select * from g_company";
            gvDataBind(sql);
        }
    }
    protected void ibtnOk_Click(object sender, ImageClickEventArgs e)
    {
        //传值到实体
        ec.ConpanName = this.txtCompanyName.Text;
        ec.ContactMan = this.txtContactMan.Text;
        ec.Address = this.txtAddress.Text;
        ec.Phone = this.txtPhone.Text;
        DataTable dt = new DataTable();
        dt = cc.CheckCompany(ec);
        if (dt.Rows.Count == 0)//判断公司名是否存在
        {
            if (cc.AddCompany(ec))//调用添加的方法
            {
                gvDataBind(sql);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('添加成功！');</script>");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('添加失败！');</script>");
            }
        }
        else
        {
            //公司名存在跳到修改页面
            string companyid = System.Convert.ToString(dt.Rows[0][0]);
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>var bRef=window.showModalDialog('./changecompany.aspx?cid=" + companyid + "','','dialogHeight:220px;dialogWidth:450px;help:no;toolbar:no;status:no;');if(bRef==true){window.location=window.location;}</script>");

        }
    }
   
    protected void ibtnCancel_Click(object sender, ImageClickEventArgs e)
    {
        this.txtCompanyName.Text = "";
        this.txtContactMan.Text = "";
        this.txtAddress.Text = "";
        this.txtPhone.Text = "";
    }
    protected void gvCompany_RowDeleting(object sender, GridViewDeleteEventArgs e)//执行删除
    {
        int i = e.RowIndex;
        string companyid = this.gvCompany.Rows[i].Cells[0].Text.ToString();
        if (cc.DeleteComany(companyid))
        {
            gvDataBind(sql);
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('删除成功！');</script>");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language='Javascript'>alert('删除失败！');</script>");
        }
    }
    protected void gvCompany_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex < 0) return;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onclick", "if(window.oldtr!=null){window.oldtr.runtimeStyle.cssText='';}this.runtimeStyle.cssText='background-color:Yellow';window.oldtr=this;");
            ImageButton ib = (ImageButton)e.Row.FindControl("ibtndelete");
            ib.Attributes.Add("onclick", "return confirm('此操作不可逆，您确定要删除所选的数据吗？');");
        }
    }
    private void gvDataBind(string sql)//   对gvcompany数据绑定
    {
        //string sql = "select * from g_company";
        DataTable dt = new DataTable();
        dt = DB.RunDataSet(sql).Tables[0];
        this.gvCompany.DataSource = dt;
        this.gvCompany.DataBind();
    }
    protected void gvCompany_RowEditing(object sender, GridViewEditEventArgs e)//修改公司信息
    {
        int i = e.NewEditIndex;
        string companyid = this.gvCompany.Rows[i].Cells[0].Text.ToString();
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>var bRef=window.showModalDialog('./changecompany.aspx?cid=" + companyid + "','','dialogHeight:220px;dialogWidth:450px;help:no;toolbar:no;status:no;');if(bRef==true){window.location=window.location;}</script>");
    }
    protected void gvCompany_RowUpdating(object sender, GridViewUpdateEventArgs e)//给该公司添加产品
    {
        int i = e.RowIndex;
        string companyid = this.gvCompany.Rows[i].Cells[0].Text.ToString();
        string companyname = this.gvCompany.Rows[i].Cells[1].Text.ToString();

    }
    protected void ibtnSreach_Click(object sender, ImageClickEventArgs e)
    {
        if (this.txtSechCompanyName.Text == "")
        {
            sql = "select * from g_company";
            gvDataBind(sql);
        }
        else
        {
            sql = "select * from g_company where companyName='" + this.txtSechCompanyName.Text + "'";
            gvDataBind(sql);
        }
    }
}
