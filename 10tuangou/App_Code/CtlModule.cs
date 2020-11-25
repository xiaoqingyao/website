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
/// CtlModule 的摘要说明
/// </summary>
public class CtlModule
{
    DataBase DB = new DataBase();
    DataSet DS = new DataSet();
  
	public CtlModule()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /*获取所有版块的前6条信息*/
    public DataSet getModuleManager()
    {
        string strSql = "select top 6 * from f_module";
        return DS = DB.RunDataSet(strSql);
    }

    /*获取前所有版块的信息*/
    public DataSet getModuleManagerTop()
    {
        string strSql = "select top 3 * from f_module";
        return DS = DB.RunDataSet(strSql);
    }
    /*添加版块*/
    public Boolean addModule(EntModule EM)
    {
        string strSql = "insert into f_module(moduleName,moduleDesc,startDate)values('" + EM.ModuleName + "','" + EM.ModuleDesc + "','" +Convert.ToDateTime(EM.StartDate) + "')";
        if (DB.ExecuteNonQuery(strSql).Equals(1))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /*跟新模块的信息*/
    public Boolean moduleUpdate(EntModule EM)
    {
        string strSql = "update f_module set moduleName='" + EM.ModuleName + "',moduleDesc='" + EM.ModuleDesc+ "',moduleCode='" + EM.ModuleCode + "' where moduleId='" + EM.ModuleId + "'";
        if (DB.ExecuteNonQuery(strSql).Equals(1))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    /*删除版块*/
    public Boolean deleteModuleById(int moduleId)
    {
        string strSql = "delete f_module where moduleId="+moduleId;
        if (DB.ExecuteNonQuery(strSql).Equals(1))
        {
            return true;
        }
        else
        {
            return false;
        }

    }
    /*根据版块名称搜索*/
    public DataSet selectModuleByName(string moduleName)
    {
        string strSql;
        if (moduleName == "")
        {
            strSql = "select * from f_module"; 
        }
        else
        {
           
           strSql = "select * from f_module where moduleName='%" + moduleName + "%'";
        }
        
        return DS = DB.RunDataSet(strSql);
    }
}
