using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Text;
using System.IO;
using System.Collections;
using System.Xml;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      严辉
    创建时间： 2010年5月26日
    功能描述： 木马扫描
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class TrojanScan : AdminPage
    {
        private static DataTable dtFileList = new DataTable();
        private string trojanXml = null;        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        #region 数据初始化
        private void PageInit()
        {
            //加载文件夹列表
            DirectoryInfo dirList = new DirectoryInfo(Request.PhysicalApplicationPath);
            rptFolderList.DataSource = dirList.GetDirectories();
            rptFolderList.DataBind();

            //初始化相关值
            trojanXml = Server.MapPath(Request.Path.Replace("TrojanScan.aspx", "") + "AboutTrojan.xml");
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(trojanXml);
            XmlNode xmlNode = null;
            string codeStr = string.Empty;
            if (xmlDoc.HasChildNodes)
            {
                txtFileType.Text = xmlDoc.SelectSingleNode("Trojan/fileType").InnerText.Trim();
                xmlNode = xmlDoc.SelectSingleNode("Trojan/Code");

                if (xmlNode.HasChildNodes)
                {
                    foreach (XmlNode node in xmlNode.ChildNodes)
                    {
                        codeStr = xmlNode.InnerXml.Replace("&lt;","<").Replace("&gt;",">");
                        break;
                    }
                }

                txtCode.Text = codeStr;
            }

            if (dtFileList.Columns.Count == 0)
            {
                dtFileList.Columns.Add("ID", typeof(int));
                dtFileList.Columns.Add("fileName", typeof(string));   //文件名
                dtFileList.Columns.Add("date", typeof(string));       //修改时间
                dtFileList.Columns.Add("fullName", typeof(string));   //路径+文件名
                dtFileList.Columns.Add("Code", typeof(string));       //特征代码
            }
            else
            {
                dtFileList.Rows.Clear();
            }
        }

        #region 将扫描条件保存至 XML
        private void SaveToXml()
        {
            //初始化相关值
            trojanXml = Server.MapPath(Request.Path.Replace("TrojanScan.aspx", "") + "AboutTrojan.xml");

            string extStr = txtFileType.Text.Trim();
            string codeStr = txtCode.Text.Trim();
            string startStr = txtStart.Text.Trim();
            string endStr = txtEnd.Text.Trim();            
            XmlDocument xmlDoc = new XmlDocument();

            xmlDoc.Load(trojanXml);

            if (!string.IsNullOrEmpty(extStr))
            {
                xmlDoc.SelectSingleNode("Trojan/fileType").InnerText = extStr;
                xmlDoc.Save(trojanXml);
            }

            if (!string.IsNullOrEmpty(codeStr))
            {
                xmlDoc.SelectSingleNode("Trojan/Code").InnerText = codeStr;
                xmlDoc.Save(trojanXml);
            }
        }
        #endregion

        #endregion

        #region 扫描文件
        protected void btnStart_Click(object sender, EventArgs e)
        {
            string folderStr = GetAllChkId();
            string currPath = Request.PhysicalApplicationPath;
            string[] folders = folderStr.Split(',');
            //获取全部文件
            if (!string.IsNullOrEmpty(folderStr))
            {
                foreach (string dir in folders)
                {
                    GetDirs(currPath + dir);
                }
            }

            DataTable dtResult = dtFileList.Copy();
            if (dtFileList.Rows.Count > 0)
            {
                //是否按扩展名查找
                dtResult = ByExtFilter(dtResult);

                //是否按最后访问时间
                dtResult = ByModiTime(dtResult);

                //是否按特征代码查找
                dtResult = FileScan(dtResult);
            }
            SaveToXml();
            if (dtResult.Rows.Count > 0)
            {
                Session["ScanResult"] = dtResult;

                Utils.UrlRedirect("ScanResult.aspx");
            }
            else
            {
                Utils.AlertMessage(this, "扫描到 0 个文件！");
            }
           
        }

        #region 扩展名
        //按扩展名查找相关文件
        private DataTable ByExtFilter(DataTable  dtTemp)
        {   
            string fileTypeStr =txtFileType.Text.Trim();
            DataTable dtResult = dtTemp.Clone();

            if (!string.IsNullOrEmpty(fileTypeStr))
            {
                string[] fileExts = fileTypeStr.ToLower().Split('|');

                DataRow drResult = null;
                foreach (DataRow dr in dtTemp.Rows)
                {
                    foreach (string ext in fileExts)
                    {
                        if (dr[1].ToString().EndsWith(ext))
                        {
                            drResult = dtResult.NewRow();

                            for (int i = 0; i < 5; i++)
                            {
                                drResult[i] = dr[i];
                            }

                            dtResult.Rows.Add(drResult);
                        }
                    }
                }

                return dtResult;
            }
            else
            {
                return dtTemp;
            }
            
        }
        #endregion

        #region 修改时间
        //按扩展名查找相关文件
        private DataTable ByModiTime(DataTable dtTemp)
        {
            string startStr = txtStart.Text.Trim();
            string endStr = txtEnd.Text.Trim();
            DataTable dtResult = dtTemp.Clone();
            DataRow drResult;

            DateTime startDate, endDate, fileDate;

            if ((!string.IsNullOrEmpty(startStr)) && (!string.IsNullOrEmpty(endStr)))      //如果有起止时间
            {
                startDate = DateTime.Parse(startStr);
                endDate = DateTime.Parse(endStr);

                foreach (DataRow dr in dtTemp.Rows)
                {
                    fileDate = DateTime.Parse(dr[2].ToString());
                    if ((startDate <= fileDate) && (endDate >= fileDate))
                    {
                        drResult = dtResult.NewRow();
                        for (int i = 0; i < 5; i++)
                        {
                            drResult[i] = dr[i];
                        }

                        dtResult.Rows.Add(drResult);
                    }
                }

                return dtResult;
            }
            else if ((!string.IsNullOrEmpty(startStr)) && (string.IsNullOrEmpty(endStr))) //只有开始时间
            {
                startDate = DateTime.Parse(startStr);

                foreach (DataRow dr in dtTemp.Rows)
                {
                    fileDate = DateTime.Parse(dr[2].ToString());

                    if (startDate <= fileDate)
                    {
                        drResult = dtResult.NewRow();
                        for (int i = 0; i < 5; i++)
                        {
                            drResult[i] = dr[i];
                        }

                        dtResult.Rows.Add(drResult);
                    }
                }

                return dtResult;
            }
            else if ((string.IsNullOrEmpty(startStr)) && (!string.IsNullOrEmpty(endStr))) //只有结束时间
            {
                endDate = DateTime.Parse(endStr);

                foreach (DataRow dr in dtTemp.Rows)
                {
                    fileDate = DateTime.Parse(dr[2].ToString());

                    if (endDate >= fileDate)
                    {
                        drResult = dtResult.NewRow();
                        for (int i = 0; i < 5; i++)
                        {
                            drResult[i] = dr[i];
                        }

                        dtResult.Rows.Add(drResult);
                    }
                }

                return dtResult;
            }
            else
            {
                return dtTemp;
            }
             
        }
        #endregion

        #region 文件扫描
        //文件扫描
        private DataTable FileScan(DataTable dtTemp)
        {
            string codeStr = txtCode.Text.Trim();
            DataTable dtResult = dtTemp.Clone();

            if (!string.IsNullOrEmpty(codeStr))
            {
                string[] codeArray = Utils.strSplit(codeStr, "\r\n");
                string strFile = string.Empty;
                FileReadOrWrite frow = new FileReadOrWrite();
                frow.IsServerPath = false;
                DataRow drResult = null;
                bool isRowsCode = false;
                string CodeTemp = "";

                foreach (DataRow dr in dtTemp.Rows)
                {
                    isRowsCode = false;
                    CodeTemp = "";

                    strFile = frow.FileRead(dr[3].ToString());
                    foreach (string code in codeArray)
                    {                       
                        if (strFile.IndexOf(code) != -1)
                        {
                            isRowsCode = true;
                            //加上特征代码
                            CodeTemp += "," + code;
                        }
                    }

                    //如果包含特征代码，则添加此行
                    if (isRowsCode)
                    {
                        drResult = dtResult.NewRow();

                        for (int i = 0; i < 4; i++)
                        {
                            drResult[i] = dr[i];
                        }
                        drResult[4] = CodeTemp.Remove(0, 1);
                        dtResult.Rows.Add(drResult);
                    }
                }


                return dtResult;
            }
            else
            {
                return dtTemp;
            }

        }

       
        #endregion

        #region 获取指定目录下的全部文件
        //读取指定文件夹下所有文件列表
        private void GetFiles(string folder)
        {  
            string[] files = Directory.GetFiles(folder);
            DataRow drTemp ;
            FileInfo fiTemp;
            foreach (string file in files)
            {
                fiTemp = new FileInfo(file);

                drTemp = dtFileList.NewRow();
                drTemp["fileName"] = fiTemp.Name;
                drTemp["date"] = fiTemp.LastWriteTime;
                drTemp["fullName"] = fiTemp.FullName;
                drTemp["code"] = "";
                dtFileList.Rows.Add(drTemp);
            }
        }

        //递归调用指定文件夹下全部文件夹
        private void GetDirs(string dir)
        {
            GetFiles(dir);
            string[] dirs = Directory.GetDirectories(dir);
            foreach (string dirTemp in dirs)
            {
                GetDirs(dirTemp);
            }
        }
        #endregion

        //获取复选框列表值
        private string GetAllChkId()
        {
            if (!string.IsNullOrEmpty(Request.Form["chkId"]))
            {
                return Request.Form["chkId"].Replace(" ", "");
            }
            else
            {
                return "";
            }
        } 
        #endregion

    }
}
