using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Data;
using AllPower.Model;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      严辉
    创建时间： 2010年5月4日
    功能描述： 添加自定义字段
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class MemberModelFieldEdit : AdminPage
    {
        AllPower.BLL.Business.BusinessField bllBusinessField = new AllPower.BLL.Business.BusinessField();
        AllPower.Model.Business.BusinessField modelBusinessField = null;
        AllPower.BLL.Business.BusinessModel bllBusinessModel = new AllPower.BLL.Business.BusinessModel();

        #region URL参数
        private string _mid = null;
        

        /// <summary>
        ///  模型 ID
        /// </summary>
        public string MID
        {
            get
            {
                if (this._mid == null)
                {
                    this._mid = Utils.ReqUrlParameter("mid");
                }

                return this._mid;
            }
        }

        
        #endregion

        /// <summary>
        /// 页面加载
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {          
            if (!Page.IsPostBack)
            {
                PageInit();               
            }
        }

        #region 数据初始化
        protected void PageInit()
        {
            //下拉框初始化
            DataTable dtMemberModel = bllBusinessModel.GetList("Member", Utils.getOneParams(""));
            ControlUtils.DropDownDataBind(ddlMemberModel, dtMemberModel, "Name", "ID");

            ddlFieldType.Items.Clear();
            OptionsDictionary Employees = new OptionsDictionary("fields");
            foreach (KeyValuePair<int, string> dict in Employees.getDictionary)
            {
                ddlFieldType.Items.Add(new ListItem(dict.Value, dict.Key.ToString()));
            }

            if (!string.IsNullOrEmpty(MID))
            {
                ddlMemberModel.SelectedValue = MID;
            }

            if (!String.IsNullOrEmpty(ID))
            {
                btnSave.Text = Utils.GetResourcesValue("Common", "Update");

                DataTable dt = new DataTable();
                dt = bllBusinessField.GetList("ONE", Utils.getOneParams(ID));
                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow drTemp = dt.Rows[0];

                    txtCName.Text = drTemp["Alias"].ToString();
                    txtDefaultValue.Text = drTemp["Default"].ToString();
                    txtEName.Text = drTemp["Name"].ToString();
                    txtTip.Text = drTemp["Tips"].ToString();           
                    chkEnable.Checked = Utils.ParseBool(drTemp["IsVisible"]);
                    ddlFieldType.SelectedIndex = int.Parse(drTemp["Type"].ToString());//字段类型
                    txtStyle.Text = drTemp["Style"].ToString();
                    txtCSS.Text = drTemp["CSS"].ToString();
                    txtJS.Text = drTemp["JS"].ToString();
                    txtOptionValue.Text = drTemp["Options"].ToString();
                    hiOrders.Value = drTemp["Orders"].ToString();
                    string type = drTemp["type"].ToString();    //控件类型 
                    int typeInt = Utils.ParseInt(type, 0);
                    ddlFieldType.SelectedValue = type;

                    //根据控件类型，控制显示方式
                    ScriptManager.RegisterStartupScript(this, Page.GetType(), "scr", "<script>BusinessField.shows(" + type + ",0)</script>", false);    

                    switch (typeInt)
                    {
                        case 1:  // 单行文本
                        case 2:  // 多行文本域
                        case 3:  //文本编辑器
                            this.txtHeight.Text = drTemp["Height"].ToString();
                            this.txtLength.Text = drTemp["Length"].ToString();
                            this.txtWidth.Text = drTemp["Width"].ToString();
                            break;

                        case 4:  //下拉
                        case 5:  //单选
                        case 6:  //复选
                        case 7:  //多选列表
                        case 8:  //数字
                        case 9:  //货币
                        case 10: //日期
                            rblDateFormat.SelectedValue =drTemp["Class"].ToString();
                            //Utils.ParseInt(drTemp["Class"].ToString(), 0) > 3 ? "0" : drTemp["Class"].ToString();
                            txtHeight.Text = drTemp["Height"].ToString();
                            txtWidth.Text = drTemp["Width"].ToString();
                            break;

                        case 11: //图片
                            txtImage.Text = drTemp["Extern"].ToString();
                            txtSize.Text = drTemp["Length"].ToString();
                            txtHeight.Text = drTemp["Height"].ToString();
                            txtWidth.Text = drTemp["Width"].ToString();
                            break;

                        case 12: //文件
                            txtFile.Text = drTemp["Extern"].ToString();
                            txtSize.Text = drTemp["Length"].ToString();
                            txtHeight.Text = drTemp["Height"].ToString();
                            txtWidth.Text = drTemp["Width"].ToString();
                            break;

                        case 13: //密码框
                            txtDefaultValue.Text = "";
                            break;

                        case 14: //超链接
                            txtLink.Text = drTemp["Default"].ToString(); 
                            txtTagret.Text = drTemp["Extern"].ToString();
                            txtLength.Text = drTemp["Length"].ToString();
                            break;
                    }
                    
                }
            }
        }
        #endregion
 
        private void InitModel()
        {
            if (Page.IsValid)//判断页面是否通过验证
            {
                modelBusinessField = new AllPower.Model.Business.BusinessField();
                modelBusinessField.Size = Utils.ParseInt(txtSize.Text.Trim(), 0);//控件行数

                modelBusinessField.ModelID = MID;//模型编号
                modelBusinessField.Name = txtEName.Text.Trim();
                modelBusinessField.Alias = txtCName.Text.Trim();
                modelBusinessField.Tips = txtTip.Text.Trim();
                modelBusinessField.JS = txtJS.Text.Trim();
                modelBusinessField.CSS = txtCSS.Text.Trim();
                modelBusinessField.Options = txtOptionValue.Text.Trim();
                modelBusinessField.Default = txtDefaultValue.Text.Trim();
                modelBusinessField.Style = txtStyle.Text.Trim();
                modelBusinessField.IsVisible = chkEnable.Checked;
                modelBusinessField.Orders = Utils.ParseInt(hiOrders.Value, 0);
                modelBusinessField.Type = Utils.ParseInt(ddlFieldType.SelectedValue, 0);
                modelBusinessField.Height = Utils.ParseInt(txtHeight.Text.Trim(), 0);
                modelBusinessField.Width = Utils.ParseInt(txtWidth.Text.Trim(), 0);
                modelBusinessField.Length = Utils.ParseInt(txtLength.Text.Trim(), 0);

                //====================================
                modelBusinessField.Class = 0;//字段所需小类型时的情况
                int sel = ddlFieldType.SelectedIndex;
                switch (sel)
                {
                    case 10:  //字段所需小类型时的情况
                        modelBusinessField.Class = Utils.ParseInt(rblDateFormat.SelectedValue, 0);
                        break;

                    case 11: //图片名                         
                        modelBusinessField.Size = Utils.ParseInt(txtMaxSize.Text.Trim(), 1024);//默认大小为1M
                        modelBusinessField.Extern = txtImage.Text.Trim();
                        break;

                    case 12: //文件名
                        modelBusinessField.Size = Utils.ParseInt(txtMaxSize.Text.Trim(), 1024);
                        modelBusinessField.Extern = txtFile.Text.Trim();
                        break;

                    case 14: //超链接     
                        modelBusinessField.Default = txtLink.Text.Trim();
                        modelBusinessField.Extern = txtTagret.Text.Trim();
                        break;

                }

                

            }
        }

        /// <summary>
        /// 修改自定义字段
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            InitModel();
            if (Action == "EDIT")
            {
                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.AlertMessage(this, "你没有修改操作权限！");
                    return;
                }

                modelBusinessField.ID = ID;
            }
            else
            {
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.AlertMessage(this, "你没有添加操作权限！");
                    return;
                }

                modelBusinessField.ID = Guid.NewGuid().ToString();
                modelBusinessField.Orders = Utils.ParseInt(GetTableID("0", "K_BusinessField")[1], 0);//排序
            }

            string temp = bllBusinessField.Save(Action, modelBusinessField);
            int result = Utils.ParseInt(temp, 3);

            //========================================
            //提示框、消息
            string alterTitle = Utils.GetResourcesValue("Common", "TipMessage");
            string success = Utils.GetResourcesValue("model", "AddSucess");
            string error = Utils.GetResourcesValue("model", "AddError");
            string nameIsExis = Utils.GetResourcesValue("member", "FieldIsUse");
            string enNameIsExis = Utils.GetResourcesValue("member", "FieldEnameIsUse");

            switch (result)
            {
                case 0:
                    WriteLog(GetLogValue(LogTitle, Action, "MemberModelField", true), "", 2);
                    Utils.RunJavaScript(this, "alert({jsMessage:'" + success + "',title:'" + alterTitle + "'})");
                    break;

                case 1:
                    WriteLog(GetLogValue(LogTitle, Action, "MemberModelField", false), nameIsExis, 3);
                    Utils.RunJavaScript(this, "alert({jsMessage:'" + nameIsExis + "',title:'" + alterTitle + "'})");
                    break;

                case 2:
                    WriteLog(GetLogValue(LogTitle, Action, "MemberModelField", false), enNameIsExis, 3);
                    Utils.RunJavaScript(this, "alert({jsMessage:'" + enNameIsExis + "',title:'" + alterTitle + "'})");
                    break;

                case 3:
                    WriteLog(GetLogValue(LogTitle, Action, "MemberModelField", false), temp, 3);
                    Utils.RunJavaScript(this, "alert({jsMessage:'" + error + "',title:'" + alterTitle + "'})");
                    break;
            }

        }
    }
}