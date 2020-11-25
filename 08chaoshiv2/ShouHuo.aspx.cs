using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ShouHuo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string orderid = Request.QueryString["orderid"];
            string SQL = "select * from tb_Goods where GoodsID in(select GoodsID from  tb_OrderDetail where OrderID='" + orderid + "')";
            DataSet ds = DBHelper.GetDataSet(SQL);
            this.DataList3.DataSource = ds;
            this.DataList3.DataBind();
          
        }
    } 

 

 
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
      
        for (int i = 0; i < this.DataList3.Items.Count; i++)
        {
            //取键值 
          string  xxid = this.DataList3.DataKeys[i].ToString();
            //这个就是取到DATALIST里面的控件,其他的控件也类似于此 
            TextBox mybox = (TextBox)this.DataList3.Items[i].FindControl("TextBox1");
            if (mybox.Text != "")
            {
                string sql = "insert into TB_PingJia(GoodsID,PingJia,UserName) values('" + xxid + "','" + mybox.Text + "','" + Session["MemberName"].ToString()+ "')";
                DBHelper.ExecSql(sql);
            }

        }
          string orderid = Request.QueryString["orderid"];
          string SQL = "update tb_Order set OrderState='已收货' where OrderID='" + orderid + "'";
          DBHelper.ExecSql(SQL);
          Response.Write("<script>javascript:alert('评价成功');</script>");
    }
} 