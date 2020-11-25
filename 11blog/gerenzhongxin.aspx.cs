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

public partial class gerenzhongxin : System.Web.UI.Page
{
    public string uid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["huiyuanid"] == null)
        {
            Response.Redirect("Default.aspx"); return;
        }
        if (!IsPostBack)
        {
            string id = Session["huiyuanid"].ToString();
            DataSet ds = new Class1().hsggetdata("select * from huiyuan where id='" + id + "'");
            if (ds != null && ds.Tables.Count > 0)
            {
                uid = ds.Tables[0].Rows[0]["id"].ToString();
                this.lblAddress.Text = ds.Tables[0].Rows[0]["ADdress"].ToString();
                this.lblDate.Text = ds.Tables[0].Rows[0]["nianling"].ToString();
                //string point = ds.Tables[0].Rows[0]["MemberMoney"].ToString();
                DataSet ds2 = new Class1().hsggetdata("select SUM(jifen) as jifen from huodong hd,huodong_baoming bm where hd.listid=bm.huodongid and bm.uid='" + uid + "'");
                if (ds2 != null && ds2.Tables[0].Rows.Count > 0)
                {
                    this.lblPoint.Text = ds2.Tables[0].Rows[0][0].ToString();
                }
                else
                {
                    this.lblPoint.Text = "0";
                }
                //new Class1().hsggetdata("select sum") //point.Equals("") ? "0" : point;
                this.lblname.Text = ds.Tables[0].Rows[0]["username"].ToString();
                this.lblSex.Text = ds.Tables[0].Rows[0]["Sex"].ToString();
            }

            this.GridView1.DataSource = new Class1().hsggetdata("select *,(select count(*) from huodong_baoming where huodongid=hd.listid) as bms,(select count(*) from huodong_baoming where huodongid=hd.listid and  uid='" + id + "') as mybms from huodong hd order by riqi desc");
            this.GridView1.DataBind();
        }

    }
    protected void GridView1_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.Header && e.Row.RowType != DataControlRowType.Footer)
        {
            string huodongid = e.Row.Cells[0].Text.Trim();
            string sl = e.Row.Cells[2].Text.Trim();
            e.Row.Cells[2].Text = "<a href=# style=\"color:Blue\" onclick=\"openDetail('baomingmx.aspx?huodongid=" + huodongid + "');\">" + sl + "</a>";
            //控制报名按钮
            string status = e.Row.Cells[6].Text.Trim();
            if (status != "0")
            {
                ((Button)e.Row.Cells[3].FindControl("btnbm")).Visible = false;
                e.Row.Cells[5].Text = "已报名";
                e.Row.Cells[5].ForeColor = System.Drawing.Color.Green;
            }
            e.Row.Cells[1].Text = "<a href=# style=\"color:Blue\" onclick=\"openDetail('huodongmingxi.aspx?huodongid=" + huodongid + "');\">" + e.Row.Cells[1].Text + "</a>";
            //控制最大报名数
            string zdsx = e.Row.Cells[3].Text.Trim();//最大上限
            if (int.Parse(sl) >= int.Parse(zdsx))
            {
                e.Row.Cells[5].Text = "<span style=\"color:Red\">已报满</span>";
            }
        }
    }

    protected void bm_Click(object sender, EventArgs e)
    {
        string id = ((Button)sender).CommandArgument.ToString();
        string jifen = ((Button)sender).CommandName.ToString();//积分
        if (Session["huiyuanid"] == null)
        {
            string js = "<script language='javascript'>alert('{0}');window.location.replace('{1}')</script>";
            HttpContext.Current.Response.Write(string.Format(js, "对不起，登录超时，请重新登录。", "loginhuiyuan.aspx"));
            return;
        }
        string userid = Session["huiyuanid"].ToString();
        string date = DateTime.Now.ToString("yyyy-MM-dd");
        string sql = "insert into huodong_baoming(uid,huodongname,huodongid,bmdate) select '" + userid + "',(select biaoti from huodong where listid='" + id + "') as huodongname,'" + id + "','" + date + "'";
        new Class1().hsgexucute(sql);
        //增加积分
        sql = "update huiyuan set MemberMoney=isnull(MemberMoney,0)+'" + jifen + "' where uid='" + userid + "' ";
        new Class1().hsgexucute(sql);
        string js2 = "<script language='javascript'>alert('{0}');</script>";
        HttpContext.Current.Response.Write(string.Format(js2, "报名成功，请准时参加哦。"));
        Response.Redirect("gerenzhongxin.aspx");
    }

    protected void lbZhuxiao_Click(object sender, EventArgs e) {
        Session.Clear();
        Response.Redirect("~/loginhuiyuan.aspx");
    }
}
