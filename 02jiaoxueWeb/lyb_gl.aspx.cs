using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class lyb_gl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            string ToPage = Request.QueryString["ToPage"];
            if (ToPage == null)
            {
                ToPage = "1";
            }
            if (!StrRegExp.IsID(ToPage))
            {
                ToPage = "1";
            }
            this.Bind_rptList(Convert.ToInt32(ToPage));
        }
        if (!IsPostBack)
        {
            string sql;
            sql = "select * from book order by id desc";
            getdata(sql);
        }
    }
    private void getdata(string sql)
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                rpt1.DataSource = result.Tables[0];
                rpt1.DataBind();
            }
            else
            {
                rpt1.DataSource = null;
                rpt1.DataBind();
            }
        }
    }

    private void Bind_rptList(int ToPage)
    {
        int CurrentPage = ToPage;
        int PageSize = 5;
        int PageCount;
        int RecordCount;
        string PageSQL;
        string DataTable = "book";
        string DataFiled = "ID";
        string DataFileds = "ID,UserName,Face,Sex,QQ,HomePage,Email,IsHidden,Adddate,body,isrely,rebody";
        string DataOrders = "ID Desc";
        SqlConnection Conn = DB.createdb();
        //  string connstring = ConfigurationManager.AppSettings["cn"];
        // SqlConnection Conn = new SqlConnection();
        //  Conn.ConnectionString = connstring;
        //  conn.Open();
        Conn.Open();
        //* 取得记录总数，计算总页数
        SqlCommand cmd = new SqlCommand("Select Count(" + DataFiled + ") From " + DataTable, Conn);
        RecordCount = Convert.ToInt32(cmd.ExecuteScalar());
        if ((RecordCount % PageSize) != 0)
        {
            PageCount = RecordCount / PageSize + 1;
        }
        else
        {
            PageCount = RecordCount / PageSize;
        }
        if (ToPage > PageCount)
        {
            CurrentPage = PageCount;
        }
        if (CurrentPage <= 1)
        {
            PageSQL = "Select Top " + PageSize + " " + DataFileds + " From " + DataTable + " Order By " + DataOrders;
        }
        else
        {
            PageSQL = "Select Top " + PageSize + " " + DataFileds + " From " + DataTable + " Where " + DataFiled + " Not In ( Select Top " + PageSize * (CurrentPage - 1) + " " + DataFiled + " From " + DataTable + " Order By " + DataOrders + " ) Order By " + DataOrders;
        }
        SqlDataAdapter oda = new SqlDataAdapter(PageSQL, Conn);
        DataSet ds = new DataSet();
        oda.Fill(ds, "infList");
        this.lbTotalPage.Text = Convert.ToString(PageCount);
        this.hlkFirstPage.NavigateUrl = "?ToPage=1";
        this.hlkLastPage.NavigateUrl = "?ToPage=" + PageCount;
        this.lbCurrentPage.Text = Convert.ToString(CurrentPage);
        if (CurrentPage <= 1)
        {
            this.hlkPrevPage.Enabled = false;
            CurrentPage = 1;
        }
        else
        {
            this.hlkPrevPage.Enabled = true;
            this.hlkPrevPage.NavigateUrl = "?ToPage=" + (ToPage - 1);
        }
        if (CurrentPage >= PageCount)
        {
            this.hlkNextPage.Enabled = false;
            CurrentPage = PageCount;
        }
        else
        {
            this.hlkNextPage.Enabled = true;
            this.hlkNextPage.NavigateUrl = "?ToPage=" + (ToPage + 1);
        }
        rpt1.DataSource = ds.Tables["infList"].DefaultView;
        rpt1.DataBind();
        Conn.Close();
    }
    protected string showrely(bool isrely, string rebody)
    {
        if (isrely)
        {
            return "<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color='#2CB421'>管理员回复:&nbsp;&nbsp;</font><font color='#000099'>" + Server.HtmlEncode(rebody) + "</font>";
        }
        else
        {
            return null;
        }
    }

    protected string showbody(bool ishidden, string str_body)
    {
        if (!ishidden || Session["username"] != null)
        {
            return str_body.Replace("\r\n", "<br>");

        }

        else
        {
            return "<br>&nbsp;&nbsp;<font color=red>此留言为悄悄话!只有管理员可见!</font>";
        }
    }

    protected string show_admin(int id)
    {
        if (Session["username"] != null)
        {
            return "" + "&nbsp;&nbsp;&nbsp;<a href=dellyb.aspx?id=" + id + ">删除</a>";
        }
        else
        {
            return null;
        }
    }
}
