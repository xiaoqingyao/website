using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop.Common;
using KingTop.Web.Admin;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      何伟
    创建时间： 2010年10月15日    功能描述： 评论模板列表
 * 
--===============================================================*/
#endregion
namespace KingTop.WEB.SysAdmin.Model
{
    public partial class CommentTemplateList : AdminPage
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
            string advPath = string.Format("{0}Plus/Comment/", dirPath);           //生成文件调用目录
            if (!"/".Equals(advPath.Substring(advPath.Length - 1, 1)))
            {
                advPath += "/";
            }
            jsCode = string.Format("{0}{1}{2}", "&lt;iframe src='", advPath + fileName, "' width='700px' scrolling='no'&gt;&lt;/iframe&gt;");
            return jsCode;
        }
        #endregion
    }
}
