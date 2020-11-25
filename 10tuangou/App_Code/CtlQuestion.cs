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
/// CtlQuestion 的摘要说明
/// </summary>
public class CtlQuestion
{
	public CtlQuestion()
	{
	}

    string strConn =  ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
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
    public DataTable selectQuestion(string questionId)
    {
        SqlConnection conn = new SqlConnection(strConn);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string sql = "select * from p_passwordQues where questionId='"+questionId.Trim()+"'";
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        da.Fill(ds);
        dt = ds.Tables[0];
        return dt;
        conn.Close();
    }

    public Boolean deleteQuestion(string questionId)
    {
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand command = new SqlCommand("delete p_passwordQues where questionId='"+questionId.Trim()+"'", conn);
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
    public Boolean updateQuestion(EntQuestion obj)
    {
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand command = new SqlCommand("update p_passwordQues set question='"+obj.question.Trim()+"'where questionId='"+obj.questionId.Trim()+"'", conn);
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
}
