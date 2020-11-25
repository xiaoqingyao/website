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
using System.Text;
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

    #region SHA1加密函数
    public static string SHA1(string source)   
    {   
        return FormsAuthentication.HashPasswordForStoringInConfigFile(source, "SHA1");   
    } 
    #endregion

    #region SQL防蛀函数
    public static string UrnHtml(string strHtml)
    {
        strHtml = strHtml.Replace("'", "＇").Replace(".", "．").Replace("%", "％").Replace("-", "－").Replace("<", " ");
        return strHtml;
    }
    #endregion

    #region 过滤字符串中所有的html标签
    public static string checkStr(string text)
    {
        text = text.Trim();
        if (string.IsNullOrEmpty(text))
            return string.Empty;
        text = Regex.Replace(text, "[\\s]{2,}", " "); //两个或多个空格替换为一个
        text = Regex.Replace(text, "(<[b|B][r|R]/*>)+|(<[p|P](.|\\n)*?>)", "\n"); //<br>
        text = Regex.Replace(text, "(\\s*&[n|N][b|B][s|S][p|P];\\s*)+", " "); //&nbsp;
        text = Regex.Replace(text, "<(.|\\n)*?>", string.Empty); //其它任何标记
        text = text.Replace("'", "''");
        return text;
    }//过滤字符串中所有的标签代码，如<img.../> ,<p></p>等
    #endregion

    #region 字符串截取函数
    public static string subString(string str, int length)
    {
        string tmpStr = str;
        int strLength = length;
        if (str.Length > strLength)
        {
            tmpStr = str.Substring(0, strLength);

        }
        return tmpStr;
    }//截取从字符串开始位置到指定位置的字符
    #endregion

    #region 截取字符串函数

    #region 截取字符串函数
    /// <summary>
    /// 截取字符串函数
    /// </summary>
    /// <param name="str">所要截取的字符串</param>
    /// <param name="num">截取字符串的长度(0则不判断)</param>
    /// <returns></returns>
    public static string GetSubString(object str, int num)
    {
        return GetSubString(str.ToString(), num);
    }
    #endregion

    /// <summary>
    /// 截取字符串函数
    /// </summary>
    /// <param name="str">所要截取的字符串</param>
    /// <param name="num">截取字符串的长度(0则不判断)</param>
    /// <param name="laststr">后缀字符（如：..）</param>
    /// <returns></returns>
    public static string GetSubString(string str, int num, string laststr)
    {
        //if (num > 0)
        //{
        //    return (RemoveHTML(str).Length > num) ? (RemoveHTML(str).Substring(0, num)) : str;
        //}
        //else
        //{
        //    return str;
        //}

        if (Encoding.UTF8.GetByteCount(str) <= num * 2)
        {
            return str;
        }
        ASCIIEncoding ascii = new ASCIIEncoding();
        int tempLen = 0;
        string tempString = "";
        byte[] s = ascii.GetBytes(str);
        for (int i = 0; i < s.Length; i++)
        {
            if ((int)s[i] == 63)//汉字
            {
                tempLen += 2;
            }
            else//非汉字
            {
                tempLen += 1;
            }

            if (tempLen > num * 2)
                break;

            tempString += str.Substring(i, 1);
        }

        return tempString + laststr;
    }
    #endregion

    #region 搜索HTML代码中的<img>标签，并返回<img>标签中的图片地址，如果没有则返回“--”
    public static string GetHtmlImageUrlList(string sHtmlText)
    {
        // 定义正则表达式用来匹配 img 标签
        Regex regImg = new Regex(@"<img\b[^<>]*?\bsrc[\s\t\r\n]*=[\s\t\r\n]*[""']?[\s\t\r\n]*(?<imgUrl>[^\s\t\r\n""'<>]*)[^<>]*?/?[\s\t\r\n]*>", RegexOptions.IgnoreCase);

        // 搜索匹配的字符串
        MatchCollection matches = regImg.Matches(sHtmlText);

        int i = 0;
        string[] sUrlList = new string[matches.Count];

        // 取得匹配项列表
        foreach (Match match in matches)
            sUrlList[i++] = match.Groups["imgUrl"].Value;
        if (sUrlList.Length <= 0)
        {
            return "--";
        }
        return sUrlList[0];
    } //此函数的功能为：搜索HTML代码中的<img>标签，并返回<img>标签中的图片地址，如果没有则返回“--”
    #endregion

    #region 弹出信息提示
    public static void ShowMessage(Page page, string msg, string key)
    {
        string strScript = "<script language=javascript>alert('" + msg + "');</script>";
        ClientScriptManager cs = page.ClientScript;
        Type type = page.GetType();
        if (!cs.IsStartupScriptRegistered(key))
        {
            cs.RegisterStartupScript(type, key, strScript);
        }

    }
    public static void ShowMessage(Page page, string msg, string key, string Redirect)
    {
        string strScript = "<script language=javascript>alert('" + msg + "');window.location.href='" + Redirect + "';</script>";
        ClientScriptManager cs = page.ClientScript;
        Type type = page.GetType();
        if (!cs.IsStartupScriptRegistered(key))
        {
            cs.RegisterStartupScript(type, key, strScript);
        }

    }
    #endregion

    #region 上传图片，若上传成功，返回文件在服务器的虚拟路径，否则返回指定字符串
    /// <summary>
    /// 上传图片，若上传成功，返回文件在服务器的虚拟路径，否则返回指定字符串
    /// </summary>
    /// <param name="fld">filupload 控件</param>
    ///<param name="pg">Page</param>
    ///<param name="ret_str">上传失败时返回的字符串</param>
    public static string UploadFile(FileUpload fld, Page pg, string ret_str)
    {
        string fname1 = "";
        string exName = System.IO.Path.GetExtension(fld.FileName).ToLower();
        if (fld.HasFile)
        {
            if (exName != ".jpg" && exName != ".jepg" && exName != ".gif" && exName != ".bmp")
            {
                Common.ShowMessage(pg, "图片格式不正确！", "kk");
                return ret_str;
            }
            else
            {
                if (fld.PostedFile.ContentLength > 1058820)
                {
                    Common.ShowMessage(pg, "图片文件大小超过200KB限制！", "kkk");
                    return ret_str;
                }
                else
                {
                    try
                    {
                        fname1 = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");
                        fname1 += exName;
                        fld.SaveAs(System.Web.HttpContext.Current.Server.MapPath("~/UpLoadImg/") + fname1);
                        fname1 = ("/UpLoadImg/" + fname1);
                        return fname1;
                    }
                    catch (Exception ex)
                    {

                        System.Web.HttpContext.Current.Response.Write("<script>alert('" + ex + "')</script>");
                        return ret_str;
                    }
                }
            }
        }
        else
        {
            Common.ShowMessage(pg, "请选择图片！", "kk");
            return ret_str;
        }
    }
    #endregion


    #region 上传文件，若上传成功，返回文件在服务器的虚拟路径，否则返回指定字符串
    /// <summary>
    /// 上传文件，若上传成功，返回文件在服务器的虚拟路径，否则返回指定字符串
    /// </summary>
    /// <param name="fld">filupload 控件</param>
    ///<param name="pg">Page</param>
    ///<param name="ret_str">上传失败时返回的字符串</param>
    public static string UploadFile2(FileUpload fld, Page pg, string ret_str)
    {
        string fname1 = "";
        string exName = System.IO.Path.GetExtension(fld.FileName).ToLower();
        if (fld.HasFile)
        {
            try
            {
                fname1 = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");
                fname1 += exName;
                fld.SaveAs(System.Web.HttpContext.Current.Server.MapPath("~/UpLoadImg/") + fname1);
                fname1 = ("/UpLoadImg/" + fname1);
                return fname1;
            }
            catch (Exception ex)
            {

                System.Web.HttpContext.Current.Response.Write("<script>alert('" + ex + "')</script>");
                return ret_str;
            }
        }
        else
        {
            Common.ShowMessage(pg, "请选择文件！", "kk");
            return ret_str;
        }
    }
    #endregion
}
