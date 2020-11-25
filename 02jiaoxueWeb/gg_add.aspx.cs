using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class gg_add : System.Web.UI.Page
{
    public string lb,lbtxt,sql; //定义全局变量
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        lb = Request.QueryString["lb"].ToString().Trim();  //类别为提交来的参数,即分为新闻中心和网站规章
        switch (lb)
        {
            case "1":
                lbtxt = "新闻中心";
                break;
            case "2":
                lbtxt = "网站规章";
                break;

        }
        //sql语句意思是:向allgonggao表中插入新数据
        sql = "insert into allgonggao(title,content,leibie) values('" + title.Text.ToString().Trim() + "','" + WebEditor1.Text + "','" + lbtxt + "')";
        int result;
        result = new Class1().hsgexucute(sql); //执行此sql语句
        if (result == 1)
        {
            Response.Write("<script>javascript:alert('添加成功');</script>"); //如果执行成功,则给出提示
        }
        else
        {
            Response.Write("<script>javascript:alert('系统错误');</script>");//如果失败,则也给出提示
        }
    }
}
