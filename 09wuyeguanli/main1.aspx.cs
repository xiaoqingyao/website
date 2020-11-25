using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class main1 : System.Web.UI.Page
{
    string connString;
    public string sql;
    public int Tag;
    public int Tag1;
    public int n_count;
    public string zjl = "";
    public string pagecount = "";
    public string cruentpage = "";
    public string userinfo = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null || Session["UserCode"] == null)
        {
            Response.Write("<script>window.alert('对不起，无权限浏览，请您登录后再试！');window.location.href='main.aspx'</script>");
            return ;
        }
        SqlConnection connection = new SqlConnection(connString);
 
        BindData();
    }
    public void BindData()
    {    
        DataTable Dtable = new DataTable();
        string connString = "Data Source=bobo-pc;Initial Catalog=XQWY;uid=sa;pwd=12345";
        SqlConnection connection = new SqlConnection(connString);
        string sql = "select LYSheet.ID,NiCheng,Sex,QQ,Email,HomePage,Title,Content,DDate,Reply,ReplyDate,FaceID,Name, LYSheet.户主,TType,PicAddr1 from LYSheet,Face where FaceID=Face.ID order by LYSheet.DDate DESC";
        DataTable dt = SQL.GetTable(sql);
        connection.Open();
        SqlDataAdapter dataAdapter = new SqlDataAdapter(sql, connection);
        dataAdapter.Fill(Dtable);

        //将数据绑定到Repeater控件中 
        repeater1.DataSource = Dtable;           
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = Dtable.DefaultView;
        pds.AllowPaging = true;//允许分页
        pds.PageSize = 2;//单页显示项数
        pds.CurrentPageIndex = Convert.ToInt32(lebCurrentPage.Text) - 1;
        repeater1.DataSource = pds;
        pagecount = pds.PageCount.ToString();
        zjl = dt.Rows.Count.ToString();
       // cruentpage = (pds.CurrentPageIndex + 1).ToString();

        repeater1.DataBind();
        connection.Close();


        if (lebCurrentPage.Text == "1")
        {
            lbtfirst.Enabled = false;
            lbtprev.Enabled = false;
            lbtnext.Enabled = true;
            lbtlast.Enabled = true;
        }
        else
        {
            if (lebCurrentPage.Text == pagecount)
            {
                lbtfirst.Enabled = true;
                lbtprev.Enabled = true;
                lbtnext.Enabled = false;
                lbtlast.Enabled = false;
            }
            else
            {
                lbtfirst.Enabled = true;
                lbtprev.Enabled = true;
                lbtnext.Enabled = true;
                lbtlast.Enabled = true;
            }
            
        }

    }


     

    //首页
   protected void lbtfirst_Click(object sender, EventArgs e)
    {

        lebCurrentPage.Text = "1";
        BindData();
    }
    //上一页
    protected void lbtprev_Click(object sender, EventArgs e)
    {
      
        lebCurrentPage.Text = (Convert.ToInt32(lebCurrentPage.Text) -1).ToString();
        BindData();
    }
    //下一页
    protected void lbtnext_Click(object sender, EventArgs e)
    {
        
        lebCurrentPage.Text = (Convert.ToInt32(lebCurrentPage.Text) + 1).ToString();
        BindData(); 
    }
    //末页
    protected void lbtlast_Click(object sender, EventArgs e)
    {

        lebCurrentPage.Text = Convert.ToInt32(pagecount).ToString();
        BindData();
    }

 
}