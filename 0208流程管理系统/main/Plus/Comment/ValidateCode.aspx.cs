using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      何伟
    创建时间： 2010年10月13日
    功能描述： 评论表单验证生成
 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion
namespace AllPower.WEB.main.Plus.Comment
{
    public partial class ValidateCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AllPower.Common.ValidateCode.Create();       //生成验证码
            }
        }
    }
}
