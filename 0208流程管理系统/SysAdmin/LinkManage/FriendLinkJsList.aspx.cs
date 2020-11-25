using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower;
using AllPower.Common;
using AllPower.Web.Admin;
using System.Text;
using System.Data;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      何伟
    创建时间： 2010年10月17日
    功能描述： 友情链接的模板列表
 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class FriendLinkJsList : AdminPage
    {
        #region 页面初始化加载
        protected string strNowTime = "";       //当前的时间
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                strNowTime = DateTime.Now.ToString("s");
            }
        }

        /// <summary>
        /// 获取调用代码
        /// </summary>
        /// <param name="fileName">生成的文件名</param>
        /// <returns>调用文件代码</returns>
        public string GetJsCode(string fileName)
        {
            string jsCode = "";                                                    //调用的代码
            string dirPath = GetSiteDomain();                                      //获取当前站点路径(跨站用)
            string advPath = string.Format("{0}Plus/FriendLink/", dirPath);        //生成文件调用目录
            if (!"/".Equals(advPath.Substring(advPath.Length - 1, 1)))
            {
                advPath += "/";
            }
            jsCode = string.Format("{0}{1}{2}", "&lt;iframe src='", advPath + fileName, "' frameborder='0' width='880px' scrolling='no'&gt;&lt;/iframe&gt;");
            return jsCode;
        }
        #endregion
    }
}
