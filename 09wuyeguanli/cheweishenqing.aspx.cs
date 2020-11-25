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

public partial class cheweishenqing : System.Web.UI.Page
{
    public string zjl = "";
    public string pagecount = "";
    public string cruentpage = "";
    public string userinfo = "";



    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null || Session["UserCode"] == null)
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
    protected void ShenQing_Click(object sender, EventArgs e)
    {
        string chepaihao = string.Empty;
        for (int i = 0; i < GridView1.Items.Count; i++)
        {
            chepaihao = ((TextBox)GridView1.Items[i].Cells[2].FindControl("TextBox1")).Text.Trim();
            //车牌号
            if (!string.IsNullOrEmpty(chepaihao))
            {
                break;
            }
        }
        string id = ((Button)sender).CommandArgument;
        string sql = "insert into 车位申请(车位ID,申请人ID,Status,车牌号) values('" + id + "','" + Session["UserCode"] + "','0','" + chepaihao + "')";
        SQL.ExecScalar(sql);
        Response.Write("<script>window.alert('申请成功，管理员通过后，自动为您分配车位');window.location.href='Car.aspx'</script>");

    }
    private void Binds()
    {
        //GridView1.PageIndex = 0
        //string sql = "select a.*, b.户主 from 车位管理 a, 住户 b where 1=1";
        string sql = "select * from (select row_number() over(order by 车位信息.ID asc) as rownum,车位信息.* from 车位信息) t where t.rownum >= 0 and t.rownum < 100000 and ID not in (select 车位代码 from 车位管理) and id not in (select 车位ID from 车位申请 where status in ('0','1'))";

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
