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

public partial class bank_Manage : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "���������˺�";

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

        if (txt_bank_No.Text != "")
        {
            where += " and bank_No like '%" + txt_bank_No.Text + "%' ";
        }

        if (ddlbank_Type.SelectedValue!= "")
        {
            where += " and bank_Type='" + ddlbank_Type.SelectedValue + "' ";
        }



        int recordcount;
        int pagesize = this.AspNetPager1.PageSize;
        int pageindex = this.AspNetPager1.CurrentPageIndex;
        this.Repeater1.DataSource = dp.pagelist(pagesize, pageindex, "bank", " * ", "bank_Id", where, "bank_Id desc", out recordcount);
        this.Repeater1.DataBind();
        this.AspNetPager1.RecordCount = recordcount;

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
        SqlHelper.ExecuteNonQuery(" delete from bank where bank_Id=" + id);

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
