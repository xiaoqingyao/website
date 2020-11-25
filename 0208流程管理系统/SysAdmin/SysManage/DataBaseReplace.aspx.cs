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

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年3月31日
    功能描述： 数据库字符串替换 
// 更新日期        更新人      更新原因/内容
  2010-9-16       胡志瑶       替换字符应为多选
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class DataBaseReplace : AdminPage
    {
        #region 变量成员
        AllPower.BLL.SysManage.DataBaseManage bll = new DataBaseManage();
        AllPower.Config.DataBaseManageConfig M_DataBaseManageConfig;
        string PhyFilePath = string.Empty;//数据库管理配置文件物理路径
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            //给数据库设置类赋值
            GetDataBaseManageSet();

            if (!IsPostBack)
            {
                string isDbManage = Utils.GetCookie("ISDBMANAGE");
                //是否已经输入验证码
                if (string.IsNullOrEmpty(isDbManage))
                {
                    Response.Redirect("DataManage.aspx?type=2&NodeCode=" + NodeCode);
                }
                //绑定列表控件
                BindData();
            }           
        }
        #endregion

        #region 控件绑定数据
        protected void BindData()
        {
            ddlDataTable.DataSource=GetDataTable();
            ddlDataTable.DataBind();
            reptFiles.DataSource = GetFiles(ddlDataTable.SelectedValue);
            reptFiles.DataBind();
            txtFiles.Attributes.Add("readonly","readonly");
        }
        #endregion

        #region 给数据库设置类赋值
        private void GetDataBaseManageSet()
        {
            string FilePath = "~/SysAdmin/Configuraion/DataBaseManage.config";
            PhyFilePath = HttpContext.Current.Server.MapPath(FilePath);
            M_DataBaseManageConfig = AllPower.Config.DataBaseManage.GetConfig(PhyFilePath);
        }
        #endregion

        #region 获取数据库所有表 返回列表
        private ArrayList GetDataTable()
        {
            ArrayList arrTables=new ArrayList();
            Server SqlServer = new Server(new ServerConnection(M_DataBaseManageConfig.Server, M_DataBaseManageConfig.UserName, M_DataBaseManageConfig.Password));
            Microsoft.SqlServer.Management.Smo.Database database = SqlServer.Databases[M_DataBaseManageConfig.DataBase];
            foreach (Microsoft.SqlServer.Management.Smo.Table datatable in database.Tables)
            { 
                arrTables.Add(datatable.Name);
            }
            return arrTables;
        }
        #endregion

        #region 返回指定表的所有字段
        private ArrayList GetFiles(string TableName)
        {
            ArrayList arrColumn = new ArrayList();
            Server SqlServer = new Server(new ServerConnection(M_DataBaseManageConfig.Server, M_DataBaseManageConfig.UserName, M_DataBaseManageConfig.Password));
            Microsoft.SqlServer.Management.Smo.Database database = SqlServer.Databases[M_DataBaseManageConfig.DataBase];
            Microsoft.SqlServer.Management.Smo.Table datatable = database.Tables[TableName];
            foreach (Microsoft.SqlServer.Management.Smo.Column datacolumn in datatable.Columns)
            {
                if (datacolumn.DataType.ToString() == "nvarchar" || datacolumn.DataType.ToString() == "varchar" || datacolumn.DataType.ToString() == "text")
                {
                    arrColumn.Add(datacolumn.Name);
                }
            }
            return arrColumn;
        }
        #endregion

        #region 自动会发绑定字段列表
        protected void ddlDataTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtFiles.Text = "";
            reptFiles.DataSource = GetFiles(ddlDataTable.SelectedValue);
            reptFiles.DataBind();


        }
        #endregion       

        #region 替换字符串
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //判断是否有替换字符串权限，暂时用edit,看后续是否需要单独加替换字符串操作
            if (IsHaveRightByOperCode("Edit"))
            {
                try
                {
                    string sql = GetSql();
                    if (bll.ExecSql(sql) == true)
                    {
                        WriteLog(GetLogValue("字符串替换成功", "Update", "DataBaseReplace", true), "", 2); //写日志      

                        Utils.RunJavaScript(this, "alert({msg:'字符串替换成功!',title:'提示信息'});$('#txtFiles').val('');");
                    }
                    else
                    {
                        Utils.RunJavaScript(this, "alert({msg:'(0 行受影响)',title:'提示信息'});$('#txtFiles').val('');");
                    }
                }
                catch (Exception exp)
                {
                    Utils.RunJavaScript(this, "alert({msg:'" + exp.Message + "',title:'提示信息'});$('#txtFiles').val('');");
                }
            }
        }
        #endregion 

        #region 获取执行的sql
        //对输入的数据未检查
        private string GetSql()
        {
            StringBuilder sqlsb = new StringBuilder();
            string[] fields = Request["chkField"].Trim().Split(',');
            
            switch (ddlReplaceType.SelectedValue)
            {
                case ("1"):
                    {
                        //字符串替换
                        sqlsb.Append("UPDATE " + ddlDataTable.SelectedValue + " SET ");
                        for (int i = 0; i < fields.Length; i++)
                        {
                            sqlsb.Append(fields[i] + " = REPLACE(" + fields[i] + ",'" + txtOldValue.Text.Trim() + "','" + txtNewValue.Text + "') ");
                            if (i != fields.Length - 1)
                            {
                                sqlsb.Append(",");
                            }
                        }                      
                        if (!string.IsNullOrEmpty(txtWhere.Text.Trim()))
                        {
                            sqlsb.Append(" WHERE "+ txtWhere.Text+"");                            
                        }                      
                        break;
                    }
                case ("2"):
                    {

                        //在字段前面追加
                        sqlsb.Append("UPDATE " + ddlDataTable.SelectedValue + " SET ");
                        for (int i = 0; i < fields.Length; i++)
                        {
                            sqlsb.Append(fields[i] + "='" + txtAdd.Text + "'+" + fields[i] + "");
                            if (i != fields.Length - 1)
                            {
                                sqlsb.Append(",");
                            }
                        }
                        if (!string.IsNullOrEmpty(txtWhere.Text.Trim()))
                        {
                            sqlsb.Append(" WHERE " + txtWhere.Text + "");
                        }  
                        break;
                    }
                case ("3"):
                    {
                        //在字段后面追加
                        sqlsb.Append("UPDATE " + ddlDataTable.SelectedValue + " SET ");
                        for (int i = 0; i < fields.Length; i++)
                        {
                            sqlsb.Append(fields[i] + "=" + fields[i] + "+'" + txtAdd.Text + "'");
                            if (i != fields.Length - 1)
                            {
                                sqlsb.Append(",");
                            }
                        }
                        if (!string.IsNullOrEmpty(txtWhere.Text.Trim()))
                        {
                            sqlsb.Append(" WHERE " + txtWhere.Text + "");
                        }  
                        break;
                    }                  
            }
            return sqlsb.ToString();
        }
        #endregion
    }
}
