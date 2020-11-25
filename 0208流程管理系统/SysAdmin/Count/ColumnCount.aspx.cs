using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AllPower.Web.Admin;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      胡志瑶
    创建时间： 2010年10月15日   栏目流量统计
 
// 更新日期        更新人      更新原因/内容
// 
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class ModuleCount : AdminPage
    {
        private int Times
        {
            get
            {
                return Request["time"] != null ? int.Parse(Request["time"]) : 0;
            }
        }
        private AllPower.BLL.SysManage.BrowseCount browse = new AllPower.BLL.SysManage.BrowseCount();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
               
                PageInit();
                btnQuery.Attributes.Add("onclick", "return checkSearch();");
            }
        }
        private void PageInit()
        {
            string startTime = txtDate1.Text;
            string endTime = txtDate2.Text;
            string now = DateTime.Now.ToShortDateString();

            
            

           
           // DataTable dt = count.GetColumnCount( parms);



            AllPower.BLL.SysManage.ModuleNode bll = new AllPower.BLL.SysManage.ModuleNode();
            DataTable dt = bll.GetList("SITEWEB", AllPower.Common.Utils.getOneParams(SiteID.ToString()));

            dt.Columns.Add("ToTalCount");
            dt.Columns.Add("TodayCount");
            dt.Columns.Add("Enable");
            DataTable newDt = dt.Clone();
            CreateTree(dt, newDt, "0");
            reptCount.DataSource = newDt;
            reptCount.DataBind();
           
        }
      
        private DataTable CreateTree(DataTable dt,DataTable newDt, string parentNode)
        {
            AllPower.Model.SelectParams parms = new AllPower.Model.SelectParams();
            parms.I1 = SiteID;
            parms.S1 = txtDate1.Text;
            parms.S2 = txtDate2.Text;
            parms.I2 = Times;

       
            DataRow[] drs = dt.Select("ParentNode='" + parentNode + "'", "NodelOrder ASC");
            foreach (DataRow dr in drs)
            {
                if (parentNode == "0")  //去除“内容管理”
                {
                    CreateTree(dt, newDt, dr["NodeCode"].ToString());
                    break;
                }
                int times = dr["NodeCode"].ToString().Length / 3;  //加空格
                string ko = "";
                for (int i = 1; i < times; i++)
                {
                    ko += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                }

                parms.S3 = dr["NodeCode"].ToString();
                browse.GetColumnCount(parms, dr);  //获得总的和今日的栏目访问量

                dr["NodeName"] = ko + dr["NodeName"].ToString();
                dr["Enable"] = false;
                if (Convert.ToInt32(dr["NodeType"]) == 1)  //父栏目
                {
                    if (Convert.ToInt32(dr["TotalCount"]) > 0)
                    {
                        dr["Enable"] = true;
                    }         
                    //"<font style='color:red'>"
                    dr["TotalCount"] =dr["TotalCount"].ToString() ;
                    dr["TodayCount"] = dr["TodayCount"].ToString();
                    newDt.Rows.Add(dr.ItemArray);
                    CreateTree(dt, newDt, dr["NodeCode"].ToString());
                }
                else
                {
                  
                    if (dr["ColumnType"].ToString() == "1")  //列表模式
                    {
                        if (Convert.ToInt32(dr["TotalCount"]) > 0)
                        {
                            dr["Enable"] = true;
                        }
                        newDt.Rows.Add(dr.ItemArray);
                        CreateTree(dt, newDt, dr["NodeCode"].ToString());
                    }
                    else
                    {                       
                        newDt.Rows.Add(dr.ItemArray);
                    }                                                
                }                  
              
            }
            return newDt;

        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            PageInit();
        }
    }
}
