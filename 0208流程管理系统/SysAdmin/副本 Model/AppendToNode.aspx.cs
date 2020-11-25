#region 程序集引用using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;

using KingTop.Web.Admin;
#endregion

#region 版权注释
/*===========================================================================
// Copyright (C) 2010 华强北在线 
// 作者：吴岸标
// 创建日期：2010-05-07
// 功能描述：添加记录至节点
//
===========================================================================*/
#endregion

namespace KingTop.WEB.SysAdmin.Model
{
    public partial class AppendToNode : AdminPage
    {
        #region 私有变量
        KingTop.BLL.Content.AppendToNode appendToNode;
        protected string jsMessage;
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            appendToNode = new KingTop.BLL.Content.AppendToNode(SiteID, NodeCode);

            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 页面初始加载
        private void PageInit()
        {
            bool isValidate;

            isValidate = IsHaveRightByOperCode("AddToNode");

            if (isValidate)
            {
                appendToNode.BindInfo(lstInfo);
                appendToNode.BindNode(GetLoginAccountId(), lstNode);
            }
            else 
            {
                jsMessage = "parent.closeFrameAdnOpenDilog({msg:'对不起，您没有  添加到节点 权限，不能进行当前操作！',title:'操作受限'});";
            }
        }
        #endregion

        #region   批量添加信息到节点/栏目
        protected void BachAppendToNode(object sender, CommandEventArgs e)
        {
            string result;         // 操作结果
            bool isValidate;
            StringBuilder sbTitle;
            StringBuilder sbNode;

            sbTitle = new StringBuilder();
            sbNode = new StringBuilder();
            isValidate = IsHaveRightByOperCode("AddToNode");

            if (isValidate)
            {
                result = appendToNode.BatchAddToNode(lstInfo, lstNode);

                foreach (ListItem item in lstInfo.Items)
                {
                    if (item.Selected)
                    {
                        if (sbTitle.Length == 0)
                        {
                            sbTitle.Append(item.Text);
                        }
                        else
                        {
                            sbTitle.Append("," + item.Text);
                        }
                    }
                }

                foreach (ListItem item in lstNode.Items)
                {
                    if (item.Selected)
                    {
                        if (sbNode.Length == 0)
                        {
                            sbNode.Append(item.Text);
                        }
                        else
                        {
                            sbNode.Append("," + item.Text);
                        }
                    }
                }

                if (result == "1")  // 成功
                {
                    jsMessage = "parent.closeFrameAndOpenDilog({msg:'恭喜您，操作批量添加信息到节点/栏目成功！',title:'批量操作成功'});";
                    WriteLog("添加记录 " + sbTitle.ToString() + " 至栏目(节点) " + sbTitle.ToString() + "成功。" , null, 2);
                }
                else
                {
                    jsMessage = "parent.closeFrameAndOpenDilog({msg:'对不起,操作批量添加信息到节点/栏目失败',title:'批量操作失败'});";
                    WriteLog("添加记录 " + sbTitle.ToString() + " 至栏目(节点) " + sbTitle.ToString() + "失败。", result, 3);
                }
            }
            else
            {
                jsMessage = "parent.closeFrameAndOpenDilog({msg:'对不起，您没有  添加到节点 权限，不能进行当前操作！',title:'操作受限'});";
            }
        }
        #endregion
    }
}
