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
/// CtlDiscuss 的摘要说明
/// </summary>
public class CtlDiscuss
{
    DataBase DB = new DataBase();
    DataSet DS = new DataSet();
	public CtlDiscuss()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    
  

    /*根据条件获取回复信息如：所回复帖子的ID，回复人*/
    public DataSet getDiscussInfo(string noteTitle,string perName)
    {
        string strSql = "select fDiscussId,n.noteId,discussContent,n.perName,disDateTime,noteTitle from f_discuss d join f_notes n on d.noteId=n.noteId";
        if (noteTitle != "")
        {
            strSql = strSql + "where noteTitle='" + noteTitle + "'";
        }
        else
        {
            if (perName != "")
            {
                strSql = strSql + " and perName='" + perName + "'";
            }
        }
        return DS = DB.RunDataSet(strSql);
    }

    /*添加回复*/
    public Boolean addDiscuss(EntDiscuss  ED)
    {
        string strSql = "insert into f_discuss(fDiscussId,noteId,discussContent,perName,disDateTime)values('" + ED.FDiscussId + "','" + ED.NoteId + "','" + ED.DiscussContent + "','" + ED.PerName + "','" + Convert.ToDateTime(ED.DisDateTime) + "')";
        if (DB.ExecuteNonQuery(strSql).Equals(1))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
 
    /*根据回复ID删除回复信息*/
    public Boolean deleteDiscussByDId(string DiscussId)
    {
        string strSql = "delete f_Discuss where fDiscussId='" + DiscussId + "'";
        if (DB.ExecuteNonQuery(strSql).Equals(1))
        {
            return true;
        }
        else
        {
            return false;
        }

    }
    /*根据帖子ID删除回复信息*/
    public Boolean deleteDiscussByNId(string noteId)
    {
        string strSql = "delete f_Discuss where noteId='" + noteId + "'";
        if (DB.ExecuteNonQuery(strSql).Equals(1))
        {
            return true;
        }
        else
        {
            return false;
        }

    }
    
}
