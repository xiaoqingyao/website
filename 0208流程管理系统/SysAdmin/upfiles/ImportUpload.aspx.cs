using System;
using System.Collections;
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

using AllPower.Config;
using AllPower.Common;
namespace AllPower.WEB
{
    public partial class ImportUpload : AllPower .Web .Admin .AdminPage 
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Buffer = true;
            Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            Response.AddHeader("Pragma", "No-Cache");

            string SavePath;
            string imgUrl = "";
            string fileName;
            string AllowExts;

            AllowExts = "jpg,gif,bmp,ico,jpeg";
            DataSet ds = new DataSet();
            ds.ReadXml(Request.InputStream);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string fileExt = ds.Tables[0].Rows[0][1].ToString().Split('.')[1].ToLower();
                if (AllowExts.IndexOf (fileExt)!=-1)
                {
                    UploadConfig uploadobj = Upload.GetConfig(GetUploadImgPath );
                    SavePath = uploadobj.ImageSavePath;
                    imgUrl=uploadobj.ImageUrl;
                    fileName = DateTime.Now.ToString("yyyyMMddHHmmssffffff") + "." + fileExt;

                    if (string.IsNullOrEmpty(imgUrl))
                    {
                        imgUrl = GetVirtualPath + SavePath + "/" + SiteDir + "/Images/" + DateTime.Now.Year + "/" + DateTime.Now.Month + "/" + fileName;
                    }
                    else
                    {
                        if (imgUrl.Replace("\\", "/").Substring(imgUrl.Length - 1) == "/")
                        {
                            imgUrl = imgUrl + DateTime.Now.Year + "/" + DateTime.Now.Month + "/" + fileName;
                        }
                        else
                            imgUrl = imgUrl +"/" + DateTime.Now.Year + "/" + DateTime.Now.Month + "/" + fileName;
                    }
                    
                    if (SavePath.IndexOf(":") == -1)  //判断输入的是虚拟路径
                    {
                        SavePath = Server.MapPath(GetVirtualPath + SavePath);
                    }
                    SavePath = SavePath + "/"+SiteDir +"/Images/" + DateTime.Now.Year + "/" + DateTime.Now.Month + "/";
                    

                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }

                    FileStream fs = new FileStream(SavePath + fileName, FileMode.Create);
                    Byte[] b = Convert.FromBase64String(ds.Tables[0].Rows[0][2].ToString());
                    fs.Write(b, 0, b.Length);
                    fs.Close();
                }
            }
            ds.Dispose();

            Response.Write(imgUrl);
        }
    }
}
