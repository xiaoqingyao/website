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
public partial class TJMoney : System.Web.UI.Page
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
        }

    }

    public DataSet GetCodeBy(int iCount)
    {
        SqlHelper date = new SqlHelper();
        string strTop = "";
        string sql = "";
        if (iCount > 1)
        {
            strTop = "top " + iCount.ToString();
        }
        if (DropDownList1.SelectedValue == "本周")
        {
            sql = "select  " + strTop + "  * from [F_Money]  where   datediff(week,AddTime,getdate())<1 and  AddUserId='" + Session["UserId"].ToString() + "' and Type='" + drpSubItem.SelectedValue + "'";
        }

        if (DropDownList1.SelectedValue == "本月")
        {
            sql = "select  " + strTop + "  * from [F_Money]  where   datediff(month,AddTime,getdate())<1 and  AddUserId='" + Session["UserId"].ToString() + "' and Type='" + drpSubItem.SelectedValue + "'";
        }
        if (DropDownList1.SelectedValue == "本年")
        {
            sql = "select  " + strTop + "  * from [F_Money]  where   datediff(year,AddTime,getdate())<1 and  AddUserId='" + Session["UserId"].ToString() + "' and Type='" + drpSubItem.SelectedValue + "'";
        }
        if (DropDownList1.SelectedValue == "全部")
        {
            sql = "select  " + strTop + "  * from [F_Money] where AddUserId='" + Session["UserId"].ToString() + "' and Type='" + drpSubItem.SelectedValue + "' ";
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

    protected void Button4_Click(object sender, EventArgs e)
    {
        GetInfo();

    }
}
