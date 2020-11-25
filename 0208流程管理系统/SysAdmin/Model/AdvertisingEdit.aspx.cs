using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.Model;
using System.Text;
using System.IO;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年4月26日
    功能描述： 广告位添加/修改
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class AdvertisingEdit : AdminPage
    {
        #region 页面初始化
        AllPower.Model.Content.Advertising modelAdvertising;
        BLL.Content.Advertising bllAdvertising = new AllPower.BLL.Content.Advertising();


        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        private void PageInit()
        {
            BLL.Content.ReviewFlow bllReviewFlow = new AllPower.BLL.Content.ReviewFlow();
            ControlUtils.RadioButtonListDataBind(rbtlType, Utils.GetXmlDataSet("../Configuraion/Model/AdvertisingType.xml").Tables[0], "Name", "value");
            DataTable dtTempTable = Utils.GetXmlDataSet("../Configuraion/Model/AdvertisingSizeType.xml").Tables[0];
            ControlUtils.DropDownDataBind(ddlSize, dtTempTable, "Name", "value");
            string[] strs = Utils.strSplit(dtTempTable.Rows[0]["value"].ToString(), "x");
            txtWidth.Text = strs[0];
            txtHeight.Text = strs[1];
            dtTempTable.Dispose();
            rbtlType.SelectedIndex = 0;
            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                DataTable dt = bllAdvertising.GetList("ONE", Utils.getOneParams(ID));
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    hidLogTitle.Value = txtName.Text;
                    txtsummary.Text = dt.Rows[0]["Desc"].ToString();
                    txtJsName.Text = dt.Rows[0]["JsName"].ToString();
                    txtJsName.Enabled = false;
                    IsEnable.Checked = Convert.ToBoolean(dt.Rows[0]["IsEnable"]);

                    rbtlType.SelectedValue = dt.Rows[0]["Type"].ToString();

                    rbtlAdvertisingType.SelectedValue = dt.Rows[0]["AdvertisingType"].ToString();


                    ddlSize.SelectedValue = dt.Rows[0]["AdvertisingSizeType"].ToString();

                    txtWidth.Text = dt.Rows[0]["AdvertisingWidth"].ToString();

                    txtHeight.Text = dt.Rows[0]["AdvertisingHeight"].ToString();

                    rbtlWeight.SelectedValue = dt.Rows[0]["AdvertisingDisplayType"].ToString();

                    switch (rbtlType.SelectedValue)
                    {
                        case "2":

                            ddlPopType.Value = dt.Rows[0]["PopType"].ToString();
                            ddlPopPosition.Value = dt.Rows[0]["PopLocation"].ToString();
                            TxtPopLeft.Value = dt.Rows[0]["LocationLeft"].ToString();
                            TxtPopTop.Value = dt.Rows[0]["LocationUp"].ToString();
                            TxtPopCookieHour.Value = dt.Rows[0]["PopTime"].ToString();
                            break;
                        case "3":
                            ddlMovePosition.Value = dt.Rows[0]["PopLocation"].ToString();
                            TxtMoveLeft.Value = dt.Rows[0]["LocationLeft"].ToString();
                            TxtMoveTop.Value = dt.Rows[0]["LocationUp"].ToString();
                            TxtMoveDelay.Value = dt.Rows[0]["Smoothness"].ToString();

                            cbMoveShowCloseAD.Checked = Convert.ToBoolean(dt.Rows[0]["IsDisplayClose"]);

                            TxtMoveCloseFontColor.Value = dt.Rows[0]["CloseLableColor"].ToString();

                            break;
                        case "4":
                            ddlFixedPosition.Value = dt.Rows[0]["PopLocation"].ToString();
                            TxtFixedLeft.Value = dt.Rows[0]["LocationLeft"].ToString();
                            TxtFixedTop.Value = dt.Rows[0]["LocationUp"].ToString();
                            cbFixedShowCloseAD.Checked = Convert.ToBoolean(dt.Rows[0]["IsDisplayClose"]);
                            TxtFixedCloseFontColor.Value = dt.Rows[0]["CloseLableColor"].ToString();
                            break;
                        case "5":
                            ddlFloatType.Value = dt.Rows[0]["DriftType"].ToString();
                            ddlFloatPosition.Value = dt.Rows[0]["PopLocation"].ToString();
                            TxtFloatLeft.Value = dt.Rows[0]["LocationLeft"].ToString();
                            TxtFloatTop.Value = dt.Rows[0]["LocationUp"].ToString();
                            cbFloatShowCloseAD.Checked = Convert.ToBoolean(dt.Rows[0]["IsDisplayClose"]);
                            TxtFloatCloseFontColor.Value = dt.Rows[0]["CloseLableColor"].ToString();
                            break;
                        case "7":
                            TxtCoupletLeft.Value = dt.Rows[0]["LocationLeft"].ToString();
                            TxtCoupletTop.Value = dt.Rows[0]["LocationUp"].ToString();
                            cbCoupletShowCloseAD.Checked = Convert.ToBoolean(dt.Rows[0]["IsDisplayClose"]);
                            TxtCoupletCloseFontColor.Value = dt.Rows[0]["CloseLableColor"].ToString();
                            TxtCoupletDelay.Value = dt.Rows[0]["Smoothness"].ToString();

                            break;
                    }
                }
                btnSave.Text = Utils.GetResourcesValue("Common", "Update");
                dt.Dispose();
            }
            else
            {
                string strDay = DateTime.Now.ToString("yyyyMM");                                     //当前的日期  
                string advPath = Utils.GetPath(string.Format("~/{0}/Plus/Advert/", SiteDir));        //广告js目录  
                if (!Directory.Exists(advPath))  //是否存在目录  没有则创建
                {
                    Directory.CreateDirectory(advPath);
                }
                string[] strTableOrId = GetTableID("0", "K_Advertising");
                txtJsName.Text = strDay + strTableOrId[1] + ".js";
            }
        }
        #endregion

        #region 操作的事件
        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            modelAdvertising = new AllPower.Model.Content.Advertising();
            ModelSaveOrUpdate();
            string strOperateName = "Add";
            if (Action == "NEW") //如果当前操作为新增,则运算出id的值
            {
                // 权限验证，是否具有修改权限

                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                string[] strTableOrId = GetTableID("0", "K_Advertising");
                modelAdvertising.ID = strTableOrId[0];
                modelAdvertising.Orders = Utils.ParseInt(strTableOrId[1], 1);
                modelAdvertising.AddMan = UserNo;
            }
            else  //否则直接绑定当前id
            {
                // 权限验证，是否具有修改权限

                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有修改操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                strOperateName = "Update";
                modelAdvertising.ID = ID;
            }
            string advPath = string.Format("/{0}/Plus/Advert/", SiteDir);   //当前js存放的目录
            string uploadPath = GetUploadImgUrl();                          //获取当前上传文件的路径
            string yuMing = GetSiteDomain();                                //获取当前站点的域名
            //用户添加/修改操作
            string strMessage = bllAdvertising.Save(Action, modelAdvertising);
            if (strMessage == "1") //操作成功
            {
                bllAdvertising.CreateJs(modelAdvertising.ID, advPath, uploadPath, yuMing);  //操作成功后创建或者更新js
                //生成一个新的表          
                ID = modelAdvertising.ID;
                Utils.RunJavaScript(this, "type=" + (Action == "NEW" ? 0 : 1).ToString() + ";title='" + modelAdvertising.Name.Replace("'", "\\'") + "';");
            }
            else
            {
                Utils.RunJavaScript(this, "type=2;errmsg='" + Utils.GetResourcesValue("model", "AddError") + "JS名称已经存在" + "';");
            }
            WriteLogExpand(modelAdvertising.Name, hidLogTitle.Value, strOperateName, "Advertising", strMessage); //写日志
        }

        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelAdvertising.Name = HttpUtility.HtmlEncode(txtName.Text.Trim());
            modelAdvertising.IsEnable = IsEnable.Checked;
            modelAdvertising.SiteId = SiteID.ToString();
            modelAdvertising.NodeId = NodeID;
            modelAdvertising.Desc = txtsummary.Text.Trim();
            modelAdvertising.JsName = txtJsName.Text.Trim();
            modelAdvertising.Type = Utils.ParseInt(rbtlType.SelectedValue, 1);
            modelAdvertising.AdvertisingType = Utils.ParseInt(rbtlAdvertisingType.SelectedValue, 1);
            modelAdvertising.AdvertisingSizeType = ddlSize.SelectedValue;
            modelAdvertising.AdvertisingWidth = Utils.ParseInt(txtWidth.Text.Trim(), 10);
            modelAdvertising.AdvertisingHeight = Utils.ParseInt(txtHeight.Text.Trim(), 10);
            modelAdvertising.AdvertisingDisplayType = Utils.ParseInt(rbtlWeight.SelectedValue, 0);
            modelAdvertising.NodeCode = NodeCode;
            switch (modelAdvertising.Type)
            {
                case 2:
                    modelAdvertising.PopType = Utils.ParseInt(ddlPopType.Value, 1);
                    modelAdvertising.PopLocation = Utils.ParseInt(ddlPopPosition.Value, 1);
                    modelAdvertising.LocationLeft = Utils.ParseInt(TxtPopLeft.Value.Trim(), 100);
                    modelAdvertising.LocationUp = Utils.ParseInt(TxtPopTop.Value.Trim(), 100);
                    modelAdvertising.PopTime = Utils.ParseInt(TxtPopCookieHour.Value.Trim(), 100);
                    break;
                case 3:
                    modelAdvertising.PopLocation = Utils.ParseInt(ddlMovePosition.Value, 1);
                    modelAdvertising.LocationLeft = Utils.ParseInt(TxtMoveLeft.Value.Trim(), 100);
                    modelAdvertising.LocationUp = Utils.ParseInt(TxtMoveTop.Value.Trim(), 100);
                    modelAdvertising.Smoothness = Convert.ToSingle(TxtMoveDelay.Value.Trim());
                    modelAdvertising.IsDisplayClose = cbMoveShowCloseAD.Checked;
                    modelAdvertising.CloseLableColor = TxtMoveCloseFontColor.Value.Trim();
                    break;
                case 4:
                    modelAdvertising.PopLocation = Utils.ParseInt(ddlFixedPosition.Value, 1);
                    modelAdvertising.LocationLeft = Utils.ParseInt(TxtFixedLeft.Value.Trim(), 100);
                    modelAdvertising.LocationUp = Utils.ParseInt(TxtFixedTop.Value.Trim(), 100);
                    modelAdvertising.IsDisplayClose = cbFixedShowCloseAD.Checked;
                    modelAdvertising.CloseLableColor = TxtFixedCloseFontColor.Value.Trim();
                    break;
                case 5:
                    modelAdvertising.DriftType = Utils.ParseInt(ddlFloatType.Value, 1);
                    modelAdvertising.PopLocation = Utils.ParseInt(ddlFloatPosition.Value, 1);
                    modelAdvertising.LocationLeft = Utils.ParseInt(TxtFloatLeft.Value.Trim(), 100);
                    modelAdvertising.LocationUp = Utils.ParseInt(TxtFloatTop.Value.Trim(), 100);
                    modelAdvertising.IsDisplayClose = cbFloatShowCloseAD.Checked;
                    modelAdvertising.CloseLableColor = TxtFloatCloseFontColor.Value.Trim();
                    break;
                case 7:
                    modelAdvertising.LocationLeft = Utils.ParseInt(TxtCoupletLeft.Value.Trim(), 100);
                    modelAdvertising.LocationUp = Utils.ParseInt(TxtCoupletTop.Value.Trim(), 100);
                    modelAdvertising.Smoothness = Convert.ToSingle(TxtCoupletDelay.Value.Trim());
                    modelAdvertising.IsDisplayClose = cbCoupletShowCloseAD.Checked;
                    modelAdvertising.CloseLableColor = TxtCoupletCloseFontColor.Value.Trim();
                    break;
            }
        }
        #endregion
    }
}
