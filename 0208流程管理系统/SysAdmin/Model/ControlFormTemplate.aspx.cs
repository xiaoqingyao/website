using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Data;

namespace AllPower.Web.Admin
{
    public partial class ControlFormTemplate : AdminPage
    {
        protected BLL.Content.ControlManageList ctrManageList;
        DataSet ds = null;
        private BLL.Content.CustomForm ctFormBll = new AllPower.BLL.Content.CustomForm();
        protected DataRow dr = null;
        private string _id = null;

        /// <summary>
        /// 缓存表
        /// </summary>
        private DataTable ViewTable
        {
            set { ViewState["ViewTable"] = value; }
            get { return ViewState["ViewTable"] as DataTable; }
        }

        /// <summary>
        /// 操作ID
        /// </summary>
        public string ID
        {
            get
            {
                if (this._id == null)
                {
                    this._id = Utils.ReqUrlParameter("ID");
                }

                return this._id;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            // 权限验证（是否登陆或登陆超时）
            ctrManageList = new BLL.Content.ControlManageList(hdnModelID.Value, hdnTableName.Value);
            if (!IsPostBack)
            {
                PageInit();
            }
        }

          /// <summary>
        /// 初始化
        /// </summary>
        private void PageInit()
        {
            //得到当前表名
           DataTable dtManage = ctFormBll.GetList("ONE", Utils.getOneParams(hdnModelID.Value));
           if (dtManage.Rows.Count > 0)
           {
               DataRow drManage = dtManage.Rows[0];
               SplitDataBind();
               if (Utils.ParseBool(drManage["IsReply"])) //是否要回复
               {                   
                   txtReplyAdminContent.Text = dr["ReplyContent"].ToString();
                   lblAdmin.Text = dr["ReplyAdmin"].ToString();
                   lblReplyTime.Text = dr["ReplyTime"].ToString();
               }
               else
               {
                   plReply.Visible = false;
               }
                  
           }
           dtManage.Dispose();
        }

        #region 绑定
        private void SplitDataBind()
        {
          
            string[] splitParam;

            // 初始加载时的SQL各参数
            splitParam = ctrManageList.GetSQLParam(hdnCustomCol.Value, hdnShowCol.Value);

            string strWhere = null; // 初始时的where
                         // 搜索栏条件
            if (!string.IsNullOrEmpty(splitParam[1]))
            {
                strWhere =splitParam[1]+ " and ID=@ID" ;
            }
            else
            {
                strWhere = splitParam[1] + " ID=@ID";
            }


            ds = ctFormBll.GetData(hdnTableName.Value, strWhere, splitParam[2] + ",ReplyAdminContent as ReplyContent,ReplyAdminTime as ReplyTime,ReplyAdminId as ReplyAdmin", hdnForignTableCol.Value, ID);
            dr = ds.Tables[1].Rows[0];
          
        }       
        #endregion   

        protected void btnReply_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            dicWhere.Add("ReplyAdminContent",txtReplyAdminContent.Text.Trim());
            dicWhere.Add("ReplyAdminTime",DateTime.Now.ToString());
            dicWhere.Add("ReplyAdminId",UserNo);
            string strMessage = ctFormBll.SaveForm(dicWhere, hdnTableName.Value,ID);
            if (strMessage == "1") //回复成功
            {                
                // 先判断是否要发送到会员手机中
                //再判断此信息是会员所发,如果是会员所发,得到此会员的邮箱
                //再发送邮件
                Utils.UrlRedirect(this, "sysadmin_" + hdnTableName.Value.Replace("K_F_","")+"List.aspx", Utils.GetResourcesValue("model", "AddSucess"));
            }
            else //回复失败
            {
                Utils.AlertJavaScript(this, Utils.GetResourcesValue("model", "AddError"));
            }
        }
    }
}
