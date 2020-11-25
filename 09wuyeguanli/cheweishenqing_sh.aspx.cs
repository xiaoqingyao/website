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

public partial class cheweishenqing_sh : System.Web.UI.Page
{
    public string zjl = "";
    public string pagecount = "";
    public string cruentpage = "";
    public string userinfo = "";



    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null || Session["UserName"] == null)
        {
            Response.Write("<script>window.alert('对不起，无权限浏览，请您登录后再试！');window.location.href='main.aspx'</script>");
            return;
        }
        if (!IsPostBack)
        {
            userinfo = Session["UserName"].ToString();
            Binds();
        }
        else
        {
            Label1.Text = "";
        }
    }
    protected void TongYi_Click(object sender, EventArgs e)
    {
        string id = ((Button)sender).CommandArgument;
        //string sql = "insert into 车位申请(车位ID,申请人ID,Status) values('" + id + "','" + Session["UserCode"] + "','0')";
        //SQL.ExecScalar(sql);
        //Response.Write("<script>window.alert('申请成功，管理员通过后，自动为您分配车位');window.location.href='Car.aspx'</script>");
        //修改状态
        string sql = "update 车位申请 set status='1' where ID='" + id + "'";
        SQL.ExecScalar(sql);
        //插入车位管理表
        sql = "insert into 车位管理(车位名称,车牌号,住户代码,员工代码) select (select 车位名称 from 车位信息 where ID=sq.车位ID) as 车位名称 ,车牌号,申请人ID,(select 员工代码 from 住户 where 住户代码=sq.申请人ID) as 员工代码 from dbo.车位申请 sq where ID='" + id + "'";
        SQL.ExecScalar(sql);
        Response.Write("<script>window.alert('审核成功，系统已经自动将该车位分配给该业主。');window.location.href='Car.aspx'</script>");
        Response.Redirect("cheweishenqing_sh.aspx");
    }
    private void Binds()
    {
        //GridView1.PageIndex = 0
        //string sql = "select a.*, b.户主 from 车位管理 a, 住户 b where 1=1";
        string sql = "select * from (select row_number() over(order by aa.ID asc) as rownum,aa.* from (select *,(select 户主 from 住户 where 住户代码=a.申请人ID) as 申请人,(select 车位名称 from 车位信息 where ID=a.车位ID ) as 车位名称 from dbo.车位申请 a where status='0') aa) t where t.rownum >= 0 and t.rownum < 100000 ";

        //string username = Txt_Name.Text.Trim();
        //if (username != "") {
        //    sql += "and b.户主 like '%" + username + "%'";//" and 住户代码=(select 住户代码 from 住户 where 户主='" + username + "')";
        //}
        //Response.Write(sql);
        DataTable dt = SQL.GetTable(sql);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        pagecount = GridView1.PageCount.ToString();
        cruentpage = (GridView1.CurrentPageIndex + 1).ToString();
        zjl = dt.Rows.Count.ToString();
        if (pagecount == "1")
        {
            lbtfirst.Enabled = false;
            lbtprev.Enabled = false;
            lbtnext.Enabled = false;
            lbtlast.Enabled = false;
        }
        else
        {
            if (cruentpage == "1")
            {
                lbtfirst.Enabled = false;
                lbtprev.Enabled = false;
                lbtnext.Enabled = true;
                lbtlast.Enabled = true;
            }
            if (GridView1.CurrentPageIndex + 1 == GridView1.PageCount)
            {
                lbtfirst.Enabled = true;
                lbtprev.Enabled = true;
                lbtnext.Enabled = false;
                lbtlast.Enabled = false;
            }
        }
    }
    //首页
    protected void lbtfirst_Click(object sender, EventArgs e)
    {
        GridView1.CurrentPageIndex = 0;
        Binds();
    }
    //上一页
    protected void lbtprev_Click(object sender, EventArgs e)
    {
        GridView1.CurrentPageIndex--;
        Binds();
    }
    //下一页
    protected void lbtnext_Click(object sender, EventArgs e)
    {
        GridView1.CurrentPageIndex++;
        Binds();
    }
    //末页
    protected void lbtlast_Click(object sender, EventArgs e)
    {
        GridView1.CurrentPageIndex = GridView1.PageCount - 1;
        Binds();
    }


    /// <summary>
    /// 查询
    /// </summary>
    protected void BtnQuery_Click(object sender, EventArgs e)
    {
        Binds();
    }
}
