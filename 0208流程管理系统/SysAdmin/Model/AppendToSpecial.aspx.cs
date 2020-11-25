#region 程序集引用
using System;
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

using AllPower.Web.Admin;
#endregion

#region 版权注释
/*===========================================================================
// Copyright (C) 2010 华强北在线 
// 作者：吴岸标
// 创建日期：2010-04-27
// 功能描述：添加记录至专题栏目

// 更新日期        更新人      更新原因/内容
//
===========================================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Model
{
    public partial class AppendToSpecial : AdminPage
    {
        #region 私有变量
        AllPower.BLL.Content.AppendToSpecial appendToSpecial;
        protected string jsMessage;
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            appendToSpecial = new AllPower.BLL.Content.AppendToSpecial();

            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 页面初始加载
        private void PageInit()
        {
            DataTable specialMenu;
            bool isValidate;

            isValidate = IsHaveRightByOperCode("AddToNode");

            if (isValidate)
            {
                specialMenu = appendToSpecial.GetSpecialMenu();
                appendToSpecial.BindInfo(lstInfo);

                if (specialMenu != null)
                {
                    lstSpecialMenu.DataTextField = "title";
                    lstSpecialMenu.DataValueField = "value";
                    lstSpecialMenu.DataSource = specialMenu;
                    lstSpecialMenu.DataBind();
                }
            }
            else
            {
                jsMessage = "parent.closeFrameAdnOpenDilog({msg:'对不起，您没有  添加至专题 权限，不能进行当前操作！',title:'操作受限'});";
            }
        }
        #endregion

        #region   批量添加信息到专题
        protected void SpecialInfo_Add(object sender, CommandEventArgs e)
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
                result = appendToSpecial.BatchAddSpecialInfo(lstInfo, lstSpecialMenu);

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

                foreach (ListItem item in lstSpecialMenu.Items)
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
                    jsMessage = "parent.closeFrameAndOpenDilog({msg:'恭喜您，操作批量添加信息到至专题栏目成功！',title:'批量操作成功'});";
                    WriteLog("添加记录 " + sbTitle.ToString() + " 至专题栏目 " + sbTitle.ToString() + "成功。", null, 2);
                }
                else
                {
                    jsMessage = "parent.closeFrameAndOpenDilog({msg:'对不起,操作批量添加信息到至专题栏目失败',title:'批量操作失败'});";
                    WriteLog("添加记录 " + sbTitle.ToString() + " 至专题栏目 " + sbTitle.ToString() + "失败。", result, 3);
                }
            }
            else
            {
                jsMessage = "parent.closeFrameAndOpenDilog({msg:'对不起，您没有 添加到专题 权限，不能进行当前操作！',title:'操作受限'});";
            }
        }
        #endregion
    }
}
