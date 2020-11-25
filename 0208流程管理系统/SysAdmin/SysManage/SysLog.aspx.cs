using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.IO;
using AllPower.Common;
using AllPower.Model;
using AllPower.BLL.SysManage;
using AllPower.Web.Admin;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      肖丹
    创建时间： 2010年5月13日
    功能描述： 操作管理
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class SysLog : AdminPage
    {
        AllPower.BLL.SysManage.SysLog objSysLog = new AllPower.BLL.SysManage.SysLog();

        DataTable dt;
        private string strDate1= null, strDate2= null;
        /// <summary>
        /// 查询字段
        /// </summary>
        public string StrDate1
        {
            get
            {
                if (strDate1 == null)
                {
                    strDate1 = Utils.UrlDecode(Utils.ReqUrlParameter("date1"));
                }
                return strDate1;
            }
        }
        /// <summary>
        /// 查询字段
        /// </summary>
        public string StrDate2
        {
            get
            {
                if (strDate2 == null)
                {
                    strDate2 = Utils.UrlDecode(Utils.ReqUrlParameter("date2"));
                }
                return strDate2;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //绑定列表控件
                SplitDataBind();
                Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中       
                //判断权限
                SetRight(this.Page, rptLogList);
            }          
        }

        // 分页控件数据绑定
        private void SplitDataBind()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            dicWhere = dictWhere();
            p.Aspnetpage = Split;
            p.RptControls = rptLogList;
            p.DicWhere = dicWhere;
            objSysLog.PageData(p);
        }

        protected void btnHide_Click(object sender, EventArgs e)
        {
            string type = Request.Form["btnHidAction"];
            if (type == "2")  //清空操作
            {
                OnClear();
            }
            else if (type == "1")  //删除操作
            {
                string lstId = Request.Form["chkId"];
                if (!string.IsNullOrEmpty(lstId))
                {
                    lstId = lstId.Replace(" ", "");
                    OnDel(lstId);
                }
            }
        }

        private void OnDel(string id)
        {
            if (base.IsHaveRightByOperCode("Delete"))
            {
                AllPower.Model.SysManage.SysLog logModel = new AllPower.Model.SysManage.SysLog();
                logModel.Content = id;
                logModel.SiteID = SiteID;
                string returnMsg = objSysLog.Save("DEL", logModel);
                if (Utils.ParseInt(returnMsg, 0) == 1)
                {
                    Utils.RunJavaScript(this, "alert({msg:'操作成功！',title:'提示信息'})");
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'操作失败，原因是："+returnMsg.Replace("'","\\'").Replace("\r\n","<br>")+"',title:'提示信息'})");
                }
                SplitDataBind();
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'操作失败，没有权限！',title:'提示信息'})");
            }
        }

        private void OnClear()
        {
            if (base.IsHaveRightByOperCode("Clear"))
            {
                Dictionary<string, string> dicWhere = dictWhere();
                DataTable dt = objSysLog.GetList("CLEAR", Utils.getOneParams(""), dicWhere);
                SplitDataBind();
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'操作失败，没有权限！',title:'提示信息'})");
            }
        }

        private Dictionary<string, string> dictWhere()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            if (StrKeySearch != "")
            {
                dicWhere.Add("Content", Utils.UrlDecode(StrKeySearch));
                dicWhere.Add("UserNo", Utils.UrlDecode(StrKeySearch));
                dicWhere.Add("ScriptName", Utils.UrlDecode(StrKeySearch));
                txtSearch.Text = StrKeySearch;
            }
            if (StrDate1 != "")
            {
                dicWhere.Add("StartDate", StrDate1);
                txtDate1.Text = StrDate1;
            }
            if (StrDate2 != "")
            {
                dicWhere.Add("EndDate", StrDate2);
                txtDate2.Text = StrDate2;
            }
            if (!string.IsNullOrEmpty(Request.QueryString["selType"]))
            {
                dicWhere.Add("Type", Utils.ParseInt(Request.QueryString["selType"], 1).ToString());
            }
            dicWhere.Add("SiteID", Utils.UrlDecode(SiteID.ToString()));
            return dicWhere;
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            if (base.IsHaveRightByOperCode("Export"))
            {
                StreamWriter sw = null;
                string FileName1 = DateTime.Now.ToString("yyyyMMddhhmmss") + DateTime.Now.Millisecond.ToString()+".log";
                string logPath = "../logTemp";

                Dictionary<string, string> dicWhere = dictWhere();

                DataTable dt = objSysLog.GetList("EXPORT", Utils.getOneParams(""), dicWhere);
                try
                {
                    string FileName = Server.MapPath(logPath + "/" + FileName1);

                    #region 检测日志目录是否存在
                    string logPath1=Server.MapPath(logPath);
                    if (!Directory.Exists(logPath1))
                    {
                        Directory.CreateDirectory(logPath1);
                    }
                    else
                    {
                        DirectoryInfo fold = new DirectoryInfo(logPath1);
                        if (fold.Exists)
                        {
                            FileInfo[] files = fold.GetFiles("*.log");
                            foreach (FileInfo f in files)//删除目录下*.txt
                            {
                                f.Delete();
                            }
                        }
                    }

                    if (!File.Exists(FileName))
                        sw = File.CreateText(FileName);
                    else
                    {
                        sw = File.AppendText(FileName);
                    }
                    #endregion
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        sw.WriteLine("[NodeCode]     :" + dt.Rows[i]["NodeCode"].ToString() + "\r");
                        sw.WriteLine("[SiteID]       :" + dt.Rows[i]["SiteID"].ToString() + "\r");
                        sw.WriteLine("[Content]      :" + dt.Rows[i]["Content"].ToString());
                        sw.WriteLine("[AddDate]      :" + dt.Rows[i]["AddDate"].ToString() + "\r");
                        sw.WriteLine("[UserNo]       :" + dt.Rows[i]["UserNo"].ToString() + "\r");
                        sw.WriteLine("[IP]           :" + dt.Rows[i]["IP"].ToString() + "\r");
                        sw.WriteLine("[ScriptName]   :" + dt.Rows[i]["ScriptName"].ToString() + "\r");
                        sw.WriteLine("[LogType]      :" + dt.Rows[i]["LogType"].ToString() + "\r");
                        sw.WriteLine("≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡\r");
                    }
                    sw.Flush();
                    sw.Close();
                    ResponseFile(Request, Response, DateTime.Now.ToString ("yyyyMMddhhmmss")+".log", Server.MapPath(logPath + "/" + FileName1), 1024000);
                }
                finally
                {
                    if (sw != null)
                        sw.Close();
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'操作失败，没有权限！',title:'提示信息'})");
            }
        }

        public static bool ResponseFile(HttpRequest _Request, HttpResponse _Response, string _fileName, string _fullPath, long _speed)
        {
            try
            {
                FileStream myFile = new FileStream(_fullPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
                BinaryReader br = new BinaryReader(myFile);
                try
                {
                    _Response.AddHeader("Accept-Ranges", "bytes");
                    _Response.Buffer = false;
                    long fileLength = myFile.Length;
                    long startBytes = 0;

                    double pack = 10240; //10K bytes
                    //int sleep = 200;   //每秒5次   即5*10K bytes每秒
                    int sleep = (int)Math.Floor(1000 * pack / _speed) + 1;
                    if (_Request.Headers["Range"] != null)
                    {
                        _Response.StatusCode = 206;
                        string[] range = _Request.Headers["Range"].Split(new char[] { '=', '-' });
                        startBytes = Convert.ToInt64(range[1]);
                    }
                    _Response.AddHeader("Content-Length", (fileLength - startBytes).ToString());
                    if (startBytes != 0)
                    {
                        //Response.AddHeader("Content-Range", string.Format(" bytes {0}-{1}/{2}", startBytes, fileLength-1, fileLength));
                    }
                    _Response.AddHeader("Connection", "Keep-Alive");
                    _Response.ContentType = "application/octet-stream";
                    _Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(_fileName, System.Text.Encoding.UTF8));

                    br.BaseStream.Seek(startBytes, SeekOrigin.Begin);
                    int maxCount = (int)Math.Floor((fileLength - startBytes) / pack) + 1;

                    for (int i = 0; i < maxCount; i++)
                    {
                        if (_Response.IsClientConnected)
                        {
                            _Response.BinaryWrite(br.ReadBytes(int.Parse(pack.ToString())));
                            System.Threading.Thread.Sleep(sleep);
                        }
                        else
                        {
                            i = maxCount;
                        }
                    }
                }
                catch
                {
                    return false;
                }
                finally
                {
                    br.Close();

                    myFile.Close();
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        public string getNodeName(string nodeCode)
        {
            string re = "";
            if (!string.IsNullOrEmpty(nodeCode))
            {
                ModuleNode bllmodule = new ModuleNode();
                DataTable dt = bllmodule.GetModeNodeFromCache();
                DataRow[] dr = dt.Select("NodeCode='" + nodeCode + "'");
                if (dr.Length > 0)
                {
                    re = dr[0]["NodeName"].ToString();
                }
                dt.Dispose();
                dt=null;
            }
            return re;
        }

        //查询按钮
        protected void btnQuery_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("SysLog.aspx?NodeCode=" + NodeCode + "&Date1=" + txtDate1.Text + "&Date2=" + txtDate2.Text + "&selType="+Request.Form["selType"]+"&keySearch=" + Utils.UrlEncode(txtSearch.Text.Trim())); //页面跳转 
            }
        }
    }
}
