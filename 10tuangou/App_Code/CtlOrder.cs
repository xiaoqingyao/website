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
/// CtlOrder 的摘要说明
/// </summary>
public class CtlOrder
{
    DataBase db = new DataBase();
	public CtlOrder()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}


    public DataTable selectOrder(string sql)
    {
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


    public Boolean updateOrderState(string oid,string state)//更新定单状态
    {
        string sql="update g_order set state='"+state+"' where orderId='"+oid+"'";
        try
        {
            int i=db.ExecuteNonQuery(sql);
            if(i==1)
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


    public Boolean deleteorder(string oid)//删除定单
    {
        string sql = "delete g_order where orderId='" + oid + "'";
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


    public Boolean CreateOrder(string osql, EntOrder eo)//生成定单
    {
        if (osql == "")
        {
            //不需要更新用户信息
            string sql = "insert g_order values('"+eo.Oid+"','"+eo.Gid+"','"+eo.Pid+"','"+eo.Pname+"',"+eo.Stotal+",'"+eo.State+"','"+eo.Time+"','"+eo.PersonalInfoid+"')";
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
        else
        {
           //要更新用户信息
            SqlConnection con = new SqlConnection();
            con = db.ReturnConn();
            SqlTransaction sqltra = con.BeginTransaction();
            SqlCommand insertcom = new SqlCommand();
            insertcom.Transaction = sqltra;
            insertcom.Connection = con;
            insertcom.CommandText = osql;

            DataSet  ds = new DataSet();
            SqlDataAdapter sqlda = new SqlDataAdapter();
            sqlda.SelectCommand = insertcom;
            try
            {
                sqlda.Fill(ds);
            }
            catch
            {
                
                sqltra.Rollback();
                con.Close();
                return false;
            }
            if (ds.Tables[0].Rows.Count > 0)
            {
                string personalInfoid = ds.Tables[0].Rows[0][0].ToString();
                SqlCommand com = new SqlCommand();
                com.Transaction = sqltra;
                com.Connection = con;
                com.CommandText = "insert g_order values('" + eo.Oid + "','" + eo.Gid + "','" + eo.Pid + "','" + eo.Pname + "'," + eo.Stotal + ",'" + eo.State + "','" + eo.Time + "','" + personalInfoid + "')";

                try
                {
                    int i = com.ExecuteNonQuery();
                    if (i == 1)
                    {
                        sqltra.Commit();
                        con.Close();
                        return true;
                    }
                    else
                    {
                      
                        sqltra.Rollback();
                        con.Close();
                        return false;
                    }
                }
                catch
                {
                    
                    sqltra.Rollback();
                    con.Close();
                    return false;
                }
            }
            else
            {
                
                sqltra.Rollback();
                con.Close();
                return false;
            }
        }
    }
}
