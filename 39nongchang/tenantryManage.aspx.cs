﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tenantryManage : BasePage
{
    sqlHelper server = new sqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            object code = Request["code"];
            if (code != null)
            {
                //删除
                string delSql = "delete from tenantry where code='" + code.ToString() + "'";
                server.ExecuteNonQuery(delSql);
                Response.Redirect("~/tenantryManage.aspx");
            }
            else
            {
                //绑定页面
                bindGuidView(1);
            }
        }
    }

    private void bindGuidView(int pageindex)
    {
        int totalCount = 0;
        DataTable dt = getData(pageindex, PageSize, out totalCount);
        this.ucPager.RecordCount = totalCount;
        this.ucPager.PageSize = PageSize;
        this.GridView1.DataSource = dt;
        this.GridView1.DataBind();
    }

    protected void ucPager_PageChanged(object sender, EventArgs e)
    {
        bindGuidView(this.ucPager.CurrentPageIndex);
    }
    private DataTable getData(int pageIndex, int pageSize, out int TotalCount)
    {
        string sql = "select *,Row_Number()over(order by createDate desc,code asc) as crow from tenantry where 1=1 ";
        string name = this.txtName.Text.Trim();
        if (!string.IsNullOrEmpty(name))
        {
            sql += " and name like '%" + name + "%'";
        }

        string sqlFrame = "select * from ( {0} ) t where t.crow>{1} and t.crow<={2}";
        string sqlCount = "select count(*) from ( {0} ) t ";
        sqlFrame = string.Format(sqlFrame, sql, (pageIndex - 1) * PageSize, pageIndex * PageSize);
        DataTable dt = server.GetDataTable(sqlFrame, null);
        object objcount = server.ExecuteScalar(string.Format(sqlCount, sql));
        TotalCount = int.Parse(objcount.ToString());
        return dt;
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        bindGuidView(1);
    }
}