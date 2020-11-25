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

public partial class yingpian_detail : System.Web.UI.Page
{
    public string nbianhao, nyingpianmingcheng, nshangyingshijian, npiaoshu, ndidian, nyingpianleixing, npiaojia, ntupian, nbeizhu;
    protected void Page_Load(object sender, EventArgs e)
    {

        //if (!IsPostBack)
        //{
        // xingbie.Items.Add("male"); 
        // xingbie.Items.Add("female");
        string sql;
        sql = "select * from yingpian where id=" + Request.QueryString["id"].ToString().Trim();
        getdata(sql);
        //}
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
                nyingpianmingcheng = result.Tables[0].Rows[0]["yingpianmingcheng"].ToString().Trim();
                nshangyingshijian = result.Tables[0].Rows[0]["shangyingshijian"].ToString().Trim();
                npiaoshu = result.Tables[0].Rows[0]["piaoshu"].ToString().Trim();
                ndidian = result.Tables[0].Rows[0]["didian"].ToString().Trim();
                nyingpianleixing = result.Tables[0].Rows[0]["yingpianleixing"].ToString().Trim();
                npiaojia = result.Tables[0].Rows[0]["piaojia"].ToString().Trim();
                ntupian = result.Tables[0].Rows[0]["tupian"].ToString().Trim();
                nbeizhu = result.Tables[0].Rows[0]["beizhu"].ToString().Trim();

            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("dingpiaojiluadd.aspx?id=" + Request.QueryString["id"].ToString() + "&bianhao=" + nbianhao + "&yingpianmingcheng=" + nyingpianmingcheng + "&shangyingshijian=" + nshangyingshijian + "&piaojia=" + npiaojia + "&didian=" + ndidian);
    }
}

