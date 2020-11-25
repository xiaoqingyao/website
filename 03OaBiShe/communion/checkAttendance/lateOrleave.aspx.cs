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

public partial class checkAttendance_lateOrleave : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    static string up;
    static string down;
    protected void Page_Load(object sender, EventArgs e)
    {
        labSTime.Text = DateTime.Now.ToString("HH:mm:ss");   //注意大小写
        labXTime.Text = DateTime.Now.ToString("HH:mm:ss");
        DataSet ds = bc.GetDataSet("select * from signstate", "signstate");
        DataRow[] row = ds.Tables[0].Select("signstateid=1");
        foreach (DataRow rs in row)
        {
            Label1.Text = "上课时间：" + Convert.ToDateTime(rs["time"]).ToString("HH:mm:ss");
            up = Convert.ToDateTime(rs["time"]).ToString("HH:mm:ss");
        }
        DataRow[] rw = ds.Tables[0].Select("signstateid=2");
        foreach (DataRow rs1 in rw)
        {
            Label2.Text = "下课时间：" +Convert.ToDateTime( rs1["time"]).ToString("HH:mm:ss");
            down = Convert.ToDateTime(rs1["time"]).ToString("HH:mm:ss");
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //上课进行考勤设置
        if (DateTime.Compare(Convert.ToDateTime(DateTime.Now.ToString("hh:mm:ss")), Convert.ToDateTime(up)) <= 0)
        {
            bc.ExecSQL("INSERT INTO sign (datetime, employeeName, late, quit) values ('" + DateTime.Now + "','" + Session["loginName"].ToString() + "','0','0')");
        }
        else
        {
            bc.ExecSQL("INSERT INTO sign (datetime, employeeName, late, quit) values ('" + DateTime.Now + "','" + Session["loginName"].ToString() + "','1','0')");
        }
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //下课进行考勤设置
        if (DateTime.Compare(Convert.ToDateTime(DateTime.Now.ToString("hh:mm:ss")), Convert.ToDateTime(down)) >= 0)
        {
            bc.ExecSQL("INSERT INTO sign (datetime, employeeName, late, quit) values ('" + DateTime.Now + "','" + Session["loginName"].ToString() + "','0','0')");
        }
        else
        {
            bc.ExecSQL("INSERT INTO sign (datetime, employeeName, late, quit) values ('" + DateTime.Now + "','" + Session["loginName"].ToString() + "','0','1')");
        }
    }
}
