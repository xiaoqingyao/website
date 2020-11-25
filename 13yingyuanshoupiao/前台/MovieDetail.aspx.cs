using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class 前台_MovieDetail : System.Web.UI.Page
{
    string tempID = " ";
    string[] det = new string[4];
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["username"] == null)
            Response.Redirect("~/前台/Login.aspx");
       
        
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        tempID = Server.HtmlEncode(Request.QueryString["ArrangeID"]);
        string strSQL = @"select * from FilmArrange where ArrangeID = '" + tempID + "'";
        sql.Open();
        SqlCommand cmd = sql.CreateCommand();
        cmd.CommandText = strSQL;
        SqlDataReader dr = cmd.ExecuteReader();
        string tempName="";
        while (dr.Read())
        {
            tempName = dr["FilmName"].ToString();
            det[0] = tempName;
           
          
            this.Lab_Price.Text = dr["Price"].ToString();
        }
        dr.Close();
        strSQL = "select * from Film where ";
        strSQL += "FilmName = '" + tempName + "'";
        cmd.CommandText = strSQL;
        dr = cmd.ExecuteReader();
        dr.Read();
        this.Lab_director.Text = dr["Dircetor"].ToString();
        this.Lab_leadingActor.Text = dr["Protagonist"].ToString();
        this.Image1.ImageUrl = dr["pictureURL"].ToString();
        det[1] = dr["pictureURL"].ToString(); ;
        this.Label_jianjie.Text = dr["BriefIntro"].ToString();
        dr.Close();
        this.movieName_lab.Text = tempName;
        sql.Close();
        if (Session["username"] != null)
        {
            if (Session["username"].ToString() != "游客")
            {

                this.Label2.Text = Session["username"].ToString();
                this.Label2.Visible = true;
                this.register_btn.Visible = false;
                this.login_btn.Text = "注销";
                this.Button2.Visible = true;
                this.Button2.PostBackUrl = "~/前台/下单.aspx?FilmName = " + det[0] + "&PictureURL  = " + det[1];
            }
            else
            {
                this.register_btn.Visible = true;
                Session["username"] = "游客";
                this.login_btn.Text = "登陆";
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
      
    }
    protected void login_btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/前台/Login.aspx");
    }
}
