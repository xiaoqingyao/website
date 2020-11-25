using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class analysis_month_analysis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "月收支分析";

            DataSet ds = SqlHelper.ExecuteforDataSet("select distinct convert(char(4),in_date,121) as mo from in_Pay");
            ddlfamily_Id.DataSource = ds;
            ddlfamily_Id.DataTextField = "mo";
            ddlfamily_Id.DataValueField = "mo";
            ddlfamily_Id.DataBind();
        
            BindData();
        }
    }

    /// <summary>
    /// 绑定
    /// </summary>
    private void BindData()
    {
        
        string where = " where 1=1  ";

        if (ddlfamily_Id.SelectedValue != "")
        {
            where += " and left(a.mm,4)='" + ddlfamily_Id.SelectedValue + "'";
        }

        string sql = @"select a.*,isnull(t1,0) as t1,isnull(t2,0) as t2,(isnull(t1,0)-isnull(t2,0)) as t3 from
                        (
                        select convert(char(7),in_date,121) as mm from in_pay
                        group by convert(char(7),in_date,121)) a left join 
                        (
                        select convert(char(7),in_date,121) as mm,sum(in_money) as t1 from in_Pay
                        where in_leixing='收入'
                        group by convert(char(7),in_date,121)
                        ) b on a.mm=b.mm
                         left join(
                        select convert(char(7),in_date,121) as mm,sum(in_money) as t2 from in_Pay
                        where in_leixing='支出'
                        group by convert(char(7),in_date,121)) c on a.mm=c.mm "+where+@"
                        order by a.mm desc";

        Repeater1.DataSource = SqlHelper.ExecuteforDataSet(sql);
        Repeater1.DataBind();

        Label2.Text = SqlHelper.ExecuteScalar("select sum(in_money) from in_pay a where in_leixing='收入' and convert(char(4),in_date,121)='" + ddlfamily_Id.SelectedValue + "'").ToString();
        Label3.Text = SqlHelper.ExecuteScalar("select sum(in_money) from in_pay a where in_leixing='支出' and convert(char(4),in_date,121)='" + ddlfamily_Id.SelectedValue + "'").ToString();
        Label2.Text = Label2.Text == "" ? "0" : Label2.Text;
        Label3.Text = Label3.Text == "" ? "0" : Label3.Text;
        Label1.Text = (decimal.Parse(Label2.Text) - decimal.Parse(Label3.Text)).ToString();
    }

    /// <summary>
    /// 搜索
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindData();
    }
}
