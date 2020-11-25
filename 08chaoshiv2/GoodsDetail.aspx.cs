using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class GoodsDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int id = Convert.ToInt32(Request.QueryString["goodsid"]);
            string Sql = "select * from View_1 where GoodsID=" + id;
            DataSet result = DBHelper.GetDataSet(Sql);
            DataTable dt = result.Tables[0];
            this.Label2.Text = dt.Rows[0]["GoodsName"].ToString();
            this.Label1.Text = dt.Rows[0]["TypeName"].ToString();
            this.Label4.Text = dt.Rows[0]["Price"].ToString();
            this.Label5.Text = dt.Rows[0]["Introduce"].ToString();
            this.Label3.Text = dt.Rows[0]["business"].ToString();
            this.Label6.Text = dt.Rows[0]["Stock"].ToString();



            this.Image10.ImageUrl = dt.Rows[0]["GoodsPicture"].ToString();
            string SQLPJ = "select * from TB_PingJia where GoodsID=" + id;
            this.GridView1.DataSource = DBHelper.GetDataSet(SQLPJ);
            this.GridView1.DataBind();
        } 
    } 


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["MemberName"] != null)
        {

            int goodsid = Convert.ToInt32(Request.QueryString["goodsid"]);
            float price = Convert.ToSingle(this.Label4.Text);
            //添加商品到表tb_BuyInfo
            BuyCar.AddShopCart(goodsid, price, Int32.Parse(Session["MemberID"].ToString()), 1);
            //提示添加成功
            Response.Write("<script>alert('恭喜您，添加成功！');document.location=document.location;</script>");   
            

        } 
        else //没有登陆。提示：请先登录，谢谢合作！
        {
            Response.Write("<script>alert('请先登录，谢谢合作！');document.location=document.location;</script>");
        } 
    } 
} 