﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class SysManage_ManagerOper : System.Web.UI.Page
{
    string id = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(id))
            {
                Get_Data();
            }
        }
    }

    void Get_Data()
    {
        try
        {
            DataTable dt = DB.getDataTable("select * from Manager where ManagerId=" + id);
            if (dt.Rows.Count == 1)
            {
                txtManagerUser.Enabled = false;
                txtManagerUser.Text = dt.Rows[0]["ManagerUser"].ToString();
                txtManagerPwd.Text = dt.Rows[0]["Managerpwd"].ToString();
                txtTitle.Text = dt.Rows[0]["Title"].ToString();
                grade.SelectedValue = dt.Rows[0]["grade"].ToString();
            }
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "页面加载时出现异常。", "");
            return;
        }
    }

    /// <summary>
    /// 按钮事件：提交信息
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string sql2 = string.Empty;
            string user = txtManagerUser.Text;
            string pwd = txtManagerPwd.Text;

            if (string.IsNullOrEmpty(id))//添加
            {
                if (DB.getDataTable("select * from Manager where ManagerUser='" + user + "'").Rows.Count > 0)
                {
                    JavaScriptHelper.Alert("此帐号已存在。");
                    return;
                }
                else
                {
                    sql2 = "insert into Manager(ManagerUser,ManagerPwd,Title,RegTime,LoginCount,grade,gradename) ";
                    sql2 += "values('" + user + "','" + pwd + "','" + txtTitle.Text + "',getdate(),0,'" + grade.SelectedValue + "','" + grade.SelectedItem.Text + "')";
                }
            }
            else//修改
            {
                sql2 = "update Manager set Title='{0}',ManagerPwd='{1}',grade='{2}',gradename='{3}' where ManagerId=" + id;
                sql2 = string.Format(sql2, txtTitle.Text, pwd, grade.SelectedValue, grade.SelectedItem.Text);
                
            }

            SqlConnection cn = DB.OpenConnection();
            SqlCommand cmd = new SqlCommand(sql2, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            cn.Dispose();
            Common.ShowMessage(this.Page, "信息保存成功！", "", "managermanage.aspx");
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "信息保存失败，请稍后重试。", "");
            return;
        }
    }

}