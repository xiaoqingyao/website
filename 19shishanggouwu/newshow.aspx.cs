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
using Common;
public partial class cjwt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //下载于www.51aspx.com
        Model.News mn = new Model.News();
        BLL.News bn = new BLL.News();
        mn.ID = Convert.ToInt32(Request.QueryString["uid"]);
        SqlDataReader sdr = bn.datareader(mn);
        if (sdr.Read())
        {
            Label1.Text = sdr["_from"].ToString();
            Label2.Text = sdr["_author"].ToString();
            Label3.Text = sdr["_posttime"].ToString();
            Label4.Text = sdr["_content"].ToString();
            Label5.Text = sdr["_title"].ToString();
            Page.Title = Label5.Text + "新闻";
            int sum = Convert.ToInt32(sdr["_click"]);
            sdr.Close();
            sum = sum + 1;
            string str = "update news set _click=" + sum + " where _id=" + mn.ID + "";
            int result = DB.ExecuteSql(str);
            if (result > 0)
            {
                Label6.Text = sum.ToString();
                //Label6.Text = dr["_click"].ToString();
            }

        }
        repeat();

        //下载于www.51aspx.com
    }
    private void repeat()
    {

        string st = "select * from newscate ";
        DataSet ds1 = Common.DB.dataSet(st);
        Repeater2.DataSource = ds1.Tables[0];
        Repeater2.DataBind();
    }
   
}