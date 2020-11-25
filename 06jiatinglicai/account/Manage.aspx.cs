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

public partial class account_Manage : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "�����˻�";

            DataSet ds = SqlHelper.ExecuteforDataSet("select family_Id,family_Name from family");
            ddlfamily_Id.DataSource = ds;
            ddlfamily_Id.DataTextField = "family_Name";
            ddlfamily_Id.DataValueField = "family_Id";
            ddlfamily_Id.DataBind();
            ddlfamily_Id.Items.Insert(0, new ListItem("---ȫ��---", ""));

            BindData();
        }
    }

    /// <summary>
    /// ��
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
        this.Repeater1.DataSource = dp.pagelist(pagesize, pageindex, "account a left join family b on a.family_Id=b.family_Id left join bank c on a.bank_id=c.bank_Id", " a.*,b.family_Name,bank_No", "account_Id", where, "account_Id desc", out recordcount);
        this.Repeater1.DataBind();
        this.AspNetPager1.RecordCount = recordcount;

        Label2.Text = SqlHelper.ExecuteScalar("select sum(account_Money) from account a where account_Type='���' and zt='���ͨ��' and " + where).ToString();
        Label3.Text = SqlHelper.ExecuteScalar("select sum(account_Money) from account a where account_Type='ȡ��'  and zt='���ͨ��' and " + where).ToString();
        Label2.Text = Label2.Text == "" ? "0" : Label2.Text;
        Label3.Text = Label3.Text == "" ? "0" : Label3.Text;

    }

    /// <summary>
    /// /ɾ����¼
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void del_Click(object sender, ImageClickEventArgs e)
    {
        string id = ((ImageButton)sender).CommandArgument;

        //ɾ�� 
        SqlHelper.ExecuteNonQuery(" delete from account where account_Id=" + id);

        //���°�
        BindData();

    }

    /// <summary>
    /// ��ҳ
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        BindData();
    }

    /// <summary>
    /// ����
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindData();
    }
    

}