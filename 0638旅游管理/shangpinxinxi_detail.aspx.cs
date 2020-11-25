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

public partial class shangpinxinxi_detail : System.Web.UI.Page
{
    public string nbianhao, nmingcheng, njiage, nleibie, njianjie, ntupian, nkucun, nfaburen;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //addxiala("alllb", "lb", "kehubianhao");
            string sql;
            sql = "select * from shangpinxinxi where id=" + Request.QueryString["id"].ToString().Trim();
            getdata(sql);
           // sql = "select * from pinglun where proid=" + Request["id"].ToString().Trim();
           // getdata2(sql);
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
                nbianhao = result.Tables[0].Rows[0]["bianhao"].ToString().Trim();
                nmingcheng = result.Tables[0].Rows[0]["mingcheng"].ToString().Trim();
                njiage = result.Tables[0].Rows[0]["jiage"].ToString().Trim();
                nleibie = result.Tables[0].Rows[0]["leibie"].ToString().Trim();
                njianjie = result.Tables[0].Rows[0]["jianjie"].ToString().Trim();
                ntupian = result.Tables[0].Rows[0]["tupian"].ToString().Trim();
                nkucun = result.Tables[0].Rows[0]["kucun"].ToString().Trim();
                nfaburen = result.Tables[0].Rows[0]["faburen"].ToString().Trim();

            }
        }
    }
    //private void getdata2(string sql)
    //{
    //    DataSet result = new DataSet();
    //    result = new Class1().hsggetdata(sql);
    //    if (result != null)
    //    {
    //        if (result.Tables[0].Rows.Count > 0)
    //        {
    //            DataGrid1.DataSource = result.Tables[0];
    //            DataGrid1.DataBind();
    //        }
    //        else
    //        {
    //            DataGrid1.DataSource = null;
    //            DataGrid1.DataBind();
    //        }
    //    }
    //}

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    if (Session["username"] != null)
    //    {
    //        string sql;
    //        sql = "insert into pinglun(content,proid,addby) values('" + content.Text.ToString().Trim() + "','" + Request.QueryString["id"].ToString().Trim() + "','" + Session["username"].ToString().Trim() + "')";
    //        int result2;
    //        result2 = new Class1().hsgexucute(sql);
    //        if (result2 == 1)
    //        {
    //            Response.Write("<script>javascript:alert('评论成功');location.href='shangpinxinxi_detail.aspx?id=" + Request.QueryString["id"].ToString().Trim() + "';</script>");
    //            Response.End();
    //        }
    //        else
    //        {
    //            Response.Write("<script>javascript:alert('系统错误');</script>");
    //        }
    //    }
    //    else
    //    {
    //        Response.Write("<script>javascript:alert('对不起，请您先登陆！');location.href='shangpinxinxi_detail.aspx?id=" + Request.QueryString["id"].ToString().Trim() + "';</script>");
    //        Response.End();
    //    }
    //}
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("gwc.aspx?id=" + Request.QueryString["id"].ToString().Trim() + "&sl=" + sl.Text.ToString().Trim());
    }
}

