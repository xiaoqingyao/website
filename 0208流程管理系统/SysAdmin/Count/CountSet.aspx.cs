using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AllPower.Web.Admin;
using AllPower.Config;
using AllPower.Common;
#region 版权注释
/*===========================================================================
//    Copyright (C) 2010 华强北在线
//    作者:      胡志瑶 
//    创建时间： 2010年10月19日
//    功能描述： 统计设置
 
//    更新日期        更新人      更新原因/内容
//
===========================================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class CountSet : AdminPage
    {
        //文件实际物理路径
        public string PhyFilePath = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            string FilePath = "~/" + SiteDir + "/config/CountSet.config";
            PhyFilePath = HttpContext.Current.Server.MapPath(FilePath);
           
            if (!Page.IsPostBack)
            {
                ResetConfig();
                BindDate();
            }
        }

        private void BindDate()
        {
             
            CountSetConfig info = AllPower.Config.CountSet.GetConfig(PhyFilePath);
    
            checkTotal.Checked = info.IsShowToTalCount;
            checkToday.Checked = info.IsShowTodayCount;
            radioShowType.SelectedValue = info.ShowType.ToString();
            txtStartToday.Text = info.TodayStart.ToString();
            txtStartTotal.Text = info.TotalStart.ToString();
            lblToday.Text = info.TodayCount.ToString();
            lblTotal.Text = info.TotalCount.ToString();
            hidDate.Value = DateTime.Now.ToShortDateString();

            txtStartTotal.Attributes.Add("onkeyup", "isNumeric(this);changeCount('Total'," + info.TotalStart + "," + info.TotalCount + ");");
            txtStartToday.Attributes.Add("onkeyup", "isNumeric(this);changeCount('Today'," + info.TodayStart + "," + info.TodayCount + ")");

            txtCountUrl.Text = "<script language=javascript src='" + GetSiteDomain() + "Plus/BrowseCount/js/common.js?infoid={$Field(1,ID,0,0)}&nodecode={$Field(1,NodeCode,0,0)}'></script>";

            string url = Request.Url.ToString().Substring(0, Request.Url.ToString().IndexOf('?')).Replace("CountSet.aspx", "BrowseCountAPI.aspx");
         
            txtShowUrl.Text = "<script language=javascript src='" + url + "?Type=0&siteID={$Field(1,SiteID,0,0)}'></script>";
        }
        //判断xml文件是否存在，如果不存在重置xml
        protected void ResetConfig()
        {
            AllPower.Config.CountSet.ConfigInfo = new CountSetConfig();     
            if (!File.Exists(PhyFilePath))
            {
                AllPower.Config.CountSet.SaveConfig(PhyFilePath);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Edit"))
            {
                CountSetConfig info = new CountSetConfig();
               
                info.IsShowTodayCount = checkToday.Checked;
                info.IsShowToTalCount = checkTotal.Checked;
                info.ShowType = int.Parse(radioShowType.SelectedValue);
                info.TotalStart = Utils.ConvertInt(txtStartTotal.Text);
                info.TodayStart = Utils.ConvertInt(txtStartToday.Text);
                info.TotalCount = Utils.ConvertInt(lblTotal.Text);
                info.TodayCount = Utils.ConvertInt(lblToday.Text);
                info.date = hidDate.Value;
                AllPower.Config.CountSet.ConfigInfo = info;
                AllPower.Config.CountSet.SaveConfig(PhyFilePath);
                WriteLog("统计显示设置成功！", "", 2);
                Utils.RunJavaScript(this, "alert({msg:'统计显示设置成功!',title:'提示信息'})");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有修改统计显示设置的权限，请联系站点管理员！',title:'提示信息'})");
            }
        }
    }
}
