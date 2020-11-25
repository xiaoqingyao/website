
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.Model;
using System.Data;
using System.Text;
using AllPower.BLL.SysManage;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年3月31日
    功能描述： 操作编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class ActionEdit : AllPower.Web.Admin.AdminPage
    {
        //逻辑层 操作表
        AllPower.BLL.SysManage.ActionPermit bll = new AllPower.BLL.SysManage.ActionPermit();
        //实体层 
        AllPower.Model.SysManage.ActionPermit mode = new AllPower.Model.SysManage.ActionPermit();
        //逻辑层模块表
        Module bllModule = new Module();
        //公共操作逻辑类
        BLL.SysManage.PublicOper bllOper = new PublicOper();
        StringBuilder sbLog = new StringBuilder(16);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDate();
                PageInit();
            }
        }

        #region 绑定下拉列表
        private void BindDate()
        {
            //绑定模块下拉列表
            DataTable dt = bllModule.GetList("ALL", Utils.getOneParams(""));
            if (dt.Rows.Count > 0)
            {
                this.ddlModel.DataSource = dt.DefaultView;
                this.ddlModel.DataTextField = "ModuleName";
                this.ddlModel.DataValueField = "ModuleID";
                this.ddlModel.DataBind();
            }
            //绑定公共操作表的英文名称
            dt = bllOper.GetList("ALL", Utils.getOneParams(""));
            if (dt.Rows.Count > 0)
            {
                this.DDLOperEngDesc.DataSource = dt.DefaultView;
                this.DDLOperEngDesc.DataTextField = "OperName";
                this.DDLOperEngDesc.DataValueField = "OperName";
                this.DDLOperEngDesc.DataBind();
                ListItem ls = new ListItem("请选择", "");//追加一项
                this.DDLOperEngDesc.Items.Insert(0, ls);
            }
        }
        #endregion

        #region 初始化页面控件赋值
        private void PageInit()
        {
            if (this.Action == "EDIT")
            {
                DataTable dt;

                //根据ID查找记录
                dt = bll.GetList("ONE", Utils.getOneParams(this.ID));

                //按钮文本改为“修改”
                btnEdit.Text = Utils.GetResourcesValue("Common", "Update");

                //赋值
                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    txID.Text = ID;
                    ddlModel.SelectedValue = Utils.HtmlDecode(dr["ModuleID"].ToString());
                    this.hidLogTitle.Value = Utils.HtmlDecode(dr["OperName"].ToString());
                    txtOperName.Text = Utils.HtmlDecode(dr["OperName"].ToString());
                    txtOperCode.Text = Utils.HtmlDecode(dr["OperCode"].ToString());
                    txtOperOrder.Text = Utils.HtmlDecode(dr["OperOrder"].ToString());
                    RBL_IsValid.SelectedValue = dr["IsValid"].ToString();
                    txtOperDesc.Text = Utils.HtmlDecode(dr["OperDesc"].ToString());
                    DDLOperEngDesc.SelectedValue = dr["OperEngDesc"].ToString();
                    chkIsDefaultOper.Checked = Utils.ParseBool(dr["IsDefaultOper"]);
                    chkIsSystem.Checked = Utils.ParseBool(dr["isSystem"]);
                    hdnMCode.Value = dr["ModuleCode"].ToString();
                }
            }
            else
            {
                //按钮文本改为“添加”
                btnEdit.Text = Utils.GetResourcesValue("Common", "Add");
                //操作ID自动生成
                txID.Text = Guid.NewGuid().ToString();
            }
        }
        #endregion

        #region 按钮事件
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string returnMsg = "";
            string tranType = "NEW";
            DataTable dt = null;

            //赋值给实体类
            mode.ID = new Guid(txID.Text);
            mode.OperName = Utils.HtmlEncode(txtOperName.Text.Trim());
            mode.OperOrder = Utils.HtmlEncode(txtOperOrder.Text.Trim());
            mode.IsValid = Utils.ParseBool(RBL_IsValid.SelectedValue);
            mode.OperDesc = Utils.HtmlEncode(txtOperDesc.Text.Trim());
            mode.OperEngDesc = Utils.HtmlEncode(DDLOperEngDesc.SelectedValue);
            mode.IsDefaultOper = Utils.ParseBool(chkIsDefaultOper.Checked);
            mode.IsSystem = Utils.ParseBool(chkIsSystem.Checked);
            mode.ModuleID = new Guid(ddlModel.SelectedValue);

            // 修改操作
            if (this.Action == "EDIT")
            {
                #region 修改操作
                // 权限验证，是否具有修改权限
                if (IsHaveRightByOperCode("Edit"))
                {
                    dt = bllModule.GetList("ONE", Utils.getOneParams(ddlModel.SelectedValue));
                    string operCode = txtOperCode.Text;

                    //operCode为模块的moduluCode再加本来的operCode后三位
                    mode.operCode = dt.Rows[0]["ModuleCode"].ToString() + operCode.Substring(operCode.Length - 3, 3);

                    //如果数据库存在相同记录就不能再添加
                    if (bll.GetList("IsExist", Utils.getTwoParams(ddlModel.SelectedValue, mode.OperEngDesc)).Rows.Count == 0)
                    {
                        returnMsg = bll.Save("EDIT", mode);
                    }
                    else
                    {
                        //如果己存在一条相同的数据，则不能修改模块ID和操作英文名
                        returnMsg = bll.Save("EDITExist", mode);
                    }
                    string logTitle = Request.Form["hidLogTitle"];
                    if (logTitle != txtOperName.Text)
                    {
                        logTitle = logTitle + " => " + txtOperName.Text;
                    }
                    try
                    {

                        if (Convert.ToInt32(returnMsg) > 0)
                        {
                            WriteLog(GetLogValue(logTitle, "Update", "ActionEdit", true), "", 2); //写日志

                            Utils.RunJavaScript(this, "type=1;title='" + txtOperName.Text.Replace("'", "\\'") + "';");
                            //Utils.RunJavaScript(this, "alertClose({msg:'修改操作成功！',title:'提示信息'},function(){location.href='ActionList.aspx"+StrPageParams+"'})");

                        }
                    }
                    catch
                    {
                        WriteLog(GetLogValue(logTitle, "Update", "ActionEdit", false), returnMsg, 3); //写日志
                        //Utils.RunJavaScript(this, "alert({msg:" + returnMsg + ",title:'提示信息'})");
                        Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "';");

                    }
                }
                else
                {
                    sbLog.Append("失败，无权限！");
                    Utils.RunJavaScript(this, "alert({msg:'无权限,请联系管理员！',title:'提示信息'});window.location.href='ActionList.aspx?nodeCode=" + NodeCode + "'");
                }
                #endregion
            }
            else  //添加操作
            {
                #region   添加操作
                // 权限验证，是否具有新增权限
                if (IsHaveRightByOperCode("New"))
                {
                    //如果数据库存在相同记录就不能再添加
                    if (bll.GetList("IsExist", Utils.getTwoParams(ddlModel.SelectedValue, mode.OperEngDesc)).Rows.Count == 0)
                    {
                        //如果此模块有相应操作，就取最大opercode+1
                        dt = bll.GetList("MAXCODE", Utils.getOneParams(ddlModel.SelectedValue));
                        if (dt.Rows[0]["opercode"].ToString() != "")
                        {
                            mode.operCode = dt.Rows[0]["opercode"].ToString();
                        }
                        else
                        {
                            //如果没有，则取此模块的modulecode,例如101，102，然后再从001开始，成为101001，102001
                            dt = bllModule.GetList("ONE", Utils.getOneParams(ddlModel.SelectedValue));
                            mode.operCode = dt.Rows[0]["ModuleCode"].ToString() + "001";
                        }

                        returnMsg = bll.Save(tranType, mode);
                        try
                        {
                            if (Convert.ToInt32(returnMsg) > 0)
                            {
                                //Utils.RunJavaScript(this, "alert({msg:'新增操作成功！',title:'提示信息'})");
                                WriteLog("新增"+txtOperName.Text+"操作成功", "", 2); // 写入操作日志
                                //Utils.RunJavaScript(this, "if(confirm('新增操作成功！点击[确定]继续新增操作，点[取消]回到操作列表页。')){location.href='ActionEdit.aspx?Action=add&nodeid=" + NodeID + "'}else{location.href='ActionList.aspx?nodeid=" + NodeID + "'}");
                                Utils.RunJavaScript(this, "type=0;title='" + txtOperName.Text.Replace("'", "\\'") + "';");
                            }
                        }
                        catch
                        {
                            //Utils.RunJavaScript(this, "alert({msg:" + returnMsg + ",title:'提示信息'})");
                            WriteLog("新增"+txtOperName.Text+"操作失败", returnMsg, 3);
                            Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "';");
                        }
                    }
                    else
                        //Utils.RunJavaScript(this, "alert({msg:'已经存在该操作',title:'提示信息'})");
                        Utils.RunJavaScript(this, "type=2;errmsg='已经存在该操作';");
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有新增操作的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }
        }
        #endregion
    }
}