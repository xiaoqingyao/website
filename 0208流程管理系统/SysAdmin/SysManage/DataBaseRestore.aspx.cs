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
//using Microsoft.SqlServer.Management;
//using Microsoft.SqlServer.Management.Common;
//using Microsoft.SqlServer.Management.Smo;
//using Microsoft.SqlServer.Management.Sdk.Sfc;
using System.IO;


#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年3月31日
    功能描述： 数据库还原 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class DataBaseRestore : AdminPage
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
                //绑定列表控件
                BindData();
                //判断权限
                SetRight(this.Page, rptSqlFileList);
                SetRight(this.Page, rptBakFileList);
            }            
        }
        #endregion 

        #region 控件绑定数据
        protected void BindData()
        {
            try
            {
                string isDbManage = Utils.GetCookie("ISDBMANAGE");
                //是否已经输入验证码
                if (string.IsNullOrEmpty(isDbManage)) 
                {
                    Response.Redirect("DataManage.aspx?type=1&NodeCode=" + NodeCode);
                }
                //bak文件列表
                if (!string.IsNullOrEmpty(M_DataBaseManageConfig.DataBackFileList))
                {
                    //服务器IP
                    string sIP = System.Net.Dns.GetHostByName(System.Net.Dns.GetHostName()).AddressList[0].ToString();
                    //sqlserverIP
                    int idx = M_DataBaseManageConfig.Server.IndexOf('\\');
                    string sqlIp = M_DataBaseManageConfig.Server.Substring(0, idx == -1 ? 0 : idx);
                    //同一台服务器
                    if (sIP == sqlIp)
                    {
                        hidIsCommIP.Value = true.ToString();
                        DirectoryInfo thisOne = new DirectoryInfo(M_DataBaseManageConfig.BakFilePath);
                        FileInfo[] fileInfo = thisOne.GetFiles(); //目录下的文件 
                        StringBuilder nameList = new StringBuilder();
                        foreach (FileInfo fInfo in fileInfo)
                        {
                            if (fInfo.Name.Substring(fInfo.Name.IndexOf('.') + 1) == "bak")
                            {
                                nameList.Append(fInfo.Name +"$" + fInfo.CreationTime + "|");
                            }
                        }
                        //及时更新配置文件中备份文件列表
                        Utils.XmlUpdate(PhyFilePath, "/DataBaseManageConfig/DataBackFileList", "", nameList.ToString());
                        GetDataBaseManageSet();
                    }

                    string[] bakList = M_DataBaseManageConfig.DataBackFileList.Substring(0, M_DataBaseManageConfig.DataBackFileList.Length - 1).Split('|');
                    //绑定bak文件列表
                    DataTable dtBak = new DataTable();
                    dtBak.Columns.Add("FileName");
                    dtBak.Columns.Add("CreateTime");
                    foreach (string bak in bakList)
                    {
                        string [] cell=bak.Split('$');
                        DataRow newdr = dtBak.NewRow();
                        newdr["FileName"] = cell[0];                       
                        newdr["CreateTime"] = cell[1];
                        dtBak.Rows.Add(newdr);
                    }
                    rptBakFileList.DataSource = dtBak;                   
                }
                else
                {
                    rptBakFileList.DataSource = null;                    
                }
                rptBakFileList.DataBind();
                //sql文件信息
                //构造DataTable
                DataTable dtSqlFileInfo = new DataTable();
                dtSqlFileInfo.Columns.Add(new DataColumn("FileName", Type.GetType("System.String")));//文件名
                dtSqlFileInfo.Columns.Add(new DataColumn("FileSize", Type.GetType("System.String")));//大小
                dtSqlFileInfo.Columns.Add(new DataColumn("CreateTime", Type.GetType("System.DateTime")));//创建时间
                //定义一个DirectoryInfo对象
                DirectoryInfo di = new DirectoryInfo(M_DataBaseManageConfig.SqlFilePath);
                //通过GetFiles方法,获取di目录中的所有文件的信息
                foreach (FileInfo fi in di.GetFiles())
                {
                    if (fi.Name.Substring(fi.Name.IndexOf('.') + 1) == "sql")
                    {
                        DataRow dr = dtSqlFileInfo.NewRow();
                        //去掉文件路径，只要文件名
                        dr["FileName"] = fi.Name.Replace(M_DataBaseManageConfig.SqlFilePath + "\\", "");
                        //大小
                        dr["FileSize"] = decimal.Round(Convert.ToDecimal(fi.Length) / 1024 / 1024, 2).ToString() + " M";
                        //创建时间
                        dr["CreateTime"] = fi.CreationTime;
                        dtSqlFileInfo.Rows.Add(dr);
                    }
                }   
                //绑定sql文件列表
                rptSqlFileList.DataSource = dtSqlFileInfo;                
                rptSqlFileList.DataBind();
            }
            catch (Exception exp)
            {
                string str = "<script>$('#searchContainer').show();$('#searchContainer').html($('#searchContainer').html()+'" + exp.Message + "');</script>";
                ltljs.Text = str;
            }
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

        #region 删除选中备份
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Delete"))
            {
                //选中的备份文件
                string[] sqlBackFiles = Request.Form["chkId"].Split(',');
                if (sqlBackFiles.Length > 0)
                {
                    try
                    {
                        foreach (string delFileName in sqlBackFiles)
                        {
                            //遍历要删除的文件数组，删除该文件
                            File.Delete(M_DataBaseManageConfig.SqlFilePath + "\\" + delFileName);
                        }
                        WriteLog(GetLogValue("删除备份文件成功", "Del", "DataBaseBackUp", true), "", 2); //写日志       
                        Utils.RunJavaScript(this, "alert({msg:'删除备份文件成功!',title:'提示信息'})");
                        BindData();
                    }
                    catch (Exception exp)
                    {
                        Utils.RunJavaScript(this, "alert({msg:'" + exp.Message + "',title:'提示信息'})");
                    }
                }
            }
        }
        #endregion   

        #region 数据库还原
        //从sql文件还原
        public void lnkbRestore_Click(object sender, CommandEventArgs e)
        {
            //判断是否有还原权限
            if (IsHaveRightByOperCode("Restore"))
            {
                //读取sql文件
                StreamReader sr = new StreamReader(M_DataBaseManageConfig.SqlFilePath + "\\" + e.CommandArgument.ToString());
                string sql = sr.ReadToEnd();
                sr.Close();
                //直接采用sqlclient的方式执行sql语句，用smo更慢，暂时没有找到执行大量insert语句高效率的方法，是否可以考虑写成存储过程
                if (bll.ExecSql(sql) == true)
                {
                    WriteLog(GetLogValue("还原数据库成功", "Update", "DataBaseBackUp", true), "", 2); //写日志       
                    Utils.RunJavaScript(this, "alert({msg:'还原数据库成功!',title:'提示信息'})");
                }
            }
        }
        //从bak文件还原
        public void lnkbRestore2_Click(object sender, CommandEventArgs e)
        {
            //判断是否有还原权限          
            

            if (IsHaveRightByOperCode("Restore"))
            {
                if (DbRestore(e.CommandArgument.ToString()) == true)
                {
                    WriteLog(GetLogValue("还原数据库成功", "Update", "DataBaseBackUp", true), "", 2); //写日志       
                    Utils.RunJavaScript(this, "alert({msg:'还原数据库成功!',title:'提示信息'})");
                }
            }
        }
        #endregion

        #region 还原用到方法
        /// <summary>
        /// 数据库恢复
        /// </summary>
        /// <param name="BackFileName">bak文件名</param>
        /// <returns>还原是否成功</returns>
        private bool DbRestore(string BackFileName)
        {
            bool re=RestoreDB(M_DataBaseManageConfig.DataBase, M_DataBaseManageConfig.BakFilePath + "\\" + BackFileName, M_DataBaseManageConfig.UserName, M_DataBaseManageConfig.Password);
            if (re==false)
            {
                Utils.RunJavaScript(this, "alert({msg:'还原失败，可能是该备份文件已经被删除或重命名',title:'提示信息'});changeMenu('Bak');");
            }

            return re;
        }


        /// <summary>
          /// 还原bak类型备份的数据库函数
          /// </summary>
          /// <param name="strDbName">数据库名</param>
          /// <param name="strFileName">数据库备份文件的完整路径名</param>
          /// <returns></returns>
        public bool RestoreDB(string strDbName, string strFileName, string userid, string pwd)
        {
            //PBar = pgbMain ;
            SQLDMO.SQLServer svr = new SQLDMO.SQLServerClass();
            try
            {
                //服务器名，数据库用户名，数据库用户名密码
                svr.Connect(M_DataBaseManageConfig.Server, userid, pwd);

                SQLDMO.QueryResults qr = svr.EnumProcesses(-1);
                int iColPIDNum = -1;
                int iColDbName = -1;
                for (int i = 1; i <= qr.Columns; i++)
                {
                    string strName = qr.get_ColumnName(i);
                    if (strName.ToUpper().Trim() == "SPID")
                    {
                        iColPIDNum = i;
                    }
                    else if (strName.ToUpper().Trim() == "DBNAME")
                    {
                        iColDbName = i;
                    }
                    if (iColPIDNum != -1 && iColDbName != -1)
                        break;
                }
                //杀死使用strDbName数据库的进程
                for (int i = 1; i <= qr.Rows; i++)
                {
                    int lPID = qr.GetColumnLong(i, iColPIDNum);
                    string strDBName = qr.GetColumnString(i, iColDbName);
                    if (strDBName.ToUpper() == strDbName.ToUpper())
                    {
                        svr.KillProcess(lPID);
                    }
                }

                SQLDMO.Restore res = new SQLDMO.RestoreClass();
                res.Action = 0;
                res.Files = strFileName;

                res.Database = strDbName;
                res.ReplaceDatabase = true;
                res.SQLRestore(svr);
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                svr.DisConnect();
            }
        }


        //删除bak备份文件
        public void lnkDelete_Click(object sender, CommandEventArgs e)
        {
            //判断是否有删除   

            if (IsHaveRightByOperCode("Delete"))
            { 
                //选中的备份文件
                string name = e.CommandArgument.ToString(); 
                try
                { 
                    //及时更新配置文件中备份文件列表
                    string nameList = Utils.XmlRead(PhyFilePath, "/DataBaseManageConfig/DataBackFileList", "");
                    string[] bakList = nameList.Split('|');
                    string oldValue = "";
                    foreach (string bak in bakList)
                    {
                        if (bak.Split('$')[0].Trim().Equals(name.Trim()))
                        {
                            oldValue = bak;
                            break;
                        }
                    }
                    nameList = nameList.Replace(oldValue + "|", "");
                    Utils.XmlUpdate(PhyFilePath, "/DataBaseManageConfig/DataBackFileList", "", nameList.ToString());
                  

                    //删除文件不能跨ip
                    if (bool.Parse(hidIsCommIP.Value))
                    {
                        //遍历要删除的文件数组，删除该文件
                        File.Delete(M_DataBaseManageConfig.SqlFilePath + "\\" + name);
                    }
                    else
                    {
                        Utils.RunJavaScript(this, "alert({msg:'删除成功，但数据库服务器上的的备份文件并未删除，请手动删除该文件！',title:'提示信息'})");
                    }

                    WriteLog(GetLogValue("删除备份文件成功", "Del", "DataBaseBackUp", true), "", 2); //写日志       
                    Utils.RunJavaScript(this, "alert({msg:'删除备份文件成功!',title:'提示信息'});changeMenu('Bak');");
                    GetDataBaseManageSet();
                    BindData();
                }
                catch (Exception exp)
                {
                    Utils.RunJavaScript(this, "alert({msg:'" + exp.Message + "',title:'提示信息'})");
                }
                
                
            }
        }
        #endregion
    }
}
