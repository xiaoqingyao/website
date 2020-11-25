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

public partial class Main_SelectRedHead : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //绑定所有红头文件
            DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPRedHead order by FileName asc");
            for(int i=0;i<MYDT.Tables[0].Rows.Count;i++)
            {
                ListItem MyList = new ListItem();
                MyList.Text = MYDT.Tables[0].Rows[i]["FileName"].ToString();
                MyList.Value = MYDT.Tables[0].Rows[i]["FilePath"].ToString();
                this.DropDownList1.Items.Add(MyList);
            }            
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<script language=javascript>window.returnValue =\"" + this.DropDownList1.SelectedValue.ToString() + "\";window.close();</script>");        
    }
}