using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.Model;
using System.Data;
using AllPower.BLL.SysManage;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年3月31日
    功能描述： 节点编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class ModelNodeEdit : AllPower.Web.Admin.AdminPage
    {
        //逻辑类
        AllPower.BLL.SysManage.ModuleNode bllModuleNode = new AllPower.BLL.SysManage.ModuleNode();
        //实体类
        AllPower.Model.SysManage.ModuleNode mode = new AllPower.Model.SysManage.ModuleNode();

        #region  URL参数
        private string _Isparent = null;
        private string _nodetype = null;
       

        public string NodeType
        {
            get
            {
                if (this._nodetype == null)
                {
                    this._nodetype = Utils.ReqUrlParameter("IsFolder");
                    // 参数格式验证，非法则重置为空字符串
                }
                return this._nodetype;
            }
        }

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
                BindDate();
                BindReviewFlowDate();
                PageInit();
            }            
            if (NodeType == "1")
            {
                chkIsFolder.Checked = true;
                chkIsFolder.Enabled = false;
            }
        }

        //绑定节点类型
        private void BindDate()
        {
            Module bllModule = new Module();
            DataTable dt = bllModule.GetList("ALL", Utils.getOneParams(""));
            if (dt.Rows.Count > 0)
            {
                this.ddlModel.DataSource = dt.DefaultView;
                this.ddlModel.DataTextField = "ModuleName";
                this.ddlModel.DataValueField = "ModuleID";
                this.ddlModel.DataBind();
                ListItem ls = new ListItem("请选择", "0");//追加一项
                this.ddlModel.Items.Insert(0,ls);
            }
        }

        //绑定审核流程
        private void BindReviewFlowDate()
        {
            AllPower.BLL.Content.ReviewFlow bllReviewFlow= new AllPower.BLL.Content.ReviewFlow();
            DataTable dt = bllReviewFlow.GetList("ALL", Utils.getOneParams(""));
            if (dt.Rows.Count > 0)
            {
                this.ddlReviewFlow.DataSource = dt.DefaultView;
                this.ddlReviewFlow.DataTextField = "Name";
                this.ddlReviewFlow.DataValueField = "ID";
                this.ddlReviewFlow.DataBind();
                ListItem ls = new ListItem("请选择", "0");//追加一项
                this.ddlReviewFlow.Items.Insert(0, ls);                
            }
        }

        private void PageInit()
        {
            //页面控件数据加载
            if (this.Action == "EDIT")
            {
                DataTable dt;
                dt = bllModuleNode.GetList("ONE", Utils.getOneParams(ID));

                btnEdit.Text = Utils.GetResourcesValue("Common", "Update");

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    txtNodeID.Text = dr["NodeID"].ToString();
                    txtNodeCode.Text = NCode;
                    txtNodeName.Text = dr["NodeName"].ToString();
                    hidLogTitle.Value = dr["NodeName"].ToString();
                    txtLinkURL.Text = dr["LinkURL"].ToString();
                    txtCustomManageLink.Text = dr["CustomManageLink"].ToString();
                    chkIsLeftDisplay.Checked = Utils.ParseBool(Convert.ToInt32(dr["IsLeftDisplay"]));  
                     RBL_IsValid.SelectedValue = dr["IsValid"].ToString();
                    txtNodelOrder.Text = dr["NodelOrder"].ToString();
                    txtNodelDesc.Text = dr["NodelDesc"].ToString();
                    txtNodelEngDesc.Text = dr["NodelEngDesc"].ToString();
                    txtNodelIcon.Text = dr["NodelIcon"].ToString();
                    chkIsFolder.Checked = Utils.ParseBool(dr["NodeType"].ToString());
                    ddlModel.Enabled = !chkIsFolder.Checked;
                    if (dr["ModuleID"].ToString().Length == 0 || dr["ModuleID"].ToString() == Guid.Empty.ToString())
                    {
                        ddlModel.SelectedValue = "0";                        
                    }
                    else
                    {
                        ddlModel.SelectedValue = dr["ModuleID"].ToString();
                    }
                    chkIsSystem.Checked = Utils.ParseBool(dr["IsSystem"].ToString());
                    chkIsContainWebContent.Checked = Utils.ParseBool(dr["IsContainWebContent"].ToString());
                    if (!string.IsNullOrEmpty(dr["ReviewFlowID"].ToString()))
                    {
                        try
                        {
                            ddlReviewFlow.SelectedValue = dr["ReviewFlowID"].ToString();
                        }
                        catch {
                            throw new Exception("没有相应项与之匹配");
                        }
                    }
                }
            }
            else
            {
                if (NodeType == "1")//添加一级目录
                {
                    chkIsFolder.Checked = true;
                    ddlModel.SelectedValue = "0";
                    ddlModel.Enabled = false;
                }
                btnDel.Visible = false;
                btnEdit.Text = Utils.GetResourcesValue("Common", "Add");
                txtNodeID.Text = Guid.NewGuid().ToString();
                //新增选中一级审核
                ddlReviewFlow.SelectedValue = "000000000000000";
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string returnMsg = "";
            DataTable dtNodeCode = null;

            #region 实体类赋值
            mode.NodeID = new Guid(txtNodeID.Text);
            mode.NodeName = Utils.HtmlEncode(txtNodeName.Text.Trim());
            
            if (txtLinkURL.Text.Length > 0)
            {
                mode.LinkURL = Utils.HtmlEncode(txtLinkURL.Text.Trim());
            }
            if (ddlModel.SelectedValue!="0")
            {
                mode.ModuleID = new Guid(ddlModel.SelectedValue.Trim());
            }
            mode.CustomManageLink = txtCustomManageLink.Text.Trim();
            mode.IsLeftDisplay = Utils.ParseBool(chkIsLeftDisplay.Checked);
            mode.IsValid = Utils.ParseBool(RBL_IsValid.SelectedValue);
            mode.NodelOrder = Utils.HtmlEncode(txtNodelOrder.Text.Trim());
            mode.NodelDesc = Utils.HtmlEncode(txtNodelDesc.Text.Trim());
            mode.NodelEngDesc = Utils.HtmlEncode(txtNodelEngDesc.Text.Trim());
            mode.NodelIcon = Utils.HtmlEncode(txtNodelIcon.Text.Trim());
            mode.IsSystem = Utils.ParseBool(chkIsSystem.Checked);
            mode.IsContainWebContent = Utils.ParseBool(chkIsContainWebContent.Checked);
            mode.WebSiteID = Convert.ToInt32(this.SiteID);
            mode.IsWeb = false;
            mode.Creater = base.GetLoginAccountId();
            mode.CreateDate = DateTime.Now;
            if (ddlReviewFlow.SelectedValue != "0")
            {
                mode.ReviewFlowID = this.ddlReviewFlow.SelectedValue;
            }
            #endregion

            if (Action == "EDIT")
            {
                #region 修改节点
                // 权限验证，是否具有修改权限
                if (IsHaveRightByOperCode("Edit"))  
                {                    
                    mode.NodeCode = Utils.HtmlEncode(txtNodeCode.Text.Trim());
                    mode.ParentNode = NCode.Substring(0, NCode.Length - 3);
                    //根据NodeCode判断它下面是否有子节点

                    dtNodeCode = bllModuleNode.GetList("ALLBY", Utils.getTwoParams(SiteID.ToString(), NCode));
                    if (dtNodeCode.Rows.Count == 0)
                    {
                        //如果没有子节点，用户可随意修改[父级节点]属性，如果有子节点，则不给它赋值
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
                    try
                    {
                        if (Convert.ToInt32(returnMsg) > 0)
                        {
                            WriteLog(GetLogValue(logTitle, "Update", "ModelNodeEdit", true), "", 2); //写日志
                            Utils.RunJavaScript(this, "type=1;title='" + txtNodeName.Text.Replace("'", "\\'") + "';");
                        }
                    }
                    catch
                    {
                        WriteLog(GetLogValue(logTitle, "Update", "ModelNodeEdit", false), returnMsg, 3); //写日志
                        Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "';");
                    }
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有修改节点的权限，请联系站点管理员！',title:'提示信息'})");
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
                    if (IsParent == "1"||NodeType=="1")
                    {
                        //如果是子节点，则必须要选择节点类型
                        if (!chkIsFolder.Checked && ddlModel.SelectedValue == "0")
                        {
                            Utils.RunJavaScript(this, "alert({msg:'请选择节点类型！',title:'提示信息'})"); 
                            return;
                        }
                        //根据NodeCode得到子节点下最大的NodeCode
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

                        //如果是添加一级节点，得到一级节点最大的NodeCode+1
                        if (NCode== "0")
                        {
                            DataTable dt = bllModuleNode.GetList("MAXPCODE", Utils.getOneParams(""));
                            if (dt.Rows.Count < 1)
                            {
                                mode.NodeCode = this.NCode;
                                mode.ParentNode = "0";
                            }
                        }

                        returnMsg = bllModuleNode.Save("NEW", mode);
                        try
                        {
                            if (Convert.ToInt32(returnMsg) > 0)
                            {
                                //Utils.RunJavaScript(this, "alert({msg:'新增节点成功！',title:'提示信息'})"); 
                                WriteLog("新增节点" + txtNodeName.Text.Trim() + "成功！", "", 2);//写入操作日志
                                //Utils.RunJavaScript(this, "if(confirm('新增节点成功！点击[确定]继续新增节点，点[取消]回到节点列表页。')){location.href='ModelNodeEdit.aspx?Action=New&nodeid=" + NodeID + "'}else{location.href='ModelNodeList.aspx?&nodeid=" + NodeID + "'}");
                                Utils.RunJavaScript(this, "type=0;title='" + txtNodeName.Text.Replace("'", "\\'") + "';");
                            }
                        }
                        catch
                        {
                            //Utils.AlertJavaScript(this, returnMsg);
                            WriteLog("新增节点" + txtNodeName.Text.Trim() + "失败！", returnMsg, 2);//写入操作日志
                            Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "';");
                        }
                    }
                    else//如果不是则不能添加子节点
                    {
                        Utils.RunJavaScript(this, "alert({msg:'上级节点不是父节点，不能添加子节点！',title:'提示信息'})"); 
                    }
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有新增节点的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }              
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
                        Utils.RunJavaScript(this, "alert({msg:'该节点包含子节点，不能直接删除，请先删除其子节点！',title:'提示信息'})"); 
                    }
                    else
                    {
                        //Utils.RunJavaScript(this, "alert({msg:'删除节点成功！',title:'提示信息'})"); 
                        WriteLog("删除" + hidLogTitle.Value + "节点成功！", "", 2);//写入操作日志
                        Utils.RunJavaScript(this, "type=3;title='" + hidLogTitle.Value.Replace("'", "\\'") + "';");
                    }

                }
                catch
                {
                    //Utils.RunJavaScript(this, "alert({msg:" + returnMsg + ",title:'提示信息'})");
                    WriteLog("删除" + hidLogTitle.Value + "节点失败！", returnMsg, 2);//写入操作日志
                    Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "';");
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有删除节点的权限，请联系站点管理员！',title:'提示信息'})");
            }
        }

        protected void chkIsFolder_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chkIsFolder.Checked)
            {
                this.ddlModel.SelectedValue = "0";
                this.ddlModel.Enabled = false;
            }
            else
            {
                this.ddlModel.Enabled = true;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModelNodeList.aspx?NodeCode=" + NodeCode);
        }
    }
}
