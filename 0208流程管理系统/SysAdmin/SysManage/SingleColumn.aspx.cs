using System;
using System.Collections.Generic;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.Model;
using System.Data;
using AllPower.BLL.SysManage;
using AllPower.Web.Admin;
using System.Text.RegularExpressions;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年3月31日
    功能描述： 栏目管理
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class SingleColumn : AdminPage
    {

        //逻辑类

        AllPower.BLL.SysManage.ModuleNode bllModuleNode = new AllPower.BLL.SysManage.ModuleNode();
        //实体类

        AllPower.Model.SysManage.ModuleNode mode = new AllPower.Model.SysManage.ModuleNode();

        #region  URL参数
        private string _Isparent = null;

        public string IsParent
        {
            get
            {
                if (this._Isparent == null)
                {
                    this._Isparent = Utils.ReqUrlParameter("IsParent");
                    // 参数格式验证，非法则重置为空字符串

                }
                return this._Isparent;
            }
        }

        public string NCode
        {
            get { return Request.QueryString["NCode"]; }
        }
        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindDate();
                MetaInit();
                BindCustomContentCount();
                PageInit();
            }
        }

        #region 绑定页面DropDownList控件
        //绑定栏目类型
        //private void BindDate()
        //{
        //    Module bllModule = new Module();
        //    DataTable dt = bllModule.GetList("ALL", Utils.getOneParams(""));
        //    if (dt.Rows.Count > 0)
        //    {
        //        this.ddlModel.DataSource = dt.DefaultView;
        //        this.ddlModel.DataTextField = "ModuleName";
        //        this.ddlModel.DataValueField = "ModuleID";
        //        this.ddlModel.DataBind();
        //        ListItem ls = new ListItem("请选择", "0");//追加一项

        //        this.ddlModel.Items.Insert(0, ls);
        //    }
        //}


        //自定义内容数量

        private void BindCustomContentCount()
        {
            for (int i = 1; i <= 10; i++)
            {
                ListItem ls = new ListItem(i.ToString(), i.ToString());
                this.ddlCustomContentCount.Items.Add(ls);
            }
            ddlCustomContentCount.SelectedValue = "1";
        }
        #endregion

        private void PageInit()
        {
            //页面控件数据加载
            if (this.Action == "EDIT")
            {
                DataTable dt = bllModuleNode.GetList("ONE", Utils.getOneParams(ID));
                btnEdit.Text = Utils.GetResourcesValue("Common", "Update");

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    txtNodeID.Text = dr["NodeID"].ToString();
                    txtNodeCode.Text = dr["NodeCode"].ToString();
                    txtNodeName.Text = dr["NodeName"].ToString();
                    hidLogTitle.Value = dr["NodeName"].ToString();
                    txtNodelIcon.Text = dr["NodelIcon"].ToString();
                    txtCurrentImg.Text = dr["CurrentImg"].ToString();
                    txtMouseOverImg.Text = dr["MouseOverImg"].ToString();
                    chkIsFolder.Checked = Utils.ParseBool(dr["NodeType"].ToString());
                    chkIsLeftDisplay.Checked = Utils.ParseBool(Convert.ToInt32(dr["IsLeftDisplay"]));
                    chkIsTopMenuShow.Checked = Utils.ParseBool(dr["IsTopMenuShow"].ToString());
                    chkIsLeftMenuShow.Checked = Utils.ParseBool(dr["IsLeftMenuShow"].ToString());
                    txtLinkURL.Text = dr["LinkURL"].ToString();
                    RBL_IsValid.SelectedValue = dr["IsValid"].ToString();
                    txtNodelOrder.Text = dr["NodelOrder"].ToString();
                    this.Editor1.Content = dr["NodelDesc"].ToString();
                    txtNodelEngDesc.Text = dr["NodelEngDesc"].ToString();
                    txtTips.Text = dr["Tips"].ToString();
                    txtKeyWords.Text = dr["Meta_Keywords"].ToString();
                    txtMetaDesc.Text = dr["Meta_Description"].ToString();
                    txtDefaultTemplate.Text = dr["DefaultTemplate"].ToString();
                    txtBanner.Text = dr["Banner"].ToString();
                    switch (dr["OpenType"].ToString())
                    {
                        case ("1"): { radSelf.Checked = true; break; }
                        case ("2"): { radNew.Checked = true; break; }
                        default: { radSelf.Checked = true; break; }
                    }
                    if (string.IsNullOrEmpty(dr["ListPagePostFix"].ToString()))
                    {
                        try
                        {
                            ddlListPagePostFix.SelectedValue = dr["ListPagePostFix"].ToString();
                        }
                        catch
                        {
                            throw new Exception("没有相应项与之匹配");
                        }
                    }
                    switch (dr["IsCreateContentPage"].ToString())
                    {
                        case ("False"): { radCreateContentPageTrue.Checked = true; break; }
                        case ("True"): { radCreateContentPageFalse.Checked = true; break; }
                        default: { radCreateContentPageTrue.Checked = true; break; }
                    }

                    //自定义内容绑定

                    //string strCustomContent = dr["Custom_Content"].ToString();
                    //if (strCustomContent.IndexOf("###") > 0)
                    //{
                    //    //有多个自定义内容
                    //    string[] arrCustomContent = Regex.Split(strCustomContent, "###");
                    //    //选中下拉框

                    //    ddlCustomContentCount.SelectedValue = arrCustomContent.Length.ToString();
                    //    //给第一个TextBox赋值

                    //    txtCustomContent1.Text = arrCustomContent[0];
                    //    //创建控件并赋值

                    //    for (var i = 2; i <= arrCustomContent.Length; i++)
                    //    {
                    //        tdCustomContent.InnerHtml += "自设内容" + i.ToString() + "：";
                    //        tdCustomContent.InnerHtml += "<textarea rows='10' cols='50' name='" + "txtCustomContent" + i.ToString() + "' ID='" + "txtCustomContent" + i.ToString() + "'>" + arrCustomContent[i - 1] + "</textarea><br>";
                    //    }

                    //}
                    //else
                    //{
                    //    //只有一个自定义内容
                    //    //选中下拉框

                    //    ddlCustomContentCount.SelectedValue = "1";
                    //    //给第一个TextBox赋值

                    //    txtCustomContent1.Text = strCustomContent;
                    //}
                    ////隐藏域保存数据库信息
                    //this.hiddenCustomContent.Value = strCustomContent;
                    InitEditor(dr["Custom_Content"].ToString());
                }
            }
            else
            {
                btnDel.Visible = false;
                btnEdit.Text = Utils.GetResourcesValue("Common", "Add");
                //生成新GUID用于新增操作产生Nodeid
                txtNodeID.Text = Guid.NewGuid().ToString();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

            string returnMsg = "";
            string editSelfMenuUrl = "";
            DataTable dtNodeCode = null;

            #region 实体类赋值

            mode.NodeID = new Guid(txtNodeID.Text);
            mode.NodeName = txtNodeName.Text.Trim();
            mode.NodelIcon = txtNodelIcon.Text.Trim();
            mode.CurrentImg = Utils.HtmlEncode(txtCurrentImg.Text.Trim());
            mode.MouseOverImg = Utils.HtmlEncode(txtMouseOverImg.Text.Trim());
            if (txtLinkURL.Text.Length > 0)
            {
                mode.LinkURL = Utils.HtmlEncode(txtLinkURL.Text.Trim());
            }
            //if (ddlModel.SelectedValue != "0")
            //{
            //    mode.ModuleID = new Guid(ddlModel.SelectedValue.Trim());
            //}  
            mode.ModuleID = new Guid(Request.Form["ddlModel"]);
            mode.IsValid = Utils.ParseBool(RBL_IsValid.SelectedValue);
            mode.IsWeb = true;
            mode.NodelOrder = Utils.HtmlEncode(txtNodelOrder.Text.Trim());
            mode.IsLeftDisplay = Utils.ParseBool(chkIsLeftDisplay.Checked);
            mode.IsTopMenuShow = Utils.ParseBool(chkIsTopMenuShow.Checked);
            mode.IsLeftMenuShow = Utils.ParseBool(chkIsLeftMenuShow.Checked);
            mode.NodelDesc = Editor1.Content;
            mode.NodelEngDesc = txtNodelEngDesc.Text.Trim();
            mode.WebSiteID = Convert.ToInt32(this.SiteID);
            mode.Creater = base.GetLoginAccountId();
            mode.Settings = "";
            mode.Tips = Utils.HtmlEncode(txtTips.Text);
            mode.Meta_Keywords = Utils.HtmlEncode(txtKeyWords.Text);
            mode.Meta_Description = Utils.HtmlEncode(txtMetaDesc.Text);
            mode.CreateDate = DateTime.Now;
            mode.OpenType = radSelf.Checked ? 1 : 2;
            mode.ColumnType = 2;
            mode.DefaultTemplate = txtDefaultTemplate.Text;

            if (ddlListPagePostFix.SelectedValue != "")
            {
                mode.ListPagePostFix = this.ddlListPagePostFix.SelectedValue;
            }
            mode.IsCreateContentPage = radCreateContentPageTrue.Checked ? false : true;

            //自定义内容赋值

            //取自定义数量
            int CustomContentCount = Utils.ParseInt(ddlCustomContentCount.SelectedValue, 1);
            //自定义内容，初始化为第一个TextBox.Text
            string strCustomContent = txtCustomContent1.Text + "<hqb>" + Utils.ParseInt(Request.Form["chkIsHtmlEditor1"], 0);
            for (int i = 2; i <= CustomContentCount; i++)
            {
                string strTemp = Request.Form["txtCustomContent" + i.ToString()];
                strCustomContent += "###" + strTemp + "<hqb>" + Utils.ParseInt(Request.Form["chkIsHtmlEditor" + i.ToString()], 0);
            }
            mode.Custom_Content = strCustomContent;
            mode.Banner = txtBanner.Text;
            #endregion

            if (Action == "EDIT")
            {
                #region 修改节点
                // 权限验证，是否具有修改权限

                if (IsHaveRightByOperCode("Edit"))
                {
                    mode.NodeCode = Utils.HtmlEncode(txtNodeCode.Text.Trim());
                    mode.ParentNode = NCode.Substring(0, NCode.Length - 3);
                    //根据NodeCode判断它下面是否有子栏目

                    dtNodeCode = bllModuleNode.GetList("ALLBY", Utils.getTwoParams(SiteID.ToString(), NCode));
                    if (dtNodeCode.Rows.Count == 0)
                    {
                        //如果没有子栏目，用户可随意修改[父级栏目]属性，如果有子栏目，则不给它赋值

                        mode.NodeType = (Utils.ParseBoolToInt(chkIsFolder.Checked)).ToString();
                    }
                    if (mode.ParentNode == "")
                    {
                        mode.ParentNode = "0";
                    }

                    returnMsg = bllModuleNode.Save("EDIT", mode);
                    string logTitle = Request.Form["hidLogTitle"];
                    if (logTitle != txtNodeName.Text)
                    {
                        logTitle = logTitle + " => " + txtNodeName.Text;
                    }
                    returnMsg = bllModuleNode.Save("EDIT", mode);
                    if (Utils.ParseInt(returnMsg, 0) > 0)
                    {
                        DataTable parentDt = bllModuleNode.GetModeNodeFromCache();
                        string parentNodeCode;
                        if (NCode.Length > 3)
                            parentNodeCode = NCode.Substring(0, NCode.Length - 3);
                        else
                            parentNodeCode = NCode;

                        DataRow[] parentdr = parentDt.Select("NodeCode='" + parentNodeCode + "'");
                        if (parentdr.Length > 0)
                        {
                            editSelfMenuUrl = "SingleColumn.aspx?Action=New&NodeID=" + parentdr[0]["NodeId"].ToString() + "&ID=" + parentdr[0]["NodeId"].ToString() + "&NCode=" + parentNodeCode + "&NodeCode=" + NodeCode + "&IsParent=1";
                        }
                        //Utils.RunJavaScript(this, "alertClose({msg:'修改栏目成功！',title:'提示信息'},function(){location.href='ColumnManage.aspx?nodeid=" + NodeID + "'})");
                        WriteLog(GetLogValue(logTitle, "Update", "ModelNodeEdit", true), "", 2); //写日志
                        Utils.RunJavaScript(this, "type=1;title='" + txtNodeName.Text.Trim().Replace("'", "\\'") + "';editSelfMenuUrl='" + editSelfMenuUrl + "'");

                    }

                    else
                    {
                        WriteLog(GetLogValue(logTitle, "Update", "ModelNodeEdit", false), returnMsg, 3); //写日志
                        Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "'");
                    }
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有修改栏目的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }
            else
            {
                #region 新增节点
                //判断是否有新增权限

                if (IsHaveRightByOperCode("New"))
                {
                    //根据IsParent判断它是不是父节点，如果不是则不能添加子节点
                    if (IsParent == "1")
                    {
                        //如果是子栏目，则必须要选择栏目类型
                        //if (!chkIsFolder.Checked)
                        //{
                        //    Utils.RunJavaScript(this, "alert({msg:'请选择栏目类型！',title:'提示信息'})");
                        //    return;
                        //}
                        //根据NodeCode得到子栏目下最大的NodeCode
                        dtNodeCode = bllModuleNode.GetList("MAXCODE", Utils.getOneParams(this.NCode));
                        if (dtNodeCode != null && dtNodeCode.Rows.Count == 1)
                        {
                            if (dtNodeCode.Rows[0]["NodeCode"].ToString() != "")
                                mode.NodeCode = dtNodeCode.Rows[0]["NodeCode"].ToString();
                            else  //如果没有NodeCode后面三位从001开始

                                mode.NodeCode = this.NCode + "001";
                        }

                        mode.NodeType = (Utils.ParseBoolToInt(chkIsFolder.Checked)).ToString();
                        mode.ParentNode = NCode;

                        //如果是添加一级栏目，得到一级栏目最大的NodeCode+1
                        if (NCode == "0")
                        {
                            DataTable dt = bllModuleNode.GetList("MAXPCODE", Utils.getOneParams(""));
                            if (dt.Rows.Count < 1)
                            {
                                mode.NodeCode = this.NCode;
                                mode.ParentNode = "0";
                            }
                        }

                        returnMsg = bllModuleNode.Save("NEW", mode);
                        editSelfMenuUrl = "SingleColumn.aspx?Action=Edit&NodeID=" + mode.NodeID + "&ID=" + mode.NodeID + "&NCode=" + mode.NodeCode + "&NodeCode=" + NodeCode + "&ColumnType=1";
                        if (Utils.ParseInt(returnMsg, 0) > 0)
                        {
                            WriteLog("新增栏目" + txtNodeName.Text + "成功！", "", 2);//写入操作日志
                            Utils.RunJavaScript(this, "type=0;title='" + txtNodeName.Text.Trim().Replace("'", "\\'") + "';editSelfMenuUrl='" + editSelfMenuUrl + "'");
                        }
                        else
                        {
                            WriteLog("新增栏目" + txtNodeName.Text + "成功！", returnMsg, 2);//写入操作日志
                            Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "'");
                        }
                    }
                    else//如果不是则不能添加子节点
                    {
                        Utils.RunJavaScript(this, "alert({msg:'上级栏目不是父栏目，不能添加子栏目！',title:'提示信息'})");
                    }
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有新增栏目的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }
        }

        private void InitEditor(string customContent)
        {
            string[] arrOneItem = Utils.strSplit(customContent, "###");
            for (int i = 0; i < arrOneItem.Length; i++)
            {
                string[] arrTxtAndCheck = Utils.strSplit(arrOneItem[i], "<hqb>");
                TextBox txt = (TextBox)Page.FindControl("txtCustomContent" + (i + 1).ToString());
                txt.Text = arrTxtAndCheck[0];
                System.Web.UI.HtmlControls.HtmlInputCheckBox chk = (System.Web.UI.HtmlControls.HtmlInputCheckBox)Page.FindControl("chkIsHtmlEditor" + (i + 1).ToString());
                chk.Checked = Utils.ParseBool(Utils.ParseInt(arrTxtAndCheck[1], 0));
            }
            ddlCustomContentCount.SelectedValue = arrOneItem.Length.ToString();
            Utils.RunJavaScript(this, "showTotal=" + arrOneItem.Length);
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            //判断权限
            if (IsHaveRightByOperCode("Delete"))
            {
                string returnMsg = bllModuleNode.ModuleNodeSet("DELONE", "", ID);
                try
                {
                    if (Convert.ToInt32(returnMsg) == -1)
                    {
                        Utils.RunJavaScript(this, "alert({msg:'该栏目包含子栏目，不能直接删除，请先删除其子栏目！',title:'提示信息'})");
                    }
                    else
                    {
                        WriteLog("删除" + hidLogTitle.Value + "节点成功！", "", 2);//写入操作日志
                        Utils.RunJavaScript(this, "type=3;title='" + hidLogTitle.Value.Replace("'", "\\'") + "';");
                    }

                }
                catch
                {
                    WriteLog("删除" + hidLogTitle.Value + "节点失败！", returnMsg, 2);//写入操作日志
                    Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "'");
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有删除栏目的权限，请联系站点管理员！',title:'提示信息'})");
            }
        }

        //protected void chkIsFolder_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (this.chkIsFolder.Checked)
        //    {
        //        this.ddlModel.SelectedValue = "0";
        //        this.ddlModel.Enabled = false;
        //    }
        //    else
        //    {
        //        this.ddlModel.Enabled = true;
        //    }
        //}

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ColumnManage.aspx?NodeCode=" + NodeCode);
        }

        #region 初始化栏目的MetaKeyword和MetaDiscript
        private void MetaInit()
        {
            string metaKW = string.Empty;
            string metaDisc = string.Empty;
            if (Action == "NEW")
            {
                if (NCode.Length == 3)  //一级栏目，读取配置
                {
                    string xmlPath = Server.MapPath("/" + SiteDir + "/config/SiteInfo.config");
                    metaKW = Utils.XmlRead(xmlPath, "SiteInfoConfig/MetaKeywords", "");
                    metaDisc = Utils.XmlRead(xmlPath, "SiteInfoConfig/MetaDescription", "");
                }
                else  //读取上级栏目
                {
                    DataTable dt = bllModuleNode.GetList("LISTBYNODECODE", Utils.getOneParams(NCode));
                    if (dt.Rows.Count > 0)
                    {
                        metaKW = dt.Rows[0]["Meta_Keywords"].ToString();
                        metaDisc = dt.Rows[0]["Meta_Description"].ToString();
                    }
                }
                this.txtMetaDesc.Text = metaDisc;
                this.txtKeyWords.Text = metaDisc;
            }
        }
        #endregion

    }
}
