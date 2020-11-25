using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
public partial class AdminManger_RecoveryDataBase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (exepro())
        {
            string strg = this.FileUpload1.PostedFile.FileName; //获得备份路径及数据库名称
            string sqltxt = "use master;";
            sqltxt += @"restore database InventoryMis from disk='" + strg + "' WITH REPLACE";
            SqlConnection conn = new SqlConnection(SqlHelper.connstring);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sqltxt, conn);
            cmd.ExecuteNonQuery();
            conn.Close();

        }
        else
        {
            Response.Write("<script language=javascript>alert('还原数据成功！')</script>");
        }
    }
  

           /**//// <summary>
        /// 杀死当前库的所有进程
        /// </summary>
        /// <returns></returns>
        private bool exepro()
       {
            SqlConnection conn1 = new SqlConnection(SqlHelper.connstring);
            SqlCommand cmd = new SqlCommand("killspid",conn1);
           cmd.CommandType = CommandType.StoredProcedure;
           cmd.Parameters.Add("@dbname","aaa");
            try
            {
              conn1.Open();
                cmd.ExecuteNonQuery();
               return true;
            }
            catch(Exception ex)
            {
               return false;
            }
            finally
          {
               conn1.Close();
           }
        }
}
