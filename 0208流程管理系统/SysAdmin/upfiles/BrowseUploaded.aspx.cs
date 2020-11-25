using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Text;

using AllPower.Config;
using AllPower.Common;

namespace AllPower.WEB.SysAdmin.upfiles
{
    public partial class BrowseUploaded : AllPower.Web .Admin.AdminPage
    {
        Dictionary<string, string> dictFile=new Dictionary<string,string> ();
        protected string SavePath = "";     // 保存路径;
        protected string FileExt = "";      //文件格式
        private const int MaxFiles = 600;   //最多读取文件数
        private int files=1;                //已读取文件数
        private string search;              //搜索关键字
        private string virPath;             //虚拟路径
        private string URL;

        protected void Page_Load(object sender, EventArgs e)
        {
            UploadConfig uploadobj = Upload.GetConfig(GetUploadImgPath);   //上传设置信息
            virPath = GetVirtualPath;
            if (Request.QueryString["Type"] == "image")
            {
                FileExt = uploadobj.UploadImageType;
                SavePath = uploadobj.ImageSavePath+"/"+SiteDir +"/Images";
                URL = GetUploadUrl(uploadobj.ImageUrl, "Images", SavePath);
            }
            else if (Request.QueryString["Type"] == "flash")
            {
                FileExt = "swf|fla";
                SavePath = uploadobj.MediaSavePath + "/" + SiteDir + "/Medias";
                URL = GetUploadUrl(uploadobj.MediaUrl, "Medias", SavePath);
            }
            else if (Request.QueryString["Type"] == "media")
            {
                FileExt = uploadobj .UploadMediaType;
                SavePath = uploadobj.MediaSavePath + "/" + SiteDir + "/Medias";
                URL = GetUploadUrl(uploadobj.MediaUrl, "Medias", SavePath);
            }
            else
            {
                FileExt = uploadobj.UploadFilesType;
                SavePath = uploadobj.FileSavePath + "/" + SiteDir + "/Files";
                URL = GetUploadUrl(uploadobj.FileUrl, "Files", SavePath);
            }
            virPath = virPath + SavePath;
            search = Request.Form["txtSearch"];
            if (SavePath.IndexOf(":") == -1)  //判断输入的是虚拟路径
            {
                SavePath = Server.MapPath(virPath);
            }
            if (!IsPostBack)
            {                //设定初始排序字段为文件修改时间FileLastWriteTime                
                gridFileList.Attributes.Add("SortExpression", "FileLastWriteTime");
                gridFileList.Attributes.Add("SortDirection", "DESC");
                BindGrid();
            }

        }

        #region 得到上传文件URL
        private string GetUploadUrl(string strUrl, string fileDir, string setUploadPath)
        {
            string reUrl;
            if (string.IsNullOrEmpty(strUrl))
            {
                reUrl = GetVirtualPath + setUploadPath;
            }
            else
            {
                reUrl = strUrl;
            }
            if (reUrl.Substring(reUrl.Length - 1) != "/")
            {
                reUrl = reUrl + "/";
            }
            return reUrl;

        }
        #endregion

        ///<summary>        
        ///要显示的文件扩展名        
        ///</summary>        
        ///<param Name="Type"></param>        
        ///<returns></returns>        
        public bool checkFileType(string type)
        {
            bool FileType = false;
            string[] type_ = FileExt.Split ('|');
            type = type.ToLower();
            for (int i = 0; i < type_.Length; i++)
            {
                if (type.Contains(type_[i].ToString()))
                {
                    FileType = true;
                }
            }
            return FileType;
        }

        ///<summary>        
        ///遍文件夹下的所有子文件夹下的文件       
        ///</summary>        
        ///<param Name="ObjDirPath">文件夹</param>        
        public void GetFiles(string ObjDirPath)
        {
            string flpath = Server.MapPath(virPath+"/").ToLower();
            DirectoryInfo SourceDir = new DirectoryInfo(ObjDirPath); 
            foreach (FileSystemInfo FSI in SourceDir.GetFileSystemInfos())
            {
                if (FSI is DirectoryInfo)
                {                    //如果是文件夹则递归                   
                    GetFiles(FSI.FullName);
                }
                else
                {                    //如果是符合要求的文件则垒加集合,因为我只要求显示图片文件，在checkFileType方法里定义要显示文件的扩展名                 
                    if (checkFileType(FSI.Extension))
                    {                        //由于是物理路径，如e:\luobing_web\uploadfiles\picture\test.jpg这种形式，需要提取虚拟路径，如：../uploadfiles/picture/test.jpg                     
                        string FilePath = ""; //一步写来看起混乱，就分开写了                     
                        FilePath = FSI.FullName.ToLower();
                        if (string.IsNullOrEmpty(search) || (!string.IsNullOrEmpty(search) && FilePath.IndexOf(search.ToLower()) != -1))
                        {
                            FileInfo FI = new FileInfo(FilePath);
                            FilePath = URL+FilePath.Replace(flpath, "").Replace("\\", "/");
                            dictFile.Add(FilePath+","+Path .GetFileName(FilePath), Convert.ToString(FI.Length / 1000) + "KB," + FI.LastWriteTime);
                            
                            files++;
                            if (files > MaxFiles)
                            {
                                break;
                            }
                        }
                    }
                }
            }
        }

        ///<summary>        
        ///构造DataTABLE来绑定GRIDVIEW        
        ///</summary>        
        ///<returns></returns>        
        public DataTable FileDataTable()
        {
            GetFiles(SavePath);            //构造DataTABLE            
            DataTable dt = new DataTable(); 
            dt.Columns.Add(new DataColumn("FilePath", typeof(string))); 
            dt.Columns.Add(new DataColumn("FileName", typeof(string))); 
            dt.Columns.Add(new DataColumn("FileLength", typeof(string))); 
            dt.Columns.Add(new DataColumn("FileLastWriteTime", typeof(string))); 
            DataRow dr;            //将文件数组集合切割到数组            
            string[] arr;
            foreach (KeyValuePair<string, string> kvp in dictFile)
            {
                dr = dt.NewRow();
                arr = kvp.Key.ToString().Split(',');
                dr[0] = arr[0];
                dr[1] = arr[1];
                arr = kvp.Value.ToString().Split(',');
                dr[2] = arr[0];
                dr[3] = arr[1];
                dt.Rows.Add(dr);
            }
            return dt;
        }

        ///<summary>        
        ///绑定gridview        
        ///</summary>        
        private void BindGrid()
        {            //获取数据源            
            DataTable dtb = FileDataTable();            //排序            
            string SortDirection = gridFileList.Attributes["SortDirection"].ToString();
            string SortExpression = gridFileList.Attributes["SortExpression"].ToString(); 
            dtb.DefaultView.Sort = string.Format("{0} {1}", SortExpression, SortDirection);            //赋数据源并绑定            
            gridFileList.DataSource = dtb; 
            gridFileList.DataBind();
        }
        
        ///<summary>        
        ///绑定数据行        
        ///</summary>        
        ///<param Name="sender"></param>        
        ///<param Name="e"></param>        
        protected void gridFileList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Image Img = (Image)e.Row.Cells[0].FindControl("ImgPath");
                Img.ImageUrl = e.Row.Cells[5].Text; 
                e.Row.Cells[5].Text = "";
            }
        }

        ///<summary>       
        ///分页        
        ///</summary>        
        ///<param Name="sender"></param>        
        ///<param Name="e"></param>        
        protected void gridFileList_PageIndexChanging(object sender, GridViewPageEventArgs e) 
        { 
            gridFileList.PageIndex = e.NewPageIndex; 
            this.BindGrid(); 
        }

        ///<summary>        
        ///排序        
        ///</summary>        
        ///<param Name="sender"></param>        
        ///<param Name="e"></param>        
        protected void gridFileList_Sorting(object sender, GridViewSortEventArgs e) 
        { 
            string sortExpression = e.SortExpression.ToString(); 
            string sortdirection = "ASC"; 
            if (sortExpression == gridFileList.Attributes["SortExpression"]) 
            { 
                sortdirection = (gridFileList.Attributes["SortDirection"].ToString() == sortdirection ? "DESC" : "ASC"); 
            } 
            gridFileList.Attributes["SortExpression"] = sortExpression; 
            gridFileList.Attributes["SortDirection"] = sortdirection; 
            this.BindGrid(); 
        }

        public string ShowFile(string filePath)
        {
            string strFile = "";
            if (Request.QueryString["Type"] == "image")
            {
                strFile = @"<img src='" + filePath + "' width=150 height=80 border=0 title='" + filePath + "'/>";
            }
            else
            {
                strFile = filePath;
            }
            return strFile;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.BindGrid(); 
        }
    }
}
