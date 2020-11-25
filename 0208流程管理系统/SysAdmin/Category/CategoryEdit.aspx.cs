using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using AllPower.Web.Admin;
using AllPower.Common;
using System.Data;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      朱存群
    创建时间： 2010年4月15日
    功能描述： 添加自定义字段
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.WEB.Admin.Categorys
{
    public partial class CategoryEdit : AdminPage
    {
        AllPower.Model.Categorys.Category model = new AllPower.Model.Categorys.Category();
        AllPower.BLL.Categorys.Category bll = new AllPower.BLL.Categorys.Category();
        StringBuilder sbLog = new StringBuilder();
        int result = 0;

        #region 属性字段
        private string _cid = null;
        private string _urlid = null;
        private string _cname = "";
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
        public string UrlID //URL参数id
        {
            get
            {
                if (this._urlid == null)
                {
                    this._urlid = Utils.ReqUrlParameter("id");
                }

                return this._urlid;
            }
        }
        public string CName //种类名
        {
            get
            {
                if (CID != null)
                {
                    switch (CID)
                    {
                        case "L":
                            _cname = Utils.GetResourcesValue("Orgin", "Location"); break; //地区名称
                        case "H":
                            _cname = Utils.GetResourcesValue("Orgin", "Industry"); break; //行业名称
                        case "S":
                            _cname = Utils.GetResourcesValue("Orgin", "Sort"); break;    //类别名称
                    }
                }
                return this._cname;
            }
        }
        public string CNameIn //种类名
        { 
            get
            {
                string _belong = "";
                if (CID != null)
                {
                    switch (CID)
                    {
                        case "L":
                            _belong = Utils.GetResourcesValue("Orgin", "LocationIn"); break; //所属地区
                        case "H":
                            _belong = Utils.GetResourcesValue("Orgin", "IndustryIn"); break; //所属行业
                        case "S":
                            _belong = Utils.GetResourcesValue("Orgin", "SortIn"); break;    //所属类别
                    }
                }
                return _belong;
            }
        }
        public string MenuField //菜单字段
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
                            _menu = Utils.GetResourcesValue("Orgin", "SonSortManage"); break;  //类别
                    }
                }
                return _menu;
            }
        }
        public string ManageMethod //操作方法
        {
            get
            {
                string _method = "";
                if (Action=="EDIT")
                {
                    _method = "修改";
                }
                else if (Action == "ADD")
                {
                    _method = "添加";
                }
                return _method;
            }
        }
        
        #endregion

        /// <summary>
        /// 页面加载
        /// </summary>     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PageInit();
            }
        }

        /// <summary>
        /// 页面初始化
        /// </summary>
        protected void PageInit()
        {
            ListBind();
        }

        #region 绑定列表显示
        protected void ListBind()
        {

            lblParent.Text = CNameIn;
            lblChild.Text = CName;          

            ddlParent.Items.Add(new ListItem("无(作为一级地区)", "0"));
            DataView dv = GetTree(CID);
            foreach (DataRowView dr in dv)
            {
                ddlParent.Items.Add(new ListItem(dr["Name"].ToString(), dr["ID"].ToString()));
            }
            if (!string.IsNullOrEmpty(UrlID))
            {
                ddlParent.SelectedValue = UrlID;
            }
            //绑定颜色下拉框
            OptionsDictionary odColor = new OptionsDictionary("color");
            ListItem item = null;
            foreach (KeyValuePair<string, string> kvp in odColor.getDictionary2)
            {
                item = new ListItem(kvp.Value, kvp.Key.ToString());
                item.Attributes.Add("style", "background-color:" + kvp.Key.ToString());
                ddlColor.Items.Add(item);
            }
            if (Action == "EDIT")
            {
                ddlParent.Enabled = false;
                DataTable dt = bll.GetList("ONE", Utils.getOneParams(ID));
                this.txtName.Text = dt.Rows[0]["Name"].ToString();
                this.hidLogTitle.Value = dt.Rows[0]["Name"].ToString();
                this.txtDescription.Text = dt.Rows[0]["Desc"].ToString();
                this.ddlParent.SelectedValue = dt.Rows[0]["ParentID"].ToString();
                this.ddlModulPage.SelectedValue = dt.Rows[0]["MoldID"].ToString();
                this.ddlColor.SelectedValue = dt.Rows[0]["Color"].ToString();
                this.chkBold.Checked = Utils.ParseBool(dt.Rows[0]["IsBold"].ToString());
            }
        }
        #endregion

        #region 添加|修改树级
        protected void btnNew_Click(object sender, EventArgs e)
        {
            string temp="0";
            StringBuilder sbr = new StringBuilder();
            string items="";

            if (base.IsHaveRightByOperCode("New"))
            {
                //================添加======================//
                if (Action == "ADD")
                {
                    string[] Name = this.txtName.Text.Split(new char[] { ',', '，', '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (string strItem in Name)
                    {                        
                        if (strItem.Length > 0)
                        {
                            sbr.Append(strItem + ",");
                        }
                    }
                    items = sbr.ToString();
                    if (sbr.ToString().IndexOf(",", 0, 1) >= 0)
                    {
                        items = sbr.ToString().Substring(1, sbr.ToString().Length - 1);
                    }
                    int ParentID = Utils.ParseInt(ddlParent.SelectedValue, 1);
                    int Orders = Utils.ParseInt(AllPower.BLL.Public.GetTableID("0", "K_Category")[1], 0);
                    string Color = this.ddlColor.SelectedValue;
                    bool isBold = this.chkBold.Checked;
                    string Desc = this.txtDescription.Text.Trim();
                    string MoldID = this.ddlModulPage.SelectedValue;
                    string AddMan = base.GetLoginAccountName();
                    DateTime AddDate = System.DateTime.Now;

                    model.ID = 1;
                    model.Name = items;
                    model.ParentID = ParentID;
                    model.Orders = Orders;
                    model.Color = Color;
                    model.isBold = isBold;
                    model.Desc = Desc;
                    model.MoldID = MoldID;
                    model.ClassID = CID;
                    model.AddMan = AddMan;
                    model.AddDate = AddDate;
                    model.NodeCode = NodeCode;
                    model.SiteID = SiteID;

                    temp = bll.Save("NEW", model);
                    result = Utils.ParseInt(temp, 2);
                    switch (result)
                    {
                        case 1:
                            WriteLog(GetLogValue(LogTitle, "Add", "CategoryModel", true), "", 2); //写日志;
                            Utils.UrlRedirect(this, "CategoryList.aspx?cid="+CID, "添加成功");
                            break;
                        case 0:
                            Utils.RunJavaScript(this, "alert({jsMessage:'添加失败，请重试！',title:'提示信息'})");
                            break;
                        case 2:
                            WriteLog(GetLogValue(LogTitle, "Add", "CategoryModel", false), temp, 3); //写日志                      
                            Utils.RunJavaScript(this, "alert({jsMessage:'添加数据失败,请重试！',title:'提示信息'})");
                            break;
                    }
                }
                //================修改======================//
                else if (Action == "EDIT")
                {
                    model.Name = this.txtName.Text.Trim();
                    model.Desc = this.txtDescription.Text.Trim();
                    model.ID =Utils.ParseInt(UrlID,0);
                    model.MoldID = this.ddlModulPage.SelectedValue;
                    model.Color = this.ddlColor.SelectedValue;
                    model.isBold = this.chkBold.Checked?true:false;
                    model.AddDate = System.DateTime.Now;
                    model.ClassID = CID;
                    model.ParentID = Utils.ParseInt(ddlParent.SelectedValue,0);                 
                    temp = bll.Save("EDIT", model);

                    result = Utils.ParseInt(temp, 3);
                    switch (result)
                    {
                        case 1:
                            WriteLog(GetLogValue(LogTitle, "Update", "CategoryModel", true), "", 2); //写日志;
                            Utils.UrlRedirect(this, "CategoryList.aspx?cid="+CID, "修改成功");
                            break;
                        case 0:
                            Utils.RunJavaScript(this, "alert({jsMessage:'修改失败，请重试！',title:'提示信息'})");
                            break;
                        case 2:
                            Utils.RunJavaScript(this, "alert({jsMessage:'重复的名称，请换个！',title:'提示信息'})");
                            break;
                        case 3:
                            WriteLog(GetLogValue(LogTitle, "Update", "CategoryModel", false), temp, 3); //写日志                      
                            Utils.RunJavaScript(this, "alert({jsMessage:'修改数据失败,请重试！',title:'提示信息'})");
                            break;
                    }
                }
            }
            else
            {
                Utils.UrlRedirect(this, "CategoryList.aspx", "失败，无新增操作权限请联系管理员");
            }
        }
        #endregion

        #region 获得数级
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
                        dot = parentDot + "├　";
                    }
                    else
                    {
                        dot = parentDot + "└　";
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

