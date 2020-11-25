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

public partial class 前台_电影分类 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int i = 0;
        string myclass;
        myclass = Server.HtmlEncode(Request.QueryString["class"].ToString());
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        SqlCommand cmd = sql.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = @"select ArrangeID ,FilmID , FilmName,PictureURL from FilmArrange where Class = '" + myclass + "'";
        sql.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if (i == 0)
            {
                this.Image_1.ImageUrl = dr["PictureURL"].ToString();
                this.lab_moviename_1.Text = dr["FilmName"].ToString();
                this.Label_id_1.Text = dr["FilmID"].ToString();
                this.Image_1.Visible = true;
                this.lab_moviename_1.Visible = true;
                this.btn_detail_1.Visible = true;
                this.btn_addCart_1.Visible = true;
                this.Image_1.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_detail_1.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_addCart_1.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";

            }
            else if (i == 1)
            {
                this.Image_2.ImageUrl = dr["PictureURL"].ToString();
                this.lab_moviename_2.Text = dr["FilmName"].ToString();
                this.Label_id_2.Text = dr["FilmID"].ToString();
                this.Image_2.Visible = true;
                this.lab_moviename_2.Visible = true;
                this.btn_detail_2.Visible = true;
                this.btn_addCart_2.Visible = true;
                this.Image_2.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_detail_2.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_addCart_2.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";

            }
            else if (i == 2)
            {
                this.Image_3.ImageUrl = dr["PictureURL"].ToString();
                this.Label_id_3.Text = dr["FilmID"].ToString();
                this.lab_moviename_3.Text = dr["FilmName"].ToString();
                this.Image_3.Visible = true;
                this.lab_moviename_3.Visible = true;
                this.btn_detail_3.Visible = true;
                this.btn_addCart_3.Visible = true;
                this.Image_3.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_detail_3.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_addCart_3.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";

            }
            else if (i == 3)
            {
                this.Image_4.ImageUrl = dr["PictureURL"].ToString();
                this.lab_moviename_4.Text = dr["FilmName"].ToString();
                this.Label_id_4.Text = dr["FilmID"].ToString();
                this.Image_4.Visible = true;
                this.lab_moviename_4.Visible = true;
                this.btn_detail_4.Visible = true;
                this.btn_addCart_4.Visible = true;
                this.Image_4.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_detail_4.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_addCart_4.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";

            }
            else if (i == 4)
            {
                this.Image_5.ImageUrl = dr["PictureURL"].ToString();
                this.lab_moviename_5.Text = dr["FilmName"].ToString();
                this.Label_id_5.Text = dr["FilmID"].ToString();
                this.Image_5.Visible = true;
                this.lab_moviename_5.Visible = true;
                this.btn_detail_5.Visible = true;
                this.btn_addCart_5.Visible = true;
                this.Image_5.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_detail_5.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_addCart_5.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";

            }
            else if (i == 5)
            {
                this.Image_6.ImageUrl = dr["PictureURL"].ToString();
                this.lab_moviename_6.Text = dr["FilmName"].ToString();
                this.Image_6.Visible = true;
                this.Label_id_6.Text = dr["FilmID"].ToString();
                this.lab_moviename_6.Visible = true;
                this.btn_detail_6.Visible = true;
                this.btn_addCart_6.Visible = true;
                this.Image_6.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_detail_6.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_addCart_6.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";

            }
            else if (i == 6)
            {
                this.Image_7.ImageUrl = dr["PictureURL"].ToString();
                this.lab_moviename_7.Text = dr["FilmName"].ToString();
                this.Label_id_7.Text = dr["FilmID"].ToString();
                this.Image_7.Visible = true;
                this.lab_moviename_7.Visible = true;
                this.btn_detail_7.Visible = true;
                this.btn_addCart_7.Visible = true;
                this.Image_7.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_detail_7.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_addCart_7.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";

            }
            else if (i == 7)
            {
                this.Image_8.ImageUrl = dr["PictureURL"].ToString();
                this.lab_moviename_8.Text = dr["FilmName"].ToString();
                this.Label_id_8.Text = dr["FilmID"].ToString();
                this.Image_8.Visible = true;
                this.lab_moviename_8.Visible = true;
                this.btn_detail_8.Visible = true;
                this.btn_addCart_8.Visible = true;
                this.Image_8.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_detail_8.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_addCart_8.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";

            }
            else if (i == 8)
            {
                this.Image_9.ImageUrl = dr["PictureURL"].ToString();
                this.lab_moviename_9.Text = dr["FilmName"].ToString();
                this.Label_id_9.Text = dr["FilmID"].ToString();
                this.Image_9.Visible = true;
                this.lab_moviename_9.Visible = true;
                this.btn_detail_9.Visible = true;
                this.btn_addCart_9.Visible = true;
                this.Image_9.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_detail_9.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_addCart_9.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";


            }
            else if (i == 9)
            {
                this.Image_10.ImageUrl = dr["PictureURL"].ToString();
                this.lab_moviename_10.Text = dr["FilmName"].ToString();
                this.Label_id_10.Text = dr["FilmID"].ToString();
                this.Image_10.Visible = true;
                this.lab_moviename_10.Visible = true;
                this.btn_detail_10.Visible = true;
                this.btn_addCart_10.Visible = true;
                this.Image_10.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_detail_10.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_addCart_10.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";

            }
            else if (i == 10)
            {
                this.Image_11.ImageUrl = dr["PictureURL"].ToString();
                this.lab_moviename_11.Text = dr["FilmName"].ToString();
                this.Label_id_11.Text = dr["FilmID"].ToString();
                this.Image_11.Visible = true;
                this.lab_moviename_11.Visible = true;
                this.btn_detail_11.Visible = true;
                this.btn_addCart_11.Visible = true;
                this.Image_11.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_detail_11.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
            }
            else
            {
                this.Image_12.ImageUrl = dr["PictureURL"].ToString();
                this.lab_moviename_12.Text = dr["FilmName"].ToString();
                this.Label_id_12.Text = dr["FilmID"].ToString();
                this.Image_12.Visible = true;
                this.lab_moviename_12.Visible = true;
                this.btn_detail_12.Visible = true;
                this.btn_addCart_12.Visible = true;
                this.Image_12.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_detail_12.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";
                this.btn_addCart_12.PostBackUrl = "~/前台/MovieDetail.aspx?ArrangeID=" + dr["ArrangeID"].ToString() + "";

            }
            i++;
        }
        sql.Close();
        string temp;
        if (Request.Cookies["TicketBooking"] != null)
        {
            this.login_btn.Text = "注销";
            this.register_btn.Visible = false;
        }
        else
        {

            Session["username"] = "游客";
            this.login_btn.Text = "登陆";
            this.register_btn.Visible = true;
        }
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        int n = this.GridView1.SelectedIndex;
        string temp = this.GridView1.Rows[n].Cells[1].Text.ToString();
        string s = "~/前台/MovieDetail.aspx?ArrangeID=" + temp;
        Response.Redirect(s);
    }
}
