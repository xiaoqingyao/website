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

public partial class lyb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] != null)
        {
            admin_go.Text = "退出管理";
            admin_go.NavigateUrl = "exit.aspx";
        }
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
    }
    protected void addly_Click(object sender, EventArgs e)
    {
        book binbin = new book();
        binbin.username = Server.HtmlEncode(this.username.Text);
        binbin.email = this.email.Text;
        binbin.qq = this.qq.Text;
        binbin.homepage = this.homepage.Text;
        if (this.Radboy.Checked)
        {
            binbin.sex = "男";
            binbin.face = "boy";
        }
        else
        {
            binbin.sex = "女";
            binbin.face = "gril";
        }
        binbin.body = this.lybody.Text;
        if (this.ishde.Checked)
        {
            binbin.ishide = true;
        }
        else
        {
            binbin.ishide = false;
        }
        Label1.Text = binbin.ishide.ToString();
        if (saveinfo.savely(binbin))
        {
            Response.Redirect("lyb.aspx");
        }
        else
        {
            Response.Write("<script>alert('留言失败,服务器错误!');location.herf='lyb.aspx'");
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
        if (!ishidden || Session["admin"] != null)
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
        if (Session["admin"] != null)
        {
            return "<a href=re.aspx?id=" + id + ">回复</a>" + "&nbsp;&nbsp;&nbsp;<a href=del.aspx?id=" + id + ">删除</a>";
        }
        else
        {
            return null;
        }
    }
}
