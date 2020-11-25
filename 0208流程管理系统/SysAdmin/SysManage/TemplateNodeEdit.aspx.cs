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
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年4月20日
    功能描述： 模板节点编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class TemplateNodeEdit : AllPower.Web.Admin.AdminPage
    {
        //站点模板表实体类
        AllPower.BLL.SysManage.WebSiteTemplateNode bll = new AllPower.BLL.SysManage.WebSiteTemplateNode();
        StringBuilder sbLog = new StringBuilder(16);    
   
        #region  URL参数
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
        private string _templateid = null;
        public string TemplateID
        {
            get
            {
                if (this._templateid == null)
                {
                    this._templateid = Request.QueryString["TemplateID"];
                    // 参数格式验证，非法则重置为空字符串
                }
                return this._templateid;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindModelDate();
                BindNodeCode();
                BindReviewFlowDate();
                PageInit();
            }
        }

        // 绑定所属模块
        private void BindModelDate()
        {
            Module bllModule = new Module();
            DataTable dt = bllModule.GetList("ALL", Utils.getOneParams(""));
            if (dt.Rows.Count > 0)
            {
                this.ddlModeID.DataSource = dt.DefaultView;
                this.ddlModeID.DataTextField = "ModuleName";
                this.ddlModeID.DataValueField = "ModuleID";
                this.ddlModeID.DataBind();
            }
            ListItem ls = new ListItem("请选择", "0");//追加一项
            this.ddlModeID.Items.Insert(0, ls);
        } 
     
        //绑定导航节点编码
        private void BindNodeCode()
        {
            ModuleNode bllModuleNode = new ModuleNode();
            //得到系统站点下所有ParentNode=0的顶级导航列表
            DataTable dt = bllModuleNode.GetList("GETPARENTNODE", Utils.getTwoParams("0", "1"));
            if (dt.Rows.Count > 0)
            {
                this.ddlNodeCode.DataSource = dt.DefaultView;
                this.ddlNodeCode.DataTextField = "NodeName";
                this.ddlNodeCode.DataValueField = "NodeCode";
                this.ddlNodeCode.DataBind();
            }
            ListItem ls = new ListItem("请选择", "0");//追加一项
            this.ddlNodeCode.Items.Insert(0, ls);
        }       

        //绑定审核流程
        private void BindReviewFlowDate()
        {
            AllPower.BLL.Content.ReviewFlow bllReviewFlow = new AllPower.BLL.Content.ReviewFlow();
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

        #region 页面初始化
        private void PageInit()
        {
            hidNodeCode.Value = NodeCode;
            //编辑
            if (this.Action == "EDIT")
            {
                DataTable dt;
                SelectParams selParams = new SelectParams();
                selParams.S1 = this.ID;
                dt = bll.GetList("ONE", selParams);

                btnTemplateNode.Text = Utils.GetResourcesValue("Common", "Update");

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    this.hidLogTitle.Value = Utils.HtmlDecode(dr["NodeName"].ToString());                    
                    txtNodeName.Text = dr["NodeName"].ToString();
                    txtLink.Text = dr["LinkURL"].ToString();
                    RBL_IsValid.SelectedValue = dr["IsValid"].ToString();
                    txtNodelOrder.Text = dr["NodelOrder"].ToString();
                    txtNodelDesc.Text = dr["NodelDesc"].ToString();
                    txtNodelEngDesc.Text = dr["NodelEngDesc"].ToString();
                    chkNodeType.Checked = Utils.ParseBool(dr["NodeType"].ToString());
                    ddlModeID.Enabled = !chkNodeType.Checked;
                    if (dr["ModuleID"].ToString().Length == 0 || dr["ModuleID"].ToString() == Guid.Empty.ToString())
                    {
                        ddlModeID.SelectedValue = "0";
                    }
                    else
                    {
                        ddlModeID.SelectedValue = dr["ModuleID"].ToString();
                    }
                    chkIsSystem.Checked = Utils.ParseBool(dr["IsSystem"].ToString());
                    chkIsContainWebContent.Checked = Utils.ParseBool(dr["IsContainWebContent"].ToString());
                    if (string.IsNullOrEmpty(dr["ReviewFlowID"].ToString()))
                    {
                        try
                        {
                            ddlReviewFlow.SelectedValue = dr["ReviewFlowID"].ToString();
                        }
                        catch
                        {
                            throw new Exception("没有相应项与之匹配");
                        }
                    }                     
                }
            }
            else
            {
                //新增一级节点
                if (this.Action == "NEWPARENTNODE")
                {
                    dlNodeCode.Visible = true;
                    this.ddlModeID.Enabled = false;
                    chkNodeType.Checked = true;
                    chkNodeType.Enabled = false;
                    ddlModeID.SelectedValue = "0";
                    ddlModeID.Enabled = false;
                }
                btnDel.Visible = false;
            }
        }
        #endregion

        protected void btnTemplateNodeEdit_Click(object sender, EventArgs e)
        {
            string returnMsg = "";
            AllPower.Model.SysManage.WebSiteTemplateNode mode = new AllPower.Model.SysManage.WebSiteTemplateNode();

            mode.ID = Utils.ParseInt(ID, 0);
            mode.TemplateID = Utils.ParseInt(TemplateID, 0);
            mode.NodeName = Utils.HtmlEncode(txtNodeName.Text.Trim());
            if (txtLink.Text.Length > 0)
            {
                mode.LinkURL = Utils.HtmlEncode(txtLink.Text.Trim());
            }
            if (ddlModeID.SelectedValue != "0")
            {
                mode.ModuleID = new Guid(ddlModeID.SelectedValue.Trim());
            }
            mode.NodeType = chkNodeType.Checked ? "1" : "0";
            mode.IsValid = Utils.ParseBool(RBL_IsValid.SelectedValue);
            mode.NodelOrder = Utils.HtmlEncode(txtNodelOrder.Text.Trim());
            mode.NodelDesc = Utils.HtmlEncode(txtNodelDesc.Text.Trim());
            mode.NodelEngDesc = Utils.HtmlEncode(txtNodelEngDesc.Text.Trim());
            mode.IsSystem = Utils.ParseBool(chkIsSystem.Checked);
            mode.IsContainWebContent = Utils.ParseBool(chkIsContainWebContent.Checked);
            mode.IsWeb = false;
            if (ddlReviewFlow.SelectedValue != "0")
            {
                mode.ReviewFlowID = this.ddlReviewFlow.SelectedValue;
            }


            if (this.Action == "EDIT")
            {
                #region 修改模块节点
                if (IsHaveRightByOperCode("Edit"))
                {
                    mode.NodeCode = Utils.HtmlEncode(hidNodeCode.Value);
                    mode.ParentNode = NodeCode.Substring(0, NodeCode.Length - 3);
                    if (mode.ParentNode == "")
                    {
                        mode.ParentNode = "0";
                    }                    
                    //根据NodeCode得到子栏目下最大的NodeCode
                    DataTable dtNodeCode = bll.GetList("MAXCODE", Utils.getOneParams(hidNodeCode.Value));
                    if (dtNodeCode.Rows[0]["NodeCode"].ToString() != "")
                    {
                        //如果没有子栏目，用户可随意修改[父级栏目]属性，如果有子栏目，则不给它赋值
                        mode.NodeType = chkNodeType.Checked ? "1" : "0";
                    }
                    returnMsg = bll.Save("EDIT", mode);
                    string logTitle = Request.Form["hidLogTitle"];
                    if (logTitle != txtNodeName.Text)
                    {
                        logTitle = logTitle + " => " + txtNodeName.Text;
                    }
                    try
                    {
                        if (Convert.ToInt32(returnMsg) > 0)
                        {
                            WriteLog("修改" + txtNodeName.Text + "模板节点成功", "", 2);// 写入操作日志
                            Utils.RunJavaScript(this, "type=1;title='" + txtNodeName.Text.Replace("'", "\\'") + "';");                            
                        }
                    }
                    catch
                    {
                        WriteLog("修改" + txtNodeName.Text + "模板节点失败", returnMsg, 2);
                        Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "';");                       
                    }
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有编辑模板节点的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }
            else
            {
                #region 新增模块节点
                if (IsHaveRightByOperCode("New"))
                {
                    //根据IsParent判断它是不是父节点，如果不是则不能添加子节点
                    if (NodeType == "1")
                    {
                        //如果是子栏目，则必须要选择栏目类型
                        if (!chkNodeType.Checked && ddlModeID.SelectedValue == "0")
                        {
                            Utils.RunJavaScript(this, "alert({msg:'请选择所属模块！',title:'提示信息'})");
                            return;
                        }
                        if (ddlNodeCode.SelectedValue != "0")
                        {
                            mode.NodeCode = Utils.HtmlDecode(ddlNodeCode.SelectedValue);
                            mode.ParentNode = "0";//顶级节点ParentNode="0"
                        }
                        else
                        {
                            //根据NodeCode得到子栏目下最大的NodeCode
                            DataTable dtNodeCode = bll.GetList("MAXCODE", Utils.getOneParams(hidNodeCode.Value));
                            if (dtNodeCode.Rows[0]["NodeCode"].ToString() != "")
                            {
                                mode.NodeCode = Utils.HtmlDecode(dtNodeCode.Rows[0]["NodeCode"].ToString());
                            }
                            else
                            {
                                mode.NodeCode = this.NodeCode + "001";
                            }
                            mode.ParentNode = hidNodeCode.Value;
                        }                        
                        returnMsg = bll.Save("NEW", mode);
                        string logTitle = Request.Form["hidLogTitle"];
                        if (logTitle != txtNodeName.Text)
                        {
                            logTitle = logTitle + " => " + txtNodeName.Text;
                        }
                        try
                        {
                            if (Convert.ToInt32(returnMsg) > 0)
                            {
                                WriteLog(GetLogValue(logTitle, "Update", "TemplateNodeEdit", true), "", 2); //写日志
                                Utils.RunJavaScript(this, "type=0;title='" + txtNodeName.Text.Replace("'", "\\'") + "';"); 
                            }
                        }
                        catch
                        {
                            WriteLog(GetLogValue(logTitle, "Update", "TemplateNodeEdit", false), returnMsg, 3); //写日志
                            Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "';");
                        }
                    }
                    else//如果不是则不能添加子节点
                    {
                        Utils.RunJavaScript(this, "alert({msg:'上级栏目不是父栏目，不能添加子栏目！',title:'提示信息'})");
                    }
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有新增模板节点的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }
        }


        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Delete"))
            {
                string returnMsg = bll.TemplateNodeSet("DELONE", "", ID);
                try
                {
                    if (Convert.ToInt32(returnMsg) == -1)
                    {
                        Utils.RunJavaScript(this, "alert({msg:'该节点包含子节点，不能直接删除，请先删除其子节点！',title:'提示信息'})");
                    }
                    else
                    {
                        Utils.RunJavaScript(this, "alert({msg:'删除节点成功！',title:'提示信息'})");
                        WriteLog("删除" + txtNodeName.Text + "节点成功！", "", 2);
                    }

                }
                catch
                {
                    Utils.RunJavaScript(this, "alert({msg:" + returnMsg + ",title:'提示信息'})");
                    WriteLog("删除" + txtNodeName.Text + "节点失败！", returnMsg, 2);
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有删除栏目的权限，请联系站点管理员！',title:'提示信息'})");
            }
        }
    }
}
