using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class reply : System.Web.UI.Page
{
    public string StrTitle;
    public string StrContent;
  
    protected void Page_Load(object sender, EventArgs e)
    {
       this.Load += new System.EventHandler(Page_Load);
       string connString = "Data Source=bobo-pc;Initial Catalog=XQWY;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connString);
            if (!IsPostBack)
            {
                connection.Open();

                string theId = Request.QueryString["ID"];//获取当前所要回复的留言信息ID

                string sql = "select * from [LYSheet] where ID=" + Convert.ToInt16(theId) + "";


                SqlCommand command = new SqlCommand(sql, connection);
                SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader.Read())
                {   //显示留言标题及内容
                    StrTitle = dataReader["Title"].ToString();
                    StrContent = dataReader["Content"].ToString();
                    connection.Close();

                }
                else
                {
                    connection.Close();
                }
            }

    }

    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
        //
        InitializeComponent();
        base.OnInit(e);
    }

    /// <summary>
    /// 设计器支持所需的方法 - 不要使用代码编辑器修改
    /// 此方法的内容。
    /// </summary>
    private void InitializeComponent()
    {

    }
    protected void sure_click(object sender, EventArgs e)
    {
        sure.Click += new System.EventHandler(sure_click);
        //int i, j;
        string connString = "Data Source=bobo-pc;Initial Catalog=XQWY;Integrated Security=True";
        SqlConnection connection = new SqlConnection(connString);//将回复信息保存至数据库中
        connection.Open();
            string theID, theReply;
            theID = Request.QueryString ["ID"];//获取留言信息的ID
          
            theReply = Content.Text; //获取回复信息
           
            string sql = "Update [LYSheet] set reply='"+theReply +"',ReplyDate='"+System.DateTime.Now.ToString()+"'  where ID="+Convert.ToInt16(theID)+" ";
            
            SqlCommand command = new SqlCommand(sql, connection);
            SqlDataReader dataReader = command.ExecuteReader();
        command.Dispose ();
            connection.Close();
        connection .Dispose ();
            Response.Redirect("main1.aspx");
     
    }

    protected void Clear_click(object sender, EventArgs e)
    {
        clear.Click += new System.EventHandler(Clear_click);
        Content.Text = "";
        span1.InnerHtml = "";
    }
    
}