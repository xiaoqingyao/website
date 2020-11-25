#region 引用程序集
using System;
using System.Collections;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.Xml;
using System.Xml.XPath;

using AllPower.Web.Admin;
using AllPower.Common;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年6月24日
    功能描述： 专题信息评论设置
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class SetSpecialInfoComment : AdminPage
    {
        #region 变量成员
        BLL.SysManage.SpecialInfoList specialInfoList;
        protected string jsMessage;
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            specialInfoList = new AllPower.BLL.SysManage.SpecialInfoList();

            if (string.IsNullOrEmpty(this.ID))
            {
                Response.Write("<script type=\"\">alert({title:'警告',msg:'参数传递错误！'});parent.Closed();");
                Response.End();
            }
            else
            {
                if (!IsPostBack)
                {
                    DataTable dt;

                    dt = specialInfoList.GetSpecialInfoByID(this.ID);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        txtCommentTitle.Text = dt.Rows[0]["CommentTitle"].ToString();
                        txtOpposeCount.Text = dt.Rows[0]["OpposeCount"].ToString();
                        txtOpposeView.Text = dt.Rows[0]["OpposeView"].ToString();
                        txtSupportCount.Text = dt.Rows[0]["SupportCount"].ToString();
                        txtSupportView.Text = dt.Rows[0]["SupportView"].ToString();
                    }
                }
            }
        }
        #endregion

        #region 更新
        protected void Edit(object sender, EventArgs e)
        {
            Hashtable hsFieldValue;
            int effectRow;

            hsFieldValue = new Hashtable();

            hsFieldValue.Add("CommentTitle", txtCommentTitle.Text);
            hsFieldValue.Add("OpposeCount", txtOpposeCount.Text);
            hsFieldValue.Add("OpposeView", txtOpposeView.Text);
            hsFieldValue.Add("SupportCount", txtSupportCount.Text);
            hsFieldValue.Add("SupportView", txtSupportView.Text);

           effectRow = specialInfoList.Edit(hsFieldValue, this.ID);
           if (effectRow > 0)  // 成功
           {
               jsMessage = "alertClose({title:'操作结果',msg:'恭喜您，操作成功！'},function(){parent.Closed();});";
           }
           else  // 失败
           {
               jsMessage = "alertClose({title:'操作结果',msg:'对不起，操作失败，请重试。'},function(){parent.Closed();});";
           }

        }
        #endregion
    }
}