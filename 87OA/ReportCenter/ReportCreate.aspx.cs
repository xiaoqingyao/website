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

public partial class ReportCenter_ReportCreate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.DBUtility.DbHelperSQL.BindDropDownList("select name from sysobjects where type='U' and name!='dtproperties' order by name", this.DropDownList1, "name", "name");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string SQLStr = "select name,(select value from sysproperties where id = syscolumns.id and smallid=syscolumns.colid) as CNName from syscolumns where id=object_id('"+this.DropDownList1.SelectedValue+"') order by colid";
        string PeportSQL = "";
        DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet(SQLStr);
        for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
        {
            string CNNameStr = MYDT.Tables[0].Rows[i]["CNName"].ToString();
            if(CNNameStr.Trim().Length==0)
            {
                CNNameStr = MYDT.Tables[0].Rows[i]["name"].ToString();
                if (CNNameStr == "ID")
                {
                    CNNameStr = "流水号";
                }
            }
            if (PeportSQL == "")
            {
                PeportSQL = PeportSQL + MYDT.Tables[0].Rows[i]["name"].ToString() + " as " + CNNameStr;
            }
            else
            {
                PeportSQL = PeportSQL + "," + MYDT.Tables[0].Rows[i]["name"].ToString() + " as " + CNNameStr;
            }
        }
        this.TextBox1.Text = "select " + PeportSQL + " from " + this.DropDownList1.SelectedValue;
    }
}
