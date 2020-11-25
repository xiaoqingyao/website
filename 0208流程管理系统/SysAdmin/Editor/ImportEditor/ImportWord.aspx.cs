using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
//using Microsoft.Office.Interop.Word;
using System.IO;
using Microsoft.Win32;

namespace AllPower.Web.Admin
{
    public partial class ImportWord : System.Web.UI.Page
    {
        //Html文件名
        private string _htmlFileName;
        //[DllImport("DllTest.dll")]
        //public static extern int DllRegisterServer();//注册时用
        protected void Page_Load(object sender, EventArgs e)
        {
            //string strFilename = UpLoadFile(this.fileWord);
            //_htmlFileName = WordToHtml((object)strFilename);

            //findUsedFromHtml(getHtml(_htmlFileName), strFilename);
            //try
            //{
            //    ApplicationClass word = new ApplicationClass();
            //}
            //catch
            //{
            //    RegistryKey rkTest = Registry.ClassesRoot.OpenSubKey("CLSID\\{7713F78A-44DE-42BA-A1F6-3FB0BD6CA63B}\\");
            //    if (rkTest == null)
            //    {
            //        DllRegisterServer(
            //    }
            //    //Response.Write(Server.MapPath("/bin/Microsoft.Office.Interop.Word.dll"));
            //    System.Diagnostics.Process.Start("regsvr32.exe   /s", "Microsoft.Office.Interop.Word.dll");
            //}
        }

        ///// <summary>
        ///// 上传Word文档
        ///// </summary>
        ///// <param name="inputFile"></param>
        ///// <param name="filePath"></param>
        //private string UpLoadFile(HtmlInputFile inputFile)
        //{
        //    string fileName, fileExtension;
  
        //    //建立上传对象
        //    HttpPostedFile postedFile = inputFile.PostedFile;
        //    //HttpPostedFile postedFile = Request.Files["upfile"];//获取上传的文件

        //    fileName = System.IO.Path.GetFileName(postedFile.FileName);
        //    fileExtension = System.IO.Path.GetExtension(fileName);

        //    string phyPath = Server.MapPath("~/") + "Portals\\0\\WordImport\\";

        //    //判断路径是否存在,若不存在则创建路径
        //    DirectoryInfo upDir = new DirectoryInfo(phyPath);
        //    if (!upDir.Exists)
        //    {
        //        upDir.Create();
        //    }

        //    //保存文件
        //    try
        //    {
        //        postedFile.SaveAs(phyPath + fileName);
        //    }
        //    catch
        //    {
                
        //    }
        //    return phyPath + fileName;
        //}

        ///// <summary>
        ///// word转成html
        ///// </summary>
        ///// <param name="wordFileName"></param>
        //private string WordToHtml(object wordFileName)
        //{
        //    //在此处放置用户代码以初始化页面
            
        //    ApplicationClass word = new ApplicationClass();
        //    Type wordType = word.GetType();
        //    Documents docs = word.Documents;

        //    //打开文件
        //    Type docsType = docs.GetType();
        //    Document doc = (Document)docsType.InvokeMember("Open",
        //    System.Reflection.BindingFlags.InvokeMethod, null, docs, new Object[] { wordFileName, true, true });

        //    //转换格式，另存为
        //    Type docType = doc.GetType();

        //    string wordSaveFileName = wordFileName.ToString();
        //    string strSaveFileName = wordSaveFileName.Substring(0, wordSaveFileName.Length - 3) + "html";
        //    object saveFileName = (object)strSaveFileName;
        //    //下面是Microsoft Word 9 Object Library的写法，如果是10，可能写成：
        //    /*
        //    docType.InvokeMember("SaveAs", System.Reflection.BindingFlags.InvokeMethod,
        //     null, doc, new object[]{saveFileName, Microsoft.Office.Interop.Word.WdSaveFormat.wdFormatFilteredHTML});
        //    */
        //    ///其它格式：
        //    ///wdFormatHTML
        //    ///wdFormatDocument
        //    ///wdFormatDOSText
        //    ///wdFormatDOSTextLineBreaks
        //    ///wdFormatEncodedText
        //    ///wdFormatRTF
        //    ///wdFormatTemplate
        //    ///wdFormatText
        //    ///wdFormatTextLineBreaks
        //    ///wdFormatUnicodeText
        //    docType.InvokeMember("SaveAs", System.Reflection.BindingFlags.InvokeMethod,
        //     null, doc, new object[] { saveFileName, WdSaveFormat.wdFormatFilteredHTML });

        //    docType.InvokeMember("Close", System.Reflection.BindingFlags.InvokeMethod,
        //     null, doc, null);

        //    //退出 Word
        //    wordType.InvokeMember("Quit", System.Reflection.BindingFlags.InvokeMethod,
        //     null, word, null);

        //    // 删除该WORD文档防止被直接下载
        //    // by flywolf 
            
        //    AllPower.Common.Utils.DelFile(wordSaveFileName);

        //    return saveFileName.ToString();
        //}

        /// <summary>
        /// 上传并处理word文档
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //string strFilename = UpLoadFile(this.fileWord);
            //_htmlFileName = WordToHtml((object)strFilename);

            //findUsedFromHtml(getHtml(_htmlFileName), strFilename);
        }

        ///// <summary>
        ///// 读取html文件，返回字符串
        ///// </summary>
        ///// <param name="strHtmlFileName"></param>
        ///// <returns></returns>
        //private string getHtml(string strHtmlFileName)
        //{
        //    System.Text.Encoding encoding = System.Text.Encoding.GetEncoding("gb2312");

        //    StreamReader sr = new StreamReader(strHtmlFileName, encoding);

        //    string str = sr.ReadToEnd();

        //    sr.Close();

        //    return str;
        //}
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="strHtml"></param>
        ///// <returns></returns>
        //private void findUsedFromHtml(string strHtml, string strFileName)
        //{
        //    string strStyle;
        //    string strBody;

        //    // stytle 部分
        //    int index = 0;
        //    int intStyleStart = 0;
        //    int intStyleEnd = 0;

        //    while (index < strHtml.Length)
        //    {
        //        int intStyleStartTmp = strHtml.IndexOf("<style>", index);
        //        if (intStyleStartTmp == -1)
        //        {
        //            break;
        //        }
        //        int intContentStart = strHtml.IndexOf("<!--", intStyleStartTmp);
        //        if (intContentStart - intStyleStartTmp == 9)
        //        {
        //            intStyleStart = intStyleStartTmp;
        //            break;
        //        }
        //        else
        //        {
        //            index = intStyleStartTmp + 7;
        //        }
        //    }

        //    index = 0;
        //    while (index < strHtml.Length)
        //    {
        //        int intContentEndTmp = strHtml.IndexOf("-->", index);
        //        if (intContentEndTmp == -1)
        //        {
        //            break;
        //        }
        //        int intStyleEndTmp = strHtml.IndexOf("</style>", intContentEndTmp);
        //        if (intStyleEndTmp - intContentEndTmp == 5)
        //        {
        //            intStyleEnd = intStyleEndTmp;
        //            break;
        //        }
        //        else
        //        {
        //            index = intContentEndTmp + 4;
        //        }
        //    }

        //    strStyle = strHtml.Substring(intStyleStart, intStyleEnd - intStyleStart + 8);

        //    // Body部分
        //    int bodyStart = strHtml.IndexOf("<body");
        //    int bodyEnd = strHtml.IndexOf("</body>");

        //    strBody = strHtml.Substring(bodyStart, bodyEnd - bodyStart + 7);

        //    //替换图片地址
        //    string fullName = strFileName.Substring(strFileName.LastIndexOf("\\")+1);
        //    string strOld = fullName.Replace("doc","files");
        //    string strNew = Page.Request.ApplicationPath + "Portals/0/WordImport/" + strOld;

        //    strBody = strBody.Replace(strOld, strNew);
        //    strBody = strBody.Replace("v:imagedata", "img");
        //    strBody = strBody.Replace("</v:imagedata>", "");
        //    //this.TextArea1.InnerHtml = strStyle;
        //    //this.Textarea2.InnerHtml = strBody; parent.UpdateMsg('" + Js(strBody) + "')
        //    //System.Web.HttpContext.Current.Response.Write("<script>window.parent.document.getElementById('hidhtml').value='" + Js(strBody) + "';parent.UpdateMsg(0);</script>");
            
        //    this.Textarea2.InnerHtml = strBody;
        //    divJs.InnerHtml="<script>parent.UpdateMsg(0);</script>";
        //}

        //private string Js(string v)
        //{//此函数进行js的转义替换的，防止字符串中输入了'后造成回调输出的js中字符串不闭合
        //    if (v == null) return "";
        //    return v.Replace("'", @"\'").Replace(@"\n","");
        //}
    }
}