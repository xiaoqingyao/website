using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

    /// <summary>
    /// book 的摘要说明
    /// </summary>
    public class book  //以下代码仅定义一些全局变量,用于记录用户填写的信息,如用户名,邮箱,QQ,性别等
    {
        public string username;
        public string email;
        public string homepage;
        public string qq;
        public string sex;
        public bool ishide;
        public string face;
        public string body;
        public book()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
    }
