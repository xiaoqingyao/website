using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MemberName"] != null)
        {
            //会员没有退出登陆
            divLogin.Visible = false;
            divShow.Visible = true;
        }
        if (!IsPostBack)
        {
            string SqlType = "select top 10 * from tb_GoodsType order by TypeID desc";
            DataSet ds = DBHelper.GetDataSet(SqlType);
            this.GridView2.DataSource = ds.Tables[0];
            this.GridView2.DataBind();


            string SQLGongGao = "select top 10 * from tb_News order by NewsDate desc";
            DataSet dsGongGao = DBHelper.GetDataSet(SQLGongGao);
            this.GridView1.DataSource = dsGongGao.Tables[0];
            this.GridView1.DataBind();


            string sql2 = "SELECT TOP (10) GoodsID, GoodsName, GoodsPicture,sales FROM tb_Goods   ORDER BY sales DESC";
            DataSet result2 = DBHelper.GetDataSet(sql2);

            this.DataList1.DataSource = result2.Tables[0];
            this.DataList1.DataBind();


            string SQLNew = "SELECT TOP (10) GoodsID, GoodsName, GoodsPicture,sales FROM tb_Goods   ORDER BY AddDate DESC";
            DataSet result3 = DBHelper.GetDataSet(SQLNew);

            this.DataList2.DataSource = result3.Tables[0];
            this.DataList2.DataBind();


        }

    }
    protected void btLogin_Click(object sender, EventArgs e)
    {
        if (txtYzm.Text.Trim().Equals(""))
        {
            Response.Write("<script language='javascript'>alert('请输入验证码！');</script>");
            return;
        }
        if (Session["VNum"] == null)
        {

            Response.Redirect("logindex.aspx");
        }
        else if (this.txtYzm.Text.Trim() == "")
        {
            Response.Write("<script language='javascript'>alert('请输入验证码！');</script>");
            txtYzm.Focus();
        }
        else if (this.txtYzm.Text.Trim() != Session["VNum"].ToString().Trim())
        {
            Response.Write("<script language='javascript'>alert('验证码错误！');</script>");
            txtYzm.Focus();
        }

        string membername, pwd;
        membername = this.txtMemberName.Text.Trim();
        pwd = this.txtPWD.Text;


        string sql1 = "select * from tb_Member where MemberName ='" + membername + "' and MemberPwd ='" + pwd + "'";

        DataSet ds1 = DBHelper.GetDataSet(sql1);


        if (ds1.Tables[0].Rows.Count >= 1)
        {
            //存在该用户
            Session["MemberName"] = ds1.Tables[0].Rows[0][1];//将登录的会员编号和会员名称用session变量保存，以备后用
            Session["MemberID"] = ds1.Tables[0].Rows[0]["MemberID"];//将登录的会员编号和会员名称用session变量保存，以备后用
            this.divLogin.Visible = false;
            this.divShow.Visible = true;
        }
        else
        {
            //该用户不存在
            Response.Write("<script language='javascript'>alert('错误的用户名或者密码！请重新输入！');</script>");
            Response.Write("<script>document.location=document.location;</script>");//执行后当前页面字体会变大,解决办法是加入当前这句代码
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserReg.aspx");
    }
    protected void linkbtSeeOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("seeorder.aspx");
    }
    protected void linkbtUpt_Click(object sender, EventArgs e)
    {
        Response.Redirect("UpdateUserInfo.aspx");
    }
    protected void linkbtExit_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();//丢弃session
        Response.Redirect("Default.aspx");//网页定向到首页
    }
    protected void dlstGoods_ItemCommand(object source, DataListCommandEventArgs e)
    {

    }


    protected void LinkButton7_Click(object sender, EventArgs e)
    {

    }

    protected void btn_Search_Click(object sender, EventArgs e)
    {
        string name = this.Name.Text.Trim();
        if (string.IsNullOrEmpty(name))
        {
            return;
        }
        Response.Redirect("~/ClassGoods.aspx?Name=" + name);
    }
}
