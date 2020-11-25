
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
using System.Collections;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年3月31日
    功能描述： 用户组赋权限
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class UserGropPermit : AdminPage
    {
        //未保存前的用户组权限数组，用于比对XmlNode得到减少的权限编码
        ArrayList _arrRigth;
        public ArrayList arrOldRigth
        {
            get
            {
                if (AllPower.Common.AppCache.IsExist("arrOldRigth"))
                {
                    this._arrRigth = (ArrayList)AllPower.Common.AppCache.Get("arrOldRigth");
                }
                return this._arrRigth;
            }
            set
            {
                if (AllPower.Common.AppCache.IsExist("arrOldRigth"))
                {
                    AllPower.Common.AppCache.Remove("arrOldRigth");
                }
                AllPower.Common.AppCache.AddCache("arrOldRigth", value,120);
            }
        }

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
            string strUserGropCode = Request.QueryString["UserGropCode"] ?? "";
            string strRoleCode = Request.QueryString["RoleCode"] ?? "";
            ViewState["UserGropCode"] = strUserGropCode;
            ViewState["RoleCode"] = strRoleCode;
        }

        private void SetParm()
        {
            if (this.Request.QueryString["UserGropCode"] != null)
            {
                this.txtUserGropCode.Value = this.Request.QueryString["UserGropCode"].ToString();
                this.txtRoleCode.Value = this.Request.QueryString["RoleCode"].ToString(); ;
                txtNodeId.Value = NodeID;
            }
        }

        private void CreateTree()
        {
            try
            {
                AllPower.BLL.SysManage.UserGroup objUserGroup = new AllPower.BLL.SysManage.UserGroup();
                string ParentGroupID = "";
                //父用户组ID
                DataTable dt = objUserGroup.GetList("GETPARENTGROUP", Utils.getOneParams(txtUserGropCode.Value)).Tables[0];
                if (dt != null && dt.Rows.Count > 0)
                {
                    ParentGroupID = dt.Rows[0]["UserGroupCode"].ToString();
                }
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
                ArrayList arrRigth1 = (ArrayList)objRight.SetModuleRightList("").Clone();
                ArrayList arrRigth2 = objRight.ArrEnable("");
                //移除用户组所有权限中角色的权限并赋给arrOldRigth
                for (int i = 0; i < arrRigth1.Count; i++)
                {
                    for (int j = 0; j < arrRigth2.Count; j++)
                    {
                        if (arrRigth2[j].ToString() == arrRigth1[i].ToString())
                        {
                            arrRigth1.Remove(arrRigth2[j]);
                            i = i - 1;
                            break;
                        }
                    }
                }
                arrOldRigth = arrRigth1;
                objRight.CreateTree("", ref objCell, ParentGroupID,null);
                objRow.Controls.Add(objCell);
                tblMain.Controls.Add(objRow);
                objRight = null;
                return;
            }
            catch { }
        }

        private bool ExportData()
        {
            if (Request.ContentType.ToLower().IndexOf( "text/xml")!=-1)
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
                                string strSubRig = GetSubRigth(objNodes);
                                strXmlStr = this.SaveData(strUserPk, objNodes, strSubRig);
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

        private string GetSubRigth(XmlNode objNodes)
        {
            //得到减少的操作编码
            string strSubRigth = string.Empty;
            bool isfind;
            for (int i = 0; i < arrOldRigth.Count; i++)
            {
                isfind = false;
                for (int j = 0; j < objNodes.ChildNodes.Count; j++)
                {
                    string strNodeCode = objNodes.ChildNodes[j].Attributes["OperCode"].Value;
                    if (arrOldRigth[i].Equals(strNodeCode))
                    {
                        isfind = true;
                        continue;
                    }
                }
                if (!isfind)
                {
                    strSubRigth += arrOldRigth[i].ToString() + ",";
                }
            }
            if (strSubRigth.Length > 0)
            {
                strSubRigth = strSubRigth.Substring(0, strSubRigth.Length - 1);
            }
            return strSubRigth;            
        }

        private string SaveData(string strUserGropCode, XmlNode objNodes, string strSubRigth)
        {
            //判断是否有权限
            if (IsHaveRightByOperCode("Right"))
            {
                AllPower.BLL.SysManage.RightTool objRight = new AllPower.BLL.SysManage.RightTool();
                objRight.LogUserPK = ViewState["UserGropCode"].ToString();
                objRight.SaveData(strUserGropCode, objNodes, strSubRigth);
                objRight = null;                
                return "修改用户组权限成功！";
            }
            else
            {
                return "你没有修改用户组权限的权限，请联系站点管理员！";
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserGropList.aspx?NodeCode=" + NodeCode);
        }

    }
}

