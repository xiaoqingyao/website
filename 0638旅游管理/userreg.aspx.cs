﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class userreg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            xingbie.Items.Add("male");
            xingbie.Items.Add("female");
            //addxiala("kehuxinxi", "bianhao", "kehubianhao");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        if (new Class1().IsEmail(youxiang.Text.ToString().Trim()))
        { }
        else
        {
            Response.Write("<script>javascript:alert('邮相格式不正确');history.back();</script>");
            Response.End();
        }
        string sql;
        sql = "insert into yonghuzhuce(yonghuming,mima,xingming,dianhua,youxiang,QQ,touxiang,jiguan,dizhi,xingbie,beizhu) values('" + yonghuming.Text.ToString().Trim() + "','" + mima.Text.ToString().Trim() + "','" + xingming.Text.ToString().Trim() + "','" + dianhua.Text.ToString().Trim() + "','" + youxiang.Text.ToString().Trim() + "','" + QQ.Text.ToString().Trim() + "','" + touxiang.Text.ToString().Trim() + "','" + jiguan.Text.ToString().Trim() + "','" + dizhi.Text.ToString().Trim() + "','" + xingbie.Text.ToString().Trim() + "','" + beizhu.Text.ToString().Trim() + "') ";
        int result;
        result = new Class1().hsgexucute(sql);
        if (result == 1)
        {
            Response.Write("<script>javascript:alert('注册成功，请待管理员审核后方可登陆！');location.href='default.aspx';</script>");
            Response.End();
        }
        else
        {
            Response.Write("<script>javascript:alert('系统错误，请检查数据库设置问题');</script>");
        }
    }

}

