using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Web.Admin;
using System.Data;

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class InfoCount : AdminPage
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

            BindCount(int.Parse(dropCount.SelectedValue), Request["node"]);

            if (Request["node"] ==null && Request["node"]!="")
            {
                DataTable moduleDt = browse.GetList("MODULELIST", AllPower.Common.Utils.getOneNumParams(SiteID));  //模型列表
                lblTitle.Text = "模型";
                reptModule.DataSource = moduleDt;
                reptModule.DataBind();
            }
            else
            {
                DataTable columnDt = browse.GetList("COLOUMNLIST", AllPower.Common.Utils.getOneParams(Request["node"]));  //模型列表//栏目列表
                lblTitle.Text = "栏目";
               // DataTable moduleOne = new AllPower.BLL.SysManage.ModuleNode().GetList("LISTBYNODECODE", AllPower.Common.Utils.getOneParams("'" + NodeCode + "'")); //栏目名称
                              
                reptColumn.DataSource = columnDt;
                reptColumn.DataBind();
            }           
          
        }
        private void BindCount(int count,string nodecode)
        {
            AllPower.Model.SelectParams parms = new AllPower.Model.SelectParams();
            parms.I1 = SiteID;
            parms.S1 = txtDate1.Text;
            parms.S2 = txtDate2.Text;
            parms.I2 = Times;
            
            parms.S3 = Request["id"];  //根据模型

            parms.S4 = nodecode; //根据栏目
          
            
            parms.I3 = count;
            DataTable dt = browse.GetInfoCount(parms);
            reptCount.DataSource = dt;
            reptCount.DataBind();
        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            PageInit();
        }

        protected void dropCount_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCount(int.Parse(dropCount.SelectedValue), Request["node"]);
        }

        protected void linkSearch_Click(object sender, EventArgs e)
        {
            BindCount(int.Parse(dropCount.SelectedValue),((LinkButton)sender).CommandArgument);
        }

    }
}
