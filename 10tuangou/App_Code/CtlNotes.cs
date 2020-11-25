using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// CtlNotes 的摘要说明
/// </summary>
public class CtlNotes
{
    DataBase DB = new DataBase();
    DataTable DT = new DataTable();
    DataSet DS = new DataSet();
    SqlDataAdapter Drt = new SqlDataAdapter();
    CtlMark CM = new CtlMark();
   
	public CtlNotes()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /* 根据版块ID获取该版块所有帖子的信息*/
    public DataSet getNotesInfos(int moduleId)
    {
        string strSql = "select  n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId  where n.moduleId=" + moduleId;
        return DS = DB.RunDataSet(strSql);
    }
    /* 根据版块ID获取该版块所有帖子的信息*/
    public DataSet getNotesInfoss()
    {
        string strSql = "select  n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId";
        return DS = DB.RunDataSet(strSql);
    }
    /* 根据版块ID获取该版块所有帖子的信息*/
    public DataSet getNotesInfo(int moduleId)
    {
        string strSql = "select top 6 n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId  where n.moduleId="+moduleId;
        return DS = DB.RunDataSet(strSql);
    }
    public DataSet getNotesInfoByName(string moduleName, string typeName)
    {
        string strSql = "";
        if (moduleName.Trim().Equals("请选择") && typeName.Trim().Equals("请选择"))
        {
            strSql = "select  n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId";

        }
        else
        {
            if (moduleName.Trim().Equals("请选择"))
            {
                 strSql = "select  n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId where t.typeName='" + typeName + "'";

            }
            else if (typeName.Trim().Equals("请选择"))
            {
                strSql = "select  n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId where m.moduleName='" + moduleName + "'";

            }
            else
            {
                  strSql = "select  n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId where m.moduleName='" + moduleName + "' and t.typeName='"+typeName+"'";

            }
        }
        return DS = DB.RunDataSet(strSql);
    }
    /* 根据帖子ID获取该版块所有帖子的信息*/
    public DataSet getNotesInfoByNoteId(string noteId)
    {
        string strSql = "select n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId  where n.noteId='" +noteId +"'";
        return DS = DB.RunDataSet(strSql);
    }
    /*精华帖，前10条记录*/
    public DataSet getNotesInfoByIsGoodtop()
    {
        string strSql = "select top 10 n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId  where n.isGood='是'";
        return DS = DB.RunDataSet(strSql);
    }

    /*精华帖子*/
    public DataSet getNotesInfoByIsGood()
    {
        string strSql = "select n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId  where n.isGood='是'";
        return DS = DB.RunDataSet(strSql);
    }
    /*推荐帖子*/
    public DataSet getNotesInfoByIsTop()
    {
        string strSql = "select n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId  where n.isTop='是'";
        return DS = DB.RunDataSet(strSql);
    }
    /* 根据帖子ID获取该帖子回复信息*/
    public DataSet getDiscussByNoteId(string noteId)
    {
        string strSql = "select * from f_discuss where noteId='"+noteId+"'";
        return DS = DB.RunDataSet(strSql);
    }
    /*获取所有帖子的信息*/
    public DataSet getAllNotesInfo()
    {
        string strSql = "select n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId ";
        return DS = DB.RunDataSet(strSql);
    }
    /*获取最新的１０条帖子信息*/
    public DataSet getNotesInfoByCount()
    {
        string strSql = "select top 10 n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId order by n.saveTime DESC";
        return DS = DB.RunDataSet(strSql);
    }
    public DataSet getNotesContent(string noteId)
    {
        string strSql = "select noteContent from f_notes where noteId='"+noteId+"'";
        return DS = DB.RunDataSet(strSql);
    }
    /*获取所有板块最新帖子的信息*/
    public DataSet getNotesForNew()
    {
        string strSql = "select n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId order by n.saveTime DESC";
        return DS = DB.RunDataSet(strSql);
    }
    /*根据用户ＩＤ获取用户积分头衔信息*/
    public DataSet getPerInfoByPerName(string perName)
    {
        string strSql = "select score,gender from p_personal where perName='"+perName+"'";
        return DS = DB.RunDataSet(strSql);
    }
    /*根据条件查询帖子信息*/
    public DataSet sreachNotes(string typeId,string perName,string startDate,string endDate)
    {
        string condition = "";
        string strSql="select n.*,t.typeName,m.moduleName from f_notes n join f_module m on n.moduleId=m.moduleId join f_type t on t.typeId=n.typeId";
        if (typeId != "")
        {
            condition = " where t.typeId=" + Convert.ToInt32(typeId);
        }
        if (condition != "")
        {
            if (perName != "")
            {
                condition = condition + " and perName='" + perName + "'";
            }
        }
        else
        {
            if (perName != "")
            {
                condition = condition + " where perName='" + perName + "'";
            }
        }

        if (condition != "")
        {
            if (startDate != "")
            {
                condition = condition + "  and saveTime between  '" + startDate + "' and '"+endDate+"'";
            }

        }
        else
        {
            if (startDate != "")
            {
                condition = condition + " where saveTime between  '" + startDate + "' and '" + endDate + "'";
            }
        }
        if (condition != "")
        {
            strSql = strSql+condition;
        }

        return DS = DB.RunDataSet(strSql);
      }
    

    /*跟新帖子的信息*/
    public Boolean noteUpdate(EntNotes EN)
    {
        string strSql = "update f_notes set isTop='" + EN.IsTop + "',isGood='" + EN.IsGood + "',moduleId='"+EN.ModuleId+"' where noteId='"+EN.NoteId+"'";
        if (DB.ExecuteNonQuery(strSql).Equals(1))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    /*插入帖子信息*/
    public Boolean addNoteInfo(EntNotes EN)
    {
        SqlConnection con = DB.ReturnConn();
        SqlTransaction sqltran = con.BeginTransaction();
        SqlCommand insertcom = new SqlCommand();
        insertcom.Connection = con;
        insertcom.Transaction = sqltran;
        insertcom.CommandText = "insert into f_notes(noteId,moduleId,noteTitle,noteContent,perName,saveTime,typeId,isGood,isTop)values('" + EN.NoteId + "'," + Convert.ToInt32(EN.ModuleId) + ",'" + EN.NoteTitle + "','" + EN.NoteContent + "','" + EN.PerName + "','" + Convert.ToDateTime(EN.SaveTime) + "','" + Convert.ToInt32(EN.TypeId) + "','" + EN.IsGood + "','" + EN.IsTop + "')";
        //string strSql = "insert into f_notes(noteId,moduleId,noteTitle,noteContent,perName,saveTime,typeId)values('" + EN.NoteId + "'," + Convert.ToInt32(EN.ModuleId) + ",'" + EN.NoteTitle + "','" + EN.NoteContent + "','"+EN.PerName+"','" + Convert.ToDateTime(EN.SaveTime) + "',"+Convert.ToInt32(EN.TypeId)+")";

        try
        {
            int i=insertcom.ExecuteNonQuery();
            if (i == 1)
            {
                SqlCommand updatecom = new SqlCommand();
                updatecom.CommandText = "update p_personal set score=score+5 where perName='"+EN.PerName+"'";
                updatecom.Connection = con;
                updatecom.Transaction = sqltran;

                try
                {
                    updatecom.ExecuteNonQuery();
                    sqltran.Commit();
                    con.Close();
                    return true;
                }
                catch
                {
                    sqltran.Rollback();
                    con.Close();
                    return false;
                }
            }
            else
            {
                sqltran.Rollback();
                con.Close();
                return false;
            }
        }
        catch
        {
            sqltran.Rollback();
            con.Close();
            return false;
        }
    }
     /* 根据板块ID获取该版块所有帖子的数量*/
    public DataSet getNotesByModuleId(string moduleId)
    {
        string strSql = "select count(*) as noteCount from f_notes where moduleId='"+moduleId+"'";
        return DS = DB.RunDataSet(strSql);
    }
    /*根据帖子ID获取该帖子的评论条数*/
    public DataSet getNoteDiscussByNoteId(string noteId)
    {
        string strSql = "select count(*) as discussCount from f_discuss where noteId='"+noteId+"'";
        return DS = DB.RunDataSet(strSql);
    }
    /*根据帖子ID删除帖子信息*/
    public Boolean noteDelete(string noteId)
    {
        int i;
        SqlConnection con = DB.ReturnConn();
        SqlTransaction sqlTran = con.BeginTransaction();

        SqlCommand DelCommand = new SqlCommand();
        DelCommand.Connection = con;
        DelCommand.CommandText = "delete f_notes where noteId='" + noteId + "'";
        DelCommand.Transaction = sqlTran;
        try
        {
            i = DelCommand.ExecuteNonQuery();
        }
        catch
        {
            sqlTran.Rollback();
            return false;
        }
        if (i == 1)
        {
            try
            {
                SqlCommand DelComm = new SqlCommand();
                DelComm.Connection = con;
                DelComm.Transaction = sqlTran;
                DelComm.CommandText = "delete f_Discuss where noteId='" + noteId + "'";
                DelComm.ExecuteNonQuery();
                sqlTran.Commit();
                con.Close();
                return true;
            }
            catch
            {
                sqlTran.Rollback();
                con.Close();
                return false;
            }
        }
        else
        {
            sqlTran.Rollback();
            con.Close();
            return false;
        }
    }
    public DataTable getNotesInfo()
    {
        return DT=DB.RunProcGetTable("getNotesInfo");
    }
    /*生成帖子ID*/
    public string getNoteId()
    {
        DT = getAllNotesInfo().Tables[0];
        int ctr, len;

        string noteId;
        string maxId = "";
        if (DT.Rows.Count - 1 < 0)
        {
            maxId = "00000001";
            return maxId;
        }
        len = DT.Rows.Count - 1;

        DataRow dr = DT.Rows[len];
        noteId = dr["noteId"].ToString();
        ctr = System.Convert.ToInt32(noteId);
        if (ctr >= 1 && ctr < 9)
        {
            ctr = ctr + 1;
            maxId = "0000000" + ctr;
        }
        if (ctr >= 9 && ctr < 99)
        {
            ctr = ctr + 1;
            maxId = "000000" + ctr;
        }
        if (ctr >= 99 && ctr < 999)
        {
            ctr = ctr + 1;
            maxId = "00000" + ctr;
        }
        if (ctr >= 999 && ctr < 9999)
        {
            ctr = ctr + 1;
            maxId = "0000" + ctr;
        }
        if (ctr >= 9999 && ctr < 99999)
        {
            ctr = ctr + 1;
            maxId = "000" + ctr;
        }
        if (ctr >= 99999 && ctr < 999999)
        {
            ctr = ctr + 1;
            maxId = "00" + ctr;
        }
        if (ctr >= 999999 && ctr < 9999999)
        {
            ctr = ctr + 1;
            maxId = "0" + ctr;
        }
        if (ctr >= 9999999 && ctr < 99999999)
        {
            ctr = ctr + 1;
            maxId = System.Convert.ToString(ctr);
        }
        return maxId;


    }
    /*生成回复ID*/
    public string getDiscussId(string noteId)
    {
        DataSet DS = new DataSet();
        DataTable DT = new DataTable();
        DS = getDiscussByNoteId(noteId);
        DT = DS.Tables[0];

        int ctr, len;

        string discussId;
        string maxId = "";
        if (DT.Rows.Count - 1 < 0)
        {
            maxId = "00001";
            return noteId + maxId;
        }
        len = DT.Rows.Count - 1;

        DataRow dr = DT.Rows[len];
        discussId = dr["fDiscussId"].ToString().Substring(8, 5);
        ctr = System.Convert.ToInt32(discussId);
        if (ctr >= 1 && ctr < 9)
        {
            ctr = ctr + 1;
            maxId = "0000" + ctr;
        }
        if (ctr >= 9 && ctr < 99)
        {
            ctr = ctr + 1;
            maxId = "000" + ctr;
        }
        if (ctr >= 99 && ctr < 999)
        {
            ctr = ctr + 1;
            maxId = "00" + ctr;
        }
        if (ctr >= 999 && ctr < 9999)
        {
            ctr = ctr + 1;
            maxId = "0" + ctr;
        }
        if (ctr >= 9999 && ctr < 99999)
        {
            ctr = ctr + 1;
            maxId = System.Convert.ToString(ctr);
        }

        return noteId + maxId;
    }
   
}
