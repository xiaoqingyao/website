using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.IO;
using System.Data;
using AllPower.Template;

/*================================================================
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月6日    功能描述： 风格添加/修改 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/

namespace AllPower.WEB.SysAdmin.Template
{
    public partial class TemplateSkinEdit : AllPower.Web.Admin.AdminPage
    {
        #region 属性字段
        AllPower.Model.TemplateSkin model = new AllPower.Model.TemplateSkin();
        AllPower.BLL.TemplateSkin bll = new AllPower.BLL.TemplateSkin();
        AllPower.Model.SelectParams sp = new AllPower.Model.SelectParams();
        AllPower.BLL.TemplateProject tpBll = new AllPower.BLL.TemplateProject();

        private string _urlid = null;
        public string ID            //URL参数方案id
        {
            get
            {
                if (this._urlid == null)
                {
                    this._urlid = Convert.ToString(Utils.ReqUrlParameter("id"));
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
        private void PageInit()
        {
            BindDllProject();                                                       //绑定方案名
            if (Action == "EDIT")                                                   //修改时显示基本的信息
            {
                DataTable dt = bll.GetList("ONE", Utils.getOneParams(ID));
                this.txtTitle.Text = dt.Rows[0]["SkinName"].ToString();
                this.txtDirectory.Text = dt.Rows[0]["Dirct"].ToString();
                this.txtDevise.Text = dt.Rows[0]["Devise"].ToString();
                this.txtIntro.Text = "";

                ViewState["Dirct"] = this.txtDirectory.Text;                        //保存风格目录
                ViewState["IsDefault"] = dt.Rows[0]["IsDefault"].ToString();        //保存默认值状态
                ViewState["IsDel"] = dt.Rows[0]["IsDel"].ToString();                //是否删除
                ViewState["DelTime"] = dt.Rows[0]["DelTime"].ToString();            //删除时间
            }
        }

        /// <summary>
        /// 绑定方案名
        /// </summary>
        private void BindDllProject()
        {
            sp.I1 = SiteID;                                                                   //站点ID
            DataTable tpDt = tpBll.GetList("ALL", sp);                                       //所有方案信息
            ddlProjects.DataSource = tpDt;                                                   //绑定
            ddlProjects.DataTextField = "Title";                                              //显示字段
            ddlProjects.DataValueField = "ID";                                               //绑定值字段
            ddlProjects.DataSource = tpDt;                                                   //绑定
            this.ddlProjects.DataBind();
        }

        #endregion

        #region 添加/修改

        private void Save()
        {
            string temp = "0";          //返回的结果提示
            int result = 0;

            if (base.IsHaveRightByOperCode("New"))
            {
                //================添加======================//
                if (Action == "NEW")
                {
                    model.ID = Guid.NewGuid().ToString();
                    model.SkinName = this.txtTitle.Text;
                    model.ProjectID = this.ddlProjects.SelectedValue;
                    model.Dirct = CreateProjectDirectory();
                    model.Devise = this.txtDevise.Text;
                    model.IsDefault = false;
                    model.IsDel = false;
                    model.DelTime = DateTime.Now;
                    model.NodeCode = NodeCode;
                    model.AddMan = txtDevise.Text;
                    model.SiteID = SiteID;
                    model.AddTime = DateTime.Now;

                    temp = bll.Save("NEW", model);
                    result = Utils.ParseInt(temp, 0);
                    switch (result)
                    {
                        case 1:
                            //加载默认的样式和脚本到当前风格
                            string fromDir = "~/SysAdmin/Template/Temp";                                             //源文件的目录
                            if (fromDir.Length > 0 && model.Dirct.Length > 0)
                            {
                                string destination = Server.MapPath("~/SysAdmin/Template/" + model.Dirct);           //当前的风格目录路径
                                DirectoryInfo sourceDir = new DirectoryInfo(Server.MapPath(fromDir));                //创建临时存放系统风格文件目录
                                DirectoryInfo destinationDir = new DirectoryInfo(destination);                       //创建当前风格目录
                                LabelUtils.CopyDirectory(sourceDir, destinationDir);                                 //移动系统风格文件到新建的风格
                            }
                            WriteLog(GetLogValue(txtTitle.Text.Trim(), Action, "TemplateStyle", true), "", 2);           //写日志;
                            Utils.RunJavaScript(this, "type=0" + ";title='" + Utils.AlertMessage(txtTitle.Text) + "';id='" + model.ID + "'");
                            break;
                        case 2:
                            WriteLog(GetLogValue(txtTitle.Text.Trim(), Action, "TemplateStyle", false), temp, 3);        //写日志
                            Utils.RunJavaScript(this, "type=2;errmsg='名称已经存在！" + "';id='" + model.ID + "'");
                            break;
                        default:
                            WriteLog(GetLogValue(txtTitle.Text.Trim(), Action, "TemplateStyle", false), temp, 3);        //写日志
                            Utils.RunJavaScript(this, "type=2;errmsg='添加失败，请重试！" + "';id='" + model.ID + "'");
                            break;
                    }
                }
                //================修改======================//
                else if (Action == "EDIT")
                {
                    model.ID = this.ID;
                    model.SkinName = this.txtTitle.Text;
                    model.ProjectID = this.ddlProjects.SelectedValue;
                    model.Devise = this.txtDevise.Text;
                    if (ViewState["Dirct"] != null)
                    {
                        model.Dirct = Convert.ToString(ViewState["Dirct"]);
                    }
                    if (ViewState["IsDefault"] != null)
                    {
                        model.IsDefault = Convert.ToBoolean(ViewState["IsDefault"]);
                    }
                    if (ViewState["IsDel"] != null) { }
                    {
                        model.IsDel = Convert.ToBoolean(ViewState["IsDel"]);
                    }
                    if (ViewState["DelTime"] != null)
                    {
                        model.DelTime = Convert.ToDateTime(ViewState["DelTime"]);
                    }
                    model.NodeCode = NodeCode;
                    model.AddMan = txtDevise.Text;
                    model.SiteID = SiteID;
                    model.AddTime = DateTime.Now;

                    temp = bll.Save("EDIT", model);

                    result = Utils.ParseInt(temp, 0);
                    switch (result)
                    {
                        case 1:
                            WriteLog(GetLogValue(txtTitle.Text.Trim(), Action, "TemplateStyle", true), "", 2);           //写日志;
                            Utils.RunJavaScript(this, "type=1" + ";title='" + Utils.AlertMessage(txtTitle.Text) + "';id='" + model.ID + "'");
                            break;
                        case 2:
                            WriteLog(GetLogValue(txtTitle.Text.Trim(), Action, "TemplateStyle", false), temp, 3);        //写日志
                            Utils.RunJavaScript(this, "type=2;errmsg='名称已经存在！" + "';id='" + model.ID + "'");
                            break;
                        default:
                            WriteLog(GetLogValue(txtTitle.Text.Trim(), Action, "TemplateStyle", false), temp, 3);        //写日志
                            Utils.RunJavaScript(this, "type=2;errmsg='修改失败，请重试！" + "';id='" + model.ID + "'");
                            break;
                    }
                }
            }
            else
            {
                Utils.UrlRedirect(this, "TemplateSkinList.aspx?Action=ALL&NodeCode=" + NodeCode, "失败，无新增操作权限!");
            }
        }

        #region 保存事件
        protected void btnConserve_Click(object o, EventArgs e)
        {
            this.Save();
        }
        #endregion

        #endregion

        #region 生成目录

        /// <summary>
        /// 根据ID查询方案目录名
        /// </summary>
        /// <param name="id">方案ID</param>
        /// <returns>方案名</returns>
        public string GetProjectDirNameById(string id)
        {
            string dirName = "";
            sp.S1 = id;
            DataTable dt = tpBll.GetList("ONE", sp);                 //获取指定的方案信息
            dirName = dt.Rows[0]["Directory"].ToString();             //查询指定ID方案
            return dirName;
        }

        /// <summary>
        /// 自动创建目录
        /// </summary>
        /// <returns>自动生成的名字</returns>
        private string CreateProjectDirectory()
        {
            string dirName = "";                                                            //目录名
            string indexPath = "~/SysAdmin/Template/";                                      //根目录
            string sPath = GetProjectDirNameById(this.ddlProjects.SelectedValue);           //取出选中的方案目录名
            DataTable dt = bll.GetList("LASTONE", Utils.getOneNumParams(SiteID));           //得到最后的一个风格目录名 
            string strDirectory = "";                                                      //最后一个的风格目录名
            if (dt.Rows.Count > 0)                                                         //判断是否有风格的记录
            {
                strDirectory = dt.Rows[0]["Dirct"].ToString();
            }
            try
            {
                if (!strDirectory.Equals("") && strDirectory.Length > 0)                     //当目录名不为空时,对目录名加一如:S01,则返回S02
                {
                    dirName = GetNo(strDirectory);
                }
                else                                                                          //否则从生成第一个初始值目录名
                {
                    dirName = sPath + "S01";
                }

                if (Directory.Exists(dirName))                        //验证目录是否已经存在
                {
                    Utils.RunJavaScript(this, "alert({jsMessage:'目录已经存在！',title:'提示信息'})");
                }
                else
                {
                    Directory.CreateDirectory(Server.MapPath(indexPath + dirName));
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return dirName;
        }

        /// <summary>
        /// 取得编号
        /// 如GetNo("P01"),返回"P02"
        /// </summary>
        /// <param name="strIn">基础编号</param>
        /// <returns>新编号</returns>
        public static string GetNo(string strIn)
        {
            string res = "";                             //返回的编号

            if (!strIn.Equals("") && strIn.Length > 0)  //目录名不为空
            {
                string[] chars = strIn.Split('S');        //取出目录名和编号的字符串数组           
                string dName = chars[0];               //前面的目录名字
                string strNo = chars[1];               //获取后面的数字编号

                string strNum = "";                  //新的编号
                int num = Int32.Parse(strNo);        //转换成数字对其加1操作,并返回01,02这种类型   
                num += 1;
                strNum = num.ToString("00");

                res = dName + "S" + strNum;
            }
            return res;
        }

        #endregion

    }
}
