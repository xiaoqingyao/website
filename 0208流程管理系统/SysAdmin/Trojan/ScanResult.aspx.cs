using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Text;
using System.IO;
using System.Collections;
using System.Xml;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      严辉
    创建时间： 2010年5月27日
    功能描述： 木马扫描结果
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class ScanResult : AdminPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReNo();
                PageData();
            }
        }

        #region 数据初始化
        private void LoadData()
        {           
            ReNo();
        }

        private void ReNo()
        {
            DataTable dtResult = (DataTable)Session["ScanResult"];
            int i=1;
            foreach (DataRow dr in dtResult.Rows)
            {
                dr[0] = i;
                i++;
            }
            
            AspNetPager1.RecordCount = dtResult.Rows.Count;

            //把当前url全部参数存入cookie中            
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); 
        }

        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            PageData();            
        }

        private void PageData()
        {
            int pageSize = AspNetPager1.PageSize;
            int pageIndex = AspNetPager1.CurrentPageIndex;
            DataTable dtResult = (DataTable)Session["ScanResult"];
            DataView dv = dtResult.DefaultView;

            if (pageIndex == 1)
            {
                dv.RowFilter = " ID<=" + pageSize.ToString();
            }
            else
            {
                dv.RowFilter = " ID >= " + (pageSize * (pageIndex-1) + 1).ToString() + " and ID <= " + (pageIndex  * pageSize).ToString();
            }
            rptScan.DataSource = dv;
            rptScan.DataBind();
        }

        #endregion

        protected void lbtnDel_Click(object sender, CommandEventArgs e)
        {
            string fileName = e.CommandArgument.ToString();            
           

            if (IsHaveRightByOperCode("Delete"))
            {
                File.Delete(fileName);

                DataTable dtResult = (DataTable)Session["ScanResult"];
                DataRow drTemp;

                if (!string.IsNullOrEmpty(fileName))
                {
                    drTemp = dtResult.Select("fullName='" + fileName + "'")[0];
                    dtResult.Rows.Remove(drTemp);

                    Session["ScanResult"] = dtResult;
                }
                PageData();
                Utils.AlertMessage(this, "删除成功！");
            }
            else
            {
                Utils.AlertMessage(this, "你没有删除操作权限 ！");
            }
        }

        protected void lbtnView_Click(object sender, CommandEventArgs e)
        {
            Session["fullName"] = e.CommandArgument.ToString();

            Utils.UrlRedirect("FileView.aspx");
        }

        protected void btnMutiReplace_Click(object sender, EventArgs e)
        {
            string IDList = GetAllChkId();
            string oldStr = hiOld.Value.Trim();
            string replaceStr = hiReplace.Value.Trim();

            if (!string.IsNullOrEmpty(IDList))
            {
                DataTable dtResult = (DataTable)Session["ScanResult"];
                DataView dv = dtResult.DefaultView;
                dv.RowFilter = " Id IN (" + IDList + ")";
                FileReadOrWrite frow = new FileReadOrWrite();
                frow.IsServerPath = false;
                string strFile = null;
                //替换文件个数
                int fileCount = 0;
                foreach (DataRowView drv in dv)
                {
                    strFile = frow.FileRead(drv["fullName"].ToString());
                    strFile = strFile.Replace(oldStr, replaceStr);
                    if (frow.FileWrite(strFile))
                    {
                        fileCount++;
                    }
                   
                }

                Utils.AlertMessage(this, "已成功替换 " + fileCount.ToString() + " 个文件 ！"); 
            }
        }

        //获取复选框列表值
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

        protected void btnAllReplace_Click(object sender, EventArgs e)
        {
            string oldStr = hiOld.Value.Trim();
            string replaceStr = hiReplace.Value.Trim();

            if (!string.IsNullOrEmpty(oldStr))
            {
                DataTable dtResult = (DataTable)Session["ScanResult"];
                FileReadOrWrite frow = new FileReadOrWrite();
                frow.IsServerPath = false;
                string strFile = null;

                //替换文件个数
                int fileCount = 0;

                foreach (DataRow dr in dtResult.Rows)
                {
                    strFile = frow.FileRead(dr["fullName"].ToString());
                    strFile = strFile.Replace(oldStr, replaceStr);

                    if (frow.FileWrite(strFile))
                    {
                        fileCount++;
                    }
                }

                Utils.AlertMessage(this, "已成功替换 " + fileCount.ToString() + " 个文件 ！"); 
            }

            
        }
    }
}
