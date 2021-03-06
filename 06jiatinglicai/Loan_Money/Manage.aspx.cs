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

public partial class Loan_Money_Manage : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "管理借(贷)款";
            DataSet ds = SqlHelper.ExecuteforDataSet("select family_Id,family_Name from family");
            ddlfamily_Id.DataSource = ds;
            ddlfamily_Id.DataTextField = "family_Name";
            ddlfamily_Id.DataValueField = "family_Id";
            ddlfamily_Id.DataBind();
            ddlfamily_Id.Items.Insert(0, new ListItem("---全部---", ""));

            BindData();
        }
    }

    /// <summary>
    /// 绑定
    /// </summary>
    private void BindData()
    {
        DataPage dp = new DataPage();
        string where = "  1=1  ";

        if (ddlfamily_Id.SelectedValue != "")
        {
            where += " and a.family_Id=" + ddlfamily_Id.SelectedValue + "";
        }



        int recordcount;
        int pagesize = this.AspNetPager1.PageSize;
        int pageindex = this.AspNetPager1.CurrentPageIndex;
        this.Repeater1.DataSource = dp.pagelist(pagesize, pageindex, "Loan_Money a left join family b on a.family_Id=b.family_Id", " a.*,b.family_Name", "lm_Id", where, "lm_Id desc", out recordcount);
        this.Repeater1.DataBind();
        this.AspNetPager1.RecordCount = recordcount;

        Label2.Text = SqlHelper.ExecuteScalar("select sum(im_Money) from Loan_Money a where  zt='审核通过' and " + where).ToString();      
        Label2.Text = Label2.Text == "" ? "0" : Label2.Text;
    }

    /// <summary>
    /// /删除记录
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void del_Click(object sender, ImageClickEventArgs e)
    {
        string id = ((ImageButton)sender).CommandArgument;

        //删除 
        SqlHelper.ExecuteNonQuery(" delete from Loan_Money where lm_Id=" + id);

        //重新绑定
        BindData();

    }

    /// <summary>
    /// 分页
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        BindData();
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
