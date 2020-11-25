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
/// CtlMark 的摘要说明
/// </summary>
public class CtlMark
{
    DataBase DB = new DataBase();
    DataSet DS = new DataSet();
	public CtlMark()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /*获取所有头衔的信息*/
    public DataSet getMarkManager()
    {
        string strSql = "select * from f_perMark";
        return DS = DB.RunDataSet(strSql);
    }
    /*添加头衔*/
    public Boolean addMark(EntMark EMK)
    {
        string strSql = "insert into f_perMark(markName,markStart,markEnd,markPhoto)values('" + EMK.MarkName + "','" + Convert.ToInt32(EMK.MarkStart) + "','" + Convert.ToInt32(EMK.MarkEnd) + "','" + EMK.MarkPhoto + "')";
        if (DB.ExecuteNonQuery(strSql).Equals(1))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    /*更新头衔名称*/
    public Boolean markUpdate(string markId, string markName,string markPhoto)
    {
        string strSql = "update f_perMark set markName='" + markName + "',markPhoto='" + markPhoto + "' where markId='" + markId + "'";
        if (DB.ExecuteNonQuery(strSql).Equals(1))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    /*删除头衔*/
    public Boolean deleteMarkById(int markId)
    {
        string strSql = "delete f_perMark where markId=" + markId;
        if (DB.ExecuteNonQuery(strSql).Equals(1))
        {
            return true;
        }
        else
        {
            return false;
        }

    }
    /*根据头衔积分搜索*/
    public DataSet selectMarkById(string mark)
    {
        string strSql;
        if (mark == "")
        {
            strSql = "select * from f_perMark";
        }
        else
        {
            int imark = Convert.ToInt32(mark);
            strSql = "select * from f_perMark where markStart<" + imark + "and markEnd>"+imark;
        }

        return DS = DB.RunDataSet(strSql);
    }
}
