
﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Web.Admin;
using System.Xml;
using AllPower.BLL.SysManage;
using AllPower.Common;
using System.Data;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年4月23日
    功能描述： 模板权限管理
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class TemplatePermit : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetRightUser();
                if (this.ExportData()) return;
                SetParm();
            }
            CreateTree();
        }

        private void SetRightUser()
        {
            string strTemplateID = Request.QueryString["TemplateID"] ?? "";
            ViewState["TemplateID"] = strTemplateID;
        }

        private void SetParm()
        {
            if (this.Request.QueryString["TemplateID"] != null)
            {
                this.txtTemplate.Value = "" + this.Request.QueryString["TemplateID"].ToString() + "";
                txtNodeId.Value = NodeID;
            }
        }


        private void CreateTree()
        {
            try
            {
                int TemplateID = Utils.ParseInt(this.txtTemplate.Value,0);
                AllPower.BLL.SysManage.RightTool objRight = new AllPower.BLL.SysManage.RightTool();
                System.Web.UI.WebControls.TableCell objCell = new TableCell();
                System.Web.UI.WebControls.TableRow objRow = new TableRow();
                objRow = objRight.CreateRow(ref this.tblMain);
                objCell = objRight.CreateCell(ref objRow);
                objRight.TemplateID = TemplateID;
                objRight.SetTemplateRightList(TemplateID, "");
                objRight.CreateTree("", ref objCell, TemplateID);
                objRow.Controls.Add(objCell);
                tblMain.Controls.Add(objRow);
                objRight = null;
                return;
            }
            catch { }
        }

        private bool ExportData()
        {
            if (Request.ContentType.ToLower().IndexOf("text/xml") == 0)
            {
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(Request.InputStream);
                if (xmlDoc.DocumentElement.ChildNodes.Count > 0)
                {
                    XmlElement xmlRoot = xmlDoc.DocumentElement;
                    XmlNode objNodes = null;
                    string strKey = xmlRoot.GetAttribute("type");
                    string strXmlStr = "", strUserPk = "";
                    switch (strKey)
                    {
                        case "save":
                            try
                            {
                                objNodes = xmlRoot.SelectNodes("//dataset").Count >= 1 ? (XmlNode)(xmlRoot.SelectNodes("//dataset")[0]) : null;
                                strUserPk = objNodes.Attributes["userpk"].Value.ToString().Trim().ToLower();
                                if (strUserPk.Trim().Length == 0)
                                {
                                    throw new Exception("未选择用户组！");
                                }
                                objNodes = xmlRoot.SelectNodes("//r").Count >= 1 ? (XmlNode)(xmlRoot.SelectNodes("//r")[0]) : null;
                                strXmlStr = this.SaveData(strUserPk, objNodes);
                            }
                            catch (System.Exception exp)
                            {
                                strXmlStr = "错误：" + exp.Message;
                            }
                            Response.ClearContent();
                            Response.ClearHeaders();
                            WriteLog(strXmlStr, "", 2);//原来SaveData()写日志改为在这里写日志
                            Response.End();
                            return true;
                    }
                }
            }
            return false;
        }

        private string SaveData(string strUserGropCode, XmlNode objNodes)
        {
            //判断是否有权限
            if (IsHaveRightByOperCode("Right"))
            {
                AllPower.BLL.SysManage.RightTool objRight = new AllPower.BLL.SysManage.RightTool();
                objRight.SaveDataTemplatePer(Utils.ParseInt(ViewState["TemplateID"].ToString(), 0), objNodes);
                objRight = null;;
                return "编辑模板权限成功！";
            }
            else
            {
                return "你没有编辑模板权限的权限，请联系站点管理员！";
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("TemplateManage.aspx?NodeID=" + NodeID);
        }
    }
}

