using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Web.Admin;
using System.Data;
using AllPower.Common;
/*================================================================
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月30日    功能描述： 显示当前站点通用的所有标签
// 更新日期        更新人      更新原因/内容
--===============================================================*/

namespace AllPower.WEB.SysAdmin.Template
{
    public partial class AllLable : AdminPage
    {
        #region 初始化
        private AllPower.BLL.Template.Lable lable = new AllPower.BLL.Template.Lable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataInitial();
            }
        }

        /// <summary>
        /// 加载标签数据
        /// </summary>
        protected void DataInitial()
        {
            AllPower.Model.SelectParams prams = new AllPower.Model.SelectParams();
            prams.I2 = 0;
            prams.I3 = -1;
            prams.S1 = "";
            prams.S2 = "";
            prams.S3 = SiteID.ToString();

            DataSet ds = lable.GetLable("LABLELIST", prams);           //所有标签集
            if (ds != null)
            {
                DataTable dt = ds.Tables[1];                          //取出所有标签列表
                rptLableList.DataSource = dt;
                rptLableList.DataBind();
            }
        }

        //项绑定事件
        protected void rptLableList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            LinkButton lbtn = (LinkButton)e.Item.FindControl("lbtnLable");                //找标签按钮

            if (lbtn != null)
            {

                string lableId = lbtn.CommandArgument;       //标签的
                string lName = string.Empty;                   //标签的名称               
                string lContent = string.Empty;                 //标签的内容
                string lTitle = string.Empty;               //标题名

                //获取当前标签信息
                DataTable dt = new AllPower.BLL.Template.Lable().GetLable("OneLable", Utils.getOneParams(lableId)).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    lContent = dt.Rows[0]["LableContent"].ToString();
                    lName = dt.Rows[0]["LableName"].ToString();
                    lTitle = dt.Rows[0]["Title"].ToString();
                    if (lbtn.Text.Length > 8)
                    {
                        lbtn.Text = lbtn.Text.Substring(0, 8);
                    }
                    switch (Convert.ToInt32(dt.Rows[0]["IsSystem"]))
                    {
                        case 0:     //静态
                            lbtn.Attributes.Add("OnClick", "insert('" + lName + "');return false;");
                            break;
                        case 1:     //系统
                            if (lContent.IndexOf(" LableType=\"NAV\"") != -1 || lContent.IndexOf(" LableType=\"MENU\"}") != -1)        //栏目
                            {
                                lbtn.Attributes.Add("OnClick", "openframe({ url: 'ColumnType.aspx?id=" + lableId + "&lableName=" + lTitle + "', width: '750', height: '330',title:'编辑栏目标签参数' });return false;");
                            }
                            else if (lContent.IndexOf(" LableType=\"LIST\"") != -1)                                              //列表,再分幻灯片类型,专题列表类型
                            {
                                if (lContent.IndexOf("TableName=\"K_U_Commend\"") != -1)
                                {
                                    lbtn.Attributes.Add("OnClick", "window.parent.insert('" + lName + "');return false;");                //幻灯片类型
                                }
                                else if (lContent.IndexOf("TableName=") == -1)                                              //专题列表类型
                                {
                                    lbtn.Attributes.Add("OnClick", "openframe({ url: 'SpecialType.aspx?id=" + lableId + "&lableName=" + lTitle + "', width: '720', height: '460',title:'编辑专题列表标签参数' });return false;");
                                }
                                else                                                                                        //通用列表类型
                                {
                                    lbtn.Attributes.Add("OnClick", "openframe({ url: 'PublicListType.aspx?id=" + lableId + "&lableName=" + lTitle + "', width: '750', height: '480',title:'编辑通用列表标签参数' });return false;");
                                }
                            }
                            else if (lContent.IndexOf(" LableType=\"CONTENT\"") != -1)                                          //详细
                            {
                                lbtn.Attributes.Add("OnClick", "openframe({ url: 'DetailPageType.aspx?id=" + lableId + "&lableName=" + lTitle + "', width: '510', height: '300',title:'编辑详细页面类型' });return false;");
                            }
                            else if (lContent.IndexOf(" LableType=\"Periodical\"") != -1)                                       //期刊
                            {
                                lbtn.Attributes.Add("OnClick", "openframe({ url: 'PeriodicalType.aspx?id=" + lableId + "&lableName=" + lTitle + "', width: '600', height: '320',title:'编辑期刊列表标签参数' });return false;");
                            }
                            break;
                        case 2:     //分页
                            lbtn.Attributes.Add("OnClick", "openframe({ url: 'ParameterSplit.htm?lName=" + lName.Split(' ')[0] + "', width: '680', height: '160' ,title:'编辑分页标签参数'});return false;");
                            break;
                        case 10:   //自由
                            lbtn.Attributes.Add("OnClick", "openframe({ url: 'ParamFree.aspx?lName=" + lName.Split(' ')[0] + "', width: '680', height: '400',title:'编辑自由标签参数' });return false;");
                            break;
                    }
                }
            }
        }
        #endregion
    }
}
