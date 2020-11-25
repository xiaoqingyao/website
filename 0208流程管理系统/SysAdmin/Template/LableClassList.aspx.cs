using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using AllPower.Common;
using AllPower.Web.Admin;
using AllPower.BLL.Template;
/*================================================================
    Copyright (C) 2010 华强北在线          功能描述： 方案添加/修改 
// 更新日期        更新人      更新原因/内容
//2010-9-10        胡志瑶      加日志，加验证
--===============================================================*/
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class LableClassList : AllPower.Web.Admin.AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int pageIndex = Request["page"] != null ? int.Parse(Request["page"]) : 1;
                PageInit(pageIndex);
                this.SetRight(null, rptListInfo);
            }
        }

        private void PageInit(int pageIndex)
        {
            int pageSize = 20;
            AllPower.Model.SelectParams prams = new AllPower.Model.SelectParams();
            prams.I1 = pageIndex;
            prams.I2 = pageSize;
            prams.I3 = -1;

            DataSet ds = new Lable().GetLable("LableClass", prams);
            rptListInfo.DataSource = ds.Tables[1];
            rptListInfo.DataBind();

            int TotalRecord = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            Split.CurrentPageIndex = pageIndex;
            Split.PageSize = 20;
            Split.RecordCount = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

            this.SetRight(null, rptListInfo);
        }

        /// <summary>
        /// 页面跳转
        /// </summary>
        /// <param name="src"></param>
        /// <param name="e"></param>
        protected void Split_PageChanged(object src, EventArgs e)
        {
            PageInit(Split.CurrentPageIndex);
        }

        #region 批量删除
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Delete(GetAllChkId());
        }

        private void Delete(string idList)
        {
            if (IsHaveRightByOperCode("Delete"))
            {
                if (!string.IsNullOrEmpty(idList))
                {
                    AllPower.Model.SelectParams prams = new AllPower.Model.SelectParams();
                    prams.I1 = -1;
                    prams.S1 = idList;

                    int row = new AllPower.BLL.Template.Lable().DeleteLableClass("ONECLASS", prams);
                    WriteLog(GetLogValue(LogTitle, "Del", "LableClass", true), "", 2);    //写日志

                    PageInit(1);
                }
            }
            else
            {
                Utils.AlertMessage(this, "你没有删除操作权限！");
            }
        }
        private string GetAllChkId()
        {
            if (!string.IsNullOrEmpty(Request.Form["chkId"]))
            {
                return Request.Form["chkId"].Replace(" ", "");
            }
            else
            {
                return "";
            }
        }
        #endregion
        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbtnEdit_Click(object sender, CommandEventArgs e)
        {
            string classId = e.CommandArgument.ToString();
            string isSystem = e.CommandName.ToString();
            Response.Redirect("LableClassEdit.aspx?action=edit&id=" + classId + "&NodeCode=" + NodeCode);
        }
        /// <summary>
        /// 添加标签
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbtnAdd_Click(object sender, CommandEventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                string classId = e.CommandArgument.ToString();
                string isSystem = e.CommandName.ToString();
                Response.Redirect("LableClassEdit.aspx?cid=" + classId + "&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.AlertMessage(this, "你没有添加操作权限！");
            }
          
        }
        /// <summary>
        /// 判断是否显示相应的按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rptListInfo_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton lnkDelete = (LinkButton)e.Item.FindControl("lbtnDelete");
                LinkButton lnkEdit = (LinkButton)e.Item.FindControl("lbtnEdit");
                LinkButton lnkAdd = (LinkButton)e.Item.FindControl("lbtnAdd");
                

                string classId = lnkDelete.CommandArgument.ToString();
                string isSystem = lnkDelete.CommandName.ToString();

                if (isSystem == "1")
                {
                    lnkDelete.Visible = false;
                    lnkAdd.Visible = false;
                }
            }
        }

        public string CheckIsSystem(string classId, string isSystem)
        {
            return isSystem == "0" ? classId : "0";
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Utils.UrlRedirect("LableClassEdit.aspx?NodeCode=" + NodeCode);
            }
            else
            {
                Utils.AlertMessage(this, "你没有添加操作权限！");
            }
        }
    }
}
