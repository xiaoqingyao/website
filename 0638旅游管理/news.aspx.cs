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

public partial class news : System.Web.UI.Page
{
    public string sql,  lb;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["lb"] != null)
        {
            lb = Request.QueryString["lb"].ToString().Trim();
        }
        
        if (!IsPostBack)
        {
           
            sql = "select id,title,addtime,leibie,dianjilv from allgonggao where 1=1";
            if (Request.QueryString["lb"] != null)
            {
                sql=sql+  " and leibie='" + lb + "'";
            }
            if (Request.QueryString["keyword"] != null)
            {
                sql = sql + " and title like '%" + Request.QueryString["keyword"].ToString().Trim() + "%'";
            }
            sql = sql + " order by id desc";
            getdata(sql);
           
        }

        //if (Session["username"] == null && Session["temp"] == null)
        //{

        //    Session["temp"] = Page.Request.UserHostAddress;
        //}
        //if (Session["username"] == null)
        //{
        //    new Class1().hsgcaozuojilu(Session["temp"].ToString().Trim(), "浏览新闻内容页leibie="+lb, "allgonggao");
        //}
        //else
        //{
        //    new Class1().hsgcaozuojilu(Session["username"].ToString().Trim(), "浏览新闻内容页leibie=" + lb, "allgonggao");
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
                DataGrid1.DataSource = result.Tables[0];
                DataGrid1.DataBind();
            }
            else
            {
                DataGrid1.DataSource = null;
                DataGrid1.DataBind();
            }
        }
    }
    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        sql = "select id,title,addtime,leibie,dianjilv from allgonggao order by id desc";
        getdata(sql);
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        DataGrid1.DataBind();
    }
    //protected void bt_Click(object sender, EventArgs e)
    //{
    //    string sql;
    //    sql = "select id,title,addtime,leibie,dianjilv from allgonggao where 1=1";
        //if (bt.Text.ToString().Trim() != "")
        //{
        //    sql = sql + " and title like '%"+bt.Text.ToString().Trim()+"%'";
        //}
        //if (rq.Text.ToString().Trim() != "")
        //{
        //    sql = sql + " and addtime >= '" + rq.Text.ToString().Trim() + "'";
        //}
        //if (rq2.Text.ToString().Trim() != "")
        //{
        //    sql = sql + " and addtime <= '" + rq2.Text.ToString().Trim() + "'";
        //}
        //if (leibie.Text.ToString().Trim() != "所有")
        //{
        //    sql = sql + " and leibie='"+leibie.Text.ToString().Trim()+"'";
        //}
    //    sql = sql + " order by id desc";
        
    //    getdata(sql);
    //}
    //private void addxiala(string ntable, string nzd, string nxlk)
    //{
    //    string sql;
    //    sql = "select " + nzd + " from " + ntable + " order by id desc";
    //    DataSet result = new DataSet();
    //    result = new Class1().hsggetdata(sql);
    //    if (result != null)
    //    {
    //        if (result.Tables[0].Rows.Count > 0)
    //        {
    //            int i = 0;
    //            for (i = 0; i < result.Tables[0].Rows.Count; i++)
    //            {
    //                leibie.Items.Add(result.Tables[0].Rows[i][0].ToString().Trim());
    //            }
    //        }
    //    }
    //}
}
