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

public partial class dingpiaojiluadd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null && Session["userip"] != null)
        {

        }
        else
        {
            Response.Write("<script>javascript:alert('对不起，请您先登陆！');location.href='index.aspx';</script>");
            Response.End();
        }
        if (!IsPostBack)
        {
            int i = 0;
            int j = 0;
            for (i = 1; i <= 20; i++)
            {
                pai.Items.Add(i.ToString().Trim());
                lie.Items.Add(i.ToString().Trim());
            }
            dingpiaoren.Text = Session["username"].ToString().Trim();
            yingpianbianhao.Text = Request.QueryString["bianhao"].ToString().Trim();
            yingpianmingcheng.Text = Request.QueryString["yingpianmingcheng"].ToString().Trim();
            piaojia.Text = Request.QueryString["piaojia"].ToString().Trim();
            id.Value = Request.QueryString["id"].ToString();
            //绑定排场
            string sqlpaichang = "select (yingyuanname+'~'+(cast(playtime as varchar(50)))) as showname,* from paipian where playtime>getdate() and yingpianid=" + Request.QueryString["id"].ToString();
            DataSet ds = new Class1().hsggetdata(sqlpaichang);
            if (ds == null || ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
            {
                this.paichang.Items.Add(new ListItem() { Value = "", Text = "对不起，暂未排场" });
            }
            else
            {
                this.paichang.DataSource = ds.Tables[0];
                this.paichang.DataTextField = "showname";
                this.paichang.DataValueField = "id";
                this.paichang.DataBind();
                this.paichang.Items.Insert(0, new ListItem() { Value = "", Text = "请选择场次" });
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "select id from dingpiaojilu where paipianid='" + paichang.SelectedValue.ToString().Trim() + "'  and zuowei='" + zuowei.Text.ToString().Trim() + "'";
        DataSet result2 = new DataSet();
        result2 = new Class1().hsggetdata(sql);
        if (result2 != null)
        {

            if (result2.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script>javascript:alert('对不起，该位置已经有人预订，请选择其他位置');history.back();</script>");
                Response.End();

            }
        }
        sql = "insert into dingpiaojilu(dingpiaoren,yingpianbianhao,yingpianmingcheng,fangyingshijian,fangyingdidian,zuowei,piaojia,paipianid) values('" + dingpiaoren.Text.ToString().Trim() + "','" + yingpianbianhao.Text.ToString().Trim() + "','" + yingpianmingcheng.Text.ToString().Trim() + "','" + fangyingshijian.Text.ToString().Trim() + "','" + fangyingdidian.Text.ToString().Trim() + "','" + zuowei.Text.ToString().Trim() + "','" + piaojia.Text.ToString().Trim() + "','" + this.paichang.SelectedValue + "') ";
        int result;
        result = new Class1().hsgexucute(sql);
        if (result == 1)
        {
            Response.Write("<script>javascript:alert('添加成功');</script>");
            Response.Redirect("dingdanlist.aspx?");
        }
        else
        {
            Response.Write("<script>javascript:alert('系统错误，请检查数据库设置问题');</script>");
        }
    }

    protected void pai_SelectedIndexChanged(object sender, EventArgs e)
    {
        zuowei.Text = pai.Text + "排" + lie.Text + "列";
    }
    protected void lie_SelectedIndexChanged(object sender, EventArgs e)
    {
        zuowei.Text = pai.Text + "排" + lie.Text + "列";
    }

    protected void paichang_SelectedIndexChanged(object sender, EventArgs e)
    {
        string paipianid = this.paichang.SelectedValue;
        string sql = "select playtime,(select [address] from yingyuan where id=yingyuanid)as dizhi from paipian where id=" + paipianid;
        DataSet ds = new Class1().hsggetdata(sql);
        this.fangyingshijian.Text = ds.Tables[0].Rows[0]["playtime"].ToString();
        this.fangyingdidian.Text = ds.Tables[0].Rows[0]["dizhi"].ToString();
    }
}

