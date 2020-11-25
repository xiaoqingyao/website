using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Xml.Linq;
using AllPower.BLL;
using AllPower.Model;
using AllPower.Common;


#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      涂芳
    创建时间： 2010年10月19日
    功能描述： 注册界面 
--===============================================================*/
#endregion

namespace AllPower.WEB
{
    public partial class Register : System.Web.UI.Page
    {
        #region 变量成员
        protected string jsMessage = string.Empty;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                this.lblUsnVel.Visible = false;
                this.lblEmalVel.Visible = false;
                this.lblVel.Visible = false;
            }
        }

        protected void btnregest_Click(object sender, EventArgs e)
        {
            AllPower.Model.MemberManage.Member member = new AllPower.Model.MemberManage.Member();
            AllPower.BLL.MemberManage.Member memberbll = new AllPower.BLL.MemberManage.Member();

            if (txtseds.Text.ToLower() != Session[SystemConst.SESSION_VALIDATECODE].ToString().ToLower())
            {
                txtseds.Text = "";
                this.lblVel.Visible = true;
                return;
            }else{
                this.lblVel.Visible = false;
                //调用GetEmAndUsnByMID,判断邮箱是否已被注册
                bool Email = memberbll.GetEmAndUsnByMID(this.txtemail.Text);
                if (!Email)
                {
                    this.lblEmalVel.Visible = false;
                    member.Email = this.txtemail.Text;
                }
                else
                {
                    txtemail.Text = "";
                    this.lblEmalVel.Visible = true;
                    return;
                }

                member.UserName = this.txtusn.Text;

                #region bool型
                bool MID =  memberbll.GetUsnByMID(this.txtusn.Text);
                if (!MID)
                {
                    this.lblUsnVel.Visible = false;
                    member.UserName = this.txtusn.Text;
                }
                else
                {
                    this.lblUsnVel.Visible = true;
                    return;
                }
                #endregion

                string password = this.txtpwd.Text;
                member.Password = AllPower.Common.Utils.getMD5(password);
                
                //生成Guid
                if (member.Password != "" && member.UserName != "")
                {
                    string strNo = Guid.NewGuid().ToString();
                    member.MemberID = strNo;
                }
            }

                //调用注册方法，实行注册功能
                if (memberbll.RegisterUser(member))
                {
                        jsMessage = "alert({msg:'注册成功！',title:'提示信息'})";
                        return;
                    
                }
                else
                {
                    jsMessage = "alert({msg:'注册失败！',title:'提示信息'})";   
                    return;
                }
            }
           
        }

    }



