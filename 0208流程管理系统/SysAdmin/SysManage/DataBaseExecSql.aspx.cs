using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AllPower.Common;
using AllPower.BLL.SysManage;
using AllPower.Web.Admin;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using Microsoft.SqlServer.Management;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Sdk.Sfc;
using System.Text.RegularExpressions;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年7月23日
    功能描述： 执行sql 
// 更新日期        更新人      更新原因/内容
 * 2010-09-16      胡志瑶      判断是否已输入验证码、gridview的样式
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class DataBaseExecSql : AdminPage
    {
        #region 变量成员
        AllPower.BLL.SysManage.DataBaseManage bll = new DataBaseManage();
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string isDbManage = Utils.GetCookie("ISDBMANAGE");
                //是否已经输入验证码
                if (string.IsNullOrEmpty(isDbManage))
                {
                    Response.Redirect("DataManage.aspx?type=3&NodeCode="+NodeCode);
                }
            }
        }
        #endregion

        #region 执行sql语句
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //判断是否有执行sql权限，暂时用edit,看后续是否需要单独加执行sql操作
            if (IsHaveRightByOperCode("Edit"))
            {
                if (Regex.IsMatch(txtSql.Text,"select", RegexOptions.IgnoreCase))
                {
                    try
                    {
                        //有select返回DataSet的第一个Table
                        DataTable dtSelectData = bll.GetTableExecSql(txtSql.Text);
                        gvSelectData.DataSource = dtSelectData;
                        gvSelectData.DataBind();
                        WriteLog(GetLogValue("执行sql成功", "Update", "DataBaseExecSql", true), "", 2); //写日志       
                        Utils.RunJavaScript(this, "alert({msg:'执行sql成功!',title:'提示信息'})");
                    }
                    catch (Exception exp)
                    {
                        Utils.RunJavaScript(this, "alert({msg:'" + Utils.ReplaceQuotes(exp.Message) + "',title:'提示信息'})");
                    }
                }
                else
                {
                    try
                    {
                        //没有select直接执行sql
                        if (bll.ExecSql(txtSql.Text) == true)
                        {
                            WriteLog(GetLogValue("执行sql成功", "Update", "DataBaseExecSql", true), "", 2); //写日志       
                            Utils.RunJavaScript(this, "alert({msg:'执行sql成功!',title:'提示信息'})");
                        }
                    }
                    catch (Exception exp)
                    {
                        Utils.RunJavaScript(this, "alert({msg:'" + Utils.ReplaceQuotes(exp.Message) + "',title:'提示信息'})");
                    }
                }               
            }
        }
        #endregion

    }
}
