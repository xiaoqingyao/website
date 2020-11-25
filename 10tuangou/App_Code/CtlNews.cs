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
/// CtlNews 的摘要说明
/// </summary>
public class CtlNews
{
    DataBase db = new DataBase();
	public CtlNews()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public Boolean insertnews(EntNews en)//发布新闻
    {
        string sql = "insert sys_news values('"+en.NewsTitle+"','"+en.Content+"','"+en.Name+"','"+en.Time+"')";
        try
        {
            int i = db.ExecuteNonQuery(sql);
            if (i == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }
    public Boolean deletenews(string newsid)//删除新闻
    {
        string sql = "delete sys_news where newsId='" + newsid+ "'";
        try
        {
            int i = db.ExecuteNonQuery(sql);
            if (i == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }
    public DataTable selectnews()//取所有新闻
    {
        string sql = "select * from sys_News";
        DataTable dt = new DataTable();
           try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {

        }
        return dt;
    
    }
    public DataTable selectByNewsIdnews(string nid)//查找对应ID的新闻
    {
        string sql = "select * from sys_News where newsId='"+nid+"'";
        DataTable dt = new DataTable();
        try
        {
            dt = db.RunDataSet(sql).Tables[0];
        }
        catch
        {

        }
        return dt;

    }
}
