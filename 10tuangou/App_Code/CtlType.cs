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
/// CtlType 的摘要说明
/// </summary>
public class CtlType
{
    DataBase DB = new DataBase();
    DataSet DS = new DataSet();
	public CtlType()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /*获取所有类别的信息*/
    public DataSet getTypeManager()
    {
        string strSql = "select * from f_type";
        return DS = DB.RunDataSet(strSql);
    }
    /*跟新类别的信息*/
    public Boolean typeUpdate(string typeId,string typeName)
    {
        string strSql = "update f_type set typeName='" + typeName + "' where typeId='" + typeId + "'";
        if (DB.ExecuteNonQuery(strSql).Equals(1))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    /*添加类别*/
    public Boolean addType(string typeName)
    {
        string strSql = "insert into f_type(typeName)values('" + typeName + "')";
        if (DB.ExecuteNonQuery(strSql).Equals(1))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    /*删除类别*/
    public Boolean deleteTypeById(int typeId)
    {
        string strSql = "delete f_type where typeId=" + typeId;
        if (DB.ExecuteNonQuery(strSql).Equals(1))
        {
            return true;
        }
        else
        {
            return false;
        }

    }
    /*根据类别名称搜索*/
    public DataSet selectTypeByName(string typeName)
    {
        string strSql;
        if (typeName == "")
        {
            strSql = "select * from f_type";
        }
        else
        {

            strSql = "select * from f_type where typeName='%" + typeName + "%'";
        }

        return DS = DB.RunDataSet(strSql);
    }
}
