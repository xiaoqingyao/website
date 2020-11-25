#region 引用程序集

using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.IO;

using Wuqi.Webdiyer;
using AllPower.Common;
using AllPower.BLL.Content;
using AllPower.Web.Admin;
using AllPower.BLL.SysManage;
#endregion

//#region 版权注释
///*================================================================
//    Copyright (C) 2010 华强北在线

//    作者:      朱存群

//    创建时间： 2010年4月22日

//    功能描述： 内容模型列表

//// 更新日期        更新人      更新原因/内容
////
//--===============================================================*/ 

namespace AllPower.Web.Admin.Categorys
{
    public partial class CategoryList : AdminPage
    {
        AllPower.BLL.Categorys.Category bll = new AllPower.BLL.Categorys.Category();              //业务类
        AllPower.Model.Categorys.Category model = new AllPower.Model.Categorys.Category();        //实体类
        Dictionary<string, string> dicWhere = null;                                             //查询的条件    
        StringBuilder sbLog = new StringBuilder();

        #region URL参数
        private string _cid = null;
        private string _cname = "";

        // 搜索类型
        public string CID //类别标识符
        {
            get
            {
                if (this._cid == null)
                {
                    this._cid = Utils.ReqUrlParameter("cid").ToUpper();
                }

                return this._cid;
            }
        }

        public string CName //类别名
        {
            get
            {
                if (CID != null)
                {
                    switch (CID)
                    {
                        case "L":
                            _cname = Utils.GetResourcesValue("Orgin", "Location"); break;
                        case "H":
                            _cname = Utils.GetResourcesValue("Orgin", "Industry"); break;
                        case "S":
                            _cname = Utils.GetResourcesValue("Orgin", "Sort"); break;
                    }
                }
                return this._cname;
            }
        }
        public string Son //子控件名
        {
            get
            {
                string _son = "";
                if (CID != null)
                {
                    switch (CID)
                    {
                        case "L":
                            _son = Utils.GetResourcesValue("Orgin", "AddSonLocation"); break;//添加子地区

                        case "H":
                            _son = Utils.GetResourcesValue("Orgin", "AddSonIndustry"); break;//添加子行业

                        case "S":
                            _son = Utils.GetResourcesValue("Orgin", "AddSonSort"); break;    //添加子类别

                    }
                }
                return _son;
            }
        }
        public string Menu //菜单字段
        {
            get
            {
                string _menu = "";
                if (CID != null)
                {
                    switch (CID)
                    {
                        case "L":
                            _menu = Utils.GetResourcesValue("Orgin", "LocationManage"); break; //地区
                        case "H":
                            _menu = Utils.GetResourcesValue("Orgin", "IndustryManage"); break; //行业
                        case "S":
                            _menu = Utils.GetResourcesValue("Orgin", "SortManage"); break;  //类别
                    }
                }
                return _menu;
            }
        }
        #endregion

        #region 页面加载初始化

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PageInit();
            }
        }

        private void PageInit()
        {



            rptCategory.DataSource = GetDatabyParentid(CID);
            rptCategory.DataBind();
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
           // SplitDataBind();
            base.SetRight(this, rptCategory);//权限检测

        }

        protected DataView GetDatabyParentid(string Parentid) 
        {
            DataTable dtTrunk;
            dtTrunk = bll.GetList("ALL", Utils.getOneParams(Parentid));
            return dtTrunk.DefaultView;
        }
        #endregion

        #region 删除树级
        public void Category_Del(object sender, CommandEventArgs e)
        {
            OnDel(e.CommandArgument.ToString());
        }

        /// <summary>
        /// 批量删除树级
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            OnDel(Request.Form["chkId"].Replace(", ", ","));
        }

        void OnDel(string id)
        {
            if (base.IsHaveRightByOperCode("Delete"))
            {
                string tranType;    // 事务类型
                string returnMsg;   // 事务返回信息

                tranType = "DELDB";
                returnMsg = bll.CategorySet(tranType, null, id);
                int result = Utils.ParseInt(returnMsg, 0);
                if (result == 0)  //操作失败
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "CategoryModel", false), returnMsg, 3); //写日志
                    Utils.AlertMessage(this, "删除失败，请重试！");
                }
                else //操作成功
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "CategoryModel", true), "", 2); //写日志
                    Utils.AlertMessage(this, "操作成功！");
                }
                PageInit();
            }
            else
            {
                Utils.AlertMessage(this, "删除" + CName + "失败，没有权限！");
            }
        }
        #endregion

        #region 更新
        protected void SetIsEnable(object sender, CommandEventArgs e)
        {
            if (base.IsHaveRightByOperCode("Edit"))
            {
                string tranType = "ENABLE";
                string returnMsg;
                string[] arrArg;        // arrArg[0]  记录ID  arrArg[1] 记录值

                int isEnable;

                // 是否启用           
                arrArg = e.CommandArgument.ToString().Split(new char[] { '|' });
                isEnable = 0;

                if (arrArg.Length > 1)
                {
                    if (arrArg[1] == "False" || arrArg[1] == "0")
                    {
                        isEnable = 1;
                    }
                    returnMsg = bll.CategorySet(tranType, isEnable.ToString(), arrArg[0]);
                    PageInit();
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'更新记录失败，没有权限！',title:'提示信息'})");
            }
        }
        #endregion

        #region 获取复选框列表值

        //获取复选框列表值

        private string GetAllChkId()
        {
            return Request.Form["chkId"].Replace(", ", ",");
        }
        #endregion

        #region 批量启用|禁用
        protected void btnDisable_Click(object sender, EventArgs e)
        {
            Enable(GetAllChkId(), "1");
        }

        protected void btnUnDisable_Click(object sender, EventArgs e)
        {
            Enable(GetAllChkId(), "0");
        }

        private void Enable(string strIdList, string setValue)
        {
            if (IsHaveRightByOperCode("State"))
            {

                if (!string.IsNullOrEmpty(strIdList))
                {
                    int result = Utils.ParseInt(bll.CategorySet("ENABLE", setValue, strIdList), 0);
                    if (result > 0)
                    {
                        Utils.AlertMessage(this, "操作成功！");
                    }
                    else
                    {
                        Utils.AlertMessage(this, "操作失败，请重试！");
                    }
                    PageInit();
                }
            }
            else
            {
                Utils.AlertMessage(this, "无此操作权限，请联系管理员！");
            }
        }
        #endregion

        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind()
        {
            //AllPower.Model.Pager p = new AllPower.Model.Pager();
            //p.Aspnetpage = Split;
            //p.RptControls = rptCategory;
            //p.DicWhere = GetSqlWhere();
            ////绑定数据表
            //bll.PageData(p);
        }

        protected void Split_PageChanged(object src, EventArgs e)
        {
            SplitDataBind();
        }

        // 获取搜索条件
        private Dictionary<string, string> GetSqlWhere()
        {
            if (dicWhere != null)
            {
                dicWhere.Clear();
            }
            else
            {
                dicWhere = new Dictionary<string, string>();
            }
            dicWhere.Add("NodeCode", NodeCode);
            dicWhere.Add("ClassID", Utils.cutBadStr(Request.QueryString["cid"]));

            return dicWhere;
        }

        #endregion

        #region 添加树级

        /// <summary>
        /// 添加树级
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("CategoryEdit.aspx?NodeCode=" + NodeCode + "&Action=add" + "&cid=" + CID);
            }
            else
            {
                Utils.AlertMessage(this, "无新增权限，请联系管理员！");
            }
        }

        #endregion

        #region 获得树级
        protected DataView GetTree(string cid)
        {
            DataTable dtTrunk;
            DataView result;
            int treeNodeOrder;

            dtTrunk = bll.GetList("ALL", Utils.getOneParams(cid));
            dtTrunk.Columns.Add(new DataColumn("TreeNodeOder", typeof(int)));
            treeNodeOrder = 0;
            AddNode(null, "", ref treeNodeOrder, ref dtTrunk);

            result = dtTrunk.DefaultView;
            result.Sort = "TreeNodeOder asc";
            return result;

        }
        #endregion

        #region 整理节点
        protected void AddNode(string parentID, string parentDot, ref int treeNodeOrder, ref DataTable dt)
        {
            DataRow[] childDataRow;

            if (parentID == null)
            {
                childDataRow = dt.Select("ParentID=0");

                foreach (DataRow dr in childDataRow)
                {
                    string dot;

                    dot = "";

                    if (dr["ArrayChildID"].ToString().Contains(","))
                    {
                        dot = "　│";
                    }

                    dr["Name"] = dr["Name"];
                    dr["TreeNodeOder"] = treeNodeOrder;
                    treeNodeOrder++;
                    AddNode(dr["ID"].ToString(), dot, ref treeNodeOrder, ref dt);
                }
            }
            else
            {
                childDataRow = dt.Select("ParentID=" + parentID, "ParentID");

                foreach (DataRow dr in childDataRow)
                {
                    string dot;

                    if (dr["ArrayChildID"].ToString().Contains(","))
                    {
                        dot = parentDot + "　├ ";
                    }
                    else
                    {
                        dot = parentDot + "　└ ";
                    }
                    dr["Name"] = dot + dr["Name"];
                    dr["TreeNodeOder"] = treeNodeOrder;
                    treeNodeOrder++;
                    AddNode(dr["ID"].ToString(), parentDot + "　", ref treeNodeOrder, ref dt);
                }
            }
        }
        #endregion

    }
}