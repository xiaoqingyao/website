using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class ProInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //if (Session["_username"] == null)
        //{
        //    Common.MessageAlert.Alert(Page, "对不起，你还没有登入！！");
        //}
        //    //引用shoplist
        //else
        //{
            Model.product mypro = new Model.product();
            mypro.id = Convert.ToInt32(Request.QueryString["uid"].ToString());
            BLL.BLLshoplist blll = new BLL.BLLshoplist();
            SqlDataReader dr = blll.readpro(mypro);
            DataTable dt;
            if (Session["dt"] == null)
            {
           dt = new DataTable();
       
            
            dt.Columns.Add("id", typeof(Int32));
            dt.Columns.Add("title", typeof( String ));
            dt.Columns.Add("localprice", typeof(Double));
            dt.Columns.Add("posttime", typeof(String));   
            dt.Columns .Add ("buycount", typeof (Int32));
            dt.Columns.Add("sumprice", typeof(Int32));
            }
            else
            {
                dt = (DataTable)Session["dt"];
            }
            DataRow row = dt.NewRow();
            if (dr.Read())
            {
                row["id"] = Convert.ToInt32(dr["_id"].ToString());
                row["title"] = Convert.ToString (dr["_title"].ToString());
                row["localprice"] = Convert.ToDouble(dr["_localprice"].ToString());
                row["posttime"] = Convert.ToString(dr["_posttime"].ToString());
                row["buycount"] = 1;
                row["sumprice"] = Convert.ToDouble(dr["_localprice"].ToString());
                dt.Rows.Add(row);
            }
            dr.Close();
            Session["dt"] = dt;
            Response.Redirect("shoplist.aspx");

        }
    //}
}
