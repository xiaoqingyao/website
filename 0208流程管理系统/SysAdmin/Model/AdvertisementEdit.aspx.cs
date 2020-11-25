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
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年4月28日
    功能描述： 广告添加/修改
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class AdvertisementEdit : AdminPage
    {
        AllPower.Model.Content.Advertisement modelAdvertisement;
        BLL.Content.Advertisement bllAdvertisement = new AllPower.BLL.Content.Advertisement();

        #region  URL参数
        private string _nid = null;


        /// <summary>
        /// 版位ID
        /// </summary>
        public string NID
        {
            get
            {
                if (this._nid == null)
                {
                    this._nid = Utils.ReqUrlParameter("nID");
                }

                return this._nid;
            }
        }
        #endregion

        #region 页面初始化
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

        #region 数据初始化
        private void PageInit()
        {
            ControlUtils.RadioButtonListDataBind(rbtlType, Utils.GetXmlDataSet("../Configuraion/Model/AdvertisementType.xml").Tables[0], "Name", "value");
            BLL.Content.Advertising bllAdvertising = new AllPower.BLL.Content.Advertising();
            DataTable dtTempTable = bllAdvertising.GetList("all", Utils.getOneParams(""));
            lbAdvertisingId.DataSource = dtTempTable;
            lbAdvertisingId.DataTextField = "Name";
            lbAdvertisingId.DataValueField = "Id";
            lbAdvertisingId.DataBind();
            dtTempTable.Dispose();

            rbtlType.SelectedIndex = 0;
            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                DataTable dt = bllAdvertisement.GetList("ONE", Utils.getOneParams(ID));
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    rbtlType.SelectedValue = dt.Rows[0]["Type"].ToString();
                    hidLogTitle.Value = txtName.Text;
                    txtWeight.Text = dt.Rows[0]["Weight"].ToString();
                    cblIsView.Checked = Utils.ParseBool(dt.Rows[0]["IsSaveView"].ToString());
                    cblIsClick.Checked = Utils.ParseBool(dt.Rows[0]["IsSaveClick"].ToString());
                    txtViewCount.Text = dt.Rows[0]["ViewCount"].ToString();
                    txtClickCount.Text = dt.Rows[0]["ClickCount"].ToString();
                    txtExpiredTime.Text = Convert.ToDateTime(dt.Rows[0]["ExpiredTime"].ToString()).ToShortDateString();

                    switch (rbtlType.SelectedValue)
                    {
                        case "1":
                            FileUploadControl1.Value = dt.Rows[0]["FileUrl"].ToString();
                            TxtImgWidth.Value = dt.Rows[0]["Weight"].ToString();
                            TxtImgHeight.Value = dt.Rows[0]["Hieght"].ToString();
                            TxtLinkUrl.Value = dt.Rows[0]["LinkUrl"].ToString();
                            TxtLinkAlt.Value = dt.Rows[0]["LinkTitle"].ToString();
                            rbtlLinkTarget.SelectedValue = dt.Rows[0]["LinkTarget"].ToString();
                            TxtADIntro.Value = dt.Rows[0]["Content"].ToString();
                            break;
                        case "2":
                            ExtenFileUpload.Value = dt.Rows[0]["FileUrl"].ToString();
                            TxtFlashWidth.Value = dt.Rows[0]["Weight"].ToString();
                            TxtFlashHeight.Value = dt.Rows[0]["Hieght"].ToString();
                            cbFlashMode.Checked = Utils.ParseBool(dt.Rows[0]["IsTransparent"].ToString());
                            break;
                        case "3":
                            TxtADText.Value = dt.Rows[0]["Content"].ToString();
                            break;
                        case "4":
                            TxtADCode.Value = dt.Rows[0]["Content"].ToString();

                            break;
                        case "5":
                            TxtWebFileUrl.Value = dt.Rows[0]["Content"].ToString();
                            break;
                    }
                    ControlUtils.SetGetListBoxSelectValue(lbAdvertisingId, dt.Rows[0]["AdvertisingId"].ToString());
                }
                else
                {
                    lbAdvertisingId.SelectedIndex = 0;
                }

                btnSave.Text = Utils.GetResourcesValue("Common", "Update");
                dt.Dispose();
            }
        }
        #endregion
        #endregion

        #region 操作的事件
        /// <summary>
        /// 添加/修改数据 By 何伟 2010-09-18 修改
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string strOperateName = "Add";
            modelAdvertisement = new AllPower.Model.Content.Advertisement();
            ModelSaveOrUpdate();
            if (Action == "NEW") //如果当前操作为新增,则运算出id的值
            {
                // 权限验证，是否具有修改权限
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                string[] strTableOrId = GetTableID("0", "K_Advertisement");
                modelAdvertisement.ID = strTableOrId[0];
                modelAdvertisement.Orders = Utils.ParseInt(strTableOrId[1], 1);
                modelAdvertisement.AddMan = UserNo;
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
                modelAdvertisement.ID = ID;
            }
            //用户添加/修改操作
            string strMessage = bllAdvertisement.Save(Action, modelAdvertisement);
            if (strMessage == "1") //操作成功
            {
                string advPath = string.Format("/{0}/Plus/Advert/", SiteDir);   //当前站点广告js目录
                string uploadPath = GetUploadImgUrl();                          //获取当前上传文件的路径
                string yuMing = GetSiteDomain();                                //获取当前站点的域名
                BLL.Content.Advertising bllAdvertising = new AllPower.BLL.Content.Advertising();
                foreach (string str in Utils.strSplit(modelAdvertisement.AdvertisingId, ","))  //成功后更新各js
                {
                    bllAdvertising.CreateJs(str, advPath, uploadPath, yuMing);
                }
                ID = modelAdvertisement.ID;
                Utils.RunJavaScript(this, "type=" + (Action == "NEW" ? 0 : 1).ToString() + ";title='" + modelAdvertisement.Name.Replace("'", "\"") + "';");
            }
            else
            {
                Utils.RunJavaScript(this, "type=2;errmsg='" + strMessage.Replace("'", "\"").Replace("\n", "").Replace("\r", "") + "';");
            }
            WriteLogExpand(modelAdvertisement.Name, hidLogTitle.Value, strOperateName, "Advertisement", strMessage); //写日志
        }

        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelAdvertisement.Name = HttpUtility.HtmlEncode(txtName.Text.Trim());
            modelAdvertisement.SiteId = SiteID.ToString();
            modelAdvertisement.NodeId = NodeID;
            modelAdvertisement.NodeCode = NodeCode;
            modelAdvertisement.Type = Utils.ParseInt(rbtlType.SelectedValue, 1);
            modelAdvertisement.Weight = Utils.ParseInt(txtWeight.Text.Trim(), 10);
            modelAdvertisement.IsSaveView = cblIsView.Checked;
            modelAdvertisement.IsSaveClick = cblIsClick.Checked;
            modelAdvertisement.ExpiredTime = Convert.ToDateTime(txtExpiredTime.Text.Trim());
            modelAdvertisement.ViewCount = Utils.ParseInt(txtViewCount.Text.Trim(), 0);
            modelAdvertisement.ClickCount = Utils.ParseInt(txtClickCount.Text.Trim(), 0);
            DataTable dt = new BLL.Content.AdvertisementConfig().GetList("one", Utils.getOneParams("1"));
            if (Utils.ParseBool(dt.Rows[0]["IsCheck"].ToString()))  //是否要审核
            {
                modelAdvertisement.FlowState = 3;
            }
            else
            {
                modelAdvertisement.FlowState = 99;
            }
            dt.Dispose();

            switch (modelAdvertisement.Type)
            {
                case 1:
                    modelAdvertisement.FileUrl = FileUploadControl1.Value.Trim();
                    modelAdvertisement.Width = Utils.ParseInt(TxtImgWidth.Value.Trim(), 100);
                    modelAdvertisement.Hieght = Utils.ParseInt(TxtImgHeight.Value.Trim(), 100);
                    modelAdvertisement.LinkUrl = TxtLinkUrl.Value.Trim();
                    modelAdvertisement.LinkTitle = TxtLinkAlt.Value.Trim();
                    modelAdvertisement.LinkTarget = Utils.ParseInt(rbtlLinkTarget.SelectedValue, 1);
                    modelAdvertisement.Content = TxtADIntro.Value.Trim();
                    break;
                case 2:
                    modelAdvertisement.FileUrl = ExtenFileUpload.Value.Trim();
                    modelAdvertisement.Width = Utils.ParseInt(TxtFlashWidth.Value.Trim(), 100);
                    modelAdvertisement.Hieght = Utils.ParseInt(TxtFlashHeight.Value.Trim(), 100);
                    modelAdvertisement.IsTransparent = cbFlashMode.Checked;
                    break;
                case 3:
                    modelAdvertisement.Content = TxtADText.Value.Trim();
                    break;
                case 4:
                    modelAdvertisement.Content = TxtADCode.Value.Trim();
                    break;
                case 5:
                    modelAdvertisement.Content = TxtWebFileUrl.Value.Trim();
                    break;
            }
            modelAdvertisement.AdvertisingId = ControlUtils.GetListBoxSelectValue(lbAdvertisingId);
        }
        #endregion
    }
}
