

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
/*==========================================
 	Copyright (C) 2010 华强北在线
		作者:肖丹
        创建时间：2010-03-27
        功能描述：修改和添加用户
        更新日期        更新人      更新原因/内容
--=========================================*/
namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class SysUserEdit1 : AdminPage
    {
        #region  URL参数
        private string _userid = string.Empty;
        public string UserID
        {
            get
            {
                if (Utils.ReqUrlParameter("UserId") != "")
                {
                    this._userid = Utils.ReqUrlParameter("UserId");
                }
                return this._userid;
            }
            set
            {
                this._userid = value;
            }
        }
        #endregion

        protected void Page_Load(object sender, System.EventArgs e)
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
            string strUserId = Request.QueryString["UserId"] ?? "";
            ViewState["UserId"] = strUserId;
        }

        private void SetParm()
        {
            string strTempRoleCode = string.Empty;            
            //根据UserID,SiteID得到UserGropCode                
            Account bllAccount = new Account();               
            DataTable dtAccInfo = bllAccount.GetList("GETACCINFOBYSITE", Utils.getTwoParams(UserID, SiteID.ToString()));                
            if (dtAccInfo.Rows.Count > 0)                
            {                   
                this.txtUserGropCode.Value = dtAccInfo.Rows[0]["UserGroupCode"].ToString();                   
                strTempRoleCode = dtAccInfo.Rows[0]["UserGroupCode"].ToString();               
            }
              
            //根据UserGropCode得到RoleCode              
            UserGroupRole bllUserGroupRole = new UserGroupRole();               
            DataTable dtRoleCode = bllUserGroupRole.GetList("ONE", Utils.getOneParams(strTempRoleCode));              
            if (dtRoleCode.Rows.Count > 0)              
            {                  
                foreach (DataRow dr in dtRoleCode.Rows)                   
                {                      
                    this.txtRoleCode.Value += dr["RoleCode"].ToString() + ",";                  
                }
                txtRoleCode.Value = txtRoleCode.Value.Substring(0, txtRoleCode.Value.Length - 1);               
            }               
            else              
            {                  
                txtRoleCode.Value = "";               
            }                
            txtNodeId.Value = NodeID;
            txtUserID.Value = UserID;   
        }

        private void CreateTree()
        {
            try
            {                
                string strUserGropCode = this.txtUserGropCode.Value;
                string strRoleCode = this.txtRoleCode.Value;
                AllPower.BLL.SysManage.RightTool objRight = new AllPower.BLL.SysManage.RightTool();
                System.Web.UI.WebControls.TableCell objCell = new TableCell();
                System.Web.UI.WebControls.TableRow objRow = new TableRow();
                objRow = objRight.CreateRow(ref this.tblMain);
                objCell = objRight.CreateCell(ref objRow);
                objRight.UserGropCode = strUserGropCode;
                objRight.RoleCode = strRoleCode;
                objRight.LogUserPK = base.GetLoginAccountId();
                objRight.SiteID = SiteID;
                objRight.SetModuleRightList3(UserID,"");
                objRight.ArrEnable2("");
                objRight.CreateTree("", ref objCell, "",null);
                objRow.Controls.Add(objCell);
                tblMain.Controls.Add(objRow);
                objRight = null;
                return;
            }
            catch { }
        }

        private bool ExportData()
        {
            if (Request.ContentType.ToLower().IndexOf("text/xml")!=-1)
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

        private string SaveData(string strAccountCode, XmlNode objNodes)
        {
            //判断是否有权限
            if (IsHaveRightByOperCode("Right"))
            {
                AllPower.BLL.SysManage.RightTool objRight = new AllPower.BLL.SysManage.RightTool();
                objRight.SaveData3(strAccountCode, objNodes);
                objRight = null;
                return "修改用户权限成功！";
            }
            else
            {
                return "你没有修改用户权限的权限，请联系站点管理员！";
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("SysUserList.aspx?NodeCode=" + NodeCode+"&NodeID="+NodeID);
        }
    }

}

