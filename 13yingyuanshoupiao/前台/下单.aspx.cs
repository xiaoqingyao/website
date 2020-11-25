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

public partial class 前台_下单 : System.Web.UI.Page
{
    string[] det = new string[6];
    string seat;
    int filmrow = 0;
    public DataTable GetTable()
    {
        DataTable f = new DataTable();
        DataColumn eid = new DataColumn("编号");
        eid.DataType = typeof(string);
        eid.Unique = true;
        f.Columns.Add(eid);

        /*DataColumn name = new DataColumn("电影名称");
        name.DataType = typeof(string);
        f.Columns.Add(name);*/

        DataColumn theater = new DataColumn("电影院名称");
        theater.DataType = typeof(string);
        f.Columns.Add(theater);
        DataColumn room = new DataColumn("放映厅");
        room.DataType = typeof(string);
        f.Columns.Add(room);

        DataColumn time = new DataColumn("播放时间");
        time.DataType = typeof(string);
        f.Columns.Add(time);


        DataColumn sum = new DataColumn("乘余票数");
        sum.DataType = typeof(string);
        f.Columns.Add(sum);


        DataColumn price = new DataColumn("价格");
        price.DataType = typeof(string);
        f.Columns.Add(price);

        f.PrimaryKey = new DataColumn[] { eid };
        return f;

       
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null && Session["username"].ToString() != "游客")
        {
            this.login_btn.Text = "注销";
            this.Image_1.ImageUrl = Server.HtmlEncode(Request.QueryString["PictureURL"]);
            this.Label4.Text = Server.HtmlEncode(Request.QueryString["PictureURL"]);
            this.Label3.Text = Server.HtmlEncode(Request.QueryString["FilmName"]);
            this.Label2.Text = Session["username"].ToString();
            string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sql = new SqlConnection();
            sql.ConnectionString = strCon;
            SqlCommand cmd = sql.CreateCommand();
            string s = Server.HtmlEncode(Request.QueryString["FilmName"]);
            this.Label4.Text += s;
            string strSQL = @"select * from FilmArrange where FilmName = '" + s + "'";
            cmd.CommandText = strSQL;
            sql.Open();
            DataTable film;
            film = GetTable();
            SqlDataReader dr = cmd.ExecuteReader();        
            while (dr.Read())
            {
                DataRow r = film.NewRow();
                int n = int.Parse(dr["TotalPollNum"].ToString()) - int.Parse(dr["SaledNum"].ToString());
                r["编号"] = dr["ArrangID"].ToString();
                r["电影院名称"] = dr["theaterName"].ToString();
                r["放映厅"] = dr["SRoomName"].ToString();
                r["播放时间"] = dr["PlayTime"].ToString();
                r["乘余票数"] = n.ToString();
                r["价格"] = dr["Price"].ToString();
                this.DropDownList2.Items.Add(dr["ArrangID"].ToString());
                film.Rows.Add(r);
                filmrow++;

            }
            dr.Close();
            this.GridView1.DataSource = film;
            this.GridView1.DataBind();
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        string n = this.DropDownList2.SelectedValue;
        string strSQL = @"select * from FilmArrange where FilmName = '" + Server.HtmlEncode(Request.QueryString["FilmName"]) +"'";
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        SqlCommand cmd = sql.CreateCommand();
        cmd.CommandText = strSQL;
        sql.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while(dr.Read())
        {          
            det[0] = dr["ArrangID"].ToString();
            det[1] = dr["theaterName"].ToString();
            det[2] = dr["SRoomName"].ToString();
            det[3] = dr["PlayTime"].ToString();
            det[4] = dr["Price"].ToString();
        }
        dr.Close();
         strSQL = @"select * from Seat where SRoomName = '" + det[2].ToString() + "' and TheaterName = '" + det[1].ToString() + "' and State = '否'";
         cmd.CommandText = strSQL;
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            this.DropDownList1.Items.Add(dr["SeatID"].ToString());
        }
        sql.Close();
       
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if(this.Label4.Text!="")
        {
         string strSQL = @"INSERT INTO BookingCart (State, FilmName, Cinema, Time, Seat, Price) VALUES (@State, @FilmName, @Cinema, @Date, @Time, @Seat, @Price)";
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        SqlCommand cmd = sql.CreateCommand();
        cmd.CommandText = strSQL;
        cmd.Parameters.Add(new SqlParameter("@State", "否"));
        cmd.Parameters.Add(new SqlParameter("@FilmName",Server.HtmlEncode(Request.QueryString["FilmName"])));
        cmd.Parameters.Add(new SqlParameter("@Cinema", det[1].ToString()+det[2].ToString()));
        cmd.Parameters.Add(new SqlParameter("@Time", det[3].ToString()));
        cmd.Parameters.Add(new SqlParameter("@Seat", this.DropDownList1.SelectedValue));
        cmd.Parameters.Add(new SqlParameter("@Price", det[4].ToString()));
        sql.Open();
        cmd.ExecuteScalar();

        strSQL = @"select SaledNum from FilmArrange where ArrangeID = '" + this.DropDownList2.SelectedValue.ToString() + "'";
        cmd.CommandText = strSQL;
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        int n = int.Parse(dr["SaledNum"].ToString());
        dr.Close();
        n += 1;
        strSQL = @"UPDATE FilmArrange SET SaledNum = " + n.ToString() + "";
        cmd.CommandText = strSQL;
        cmd.ExecuteScalar();

         strSQL = @"UPDATE Seat SET State = '是'where SeatID = '"+this.DropDownList1.SelectedValue+"'";
        cmd.CommandText = strSQL;
        cmd.ExecuteScalar();
        sql.Close();
        }
    }
    protected void login_btn_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = new HttpCookie("TicketBooking");
        cookie.Expires = DateTime.Now.AddDays(-1);
        Response.AppendCookie(cookie);
        Session["username"] = "游客";
        Response.Redirect("~/前台/首页.aspx");
    }
}
