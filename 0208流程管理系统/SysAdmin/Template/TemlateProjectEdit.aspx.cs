using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AllPower.Common;
using AllPower.Template;
using System.Text;
using System.Data;

/*================================================================
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月1日    功能描述： 方案添加/修改 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class TemlateProjectEdit : AllPower.Web.Admin.AdminPage
    {
        #region 属性字段
        private string _urlid = null;
        AllPower.Model.TemplateProject model = new AllPower.Model.TemplateProject();
        AllPower.BLL.TemplateProject bll = new AllPower.BLL.TemplateProject();

        public string ID            //URL参数方案id
        {
            get
            {
                if (this._urlid == null)
                {
                    this._urlid = Convert.ToString(Utils.ReqUrlParameter("id")).ToUpper();
                }

                return this._urlid;
            }
        }
        #endregion

        #region 页面加载


        /// <summary>
        /// 
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

        /// <summary>
        /// 页面初始化

        /// </summary>
        protected void PageInit()
        {
            if (Action == "EDIT")                                                   //修改时显示基本的信息
            {
                DataTable dt = bll.GetList("ONE", Utils.getOneParams(ID));
                this.txtTitle.Text = dt.Rows[0]["Title"].ToString();
                this.txtDirectory.Text = dt.Rows[0]["Directory"].ToString();
                this.txtDevise.Text = dt.Rows[0]["Devise"].ToString();
                this.txtWidth.Text = dt.Rows[0]["Width"].ToString();
                this.ImgLogo.Value = dt.Rows[0]["Thumbnail"].ToString();
                this.txtIntro.Text = dt.Rows[0]["Intro"].ToString();

                ViewState["Directory"] = this.txtDirectory.Text;                    //保存方案目录
                ViewState["IsDefault"] = dt.Rows[0]["IsDefault"].ToString();        //保存默认值状态
                ViewState["IsDel"] = dt.Rows[0]["IsDel"].ToString();                //是否删除
                ViewState["DeTime"] = dt.Rows[0]["DeTime"].ToString();              //删除时间
            }
        }

        #endregion

        #region 添加/修改

        private void Save()
        {
            string temp = "0";          //返回的结果提示
            int result = 0;
            string logTitle = hidLogTitle.Value;
            if (base.IsHaveRightByOperCode("New"))
            {
                //================添加======================//
                if (Action == "NEW")
                {
                    model.ID = Guid.NewGuid().ToString();
                    model.Title = this.txtTitle.Text;
                    model.Directory = bll.CreateProDir(SiteDir, SiteID);
                    model.Devise = this.txtDevise.Text;
                    model.Width = Convert.ToInt32(this.txtWidth.Text);
                    model.Intro = this.txtIntro.Text;
                    model.IsDefault = false;
                    model.Thumbnail = this.ImgLogo.Value;
                    model.IsDel = false;
                    model.DeTime = DateTime.Now;
                    model.NodeCode = NodeCode;
                    model.AddMan = txtDevise.Text;
                    model.SiteID = SiteID;
                    model.AddTime = DateTime.Now;
                    logTitle = txtTitle.Text.Trim();

                    temp = bll.Save("NEW", model);
                    result = Utils.ParseInt(temp, 0);
                    switch (result)
                    {
                        case 1:
                            bll.CreateDefaultSkin(result, model.Directory);                                    //设置默认风格
                            WriteLog(GetLogValue(logTitle, Action, "TemplateProject", true), txtTitle.Text, 2);//写日志;
                            Utils.RunJavaScript(this, "type=0" + ";title='" + Utils.AlertMessage(txtTitle.Text) + "';id='" + model.ID + "'");
                            break;
                        case 2:
                            WriteLog(GetLogValue(logTitle, Action, "TemplateProject", false), temp, 3);        //写日志
                            Utils.RunJavaScript(this, "type=2;errmsg='名称已经存在！" + "';id='" + model.ID + "'");
                            break;
                        default:
                            WriteLog(GetLogValue(logTitle, Action, "TemplateProject", false), temp, 3);        //写日志
                            Utils.RunJavaScript(this, "type=2;errmsg='添加失败，请重试！" + "';id='" + model.ID + "'");
                            break;
                    }
                }
                //================修改======================//
                else if (Action == "EDIT")
                {
                    model.ID = this.ID;
                    model.Title = this.txtTitle.Text;
                    model.Devise = this.txtDevise.Text;
                    model.Width = Convert.ToInt32(this.txtWidth.Text);
                    model.Intro = this.txtIntro.Text;
                    model.Thumbnail = this.ImgLogo.Value;
                    if (ViewState["Directory"] != null)
                    {
                        model.Directory = Convert.ToString(ViewState["Directory"]);
                    }
                    if (ViewState["IsDefault"] != null)
                    {
                        model.IsDefault = Convert.ToBoolean(ViewState["IsDefault"]);
                    }
                    if (ViewState["IsDel"] != null) { }
                    {
                        model.IsDel = Convert.ToBoolean(ViewState["IsDel"]);
                    }
                    if (ViewState["DeTime"] != null)
                    {
                        model.DeTime = Convert.ToDateTime(ViewState["DeTime"]);
                    }
                    model.NodeCode = NodeCode;
                    model.AddMan = txtDevise.Text;
                    model.SiteID = SiteID;
                    model.AddTime = DateTime.Now;
                    logTitle = txtTitle.Text.Trim();

                    temp = bll.Save("EDIT", model);
                    result = Utils.ParseInt(temp, 0);
                    switch (result)
                    {
                        case 1:
                            WriteLog(GetLogValue(logTitle, Action, "TemplateProject", true), txtTitle.Text, 2);    //写日志;
                            Utils.RunJavaScript(this, "type=1" + ";title='" + Utils.AlertMessage(txtTitle.Text) + "';id='" + model.ID + "'");
                            break;
                        case 2:
                            WriteLog(GetLogValue(logTitle, Action, "TemplateProject", false), temp, 3);    //写日志
                            Utils.RunJavaScript(this, "type=2;errmsg='名称已经存在！" + "';id='" + model.ID + "'");
                            break;
                        default:
                            WriteLog(GetLogValue(logTitle, Action, "TemplateProject", false), temp, 3);    //写日志
                            Utils.RunJavaScript(this, "type=2;errmsg='修改失败，请重试！" + "';id='" + model.ID + "'");
                            break;
                    }
                }
            }
            else
            {
                Utils.UrlRedirect(this, "TemplateProjectList.aspx?Action=ALL&NodeCode=" + NodeCode, "失败，无新增操作权限!");
            }
        }

        #region 获取实体
        #endregion

        #endregion

        #region 添加/修改的事件
        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.Save();
        }
        #endregion
    }
}
