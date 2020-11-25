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
/// CtlCompany 的摘要说明
/// </summary>
public class CtlCompany
{
    DataBase DB = new DataBase();
	public CtlCompany()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public Boolean AddCompany(EntCompany ec)//添加公司
    {
        try
        {
            string sql="insert g_company values('"+ec.ConpanName+"','"+ec.ContactMan+"','"+ec.Phone+"','"+ec.Address+"')";
            int i = DB.ExecuteNonQuery(sql);
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
    public DataTable CheckCompany(EntCompany ec)//检查是否存在这个公司
    {
        DataTable dt = new DataTable();
        try
        {
            
            string sql = "select * from g_company where companyName='" + ec.ConpanName + "'";
            dt = DB.RunDataSet(sql).Tables[0];          
        }
        catch
        {
            //return false;
        }
        return dt;
    }
    public DataTable SelectCompany()//检查是否存在这个公司
    {
        DataTable dt = new DataTable();
        try
        {

            string sql = "select * from g_company ";
            dt = DB.RunDataSet(sql).Tables[0];
        }
        catch
        {
            //return false;
        }
        return dt;
    }
    public Boolean DeleteComany(String cid)//删除一个公司的记录及其产品记录
    {
        SqlConnection con = new SqlConnection();
        con = DB.ReturnConn();
        SqlTransaction sqltrcon = con.BeginTransaction();
        SqlCommand sqldelete = new SqlCommand();
        sqldelete.Connection = con;
        sqldelete.CommandText = "delete g_product where companyId='" + cid + "'";
        sqldelete.Transaction = sqltrcon;
        try
        {
            sqldelete.ExecuteNonQuery();
        }
        catch
        {
            sqltrcon.Rollback();
            con.Close();
            return false;
        }
        try
        {
            SqlCommand sqlcom = new SqlCommand();
            sqlcom.Connection = con;
            sqlcom.CommandText = "delete g_company where companyId='" + cid + "'";
            sqlcom.Transaction = sqltrcon;
            int i = sqlcom.ExecuteNonQuery();
            if (i == 1)
            {
                sqltrcon.Commit();
                con.Close();
                return true;
            }
            else
            {
                sqltrcon.Rollback();
                con.Close();
                return false;
            }
        }
        catch
        {
            sqltrcon.Rollback();
            con.Close();
            return false;
        }
    }
    public DataTable RunTable(EntCompany ec)
    {
        DataTable dt = new DataTable();
        string sql = "select * from g_company where companyId='" + ec.CompanyID + "'";
        try
        {
            dt = DB.RunDataSet(sql).Tables[0];
        }
        catch
        {
 
        }
        return dt;
    }
    public Boolean UpdateCompany(EntCompany ec)
    {
        string sql = "update g_company set companyName='" + ec.ConpanName + "',contactMan='" + ec.ContactMan + "',phone='" + ec.Phone + "',address='" + ec.Address + "' where companyId='" + ec.CompanyID + "'";
        try
        {
            int i=DB.ExecuteNonQuery(sql);
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
}
