using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data ;

public partial class Del : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Load += new System.EventHandler(Page_Load);
     
            string connString = "Data Source=.;Initial Catalog=XQWY;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connString);
            connection.Open();
            string theTag;
            theTag = Request.QueryString ["ID"];//获取所要删除的留言信息ID
            //执行删除操作
            string sql = "delete from [LYSheet] where ID="+Convert.ToInt16(theTag)+"";

            SqlCommand command = new SqlCommand(sql, connection);
            SqlDataReader dataReader = command.ExecuteReader();
            Response.Redirect("main1.aspx");
            connection.Close();
       
       
    }
   
  
}