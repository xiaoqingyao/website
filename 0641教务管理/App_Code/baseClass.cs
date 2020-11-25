using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;

/// <summary>
/// baseClass 的摘要说明
/// </summary>
public class baseClass
{
	public baseClass()
	{
		
	}
    //================数据库连接========================================
    public static OleDbConnection GetCon() 
    { string conn_str = System.Configuration.ConfigurationManager.AppSettings["ConnString"].ToString() + System.Web.HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["dbPath"]) + ";"; OleDbConnection conn = new OleDbConnection(conn_str); return conn; 
    }
    //================数据绑定=========================================
    public static void BindDG(GridView dg, string id, string strSql, string Tname)
    {
        OleDbConnection conn = GetCon();
        OleDbDataAdapter sda = new OleDbDataAdapter(strSql, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds, Tname);
        dg.DataSource = ds.Tables[Tname];
        dg.DataKeyNames = new string[] { id };
        dg.DataBind();
    }
    public static void ExecuteSql(string sqlStr)
    {
       
            OleDbConnection conn = baseClass.GetCon();
            conn.Open();
            OleDbCommand cmd = new OleDbCommand(sqlStr,conn);
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = sqlStr;
            cmd.ExecuteNonQuery();
      
    }
    //================数据操作=========================================
    public static void OperateData(string strsql)
    {
        OleDbConnection conn = GetCon();
        conn.Open();
        OleDbCommand cmd = new OleDbCommand(strsql, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    //================如果是学生登录=========================================
    public static bool CheckStudent(string studentNum, string studentPwd)
    {
        OleDbConnection conn = GetCon();
        conn.Open();
        OleDbCommand cmd = new OleDbCommand("select count(*) from tb_student where stuID='" + studentNum + "' and stuPwd='" + studentPwd + "'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        if (i > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
        conn.Close();
    }
    //================如果是教师登录=========================================
    public static bool CheckTeacher(string teacherNum, string teacherPwd)
    {
        OleDbConnection conn = GetCon();
        conn.Open();
        OleDbCommand cmd = new OleDbCommand("select count(*) from tb_teacher where techID='" + teacherNum + "' and techPwd='" + teacherPwd + "' ", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        if (i > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
        conn.Close();
    }
    //================如果是管理员登录=========================================
    public static bool CheckAdmin(string adminNum, string adminPwd)
    {
        OleDbConnection conn = GetCon();
        conn.Open();
        OleDbCommand cmd = new OleDbCommand("select count(*) from tb_admin where adminID='" + adminNum + "' and adminPwd='" + adminPwd + "'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        if (i > 0)
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
