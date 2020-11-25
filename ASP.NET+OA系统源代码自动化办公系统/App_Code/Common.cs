using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
using System.IO;
using System.Net;

/// <summary>
/// Common 的摘要说明
/// </summary>
public class Common
{
    public Common()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    /// <summary>
    /// 获取文本编辑器的数据，并自动上传远程图片
    /// </summary>
    /// <param name="uc">文本编辑器数据</param>
    /// <returns></returns>
    public string GetText(string str)
    {
        string mycontext = Regex.Replace(str, @"src[^>]*[^/].(?:jpg|bmp|gif|png|jpeg|JPG|BMP|GIF|JPEG)(?:\""|\')", new MatchEvaluator(SaveYuanFile));
        
        return mycontext;
    }

   

    private string SaveYuanFile(Match m)
    {
        string imgurl = "";
        string matchstr = m.Value;//str[i].ToString();
        string tempimgurl = "";
        tempimgurl = matchstr.Substring(5);
        tempimgurl = tempimgurl.Substring(0, tempimgurl.IndexOf("\""));

        Regex re = new Regex(@"^http://*");
        if (re.Match(tempimgurl).Success)
        {
            matchstr = matchstr.Substring(5);
            matchstr = matchstr.Substring(0, matchstr.IndexOf("\""));

            //Response.Write(matchstr + "<br>");

            //远程文件保存路径
            string Folders = ConfigurationManager.AppSettings["yuanimg"].ToString();
            string fullname = matchstr;

            string huozui = fullname.Substring(fullname.LastIndexOf("."));
            string filename = Common.GetFileName();
            string path = Folders + filename + huozui;
            //Folders+fullname.Substring(fullname.LastIndexOf("\\") + 1);

            if (System.IO.File.Exists(System.Web.HttpContext.Current.Request.MapPath(path)))
                System.IO.File.Delete(System.Web.HttpContext.Current.Request.MapPath(path));
            GetHttpFile(matchstr, System.Web.HttpContext.Current.Request.MapPath(path));
            imgurl = "src=\"" + path.Replace("~/", "") + "\"";
        }
        else
        {
            imgurl = matchstr;
        }


        return imgurl;
    }


    string sException = null;
    private bool GetHttpFile(string sUrl, string sSavePath)
    {
        bool bRslt = false;
        WebResponse oWebRps = null;
        WebRequest oWebRqst = WebRequest.Create(sUrl);
        oWebRqst.Timeout = 100000;
        try
        {
            oWebRps = oWebRqst.GetResponse();
        }
        catch (WebException e)
        {
            sException = e.Message.ToString();
        }
        catch (Exception e)
        {
            sException = e.ToString();
        }
        finally
        {
            if (oWebRps != null)
            {
                BinaryReader oBnyRd = new BinaryReader(oWebRps.GetResponseStream(), System.Text.Encoding.GetEncoding("GB2312"));
                int iLen = Convert.ToInt32(oWebRps.ContentLength);
                FileStream oFileStream;
                try
                {
                    if (File.Exists(System.Web.HttpContext.Current.Request.MapPath("RecievedData.tmp")))
                    {
                        oFileStream = File.OpenWrite(sSavePath);
                    }
                    else
                    {
                        oFileStream = File.Create(sSavePath);
                    }
                    oFileStream.SetLength((Int64)iLen);
                    oFileStream.Write(oBnyRd.ReadBytes(iLen), 0, iLen);
                    oFileStream.Close();
                }
                catch (Exception ex)
                {
                    //bRslt= false;
                }
                finally
                {
                    oBnyRd.Close();
                    oWebRps.Close();

                }
                bRslt = true;

            }
        }
        return bRslt;

    }

    /// <summary>
    /// 文件上传
    /// </summary>
    /// <param name="fileupload">文件上传实例</param>
    /// <returns>保存的文件名称</returns>
    public static string UpLoadFile(FileUpload fileupload, string Folders)
    {
        //string Folders = "~/admin/eWebEditor/UpLoadFile/";
        string fullname = fileupload.PostedFile.FileName;
        if ((fullname == null) || (fullname.Equals("")))
            return "";
        string huozui = fullname.Substring(fullname.LastIndexOf("."));
        string filename = GetFileName();
        string p1 = Folders + filename + huozui;
        //Folders + fullname.Substring(fullname.LastIndexOf("\\") + 1); 
        string path = System.Web.HttpContext.Current.Server.MapPath(p1);

        if (System.IO.File.Exists(path))
            System.IO.File.Delete(path);
        fileupload.PostedFile.SaveAs(path);
        return p1;
    }
    public static string GetFileName()
    {
        System.Threading.Thread.Sleep(1000);
        string str1 = System.DateTime.Now.Year.ToString() + "-";

        if ((System.DateTime.Now.Month).ToString().Length < 2)
        {
            str1 += "0" + System.DateTime.Now.Month.ToString() + "-";
        }
        else
        {
            str1 += System.DateTime.Now.Month.ToString() + "-";
        }

        if ((System.DateTime.Now.Day).ToString().Length < 2)
        {
            str1 += "0" + System.DateTime.Now.Day.ToString() + "-";
        }
        else
        {
            str1 += System.DateTime.Now.Day.ToString() + "-";
        }

        if ((System.DateTime.Now.Hour).ToString().Length < 2)
        {
            str1 += "0" + System.DateTime.Now.Hour.ToString() + "-";
        }
        else
        {
            str1 += System.DateTime.Now.Hour.ToString() + "-";
        }

        if ((System.DateTime.Now.Minute).ToString().Length < 2)
        {
            str1 += "0" + System.DateTime.Now.Minute.ToString() + "-";
        }
        else
        {
            str1 += System.DateTime.Now.Minute.ToString() + "-";
        }

        if ((System.DateTime.Now.Second).ToString().Length < 2)
        {
            str1 += "0" + System.DateTime.Now.Second.ToString();
        }
        else
        {
            str1 += System.DateTime.Now.Second.ToString();
        }

        return str1;
    }
     
}
