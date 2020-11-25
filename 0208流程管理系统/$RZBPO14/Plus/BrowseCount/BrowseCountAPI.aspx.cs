using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Data;
using System.Text;
using AllPower.BLL.SysManage;
using AllPower.Web.Admin;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      胡志瑶  统计网站浏览量API

    创建时间： 2010年9月7日   
 
// 更新日期        更新人      更新原因/内容
// 
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class CountAPI : AdminPage
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
            AllPower.Model.SysManage.BrowseCount acount = new AllPower.Model.SysManage.BrowseCount();
            string nodecode = Request["nodecode"];
            string nodename = "";
            try
            {
                if (Request["nodecode"].Length < 2)  //特殊情况下,暂时用这种方法处理。
                {
                    switch (int.Parse(Request["nodecode"]))
                    {
                        case 1:  //首页
                            nodename = "首页";
                            break;
                    }
                    DataTable nodeTb = new AllPower.BLL.SysManage.ModuleNode().GetList("SITEWEB", AllPower.Common.Utils.getOneParams(SiteID.ToString()));
                    nodecode = nodeTb.Select(" NodeName='" + nodename + "'")[0]["NodeCode"].ToString();
                }
                acount.NodeCode = nodecode;

                DataTable moduleOne = new AllPower.BLL.SysManage.ModuleNode().GetList("LISTBYNODECODE", AllPower.Common.Utils.getOneParams("'" + acount.NodeCode + "'")); //SysModuleNode的table

                if (Request["infoid"] != null && Request["infoid"] != "")  //不为单页栏目
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

                new AllPower.BLL.SysManage.BrowseCount().Save("NEW", acount);
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

            AllPower.Config.CountSetConfig info = AllPower.Config.CountSet.GetConfig(PhyFilePath);
            
            info.TodayCount += 1;
            info.TotalCount += 1;
            string totalCount = "";
            string todayCount = "";

           
            if (info.IsShowToTalCount)
            {
                totalCount = "总访问量：" + (info.ShowType == 1 ? GetTxt(info.TotalCount.ToString()) : info.TotalCount.ToString());
            }
            if (info.IsShowTodayCount)
            {
                todayCount = "    今日访问量：" + (info.ShowType == 1 ? GetTxt(info.TodayCount.ToString()) : info.TodayCount.ToString());
            }
            
            AllPower.Config.CountSet.SaveConfig(PhyFilePath);
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
