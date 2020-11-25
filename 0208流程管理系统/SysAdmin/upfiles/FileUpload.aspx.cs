using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AllPower.Common;
using AllPower.Web.Admin;
using System.Diagnostics;
using Microsoft.Win32;
using System.Text;

/*================================================================
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月8日    功能描述： 风格模板文件上传 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
namespace AllPower.WEB.SysAdmin.upfiles
{
    public partial class FileUpload : AdminPage
    {
        #region 属性/变量
        string AllowExt = "";                   //允许上传文件类型
        string upType = "";                     //上传的类型,如:skin,temp
        private string _controlMaxSize = "";   //控件的最大文件大小
        private int MaxSize = 6291456;         //6M 1024*1024*6 允许上传最大文件大小(默认)
        protected string jsExe = string.Empty;  //输出字符串

        private string ControlMaxSize
        {
            get { return _controlMaxSize; }
            set { _controlMaxSize = value; }
        }
        #endregion

        #region 初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            this.upType = Request.QueryString["FileType"].ToLower();   //上传类型
            this.ControlMaxSize = Request.QueryString["MaxSize"];      //用户设置允许最大上传文件大小
            switch (this.upType)                                      //判断上传类型以确定允许上传的文件类型  
            {
                case "skin":
                    AllowExt = "zip|rar|jpg|jpeg|gif|bmp|png|js|css|swf";
                    MaxSize = GetMaxSize(8192);
                    break;
                case "temp":
                    AllowExt = "zip|rar|html|htm";
                    break;
            }

            if (!Page.IsPostBack)
            {
                spanSize.InnerHtml = (Math.Round(float.Parse(MaxSize.ToString()) / 1048576, 2)).ToString();
                this.lblMessage.Text = Utils.GetResourcesValue("Common", "UploadMsg") + AllowExt;
            }
        }
        #endregion

        #region 文件或压缩包上传
        private void UploadFiles()
        {
            #region 变量
            string formName = Request.QueryString["FormName"];          // 表单名称
            string fileName = string.Empty;                             // 文件名
            string fileExt = string.Empty;                              // 上传文件扩展名


            fileName = Path.GetFileName(this.txtFileUpload.FileName);   //获得去掉目录信息文件名称
            fileExt = Path.GetExtension(fileName).ToLower();            //上传文件扩展名

            string lstrFileNamePath = null;                             //上传目录及文件名
            string dir = Request.QueryString["savePath"];               //服务的目录路径
            //判断路径最后是含有"/"
            if (!dir.Substring(dir.Length - 1).Equals("/"))
            {
                dir += "/";
            }
            #endregion

            try
            {
                //判断文件的类型是否合法
                if (AllowExt.IndexOf(fileExt.Replace(".", "")) == -1)
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script language=\"javascript\">alert('" + Utils.GetResourcesValue("Common", "UploadExtErr") + "!');</script>");
                    return;
                }
                //判断文件大小是否超限
                if (txtFileUpload.FileContent.Length > MaxSize)
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script language=\"javascript\">alert('" + Utils.GetResourcesValue("Common", "UploadErr1") + Math.Round(float.Parse(MaxSize.ToString()) / 1048576, 2) + "M!');</script>");
                    return;
                }

                //判断上传到服务器的目录路径是否为空
                if (dir.Length > 0 && !dir.Equals(""))
                {
                    //判断上传目录是否存在，不存在就建立 
                    if (!Directory.Exists(dir))
                    {
                        Directory.CreateDirectory(dir);
                    }
                }
                //判断路径最后是含有"/"
                if (dir.Substring(dir.Length - 1).Equals("/"))
                {
                    lstrFileNamePath = Server.MapPath(dir + fileName);             //得到上传目录及文件名称
                }
                else
                {
                    lstrFileNamePath = Server.MapPath(dir + "/" + fileName);             //得到上传目录及文件名称
                }
                //判断是文件还压缩包
                if (fileExt.Equals(".rar"))
                {
                    string tempPath = Path.GetTempPath();                               //临时存放目录 
                    string unPath = tempPath + fileName;                                //要解压的完整路径
                    string rarPath = dir;                                               //解压的目录
                    this.txtFileUpload.SaveAs(unPath);                                  //上传到临时目录
                    unRAR(rarPath, tempPath, fileName);                                 //解压到指定的目录
                }
                else if (fileExt.Equals(".zip"))
                {
                    string tempPath = Path.GetTempPath();                               //临时存放目录 
                    string unPath = tempPath + fileName;                                //要解压的完整路径
                    string zipPath = Server.MapPath(dir);                               //解压的目录
                    this.txtFileUpload.SaveAs(unPath);                                  //上传到临时目录
                    UnZip(unPath, zipPath);                                             //解压到指定的目录里
                }
                else
                {
                    this.txtFileUpload.PostedFile.SaveAs(lstrFileNamePath);             //上传文件到服务器
                }
                jsExe = "<script language=\"javascript\" type=\"text/javascript\">window.parent.location.reload();window.parent.Closed();</script>";    //上传成功关闭当前窗口
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        #region 得到上传文件限制大小
        private int GetMaxSize(int uploadSetSize)
        {
            int reSize = uploadSetSize;
            if (!Utils.StrIsNullOrEmpty(this.ControlMaxSize))
            {
                reSize = Utils.ParseInt(this.ControlMaxSize, uploadSetSize);
            }
            return reSize * 1024;
        }
        #endregion

        /// <summary>
        ///  上传
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            this.UploadFiles();
        }

        /// <summary>
        /// 解压rar文件包
        /// </summary>
        /// <param name="unRarPatch">解压后的目录</param>
        /// <param name="rarPatch">要解压目录</param>
        /// <param name="rarName">压缩包名字</param>
        private void unRAR(string unRarPatch, string rarPatch, string rarName)
        {
            string the_rar;
            RegistryKey the_Reg;
            Object the_Obj;
            string the_Info;
            ProcessStartInfo the_StartInfo;
            Process the_Process;
            try
            {
                the_Reg = Registry.ClassesRoot.OpenSubKey(@"Applications\\WinRAR.exe\\shell\\open\\command"); //(@"ApplicationsWinRAR.exeShellOpenCommand"); //启动解压的进程
                the_Obj = the_Reg.GetValue("");
                the_rar = the_Obj.ToString();
                the_Reg.Close();
                the_rar = the_rar.Substring(1, the_rar.Length - 7);
                //判断解压后的目录是否存在,没有就创建
                if (unRarPatch.Length > 0 && !unRarPatch.Equals(""))
                {
                    //判断上传目录是否存在，不存在就建立 
                    if (!Directory.Exists(unRarPatch))
                    {
                        Directory.CreateDirectory(unRarPatch);
                    }
                }
                //设置解压的命令参数
                the_Info = "x " + rarName + " " + Server.MapPath(unRarPatch) + " -r -y";               //支持包含子目录的,无则是x改成e,解压的命令
                the_StartInfo = new ProcessStartInfo();
                the_StartInfo.FileName = the_rar;
                the_StartInfo.Arguments = the_Info;
                the_StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                the_StartInfo.WorkingDirectory = rarPatch;                                            //获取压缩包路径
                the_Process = new Process();
                the_Process.StartInfo = the_StartInfo;
                the_Process.Start();
                the_Process.WaitForExit();
                the_Process.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// 解压zip包
        /// </summary>
        /// <param name="zipFile">压缩包目录</param>
        /// <param name="destFolder">解压文件的目标存放目录</param>
        private void UnZip(string zipFile, string destFolder)
        {
            Shell32.ShellClass sc = new Shell32.ShellClass();
            Shell32.Folder SrcFolder = sc.NameSpace(zipFile);
            Shell32.Folder DestFolder = sc.NameSpace(destFolder);
            Shell32.FolderItems items = SrcFolder.Items();
            DestFolder.CopyHere(items, 20);
        }
        #endregion
    }
}
