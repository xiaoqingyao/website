
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

public partial class ReportCenter_Report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview("");

            //设定按钮权限            
            ImageButton1.Visible = ZWL.Common.PublicMethod.StrIFIn("|131A|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton5.Visible = ZWL.Common.PublicMethod.StrIFIn("|131M|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton3.Visible = ZWL.Common.PublicMethod.StrIFIn("|131D|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton2.Visible = ZWL.Common.PublicMethod.StrIFIn("|131E|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));

            if (Request.QueryString["TypeID"].ToString().Trim() == "0")
            {
                ImageButton1.Visible = false;
                ImageButton2.Visible = false;
                ImageButton3.Visible = false;
                ImageButton5.Visible = false;
            }

            this.Label1.Text = "[" + ZWL.DBUtility.DbHelperSQL.GetSHSL("select TypeName from ERPReportType where ID=" + Request.QueryString["TypeID"].ToString().Trim()) + "]";
        }
    }
    #region  分页方法
    protected void ButtonGo_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (GoPage.Text.Trim().ToString() == "")
            {
                Response.Write("<script language='javascript'>alert('页码不可以为空!');</script>");
            }
            else if (GoPage.Text.Trim().ToString() == "0" || Convert.ToInt32(GoPage.Text.Trim().ToString()) > GVData.PageCount)
            {
                Response.Write("<script language='javascript'>alert('页码不是一个有效值!');</script>");
            }
            else if (GoPage.Text.Trim() != "")
            {
                int PageI = Int32.Parse(GoPage.Text.Trim()) - 1;
                if (PageI >= 0 && PageI < (GVData.PageCount))
                {
                    GVData.PageIndex = PageI;
                }
            }

            if (TxtPageSize.Text.Trim().ToString() == "")
            {
                Response.Write("<script language='javascript'>alert('每页显示行数不可以为空!');</script>");
            }
            else if (TxtPageSize.Text.Trim().ToString() == "0")
            {
                Response.Write("<script language='javascript'>alert('每页显示行数不是一个有效值!');</script>");
            }
            else if (TxtPageSize.Text.Trim() != "")
            {
                try
                {
                    int MyPageSize = int.Parse(TxtPageSize.Text.ToString().Trim());
                    this.GVData.PageSize = MyPageSize;
                }
                catch
                {
                    Response.Write("<script language='javascript'>alert('每页显示行数不是一个有效值!');</script>");
                }
            }

            DataBindToGridview("");
        }
        catch
        {
            DataBindToGridview("");
            Response.Write("<script language='javascript'>alert('请输入有效数字！');</script>");
        }
    }
    protected void PagerButtonClick(object sender, ImageClickEventArgs e)
    {
        //获得Button的参数值
        string arg = ((ImageButton)sender).CommandName.ToString();
        switch (arg)
        {
            case ("Next"):
                if (this.GVData.PageIndex < (GVData.PageCount - 1))
                    GVData.PageIndex++;
                break;
            case ("Pre"):
                if (GVData.PageIndex > 0)
                    GVData.PageIndex--;
                break;
            case ("Last"):
                try
                {
                    GVData.PageIndex = (GVData.PageCount - 1);
                }
                catch
                {
                    GVData.PageIndex = 0;
                }

                break;
            default:
                //本页值
                GVData.PageIndex = 0;
                break;
        }
        DataBindToGridview("");
    }
    #endregion
    protected void GVData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ZWL.Common.PublicMethod.GridViewRowDataBound(e);
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label LabID = (Label)e.Row.FindControl("LabVisible");
            HyperLink MyHyp = (HyperLink)e.Row.FindControl("HyperLink10");

            DataSet MyDataSet = ZWL.DBUtility.DbHelperSQL.GetDataSet("select top 1 * from ERPReport where ID=" + LabID.Text);
            if (CheckIFOK(MyDataSet.Tables[0].Rows[0]["UserListOK"].ToString(), MyDataSet.Tables[0].Rows[0]["DepListOK"].ToString(), MyDataSet.Tables[0].Rows[0]["JiaoSeListOK"].ToString()) == true)
            {

            }
            else
            {
                MyHyp.NavigateUrl = "javascript:void(0);";
                MyHyp.Text = "无权限";
                MyHyp.ForeColor = System.Drawing.Color.Gray;
            }
        }
    }

    public bool CheckIFOK(string YunXuUser, string YunXuBuMen, string YunXuJiaoSe)
    {
        //admin      超级管理员,外部企业      admin,zwl,zzz    超级管理员,外部企业,一般员工        
        if (YunXuUser == "全部" || YunXuBuMen == "全部" || YunXuJiaoSe == "全部")
        {
            //在允许字段中
            return true;
        }
        else if (ZWL.Common.PublicMethod.StrIFIn("," + ZWL.Common.PublicMethod.GetSessionValue("UserName") + ",", "," + YunXuUser + ",") == true)
        {
            //在允许字段中
            return true;
        }
        else
        {
            string[] JiaoSeArray = ZWL.Common.PublicMethod.GetSessionValue("JiaoSe").Split(',');
            for (int jk = 0; jk < JiaoSeArray.Length; jk++)
            {
                if (ZWL.Common.PublicMethod.StrIFIn("," + JiaoSeArray[jk] + ",", "," + YunXuJiaoSe + ",") == true)
                {
                    return true;
                }
            }

            string[] BuMenArray = ZWL.Common.PublicMethod.GetSessionValue("Department").Split(',');
            for (int jk = 0; jk < JiaoSeArray.Length; jk++)
            {
                if (ZWL.Common.PublicMethod.StrIFIn("," + BuMenArray[jk] + ",", "," + YunXuBuMen + ",") == true)
                {
                    return true;
                }
            }

            return false;
        }
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        //保存上一次查询结果
        string JJ = "0";
        for (int i = 0; i < this.GVData.Rows.Count; i++)
        {
            Label LabV = (Label)GVData.Rows[i].FindControl("LabVisible");
            JJ = JJ + "," + LabV.Text.Trim();
        }
        DataBindToGridview(JJ);
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        DataBindToGridview("");
    }
	public void DataBindToGridview(string IDList)
	{
		ZWL.BLL.ERPReport MyModel = new ZWL.BLL.ERPReport();
		if (IDList.Trim().Length > 0)
		{
            GVData.DataSource = MyModel.GetList(" " + DropDownList2.SelectedItem.Value.ToString() + " like '%" + this.TextBox3.Text.Trim() + "%' and TypeID=" + Request.QueryString["TypeID"].ToString() + " and ID in(" + IDList + ") order by PaiXuStr asc,ID desc");
		}
		else
		{
            GVData.DataSource = MyModel.GetList(" " + DropDownList2.SelectedItem.Value.ToString() + " like '%" + this.TextBox3.Text.Trim() + "%' and TypeID=" + Request.QueryString["TypeID"].ToString() + " order by PaiXuStr asc,ID desc");
		}
		GVData.DataBind();
		LabPageSum.Text = Convert.ToString(GVData.PageCount);
		LabCurrentPage.Text = Convert.ToString(((int)GVData.PageIndex + 1));
		this.GoPage.Text = LabCurrentPage.Text.ToString();
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		Response.Redirect("ReportAdd.aspx?TypeID="+Request.QueryString["TypeID"].ToString());
	}
	protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
	{
		string IDlist = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
		if (ZWL.DBUtility.DbHelperSQL.ExecuteSQL("delete from ERPReport where ID in (" + IDlist + ")") == -1)
		{
			Response.Write("<script>alert('删除选中记录时发生错误！请重新登陆后重试！');</script>");
		}
		else
		{
			DataBindToGridview("");
			//写系统日志
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户删除报表管理信息";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
		}
	}
	protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
	{
		string IDList = "0";
		for (int i = 0; i < GVData.Rows.Count; i++)
		{
			Label LabVis = (Label)GVData.Rows[i].FindControl("LabVisible");
			IDList = IDList + "," + LabVis.Text.ToString();
		}
		Hashtable MyTable = new Hashtable();
		MyTable.Add("ReportName", "报表名称");
		MyTable.Add("BackInfo", "备注");
		MyTable.Add("TypeID", "所属分类ID");
		MyTable.Add("UserListOK", "允许使用人");
		MyTable.Add("DepListOK", "允许使用部门");
		MyTable.Add("JiaoSeListOK", "允许使用角色");
		MyTable.Add("PaiXuStr", "排序字符");
		MyTable.Add("UserName", "录入人");
		MyTable.Add("TimeStr", "录入时间");
		ZWL.Common.DataToExcel.GridViewToExcel(ZWL.DBUtility.DbHelperSQL.GetDataSet("select  ReportName,BackInfo,TypeID,UserListOK,DepListOK,JiaoSeListOK,PaiXuStr,UserName,TimeStr  from ERPReport where ID in (" + IDList + ") order by ID desc"), MyTable, "Excel报表");
	}
	protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
	{
		string CheckStr = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
		string[] CheckStrArray = CheckStr.Split(',');
        Response.Redirect("ReportModify.aspx?ID=" + CheckStrArray[0].ToString() + "&TypeID=" + Request.QueryString["TypeID"].ToString());
	}
}
