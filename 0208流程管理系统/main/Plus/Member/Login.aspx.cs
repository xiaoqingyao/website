using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using AllPower.Common;
using AllPower.Model;
using AllPower.BLL.MemberManage;
using AllPower.Model.SysManage;
using AllPower.Web.Admin;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      涂芳
    创建时间： 2010年10月19日
    功能描述： 登陆界面 
--===============================================================*/
#endregion

namespace AllPower.WEB
{
    public partial class Login : System.Web.UI.Page
    {
        #region 变量成员
        protected string jsMessage = string.Empty;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) 
            {
            }
        }
        //按钮事件，进行登录操作
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
                //判断验证码
                if (txtyzm.Text.ToLower() != Session[SystemConst.SESSION_VALIDATECODE].ToString().ToLower())
                {
                    txtyzm.Text = "";
                    jsMessage = "alert({msg:'验证码输入错误！',title:'提示信息'})";
                    return;
                }
                else
                {
                    AllPower.Model.MemberManage.Member member = new AllPower.Model.MemberManage.Member();
                     member.UserName = this.txtusn.Text;
                    string password = this.txtpwd.Text;
                    member.Password = AllPower.Common.Utils.getMD5(password);
                    AllPower.BLL.MemberManage.Member mMem=new AllPower.BLL.MemberManage.Member();
                    bool flag = mMem.GetUsnAndPwd(member);
                    if (flag)
                    { 
                        HttpCookie cookies = new HttpCookie("userName");
                        cookies["memberusername"] = member.UserName;
                        cookies["memberid"] = member.MemberID;
                        if (chbusername.Checked)
                        {
                            cookies.Expires = DateTime.Now.AddDays(30);
                        }
                        Response.Cookies.Add(cookies);
                        Response.Redirect("~/Main.aspx");
                    }
                    else
                    {
                        jsMessage = "alert({msg:'用户名或密码输入错误！',title:'提示信息'})";
                        return;
                    }
                }
            }
         
        

      
    }
}
