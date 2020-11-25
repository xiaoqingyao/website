using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Data;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      严辉
    创建时间： 2010年5月4日
    功能描述： 自定义字段列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class  MemberModelFieldList : AdminPage
    {
        private string _mid = null;
        AllPower.BLL.Business.BusinessField bllField = new AllPower.BLL.Business.BusinessField();

        OptionsDictionary odTemp = new OptionsDictionary("fields");

        #region 参数
         
        public string MID //模型编号
        {
            get
            {
                if (this._mid == null)
                {
                    this._mid = Utils.UrlDecode(Utils.ReqUrlParameter("mid"));
                }
                return this._mid;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();    //初始化绑定 

            }
        }

        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        void PageInit()
        {
            DataTable dt = (new AllPower.BLL.Business.BusinessModel()).GetList("ONE", Utils.getOneParams(MID));
            if (dt != null && dt.Rows.Count > 0)
            {
                lblModelName.Text = dt.Rows[0][1].ToString();
            }
            PageData();//分页绑定列表  

            //把当前url全部参数存入cookie中  
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); 
        }

        #region 实现列表信息绑定
        private void PageData()
        {
            Dictionary<string, string> dcWhere = new Dictionary<string, string>();           
            if (!string.IsNullOrEmpty(MID))
            {
                dcWhere.Add("ModelID", MID);
            }
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.DicWhere = dcWhere;
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptFieldList;
            bllField.PageData(p);
           
        }
        #endregion

        #region 分页
        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            PageData();
        }
        #endregion

        protected void lbtnDel_Click(object sender, CommandEventArgs e)
        {
            if (!IsHaveRightByOperCode("Delete"))
            {
                Utils.AlertMessage(this, "你没有删除操作权限 ！");
                return;
            }
            bllField.BusinessFieldSet("DELFIELD", "", e.CommandArgument.ToString());  //删除数据

            PageInit();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (!IsHaveRightByOperCode("Delete"))
            {
                Utils.AlertMessage(this, "你没有删除操作权限 ！");
                return;
            }

           string  chkIdList = GetAllChkId();
            if (!string.IsNullOrEmpty(chkIdList))
            {
                bllField.BusinessFieldSet("DELFIELD", "", chkIdList);  //删除数据
                WriteLog(GetLogValue(LogTitle, "Del", "MemberModelField", true), "", 2);    //写日志
                PageInit();
            }
        }

        //获取复选框列表值
        private string GetAllChkId()
        {
            if (!string.IsNullOrEmpty(Request.Form["chkId"]))
            {
                return Request.Form["chkId"].Replace(" ", "");
            }
            else
            {
                return "";
            }
        }

        protected void lbtnEnable_Click(object sender, CommandEventArgs e)
        {
            if (!IsHaveRightByOperCode("State"))
            {
                Utils.AlertMessage(this, "你没有更改状态操作权限 ！");
                return;
            }
            bllField.BusinessFieldSet("UNENABLE", "", e.CommandArgument.ToString());  //更改状态

            PageInit();
        }

        protected void btnOrders_Click(object sender, EventArgs e)
        {
            TextBox txtOrder = null;
            HiddenField hidId = null;
            for (int i = 0; i < rptFieldList.Items.Count; i++)  //循环得到rpt当前行的id和排序进行更改
            {
                txtOrder = rptFieldList.Items[i].FindControl("txtOrders") as TextBox;
                hidId = rptFieldList.Items[i].FindControl("hidIds") as HiddenField;

                bllField.BusinessFieldSet("ORDER", txtOrder.Text.Trim(), hidId.Value);  //更改排序
            }
            PageInit();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (!IsHaveRightByOperCode("New"))
            {
                Utils.AlertMessage(this, "你没有添加操作权限 ！");
                return;
            }

            Response.Redirect("MemberModelFieldEdit.aspx?action=NEW&MID=" + MID);
        }

        protected string GetDictionaryValue(object objIndex)
        {
            return odTemp.getDictionaryValue(Utils.ParseInt(objIndex, 0));
        }
 
    }
}
