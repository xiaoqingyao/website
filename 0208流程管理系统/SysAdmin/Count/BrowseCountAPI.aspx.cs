using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop.Common;
using System.Data;
using System.Text;
using KingTop.BLL.SysManage;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      胡志瑶  统计网站浏览量API

    创建时间： 2010年9月7日   
 
// 更新日期        更新人      更新原因/内容
// 
--===============================================================*/
#endregion
namespace KingTop.WEB.SysAdmin.SysManage
{
    public partial class CountAPI : System.Web.UI.Page
    {
    
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Request["Type"] != null)  //获取访问量 
            {
                Response.Write(GetCount());
                Response.End();
            }
            else
            {
                Save();
            }
        }

        private void Save()
        {
            KingTop.Model.SysManage.BrowseCount acount = new KingTop.Model.SysManage.BrowseCount();

            acount.NodeCode = Request["nodecode"];
          
            try
            {
                DataTable moduleOne = new KingTop.BLL.SysManage.ModuleNode().GetList("LISTBYNODECODE", KingTop.Common.Utils.getOneParams("'" + acount.NodeCode + "'")); //SysModuleNode的table

                if (Request["infoid"] != null && Request["infoid"]!="")  //不为单页栏目
                {
                    acount.InfoID = Request["infoid"];
                    acount.ModelId = moduleOne.Rows[0]["ModuleID"].ToString();  //模型ID
                }
                acount.IP = Utils.GetIP();
                acount.BrowseTime = DateTime.Now;
                acount.LastVisiteUrl = Request["lastUrl"];
                acount.VisiteUrl = Request["curenturl"];
                acount.Browser = Request.Browser.Browser;
                
                acount.OperatSystem = Request.Browser.Platform;
                acount.SiteID = Utils.ConvertInt(moduleOne.Rows[0]["WebSiteID"].ToString());
               
                new KingTop.BLL.SysManage.BrowseCount().Save("NEW", acount);
            }
            catch
            {

            }
            Response.End();
        }

        private string GetCount()
        {
            SysWebSite bllWebSite = new SysWebSite();
            DataTable dt = bllWebSite.GetList("ONE", Utils.getOneParams(Request["siteID"]));
            string siteDir = dt.Rows[0]["Directory"].ToString();


            string FilePath = "~/" + siteDir + "/config/CountSet.config";
            string PhyFilePath = HttpContext.Current.Server.MapPath(FilePath);

            KingTop.Config.CountSetConfig info = KingTop.Config.CountSet.GetConfig(PhyFilePath);
            
            info.TodayCount += 1;
            info.TotalCount += 1;
            string totalCount = info.TotalCount.ToString();
            string todayCount = info.TodayCount.ToString();

            if (info.ShowType == 1) //图片显示
            {
                if (info.IsShowToTalCount)
                {
                    totalCount = "总访问量：" + GetTxt(totalCount);
                }
                if (info.IsShowTodayCount)
                {
                    todayCount = "    今日访问量：" + GetTxt(todayCount);
                }
            }
            KingTop.Config.CountSet.SaveConfig(PhyFilePath);
            return "document.write(\"" + totalCount + todayCount + "\")";
        }

        public string GetTxt(string count)
        {
            StringBuilder str = new StringBuilder();
            foreach (char i in count.ToString().ToCharArray())
            {
                str.Append("<img src='Plus/BrowseCount/image/" + i.ToString() + ".jpg' />");
            }
            return str.ToString();
        }
        
    }
}
