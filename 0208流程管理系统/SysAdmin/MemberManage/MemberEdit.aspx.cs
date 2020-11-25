using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      严辉
    创建时间： 2010年4月29日
    功能描述： 会员 添加/编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class MemberEdit : AdminPage
    {
        Model.MemberManage.Member modelMember;
        Model.MemberManage.MemberDetail modelMemberDetail;

        BLL.MemberManage.Member bllMember = new BLL.MemberManage.Member();
        BLL.MemberManage.MemberDetail bllMemberDetail = new AllPower.BLL.MemberManage.MemberDetail();
        
        //会员模型相关类
        Model.Business.BusinessField modelField = new AllPower.Model.Business.BusinessField();
        //AllPower.BLL.Business.BusinessModel bllBusinessModel = new AllPower.BLL.Business.BusinessModel();
        AllPower.BLL.Business.BusinessFieldValue bllBusinessFieldValue = new AllPower.BLL.Business.BusinessFieldValue();     
        Model.Business.BusinessFieldValue modelBusinFieldValue = new AllPower.Model.Business.BusinessFieldValue();


        //自定义控件解析类
        protected BLL.Business.ParseBusiness paseBusiness = new BLL.Business.ParseBusiness();
        
      
        #region  URL参数  
        private string _memberID = null;
       
        /// <summary>
        /// 会员 ID
        /// </summary>
        public string MemberID
        {
            get
            {
                if (this._memberID == null)
                {
                    this._memberID = Utils.ReqUrlParameter("memberID");
                }

                return this._memberID;
            }
        }
        #endregion

        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();

            }
        }

        #region 数据初始化
        private void PageInit()
        {
            //绑定会员组下拉框
            BLL.MemberManage.MemberGroup bllMemberGroup = new BLL.MemberManage.MemberGroup();
            DataTable dtMemberGroup = bllMemberGroup.GetList("NODEL", Utils.getOneParams(SiteID.ToString()));
            ControlUtils.DropDownDataBind(ddlMemberGroup, dtMemberGroup, "GroupName", "ID", true);

            //绑定会员模型下拉框
            //BLL.Business.BusinessModel bllBusinessModel = new AllPower.BLL.Business.BusinessModel();
            //DataTable dtMemeberModel = bllBusinessModel.GetList("MEMBER", Utils.getOneParams(SiteID.ToString()));
            //ControlUtils.DropDownDataBind(ddlMemberModel, dtMemeberModel, "Name", "ID", true);

            //所在地区
            // BLL.Categorys.Category bllCategory = new AllPower.BLL.Categorys.Category();
            //DataTable dtProvince = bllCategory.GetProvinceList();
            //ControlUtils.DropDownDataBind(ddlCProvince, dtProvince, "name", "id");
    
            ////如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                //如果为编辑，则显示 用户的详细信息

                pnlMemberDetail.Visible = true;
                //可编辑会员模型链接

                //lnkbEditModel.Visible = true;

                DataRow drOne;

                #region 基本信息
                //基本信息
                DataTable dtMember = bllMember.GetList("ONE", Utils.getOneParams(MemberID));
                if (dtMember != null && dtMember.Rows.Count > 0)
                {
                    drOne = dtMember.Rows[0];
                    txtUserName.Text = drOne["UserName"].ToString();
                    hidLogTitle.Value = drOne["UserName"].ToString();
                    //txtPassword.Attributes.Add("value", drOne["Password"].ToString());
                    //txtConfirmPassword.Attributes.Add("value", drOne["Password"].ToString());
                    ddlMemberGroup.SelectedValue = drOne["GroupID"].ToString();
                    //ddlMemberModel.SelectedValue = drOne["ModleID"].ToString();
                    txtEmail.Text = drOne["Email"].ToString();
                    rblGender.SelectedValue = drOne["Gender"].ToString();
                }
                dtMember.Dispose();
                #endregion

                #region 详细信息
                //会员详细信息获取
                DataTable dtMemberDetail = bllMemberDetail.GetList("ONEALL", Utils.getOneParams(MemberID));
                if (dtMemberDetail != null && dtMemberDetail.Rows.Count > 0)
                {
                    //Page.RegisterStartupScript("area", "<script>$(function() {Common.action = 'edit'; $('#ddlCProvince').change();})</script>");
                    drOne = dtMemberDetail.Rows[0];
                    txtTrueName.Text = drOne["TrueName"].ToString();
                    txtBirthday.Text = drOne["Birthday"].ToString();
                    txtMobile.Text = drOne["Mobile"].ToString();
                    txtTel.Text = drOne["Tel"].ToString();
                    txtQQ.Text = drOne["OICQ"].ToString();
                    txtMSN.Text = drOne["MSN"].ToString();
                    txtAddress.Text = drOne["Address"].ToString();
                    txtZipCode.Text = drOne["ZipCode"].ToString();

                    //ddlCProvince.SelectedValue = drOne["CProvince"].ToString();
                    //hdnddlCCity.Value = drOne["CCity"].ToString();
                    //hdnddlCArea.Value = drOne["CArea"].ToString();
                }
                dtMemberDetail.Dispose();
                #endregion

                #region 自定义字段
                // 获得自定义字段                 
                //DataTable dtSelf = new DataTable();
                //string modelID = ddlMemberModel.SelectedValue;
                ////dtSelf = bllBusinessModel.GetList("DEFINE", AllPower.Common.Utils.getTwoParams(modelID, MemberID));
                //dtSelf = bllBusinessModel.GetList("BORN", AllPower.Common.Utils.getTwoParams(modelID, MemberID));
                //if (dtSelf != null && dtSelf.Rows.Count > 0)
                //{
                //    lblSelf.Text = BLL.Business.FieldHtml.controlParentTemplate.Replace("{$TableBody$}",
                //                                                         paseBusiness.BasicHtml(dtSelf, MemberID, modelID).ToString());
                //}

                #endregion

                //btnSave.Text = Utils.GetResourcesValue("Common", "Update");
                //ddlMemberModel.Enabled = false;

                dlConPwd.Visible = false;
                dlPwd.Visible = false;
                dlEmail.Visible = true;
            }
            else
            {
                dlConPwd.Visible = true;
                dlPwd.Visible = true;
                dlEmail.Visible = false;
            }
        }
        #endregion

        #region 添加/修改数据
        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Action == "NEW")
            {
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.AlertMessage(this, "你没有添加权限！");
                    return;
                }
            }
            else
            {
                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.AlertMessage(this, "你没有修改权限！");
                    return;
                }
            }

            string logTitle = hidLogTitle.Value;

            modelMember = new AllPower.Model.MemberManage.Member();
            string strMessageDetail = "1";
            string strMessage = string.Empty;

            //初始化相关属性
            InitModel();
            strMessage = bllMember.Save(Action, modelMember);
            int result = Utils.ParseInt(strMessage, 0);

            
            if (Action == "EDIT")
            {
                if (LogTitle != modelMember.UserName)
                {
                    logTitle += "=>" + modelMember.UserName;
                }

                //当用户的基本信息更新成功时，再更新其它信息
                if (result == 1)
                {
                    // 修改用户信息时，保存用户的详细信息
                    strMessageDetail = SaveOrUpdateDetail();

                    //保存用户自定义字段值
                    SaveOrUpdateSelf();
                }
            }

            //本来是需要判断都更新成功，才提示成功，但现在只要基本信息更新成功即可
            ///////if ((strMessage == "1") && (strMessageDetail == "1")) //操作成功

            //提示框、消息
            string alterTitle = Utils.GetResourcesValue("Common", "TipMessage");
            string success = Utils.GetResourcesValue("model", "AddSucess");
            string error = Utils.GetResourcesValue("model", "AddError");
            string userIsExis = Utils.GetResourcesValue("member","UserIsExis");
            string emailIsExis = Utils.GetResourcesValue("member", "EmailIsExis");

            switch (result)
            {
                case 1:     //成功
                    WriteLog(GetLogValue(logTitle, Action, "Member", true), "", 2);
                    Utils.AlertMessage(this, success);                    
                    break;

                case -1:    //用户名已存在
                    WriteLog(GetLogValue(logTitle, Action, "Member", false), userIsExis, 3);
                    Utils.AlertMessage(this, userIsExis);                    
                    break;
                   
                case -2:    //邮箱已存在
                    WriteLog(GetLogValue(logTitle, Action, "Member", false), emailIsExis, 3);
                    Utils.AlertMessage(this, emailIsExis);                    
                    break;

                case 0:     //失败
                    WriteLog(GetLogValue(logTitle, Action, "Member", false), strMessage, 3);
                    Utils.AlertMessage(this, error);                    
                    
                    break;
            }

        }
        #endregion

        #region  保存用户的详细信息
        /// <summary>
        /// 保存用户的详细信息
        /// </summary>
        private string SaveOrUpdateDetail()
        {
            //保存详细信息
            modelMemberDetail = new AllPower.Model.MemberManage.MemberDetail();
            modelMemberDetail.ID = MemberID;
            modelMemberDetail.TrueName = txtTrueName.Text.Trim();         
            string birthDay = txtBirthday.Text.Trim();
            if (!string.IsNullOrEmpty(birthDay))
            {
                modelMemberDetail.Birthday = Utils.ParseDateTime(birthDay);
            }
            modelMemberDetail.Mobile = txtMobile.Text.Trim();
            modelMemberDetail.Tel = txtTel.Text.Trim();
            modelMemberDetail.OICQ = txtQQ.Text.Trim();
            modelMemberDetail.MSN = txtMSN.Text.Trim();
            modelMemberDetail.Address = txtAddress.Text.Trim();
            modelMemberDetail.ZipCode = txtZipCode.Text.Trim();
            modelMemberDetail.NodeCode = NodeCode;
            modelMemberDetail.SiteID = SiteID;
            //modelMemberDetail.CProvince =Utils.ParseInt(ddlCProvince.SelectedValue,0);
            //modelMemberDetail.CCity = Utils.ParseInt(hdnddlCCity.Value,0);
            //modelMemberDetail.CArea = Utils.ParseInt(hdnddlCArea.Value, 0);

            return bllMemberDetail.Save(Action, modelMemberDetail);
        }
        #endregion

        #region  保存用户的自定义字段值
        private void SaveOrUpdateSelf()
        {


            //*********************自定义字段************************
            //int f = 0;
            //string resultN;
            //string modelID = ddlMemberModel.SelectedValue;
            //DataView dv = bllBusinessModel.GetList("BORN", Utils.getTwoParams(modelID, MemberID)).DefaultView;
            //System.Text.StringBuilder sb = new System.Text.StringBuilder();
            //foreach (DataRowView dr in dv)
            //{
            //    //=============判断用户自定义表中是否存在记录=======================//
            //    //===================如不存在则插入,存在则逐条更新========================//
            //    modelBusinFieldValue.ModelID = dr["ModelID"].ToString();
            //    modelBusinFieldValue.FieldID = dr["ID"].ToString();
            //    modelBusinFieldValue.BusinessID = MemberID;
            //    modelBusinFieldValue.FieldValue = Utils.ReqFromParameter(dr["Name"].ToString());
            //    bllBusinessFieldValue.Save("NEWOREDIT", modelBusinFieldValue);
            //    //=========================更新值==========================
            //    string strDefault = Utils.ReqFromParameter(dr["Name"].ToString()); //缺省值
            //    resultN = bllBusinessModel.Store("UPDATE", dr["Name"].ToString(), strDefault, MemberID, modelID);  //按Name逐条更新自定义字段的默认值   
            //    int temp = int.TryParse(resultN, out f) ? int.Parse(resultN) : 0;
            //    if (temp <= 0)
            //    {
            //        continue;
            //    }
            //    sb.Append(bllBusinessModel.Store("UPDATE", dr["Name"].ToString(), strDefault, MemberID, modelID) + "|");
            //}
            //string temp = sb.ToString();
            //string[] arr = temp.Substring(0, temp.Length - 1).Split(new char[] { '|' });
            //for (int i = 0; i < arr.Length - 1; i++)
            //{
            //    int reslut = int.TryParse(arr[i], out flag) ? int.Parse(arr[i]) : 0;
            //    if (reslut != 1)
            //    {
            //        Utils.AlertJavaScript(this, "操作过程中有错误产生！");
            //        return;
            //    }
            //}

            //AllPower.BLL.Business.BusinessInfo bllBusinessInfo = new AllPower.BLL.Business.BusinessInfo();
            //AllPower.Model.Business.BusinessInfo modleBusinessInfo = new AllPower.Model.Business.BusinessInfo();

            //string result = bllBusinessInfo.Save("EDIT", modleBusinessInfo);
            //int dome = int.TryParse(result, out f) ? int.Parse(result) : 0;
            //if (dome > 0)
            //{
            //    Utils.UrlRedirect(this, "BusinessView.aspx?action=show&mid=" + MID + "&id=" + SID, "更新成功!");
            //}
        }
        #endregion 

        #region 基本属性绑定
        /// <summary>
        /// 添加数据时，初始化相关属性
        /// </summary>
        private void InitModel()
        {
            if (Action == "NEW")
            {
                modelMember.MemberID = Guid.NewGuid().ToString();
            }
            else
            {
                modelMember.MemberID = MemberID;
            }

            modelMember.Funds = 0;
            modelMember.Point = 0;
            modelMember.Integral = 0;
            modelMember.IsCheck = 0;
            modelMember.IsDel = 0;
            modelMember.IsEmailValid = 0;
            modelMember.StateID = 1;
            modelMember.RegitIP = Utils.GetIP();
            //modelMember.LastLoginDate = null;
            //modelMember.RegitDate = null;
            modelMember.SiteID = SiteID;
            modelMember.NodeCode = NodeCode;
            modelMember.Gender = Utils.ParseInt(rblGender.SelectedValue, 1);
            modelMember.UserName = txtUserName.Text.Trim();
          //  modelMember.Password = Utils.getMD5(txtPassword.Text.Trim().ToLower());
            modelMember.GroupID = ddlMemberGroup.SelectedValue;
            //modelMember.ModleID = ddlMemberModel.SelectedValue;
            //modelMember.AreaID = ddlArea.SelectedValue;
            modelMember.Email = txtEmail.Text.Trim();
            
        }
        #endregion

        //编辑会员模型
        protected void lnkbEditModel_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Edit"))
            {
                Utils.UrlRedirect(this, "MemberOnlyModelEdit.aspx?memberID=" + MemberID);
            }
            else
            {
                Utils.AlertMessage(this, "你没有修改权限！");
            }
        }

  
    }
}
