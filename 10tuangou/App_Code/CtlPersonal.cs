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
using System.Text;
using System.Security.Cryptography;

/// <summary>
/// CtlPersonal 的摘要说明
/// </summary>
public class CtlPersonal
{
    public CtlPersonal()
    {
    }
    string strConn =  ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    public DataTable selectPersonal(string perName)
    {
        SqlConnection conn = new SqlConnection(strConn);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string sql = "select * from p_personal where perName='" + perName.Trim() + "'";
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        da.Fill(ds);
        dt = ds.Tables[0];
        return dt;
        conn.Close();
    }
    public DataTable getAllQues()
    {
        SqlConnection conn = new SqlConnection(strConn);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string sql = "select * from p_passwordQues";
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        da.Fill(ds);
        dt = ds.Tables[0];
        return dt;
        conn.Close();
    }

    public Boolean register(EntPersonal obj)
    {
    
        SqlConnection conn = new SqlConnection(strConn);
        conn.Open();
        SqlTransaction sqltr = conn.BeginTransaction();
        SqlCommand command = new SqlCommand();
        command.Transaction = sqltr;
        command.Connection = conn;
        command.CommandText = "insert  into  p_personal (perName,password,email,phone,address,msn,qq,functionId,photo,score,regDate,lastLoginDate,pwQuestion,pwAnswer) values('" + obj.perName.Trim() + "','" + obj.password.Trim() + "','" + obj.email.Trim() + "','" + obj.phone.Trim() + "','" + obj.address.Trim() + "','" + obj.msn.Trim() + "','" + obj.qq.Trim() + "','" + obj.functionId.Trim() + "','" + obj.photo.Trim() + "'," + obj.score.Trim() + ",'" + obj.regDate.Trim() + "','" + obj.lastLoginDate.Trim() + "','" + obj.pwQuestion.Trim() + "','" + obj.pwAnswer.Trim() + "')";
      
        try
        {
            if (command.ExecuteNonQuery() == 1)
            {
                SqlCommand incom = new SqlCommand();
                incom.Transaction = sqltr;
                incom.Connection = conn;
                incom.CommandText = "insert into p_personalInfo (perName,addressInfo,phone,gender) values('" + obj.perName.Trim() + "','" + obj.address.Trim() + "','" + obj.phone.Trim() + "','" + obj.gender.Trim() + "')";
                if (incom.ExecuteNonQuery() == 1)
                {
                    sqltr.Commit();
                    conn.Close();
                    return true;
                }
                else
                {
                    sqltr.Rollback();
                    conn.Close();
                    return false;
                }
            }

            else
            {
                sqltr.Rollback();
                conn.Close();
                return false;
            }
        }
        catch
        {
            sqltr.Rollback();
            conn.Close();
            return false;
        }
        conn.Close();
    }
    public DataTable getAllPersonal()
    {
        SqlConnection conn = new SqlConnection(strConn);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string sql = "select * from p_personal";
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        da.Fill(ds);
        dt = ds.Tables[0];
        return dt;
        conn.Close();
    }
    public Boolean updatePassword(EntPersonal obj)
    {
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand command = new SqlCommand("update p_personal set password='"+obj.password.Trim()+"' where perName='" + obj.perName.Trim() + "'", conn);
        conn.Open();
        if (command.ExecuteNonQuery() == 1)
        {
            return true;
        }

        else
        {
            return false;
        }
        conn.Close();
    }
    public Boolean updateDetails(EntPersonal obj)
    {
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand command = new SqlCommand("update p_personal set email='" + obj.email.Trim() + "',phone='" + obj.phone.Trim() + "',msn='" + obj.msn.Trim() + "',qq='" + obj.qq.Trim() + "',photo='" + obj.phone.Trim() + "' where perName='" + obj.perName.Trim() + "'", conn);
        conn.Open();
        if (command.ExecuteNonQuery() == 1)
        {
            return true;
        }

        else
        {
            return false;
        }
        conn.Close();
    }

    public Boolean deletePersonal(string perName)
    {
        
        SqlConnection conn = new SqlConnection(strConn);
        //SqlCommand command = new SqlCommand("delete p_personal where perName='"+perName+"'", conn);
        conn.Open();
        SqlTransaction sqltr = conn.BeginTransaction();
        SqlCommand command = new SqlCommand();
        command.Transaction = sqltr;
        command.CommandText = "delete p_personalInfo where perName='" + perName + "'";
        command.Connection = conn;
        try
        {
            command.ExecuteNonQuery();
            
                SqlCommand delcom = new SqlCommand();
                delcom.Transaction = sqltr;
                delcom.CommandText = "delete p_personal where perName='" + perName + "'";
                delcom.Connection = conn;
            if(delcom.ExecuteNonQuery()==1)
            {
                 sqltr.Commit();
                return true;
            }
                
            else
            {
                sqltr.Rollback();
                conn.Close();
                return false;
            }
        }
        catch
        {
            sqltr.Rollback();
            conn.Close();
            return false;
        }
        conn.Close();
    }
}

