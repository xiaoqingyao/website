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
using System.Collections;
/// <summary>
/// BaseClass 的摘要说明
/// </summary>
public class BaseClass:System.Web.UI.Page
{
	public BaseClass()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
    }

    public string MessageBox(string TxtMessage)
    {
        string str;
        str ="<script language=javascript>alert('" + TxtMessage + "')</script>";
        return str;
    }

    public Boolean ExecSQL(string sQueryString)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        con.Open();
        SqlCommand dbCommand = new SqlCommand(sQueryString,con);
        try
        {
            dbCommand.ExecuteNonQuery();
            con.Close();
        }
        catch (System.Exception e)
        {
            con.Close();
            return false;
        }
        return true;
    }

    public System.Data.DataSet GetDataSet(string sQueryString, string TableName)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        con.Open();
        SqlDataAdapter dbAdapter = new SqlDataAdapter(sQueryString, con);
        DataSet dataset = new DataSet();
        dbAdapter.Fill(dataset, TableName);
        con.Close();
        return dataset;
    }
}
