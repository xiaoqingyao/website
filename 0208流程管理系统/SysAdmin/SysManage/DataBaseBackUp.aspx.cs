using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AllPower.Common;
using AllPower.Model;
using AllPower.BLL.SysManage;
using AllPower.Web.Admin;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using Microsoft.SqlServer.Management;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;
using System.IO;
using Microsoft.SqlServer.Management.Sdk.Sfc;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年3月31日
    功能描述： 数据库备份 
// 更新日期        更新人      更新原因/内容
   2010-9-14       胡志瑶     CreatePath：文件夹不存在时，自动创建、及页面效果
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class DataBaseBackUp : AdminPage
    {
        #region 变量成员
        AllPower.BLL.SysManage.DataBaseManage bll = new DataBaseManage();
        AllPower.Config.DataBaseManageConfig M_DataBaseManageConfig;
        string PhyFilePath = string.Empty;//数据库管理配置文件物理路径
        string DataBaseBackUpFileName = string.Empty;//数据库备份文件名，由CreatePath()方法生成
        public string strSqlFilePath, strBakFileServer, strBakFilePath;//配置信息
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            //给数据库设置类赋值
            GetDataBaseManageSet();

            //获取配置文件信息
            GetDataBaseSetInfo();

            if (!IsPostBack)
            {
                //绑定列表控件
                BindData();
                //判断权限
                SetRight(this.Page, rptDataTableList);                
            }            
        }
        #endregion 

        #region 获取配置文件信息
        private void GetDataBaseSetInfo()
        {
            strSqlFilePath = M_DataBaseManageConfig.SqlFilePath;
            strBakFileServer = M_DataBaseManageConfig.Server;
            strBakFilePath = M_DataBaseManageConfig.BakFilePath;
            if (strSqlFilePath == "")
            {
                Utils.RunJavaScript(this, "alert({msg:'请到-系统设置-数据库设置 下设置sql文件备份路径!',title:'提示信息'})");
            }
            if (strBakFileServer == "")
            {
                Utils.RunJavaScript(this, "alert({msg:'请到-系统设置-数据库设置 下设置serve服务器地址!',title:'提示信息'})");
            }

        }
        #endregion

        #region 控件绑定数据
        protected void BindData()
        {
            rptDataTableList.DataSource = bll.GetUserTableInfo();
            rptDataTableList.DataBind();
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

        #region 备份数据库
        //sql文件备份
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //判断是否有备份权限，暂时用edit,看后续是否需要单独加备份操作
            if (IsHaveRightByOperCode("Edit"))
            {
                try
                {
                    string path = CreatePath("sql");
                    StreamWriter sw = new StreamWriter(path);
                    string strSql;
                    string[] Tables = Request.Form["chkId"].Split(',');
                    List<string> dbInfo = new Top().GetDataBaseInfo();
                    //if(dbInfo[0].IndexOf ("2008")!=-1)
                    //    strSql = DbBackup2(Tables);
                    //else
                        strSql = DbBackup2005_SQL(Tables);

                    sw.Write(strSql);
                    sw.Close();
                    WriteLog(GetLogValue("备份数据库成功", "Update", "DataBaseBackUp", true), "", 2); //写日志  
                    Utils.RunJavaScript(this, " alert({ msg: '备份数据库成功！', title: '提示消息' });");
                }
                catch (Exception exp)
                {
                    Utils.RunJavaScript(this, "alert({msg:'+"+exp.Message+"+',title:'提示信息'})");
                }
            }
        }
        //bak文件备份
        protected void btnSave2_Click(object sender, EventArgs e)
        {
            //判断是否有备份权限，暂时用edit,看后续是否需要单独加备份操作
            if (IsHaveRightByOperCode("Edit"))
            {
                bool isOk = false;
                List<string> dbInfo = new Top().GetDataBaseInfo();
                if (dbInfo[0].IndexOf("2008") != -1)
                    isOk = DbBackup();
                else
                    isOk = DbBackup2005();

                if (isOk)
                {
                    //如果备份成功，向配置文件中加入备份文件列表
                    string strDataBackFileList = Utils.XmlRead(PhyFilePath, "/DataBaseManageConfig/DataBackFileList", "");//读取原有备份文件列表

                    Utils.XmlUpdate(PhyFilePath, "/DataBaseManageConfig/DataBackFileList", "", strDataBackFileList + DataBaseBackUpFileName + "$" + DateTime.Now + "|");//追加新的数据库文件

                    
                    WriteLog(GetLogValue("备份数据库成功", "New", "DataBaseBackUp", true), "", 2); //写日志       
                    Utils.RunJavaScript(this, "alert({msg:'备份数据库成功!',title:'提示信息'})");
                }
            }
        }
        #endregion

        #region 备份用到方法 SQL SERVER2008
        /// <summary>
        /// 数据库备份bak文件方式
        /// </summary>
        /// <returns>备份是否成功</returns>
        private bool DbBackup()
        {
            string path = CreatePath("bak");
            Server SqlServer = new Server(new ServerConnection(M_DataBaseManageConfig.Server, M_DataBaseManageConfig.UserName, M_DataBaseManageConfig.Password));
            Backup myBackup = new Backup();
            try
            {
                myBackup.Action = BackupActionType.Database;//备份方式前台选择
                myBackup.Database = M_DataBaseManageConfig.DataBase;
                BackupDeviceItem deviceItem = new BackupDeviceItem(path, DeviceType.File);
                myBackup.Devices.Add(deviceItem);
                myBackup.Initialize = true;
                myBackup.SqlBackup(SqlServer);
                return true;
            }
            catch (Exception exp)
            {
                Utils.RunJavaScript(this, "alert({msg:'" + strBakFileServer.Replace("\\", "\\\\") + "上的" + strBakFilePath.Replace("\\", "\\\\") + "不存在，或sql服务器未配置正确！',title:'提示信息'});");
                return false;
            }
        }

        /// <summary>
        /// 数据库备份sql文件方式
        /// </summary>
        /// <param name="Tables">要备份的表数组</param>
        /// <returns>返回生成的脚本</returns>
        private string DbBackup2(string[] Tables)
        {
            string strReturn = string.Empty;
            Server SqlServer = new Server(new ServerConnection(M_DataBaseManageConfig.Server, M_DataBaseManageConfig.UserName, M_DataBaseManageConfig.Password));
            Scripter script=new Scripter(SqlServer);
            try
            {              
                Microsoft.SqlServer.Management.Smo.Database database = SqlServer.Databases[M_DataBaseManageConfig.DataBase];
                foreach (Microsoft.SqlServer.Management.Smo.Table datatable in database.Tables)
                {
                    for(int i=0;i<Tables.Length;i++)
                    {
                        if (datatable.Name.Equals(Tables[i]))
                        {
                            //生成创建/删除table的脚本
                            ScriptingOptions scriptOptions = new ScriptingOptions();                            
                            scriptOptions.IncludeIfNotExists = true;
                            scriptOptions.ScriptDrops = true;
                            //scriptOptions.ScriptData = true;
                            //scriptOptions.IncludeDatabaseContext = true;
                            //scriptOptions.Triggers = true;
                            //scriptOptions.DriAll = true;
                            //scriptOptions.DriAllConstraints = true;
                            //scriptOptions.DriAllKeys = true;
                            //scriptOptions.DriChecks = true;
                            //scriptOptions.DriClustered = true;
                            //scriptOptions.DriDefaults = true;
                            //scriptOptions.DriForeignKeys = true;
                            //scriptOptions.DriIndexes = true;
                            //scriptOptions.DriNonClustered = true;
                            //scriptOptions.DriPrimaryKey = true;
                            //scriptOptions.DriUniqueKeys = true;
                            //scriptOptions.WithDependencies = true;   
                            System.Collections.Specialized.StringCollection sc = datatable.Script(scriptOptions);
                            foreach (String s in sc)
                            {
                                strReturn += s;
                            }
                            //生成insert语句的脚本
                            script.Options.ScriptData = true;
                            foreach (string s in script.EnumScript(new Urn[] { datatable.Urn }))
                            {
                                strReturn = strReturn+s+"\r\n";
                            }
                            break;
                        }
                    }
                }                  
            }
            catch (Exception exp)
            {
                Utils.RunJavaScript(this, "alert({msg:'" + exp.Message + "',title:'提示信息'})");
            }
            return strReturn;
        }

        /// <summary>
        /// 构造文件名
        /// </summary>
        /// <param name="Type">类型</param>
        /// <returns>文件名</returns>
        private string CreatePath(string Type)
        {
            string CurrTime = System.DateTime.Now.ToString("yyyyMMddhhmmss");
            string path = string.Empty;//返回的文件名
           
            if (Type == "bak"){
                path = string.Format(@"{0}\cms_db_{1}.bak", M_DataBaseManageConfig.BakFilePath, CurrTime);   
                 
            }
            else {
                path = string.Format(@"{0}\cms_db_{1}.sql", M_DataBaseManageConfig.SqlFilePath, CurrTime);
                if (!System.IO.Directory.Exists(M_DataBaseManageConfig.SqlFilePath)) //不存在该文件夹
                {
                    System.IO.Directory.CreateDirectory(M_DataBaseManageConfig.SqlFilePath);
                }
            }

            DataBaseBackUpFileName = string.Format("cms_db_{0}.bak", CurrTime);//bak备份文件名，保存在配置文件中，用于选择bak备份文件列表时显示
            return path;
        }
        #endregion

        #region 备份用到方法 SQL SERVER2005
        /// <summary>
        /// 数据库备份bak文件方式
        /// </summary>
        /// <returns>备份是否成功</returns>
        private bool DbBackup2005()
        {
            string path = CreatePath("bak");

            SqlDmoHelper dmo = new SqlDmoHelper(M_DataBaseManageConfig.Server, M_DataBaseManageConfig.UserName, M_DataBaseManageConfig.Password, M_DataBaseManageConfig.DataBase);
            bool isOk=dmo.BackupDB(M_DataBaseManageConfig.DataBase, path, "手动备份", "");

            if(!isOk)
            {
                Utils.RunJavaScript(this, "alert({msg:'" + strBakFileServer.Replace("\\", "\\\\") + "上的" + strBakFilePath.Replace("\\", "\\\\") + "不存在，或sql服务器未配置正确！',title:'提示信息'});");
                return false;
            }
            return true;
        }

        /// <summary>
        /// 数据库备份sql文件方式
        /// </summary>
        /// <param name="Tables">要备份的表数组</param>
        /// <returns>返回生成的脚本</returns>
        private string DbBackup2005_SQL(string[] Tables)
        {
            StringBuilder backSql = new StringBuilder();
            string dbName=M_DataBaseManageConfig.DataBase;
            SqlDmoHelper dmo = new SqlDmoHelper(M_DataBaseManageConfig.Server, M_DataBaseManageConfig.UserName, M_DataBaseManageConfig.Password, dbName);
            for(int i=0;i<Tables.Length ;i++)
            {
                if (this.chkIsCreateTable.Checked)
                {
                    string createTable = dmo.CreateTableSql(dbName, Tables[i]);
                    if (string.IsNullOrEmpty(createTable))
                    {
                        backSql.Append ( " delete " + Tables[i] + "\r\n");
                    }
                    else
                    {
                        backSql.Append ( " IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[" + Tables[i] + "]') AND type in (N'U')) DROP TABLE [dbo].[" + Tables[i] + "]\r\n");
                    }
                    backSql.Append (createTable);
                }
                backSql.Append (dmo.CreateInsertSql(Tables[i]));
                backSql.Append ("\r\n");
            }
            return backSql.ToString ();
        }

        #endregion
       
    }
}
