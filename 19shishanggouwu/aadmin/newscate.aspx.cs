﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


public partial class admin_newscate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string str = "select count(*) from newscate";
            int result = Convert.ToInt32(Common.DB.ExecuteScalar(str));
            AspNetPager1.RecordCount = result;
            AspNetPager1.PageSize = 5;
            info();
        }
    }
    public void info()
    {

        string str = "select * from newscate";
        DataSet ds = Common.DB.PagedataSet(str, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize, "helpcate");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
    protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        info();
    }
   

    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gv in GridView1.Rows)
        {
            CheckBox cb = (CheckBox)gv.FindControl("CheckBox1");
            cb.Checked = true;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gv in GridView1.Rows)
        {
            CheckBox cb = (CheckBox)gv.FindControl("CheckBox1");
            if (cb.Checked)
            {
                cb.Checked = false;
            }
            else
            {
                cb.Checked = true;
            }
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Model.Newscate mh = new Model.Newscate();
        BLL.Newscate bh = new BLL.Newscate();
        Model.News mn = new Model.News();
        BLL.News bn = new BLL.News();
        int result = 0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");

            if (cb.Checked)
            {
                //通过删除新闻分类同时删除相关新闻
                mh.ID = Convert.ToInt32(GridView1.DataKeys[i].Value);
                bn._deletebycate(mh);
                result = bh._delete(mh);
            }
        }
        if (result > 0)
        {
            Response.Write("<script>alert('删除成功'),location.href='newscate.aspx'</script>");
        }
        else
        {
            Response.Write("<script>alert('删除失败'),location.href='newscate.aspx'</script>");
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.color='red';");
            e.Row.Attributes.Add("onmouseout", "this.style.color='#000';");
        }
    }
  
}
