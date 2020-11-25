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

public partial class indexFrame_right : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BaseClass bc = new BaseClass();
        DataList1.DataSource = bc.GetDataSet("SELECT name, dept, job, photoPath, qty FROM (SELECT * FROM employee a INNER JOIN (SELECT TOP 10 * FROM (SELECT employeeName, COUNT(late) + COUNT(quit) AS qty FROM sign GROUP BY employeeName) DERIVEDTBL ORDER BY qty) b ON a.name = b.employeeName) DERIVEDTBL ORDER BY qty", "sign");
        DataList1.DataBind();
    }
}
