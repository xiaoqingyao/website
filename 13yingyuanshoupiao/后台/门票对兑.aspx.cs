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

public partial class 后台_门票对兑 : System.Web.UI.Page
{
    static bool b = false;
    private static string ticket = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Label_Date.Text = "";
        this.Label_MenPiao.Text = "";
        this.Label_Room.Text = "";
        this.Label_Seat.Text = "";
        this.Label_UserName.Text = "";
        this.Label_FilmName.Text = "";
        string arrangeID = "";
        this.Label1.Visible = false;
        this.Label1.Text = "";
        string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sql = new SqlConnection();
        sql.ConnectionString = strCon;
        SqlCommand cmd = sql.CreateCommand();
        string strSQL = @"select ArrangeID , SRoomName , Seat,UserName,OrderDate,State from SalesInfo where TicketID = '"+this.TextBox1.Text+"' and theaterName = '"+this.DropDownList1.SelectedValue+"'";
        cmd.CommandText = strSQL;
        sql.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            b = true;
            ticket = this.TextBox1.Text;
            
            this.Label_Date.Text = dr["OrderDate"].ToString();
            this.Label_MenPiao.Text = dr["State"].ToString();
            this.Label_Room.Text = dr["SRoomName"].ToString();
            this.Label_Seat.Text = dr["Seat"].ToString();
            this.Label_UserName.Text = dr["UserName"].ToString();
            arrangeID = dr["ArrangeID"].ToString();
        }
        dr.Close();
        cmd.CommandText = @"select FilmName from FilmArrange where ArrangeID = '"+arrangeID+"'";
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            this.Label_FilmName.Text = dr["FilmName"].ToString();
        }
        dr.Close();
        sql.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (b == true&&this.Label_MenPiao.Text =="否")
        {
            int c = 0;
            string strSQL = @"update SalesInfo set State = '已对兑' where TicketID = '"+ticket+"'";
            string strCon = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sql = new SqlConnection();
            sql.ConnectionString = strCon;
            SqlCommand cmd = sql.CreateCommand();
            cmd.CommandText = strSQL;
            sql.Open();
            c = cmd.ExecuteNonQuery();
            if (c != 0)
            {
                this.Label1.Visible = true;
                this.Label1.Text = "对兑成功！！";
            }
            
        }
        if (this.Label_MenPiao.Text == "已对兑")
        {
            this.Label1.Visible = true;
            this.Label1.Text = "该门票已对兑！";
        }
    }
}
