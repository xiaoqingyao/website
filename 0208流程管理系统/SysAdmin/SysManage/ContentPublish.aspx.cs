using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.Web.Admin;
using AllPower.BLL;
using System.Net;
using System.IO;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年7月27日
    功能描述： 内容发布
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class ContentPublish : AdminPage
    {
        #region 变量成员
        AllPower.BLL.SysManage.ServerMachine bll = new AllPower.BLL.SysManage.ServerMachine();
        string strSourceDir = System.Web.HttpContext.Current.Server.MapPath("/") + "SysAdmin\\Template\\Html";//本地发布目录，到时候会写在配置文件里维护
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        #endregion 

        #region 绑定数据
        private void BindData()
        {
            ddlServerMachine.DataSource = bll.GetList("ALL", Utils.getOneParams("")).DefaultView;
            ddlServerMachine.DataValueField = "ServerMachineName";
            ddlServerMachine.DataTextField = "ServerMachineName";
            ddlServerMachine.DataBind();
        }
        #endregion

        #region 发布
        protected void btnPublish_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Publish"))
            {
                try
                {
                    DataRow dr = bll.GetList("ONE", Utils.getOneParams(ddlServerMachine.SelectedValue)).Rows[0];
                    switch (dr["ConnectionType"].ToString())
                    {
                        case ("Local"):
                            {
                                CopyDirectory(strSourceDir, dr["LocalDirectoryPath"].ToString());
                                break;
                            }
                        case ("Ftp"):
                            {
                                UploadDirectoryFtp(strSourceDir,"",dr["FtpServer"].ToString(), dr["FtpUserName"].ToString(), dr["FtpPassword"].ToString(), dr["FtpPort"].ToString(), dr["FtpHomeDirectory"].ToString());
                                break;
                            }
                        case ("Network"):
                            {
                                CopyDirectory(strSourceDir, dr["NetworkDirectoryPath"].ToString());
                                break;
                            }
                    }
                    WriteLog(GetLogValue("发布内容成功", "Publish", "ContentPublish", true), "", 2); //写日志       
                    Utils.RunJavaScript(this, "alert({msg:'发布内容成功!',title:'提示信息'})");
                }
                catch (Exception exp)
                {
                    Utils.RunJavaScript(this, "alert({msg:'" + exp.Message + "',title:'提示信息'})");
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'您没有内容发布的权限!',title:'提示信息'})");
            }
        }
        #endregion 

        #region 发布用到方法
        /// <summary>
        /// 复制文件夹下所有文件和文件夹(Local/Network方式)
        /// </summary>
        /// <param name="SourceDir">要复制的源文件夹</param>
        /// <param name="TragetDir">目标文件夹</param>
        public void CopyDirectory(string SourceDir,string TragetDir)
        {
            if (!Directory.Exists(TragetDir))
            { 
                //目标文件夹不存在
                Directory.CreateDirectory(TragetDir);
            }
            //得到文件列表
            string[] files = Directory.GetFiles(SourceDir);
            foreach (string file in files)
            { 
                //复制
                File.Copy(file, TragetDir + Path.GetFileName(file), true);
            }
            //得到文件夹列表
            string[] dirs=Directory.GetDirectories(SourceDir);
            //递归调用CopyDirectory方法
            foreach (string dir in dirs)
            {
                CopyDirectory(dir, TragetDir + Path.GetFileName(dir)+"\\");
            }
        }

        /// <summary>
        /// 复制文件夹下所有文件和文件夹(FTP方式)
        /// </summary>
        /// <param name="SourceDir">源文件夹</param>
        /// <param name="TragetDir">目标文件夹</param>
        /// <param name="FtpServer">服务器</param>
        /// <param name="FtpUserName">用户名</param>
        /// <param name="FtpPassword">密码</param>
        /// <param name="FtpPort">端口号</param>
        /// <param name="FtpHomeDirectory">FTP主目录</param>
        public void UploadDirectoryFtp(string SourceDir, string TragetDir, string FtpServer, string FtpUserName, string FtpPassword, string FtpPort, string FtpHomeDirectory)
        {
            if (TragetDir != "" && DirectoryExist(TragetDir, FtpServer, FtpUserName, FtpPassword, FtpPort, FtpHomeDirectory)==false)
            {
                //目标文件夹不存在,创建FTP文件夹
                CreateFtpDir(TragetDir, FtpServer, FtpUserName, FtpPassword, FtpPort, FtpHomeDirectory);
            }
            //得到文件列表
            string[] files = Directory.GetFiles(SourceDir);
            foreach (string file in files)
            {
                //上传文件至FTP
                FtpUpload(file, FtpServer, FtpUserName, FtpPassword, FtpPort, FtpHomeDirectory +"\\" +TragetDir);
            }
            //得到文件夹列表
            string[] dirs = Directory.GetDirectories(SourceDir);
            //递归调用CopyDirectory方法
            foreach (string dir in dirs)
            {
                UploadDirectoryFtp(dir, TragetDir +"//"+ Path.GetFileName(dir), FtpServer, FtpUserName, FtpPassword, FtpPort, FtpHomeDirectory);
            }
        }

        /// <summary>
        /// 上传单个文件(FTP方式)
        /// </summary>
        /// <param name="FileName">要复制的文件</param>
        /// <param name="FtpServer">服务器</param>
        /// <param name="FtpUserName">用户名</param>
        /// <param name="FtpPassword">密码</param>
        /// <param name="FtpPort">端口号</param>
        /// <param name="FtpHomeDirectory">FTP主目录</param>
        public void FtpUpload(string FileName,string FtpServer, string FtpUserName, string FtpPassword, string FtpPort, string FtpHomeDirectory)
        {
            //定义一个FileInfo指向FileName
            FileInfo file = new FileInfo(FileName);
            FtpWebRequest ftpreq = (FtpWebRequest)FtpWebRequest.Create(new Uri(string.Format("ftp://{0}:{1}/{2}/{3}", FtpServer, FtpPort, FtpHomeDirectory, file.Name)));
            ftpreq.Credentials = new NetworkCredential(FtpUserName, FtpPassword);
            ftpreq.Method = WebRequestMethods.Ftp.UploadFile;
            ftpreq.KeepAlive = false;
            ftpreq.UseBinary = true;
            ftpreq.ContentLength = file.Length;

            byte[] buff = new byte[2048];
            FileStream fs = file.OpenRead();
            Stream strm = ftpreq.GetRequestStream();
            int contentLen;
            contentLen = fs.Read(buff, 0, 2048);
            while (contentLen != 0)
            {
                strm.Write(buff, 0, contentLen);
                contentLen = fs.Read(buff, 0, 2048);
            }
            strm.Close();
            fs.Close();
        }

        /// <summary>
        /// 创建文件夹(FTP方式)
        /// </summary>
        /// <param name="DirName">要创建的文件夹</param>
        /// <param name="FtpServer">服务器</param>
        /// <param name="FtpUserName">用户名</param>
        /// <param name="FtpPassword">密码</param>
        /// <param name="FtpPort">端口号</param>
        /// <param name="FtpHomeDirectory">FTP主目录</param>
        public void CreateFtpDir(string DirName, string FtpServer, string FtpUserName, string FtpPassword, string FtpPort, string FtpHomeDirectory)
        {
            FtpWebRequest ftpreq = (FtpWebRequest)FtpWebRequest.Create(new Uri(string.Format("ftp://{0}:{1}/{2}/{3}", FtpServer, FtpPort, FtpHomeDirectory, DirName)));
            ftpreq.Credentials = new NetworkCredential(FtpUserName, FtpPassword);
            ftpreq.Method = WebRequestMethods.Ftp.MakeDirectory;
            ftpreq.KeepAlive = false;
            ftpreq.UseBinary = true;
            FtpWebResponse response = (FtpWebResponse)ftpreq.GetResponse();
            Stream ftpStream = response.GetResponseStream();
            ftpStream.Close();
            response.Close();
        }

        /// <summary>
        /// 判断目录是否存在(FTP方式)
        /// </summary>
        /// <param name="DirName">目录名</param>
        /// <param name="FtpServer">服务器</param>
        /// <param name="FtpUserName">用户名</param>
        /// <param name="FtpPassword">密码</param>
        /// <param name="FtpPort">端口号</param>
        /// <param name="FtpHomeDirectory">FTP主目录</param>
        /// <returns></returns>
        public bool DirectoryExist(string DirName, string FtpServer, string FtpUserName, string FtpPassword, string FtpPort, string FtpHomeDirectory)
        {
            bool boolReturn = false;
            ArrayList arrDirAndFile = new ArrayList();//所有文件和文件夹列表
            ArrayList arrDirName = new ArrayList();//文件夹列表
            FtpWebRequest ftpreq = (FtpWebRequest)FtpWebRequest.Create(new Uri(string.Format("ftp://{0}:{1}/{2}/{3}", FtpServer, FtpPort, FtpHomeDirectory, DirName.Substring(0,DirName.LastIndexOf("//") ))));
            ftpreq.Credentials = new NetworkCredential(FtpUserName, FtpPassword);
            ftpreq.Method = WebRequestMethods.Ftp.ListDirectoryDetails;
            ftpreq.KeepAlive = false;
            ftpreq.UseBinary = true;
            FtpWebResponse response = (FtpWebResponse)ftpreq.GetResponse();
            StreamReader StreamReader = new StreamReader(response.GetResponseStream());
            string line = StreamReader.ReadLine();
            while (line != null)
            {
                arrDirAndFile.Add(line);
                line = StreamReader.ReadLine();
            }
            StreamReader.Close();
            response.Close();
            foreach (string strDirName in arrDirAndFile)
            {
                if (strDirName.Substring(0, 1).ToUpper() == "D")
                {
                    arrDirName.Add(strDirName.Substring(strDirName.LastIndexOf(" ")+1, strDirName.Length - strDirName.LastIndexOf(" ")-1));
                }
            }
            foreach (string DirectoryName in arrDirName)
            {
                if (DirectoryName == DirName.Substring(DirName.LastIndexOf("//") + 2, DirName.Length - DirName.LastIndexOf("//") - 2))
                {
                    boolReturn = true;
                    break;
                }
            }
            
            return boolReturn;
        }
        #endregion
    }
}
