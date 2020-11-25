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
public partial class CKMoneyManger : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    Alert js = new Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Alert.AlertAndRedirect("对不起您没有登录！", "Login.aspx");

            }
            else
            {

                GetInfo();
            }
        }

    }
    private void GetInfo()
    {
        try
        {
            GvInfo.DataSource = GetCodeBy(0);
            GvInfo.DataBind();
        }
        catch
        {

        }
    }
    protected void GvInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GvInfo.PageIndex = e.NewPageIndex;
        GetInfo();
    }
    decimal he;
    decimal dqbx;
    decimal xybx;
    protected void GvInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //鼠标移动变色
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //当鼠标放上去的时候 先保存当前行的背景颜色 并给附一颜色 
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f6f6f6',this.style.fontWeight='';");
            //当鼠标离开的时候 将背景颜色还原的以前的颜色 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor,this.style.fontWeight='';");
        }
        //单击行改变行背景颜色 
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onclick", "this.style.backgroundColor='#f6f6f6'; this.style.color='buttontext';this.style.cursor='default';");

            he += decimal.Parse((e.Row.Cells[6].FindControl("Label15") as Label).Text);
            dqbx += decimal.Parse((e.Row.Cells[7].FindControl("Label152") as Label).Text);
            xybx += decimal.Parse((e.Row.Cells[8].FindControl("Label153") as Label).Text);
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[6].Text = he.ToString();
            e.Row.Cells[7].Text = dqbx.ToString();
            e.Row.Cells[8].Text = xybx.ToString();
            e.Row.Cells[0].Text = "合计";
        }
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        for (int rowIndex = 0; rowIndex < GvInfo.Rows.Count; rowIndex++)
        {
            if (((CheckBox)GvInfo.Rows[rowIndex].Cells[0].FindControl("chkSelect")).Checked)
            {
                if (DelCode(Convert.ToInt32(GvInfo.DataKeys[rowIndex].Value)))
                {

                }
            }
        }
        GetInfo();
        js.Alertjs("删除成功！");
    }
    protected void btnSelectAll_Click(object sender, EventArgs e)
    {

        Button btn = (Button)sender;
        bool isOK = false;
        if (btn.Text == "全选")
        {
            isOK = true;
            //找到PagerTemplate中的全选按钮
            btnSelectAll.Text = "取消全选";
        }
        else
        {
            btnSelectAll.Text = "全选";
        }

        foreach (GridViewRow row in GvInfo.Rows)
        {
            ((CheckBox)row.Cells[0].FindControl("chkSelect")).Checked = isOK;
        }
    }
    public bool DelCode(int id)
    {
        bool isOK = false;
        string sql = "delete from [LC_Money] where id=" + id;
        SqlConnection con = new SqlConnection(SqlHelper.connstring);
        SqlCommand cmd = new SqlCommand(sql, con);
        try
        {
            con.Open();
            if (cmd.ExecuteNonQuery() > 0)
                isOK = true;
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return isOK;
    }

    public DataSet GetCodeBy(int iCount)
    {
        SqlHelper date = new SqlHelper();
        string strTop = "";

        if (iCount > 1)
        {
            strTop = "top " + iCount.ToString();
        }
        string sql = "select  " + strTop + "  * from [LC_Money] where AddUserId='" + Session["UserId"].ToString() + "'";
        if (!drpSubItem.SelectedValue.Equals("全部"))
        {
            sql += " and TypeName='" + drpSubItem.SelectedValue + "'";
        }
        SqlConnection con = new SqlConnection(SqlHelper.connstring);
        SqlCommand cmd = new SqlCommand(sql, con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = null;
        try
        {
            con.Open();
            ds = new DataSet();
            da.Fill(ds);

        }
        catch (SqlException ex)
        {
            throw ex;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return ds;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        Response.Redirect("AddCK.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GetInfo();
    }
}
