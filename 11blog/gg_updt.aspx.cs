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

public partial class gg_updt : System.Web.UI.Page
{
    public string sql, dID;

    protected void Page_Load(object sender, EventArgs e)
    {
        dID = Request.QueryString["id"].ToString().Trim();
        if (!IsPostBack)
        {
            //页面初始化时,先查找所有当前ID 的数据信息
            sql = "select * from allgonggao where id=" + dID;
            getdata(sql); //调用getdata函数,为把读取到的数据显示出来
        }
    }
    private void getdata(string sql) //自定义函数,用于读取并显示数据
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                title.Text = result.Tables[0].Rows[0]["title"].ToString().Trim();  //给文本框赋值
                WebEditor1.Text = result.Tables[0].Rows[0]["content"].ToString().Trim(); //给文本框赋值
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //修改操作,修改当前ID的数据
        sql = "update allgonggao set title='" + title.Text.ToString().Trim() + "',content='" + WebEditor1.Text + "' where id=" + dID;
        int result;
        result = new Class1().hsgexucute(sql); //执行sql语句
        if (result == 1)
        {
            Response.Write("<script>javascript:alert('修改成功');</script>"); //执行成功,给出提示
        }
        else
        {
            Response.Write("<script>javascript:alert('系统错误');</script>");// 执行失败则也给出提示
        }
    }
}
