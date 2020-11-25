using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using AllPower.Common;
using AllPower.Model.MemberManage;
using System.Text;
using System.Text.RegularExpressions;
using AllPower.Config;
using AllPower.BLL.SysManage;
using System.Data;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      何伟
    创建时间： 2010年10月22日
    功能描述： 会员用户接口 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion

namespace AllPower.WEB.main.Plus.API
{
    /// <summary>
    /// MemberWebService 的摘要说明 "http://tempuri.org/"
    /// </summary>
    [WebService(Namespace = "http://www.360hqb.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。
    [System.Web.Script.Services.ScriptService]
    public class MemberWebService : System.Web.Services.WebService
    {
        #region 业务操作类/属性
        AllPower.Model.MemberManage.Member member = new AllPower.Model.MemberManage.Member();        //会员实体对象
        AllPower.BLL.MemberManage.Member bllMember = new AllPower.BLL.MemberManage.Member();         //会员业务操作类

        private string currentMemberID;                                                            //当前cookie状态中的会员ID
        public string CurrentMemberID
        {
            get
            {
                if (HttpContext.Current.Request.Cookies["MemberInfo"] != null && HttpContext.Current.Request.Cookies["MemberInfo"].Value.ToString().Length > 0)
                {

                    currentMemberID = HttpContext.Current.Request.Cookies["MemberInfo"]["memberid"].ToString();
                }
                return currentMemberID;
            }
        }
        #endregion

        #region 注册
        /// <summary>
        /// 会员注册
        /// </summary>
        /// <param name="userName">用户名</param>
        /// <param name="userPwd">密码</param>
        /// <param name="email">邮箱</param>
        /// <returns>0:失败 1:成功 2:邮箱已被注册 3:用户名已经存在 4.输入的注册信息不合规范</returns>
        [WebMethod]
        public string RegisterUser(string userName, string userPwd, string email)
        {
            string ret = "";                                                    //返回的结果           
            string strName = "^[a-zA-Z]{1}([a-zA-Z0-9]|[-_]){3,15}$";           //只能输入4-16个以字母开头、可带数字、“_”、“-”的字串
            string strPwd = "^(\\w){6,16}$";                                    //长度在6-16位
            string strEmail = "^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$";    //email

            //验证的正则
            //RegexOptions options = (RegexOptions.IgnorePatternWhitespace | RegexOptions.Multiline | RegexOptions.IgnoreCase);
            Regex regEmail = new Regex(strEmail);
            Regex regName = new Regex(strName);
            Regex regPwd = new Regex(strPwd);

            //先验证信息是否合法
            if (regName.IsMatch(userName) && regPwd.IsMatch(userPwd) && regEmail.IsMatch(email))
            {
                //判断邮箱是否已被注册
                bool Email = bllMember.GetEmAndUsnByMID(email);
                if (!Email)
                {
                    member.Email = email;
                }
                else
                {
                    ret = "2";
                }

                //验证用户名是否存在
                member.UserName = userName;
                bool MID = bllMember.GetUsnByMID(userName);
                if (!MID)
                {
                    member.UserName = userName;
                }
                else
                {
                    ret = "3";
                }

                string password = userPwd;
                member.Password = AllPower.Common.Utils.getMD5(password);

                //生成Guid
                if (member.Password != "" && member.UserName != "")
                {
                    string strNo = Guid.NewGuid().ToString();
                    member.MemberID = strNo;
                }

                //调用注册方法，实行注册功能
                if (!"2".Equals(ret) && !"3".Equals(ret))           //先验证信息是否已被注册
                {
                    if (bllMember.RegisterUser(member))
                    {
                        ret = "1";      //成功
                    }
                    else
                    {
                        ret = "0";      //失败
                    }
                }
            }
            else
            {
                ret = "4";
            }
            return ret;
        }
        #endregion

        #region 登录
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="userName">用户名</param>
        /// <param name="pwd">密码</param>
        /// <returns>0:失败(用户名或密码错误) 1:成功</returns>
        [WebMethod]
        public string Login(string userName, string pwd)
        {
            string ret = "";

            member.UserName = userName;
            member.Password = AllPower.Common.Utils.getMD5(pwd);
            bool flag = bllMember.GetUsnAndPwd(member);
            if (flag)
            {
                ret = "1";
                HttpCookie cookies = new HttpCookie("MemberInfo");
                cookies["memberusername"] = member.UserName;
                cookies["memberid"] = member.MemberID;

                HttpContext.Current.Response.Cookies.Add(cookies);
            }
            else
            {
                ret = "0";
            }

            return ret;
        }
        #endregion

        #region 获取会员信息
        /// <summary>
        /// 获取当前ID的会员信息
        /// </summary>
        /// <param name="memberID">会员ID</param>
        /// <returns>会员信息</returns>
        [WebMethod]
        public AllPower.Model.MemberManage.Member GetUserInfoByMemberID(string memberID)
        {
            if (memberID.Length >= 36)                                        //判断ID是否合法和为空
            {
                if (bllMember.GetMember(memberID) != null)
                {
                    member = bllMember.GetMember(memberID);
                    member.HeadImg = GetUploadImgUrl() + member.HeadImg;      //完整的URL 
                    return member;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 获取当前上传文件的URL
        /// </summary>
        /// <returns>url</returns>
        protected string GetUploadImgUrl()
        {
            string reUrl;

            //获取当前站点信息
            string path = Server.MapPath("../../config/SiteParam.config");
            string siteDir = Utils.XmlRead(path, "SiteParamConfig/SiteDir", "");
            string siteId = Utils.XmlRead(path, "SiteParamConfig/SiteID", "");
            if (siteDir.Length < 0)                         //如果站点目录为空时,通过ID从数据库中取
            {
                SysWebSite bllWebSite = new SysWebSite();
                DataTable dt = bllWebSite.GetList("ONE", Utils.getOneParams(siteId));
                siteDir = dt.Rows[0]["Directory"].ToString();
            }

            string GetUploadImgPath = Server.MapPath("../../config/Upload.config");
            UploadConfig uploadobj = Upload.GetConfig(GetUploadImgPath);

            if (string.IsNullOrEmpty(uploadobj.ImageUrl))
            {
                reUrl = uploadobj.ImageSavePath + "/" + siteDir + "/Images";
            }
            else
            {
                reUrl = uploadobj.ImageUrl;
            }
            if (reUrl.Substring(reUrl.Length - 1) != "/")
            {
                reUrl = reUrl + "/";
            }

            return reUrl;
        }
        #endregion
    }
}
