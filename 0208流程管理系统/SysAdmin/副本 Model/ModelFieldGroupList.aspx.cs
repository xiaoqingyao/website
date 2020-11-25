using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop;
using KingTop.Common;
using KingTop.Web.Admin;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年3月10日
    功能描述： 模板字段分组管理列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace KingTop.Web.Admin
{
    public partial class ModelFieldGroupList : AdminPage
    {
        BLL.Content.ModelFieldGroup bllModelFieldGroup = new KingTop.BLL.Content.ModelFieldGroup();

        #region 初始参数
        
      
        private string strKeySearch, strModelId;        
        /// <summary> 
        /// 下拉选中模型ID
        /// </summary>
        public string StrModelId
        {
            get
            {
                if (strModelId == null)
                {
                    strModelId = Utils.ReqUrlParameter("ModelId");
                }               
                return strModelId;
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
            //模型下拉绑定
            BLL.Content.ModelManage bllModelManage = new KingTop.BLL.Content.ModelManage();
            KingTop.Model.SelectParams parms = new KingTop.Model.SelectParams();  //传递参数类             
            ddlModelList.DataSource = bllModelManage.GetList("ALL", parms);
            ddlModelList.DataTextField = "title";
            ddlModelList.DataValueField = "ID";
            ddlModelList.DataBind();           
            ddlModelList.Items.Insert(0,new ListItem("全部","-1"));  
            PageData();//分页绑定列表       
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY,Session.SessionID,Utils.GetUrlParams().Replace("&", "|"),SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中            
            //判断页面权限
            SetRight(this.Page, rptModelFileGroup);
            btnDelete2.Visible = btnDelete.Visible;
            btnOrder2.Visible = btnOrder.Visible;
            btnNew2.Visible = btnNew.Visible;
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            //判断是否有权限
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("ModelFieldGroupEdit.aspx?NodeID="+NodeID);
            }
        }

        protected void lbtnDel_Click(object sender, CommandEventArgs e)
        {
            //判断是否有权限
            if (IsHaveRightByOperCode("Delete"))
            {
              
                string strMessage = bllModelFieldGroup.ModelFieldGroupSet("DEL", "", e.CommandArgument.ToString());  //删除数据
                WriteLogExpand(LogTitle, "Del", "ModelGroup", strMessage);  //写日志               
                PageInit();
            }
        }

        protected void btnDel_Click(object sender, EventArgs e)

        {
             //判断是否有权限
            if (IsHaveRightByOperCode("Delete"))
            {                           
                string strMessage = bllModelFieldGroup.ModelFieldGroupSet("DEL", "", Utils.ReqFromParameter("chkID"));  //删除数据
                WriteLogExpand(LogTitle, "Del", "ModelGroup", strMessage);
                PageInit();
            }
        }

        protected void lbtnEnable_Click(object sender, CommandEventArgs e)
        {
            //判断是否有权限
            if (IsHaveRightByOperCode("State"))
            {
                string[] strMessage = KingTop.Common.Utils.strSplit(e.CommandArgument.ToString(), "|");     //分隔传入的两个参数id和是否启用状态
                #region 是否启用状态标识更改
                int iEnable = KingTop.Common.Utils.BoolToInt(strMessage[1]);
                if (iEnable == 1)
                {
                    iEnable = 0;
                }
                else
                {
                    iEnable = 1;
                }
                #endregion
                string strValue = bllModelFieldGroup.ModelFieldGroupSet("Enable", iEnable.ToString(), strMessage[0]);  //更改状态
                PageInit();
            }
        }

        #region 分页
        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            PageData();
        }
        #endregion

        #region 实现列表信息绑定
        private void PageData()
        {
            Dictionary<string, string> dcWhere = new Dictionary<string, string>();           
            if (StrKeySearch != "")
            {
                dcWhere.Add("Name", StrKeySearch);                
                txtGroupName.Text = strKeySearch;
            }
            if (StrModelId != "" && StrModelId != "-1")
            {
                dcWhere.Add("ModelId", StrModelId);                        
                ddlModelList.SelectedValue = StrModelId;
            }
            KingTop.Model.Pager p = new  KingTop.Model.Pager();              
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptModelFileGroup;
            p.DicWhere = dcWhere;
            bllModelFieldGroup.PageData(p);
        }

        #endregion

      
        protected void btnOrders_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Order"))
            {
                TextBox txtOrder = null;
                HiddenField hidId = null;
                string strId = Utils.ReqFromParameter("chkID"); ;
                for (int i = 0; i < rptModelFileGroup.Items.Count; i++)  //循环得到rpt当前行的id和排序进行更改
                {
                    hidId = rptModelFileGroup.Items[i].FindControl("hidIds") as HiddenField;
                    if (strId.IndexOf(hidId.Value) != -1)  //如果当前已经勾选,则排序
                    {
                        txtOrder = rptModelFileGroup.Items[i].FindControl("txtOrders") as TextBox;
                        bllModelFieldGroup.ModelFieldGroupSet("ORDER", KingTop.Common.Utils.ParseInt(txtOrder.Text.Trim(), 1).ToString(), hidId.Value);  //更改排序
                    }
                }
                PageInit();
            }
        }

        /// <summary>
        /// 按条件搜索
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnKeySerach_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("ModelFieldGroupList.aspx?NodeID=" + NodeID + "&keySearch=" + Utils.UrlEncode(txtGroupName.Text.Trim()) + "&ModelId=" + ddlModelList.SelectedValue); //页面跳转          
            }
        }        
    }
}
