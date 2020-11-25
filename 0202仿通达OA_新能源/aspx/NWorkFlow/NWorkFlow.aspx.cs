
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

namespace OA.aspx.NWorkFlow{ 
 public partial class NWorkFlow: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            DataBindToGridview("");

            //设定按钮权限            
            iButton1.Visible = FTD.Unit.PublicMethod.StrIFIn("|023A|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
            iButton5.Visible = FTD.Unit.PublicMethod.StrIFIn("|023M|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
            iButton3.Visible = FTD.Unit.PublicMethod.StrIFIn("|023D|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
            iButton2.Visible = FTD.Unit.PublicMethod.StrIFIn("|023E|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));

            if (Request.QueryString["FormID"].ToString().Trim() == "0")
            {
                iButton1.Visible = false;
                iButton2.Visible = false;
                iButton3.Visible = false;
                iButton5.Visible = false;
            }

            this.Label1.Text ="["+ FTD.DBUnit.DbHelperSQL.GetSHSL("select FormName from ERPNForm where ID=" + Request.QueryString["FormID"].ToString().Trim())+"]";
        }
    }
    #region  分页方法
    protected void ButtonGo_Click(object sender, EventArgs e)
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
    protected void PagerButtonClick(object sender, EventArgs e)
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
        FTD.Unit.PublicMethod.GridViewRowDataBound(e);

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label LabID = (Label)e.Row.FindControl("LabVisible");
            HyperLink MyHyp = (HyperLink)e.Row.FindControl("HyperLink10");
            
            string NumStr=FTD.DBUnit.DbHelperSQL.GetSHSLInt("select count(*) from ERPNWorkToDo where StateNow='正在办理'  and WorkFlowID="+LabID.Text.Trim());
            if (NumStr!="0")
            {
                MyHyp.Text = "有"+NumStr+"件工作正在办理，不可定义节点！";
                MyHyp.NavigateUrl = "javascript:void(0);";
            }
        }

        //判定是否有权限
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HyperLink MyHyp = (HyperLink)e.Row.FindControl("HyperLink10");
            MyHyp.Visible = FTD.Unit.PublicMethod.StrIFIn("|023N|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
        }

    }
    protected void iButton6_Click(object sender, EventArgs e)
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
    protected void iButton4_Click(object sender, EventArgs e)
    {
        DataBindToGridview("");
    }
	public void DataBindToGridview(string IDList)
	{
		FTD.BLL.ERPNWorkFlow MyModel = new FTD.BLL.ERPNWorkFlow();
		if (IDList.Trim().Length > 0)
		{
            GVData.DataSource = MyModel.GetList(" " + DropDownList2.SelectedItem.Value.ToString() + " like '%" + this.TextBox3.Text.Trim() + "%' and FormID=" + Request.QueryString["FormID"].ToString() + " and ID in(" + IDList + ") order by PaiXuStr asc,ID desc");
		}
		else
		{
            GVData.DataSource = MyModel.GetList(" " + DropDownList2.SelectedItem.Value.ToString() + " like '%" + this.TextBox3.Text.Trim() + "%' and FormID=" + Request.QueryString["FormID"].ToString() + " order by PaiXuStr asc,ID desc");
		}
		GVData.DataBind();
		LabPageSum.Text = Convert.ToString(GVData.PageCount);
		LabCurrentPage.Text = Convert.ToString(((int)GVData.PageIndex + 1));
		this.GoPage.Text = LabCurrentPage.Text.ToString();
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
        Response.Redirect("NWorkFlowAdd.aspx?FormID=" + Request.QueryString["FormID"].ToString());
	}
	protected void iButton3_Click(object sender, EventArgs e)
	{
		string IDlist = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
		if (FTD.DBUnit.DbHelperSQL.ExecuteSQL("delete from ERPNWorkFlow where ID in (" + IDlist + ")") == -1)
		{
			Response.Write("<script>alert('删除选中记录时发生错误！请重新登陆后重试！');</script>");
		}
		else
		{
			DataBindToGridview("");
			//写系统日志
			FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
			MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户删除流程定义信息";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
		}
	}
	protected void iButton2_Click(object sender, EventArgs e)
	{
		string IDList = "0";
		for (int i = 0; i < GVData.Rows.Count; i++)
		{
			Label LabVis = (Label)GVData.Rows[i].FindControl("LabVisible");
			IDList = IDList + "," + LabVis.Text.ToString();
		}
		Hashtable MyTable = new Hashtable();
		MyTable.Add("WorkFlowName", "流程名称");
		MyTable.Add("FormID", "所用表单");
		MyTable.Add("UserListOK", "允许使用人");
		MyTable.Add("DepListOK", "允许使用部门");
		MyTable.Add("JiaoSeListOK", "允许使用角色");
		MyTable.Add("PaiXuStr", "排序字符");
		MyTable.Add("UserName", "录入人");
		MyTable.Add("TimeStr", "录入时间");
		MyTable.Add("BackInfo", "简要说明");
		MyTable.Add("IFOK", "是否启用");
		FTD.Unit.DataToExcel.GridViewToExcel(FTD.DBUnit.DbHelperSQL.GetDataSet("select  WorkFlowName,FormID,UserListOK,DepListOK,JiaoSeListOK,PaiXuStr,UserName,TimeStr,BackInfo,IFOK  from ERPNWorkFlow where ID in (" + IDList + ") order by ID desc"), MyTable, "Excel报表");
	}
	protected void iButton5_Click(object sender, EventArgs e)
	{
		string CheckStr = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
		string[] CheckStrArray = CheckStr.Split(',');
		Response.Redirect("NWorkFlowModify.aspx?FormID=" + Request.QueryString["FormID"].ToString()+"&ID=" + CheckStrArray[0].ToString());
	}
    protected void iButton7_Click(object sender, EventArgs e)
    {
        string CheckStr = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        string[] CheckStrArray = CheckStr.Split(',');

        string CopyStr = "insert into ERPNWorkFlow([WorkFlowName], [FormID], [UserListOK], [DepListOK], [JiaoSeListOK], [PaiXuStr], [UserName], [TimeStr], [BackInfo], [IFOK]) (select [WorkFlowName]+'-副本', [FormID], [UserListOK], [DepListOK], [JiaoSeListOK], [PaiXuStr], [UserName], [TimeStr], [BackInfo], [IFOK] from ERPNWorkFlow where ID=" + CheckStrArray[0].ToString() + ")";
        FTD.DBUnit.DbHelperSQL.ExecuteSQL(CopyStr);

        string MaxIDStr = FTD.DBUnit.DbHelperSQL.GetSHSLInt("select top 1 ID from ERPNWorkFlow order by ID desc");
        //复制节点
        string CopyNodeStr = "insert into ERPNWorkFlowNode([WorkFlowID], [NodeSerils], [NodeName], [NodeAddr], [NextNode], [IFCanJump], [IFCanView], [IFCanEdit], [IFCanDel], [JieShuHours], [PSType], [SPType], [SPDefaultList], [CanWriteSet], [SecretSet], [ConditionSet], [NodeLeft], [NodeTop])(select " + MaxIDStr + ", [NodeSerils], [NodeName], [NodeAddr], [NextNode], [IFCanJump], [IFCanView], [IFCanEdit], [IFCanDel], [JieShuHours], [PSType], [SPType], [SPDefaultList], [CanWriteSet], [SecretSet], [ConditionSet], [NodeLeft], [NodeTop] from ERPNWorkFlowNode where WorkFLowID=" + CheckStrArray[0].ToString() + ")";
        FTD.DBUnit.DbHelperSQL.ExecuteSQL(CopyNodeStr);

        FTD.Unit.MessageBox.Show(this, "工作流程数据复制完成！");
        DataBindToGridview("");
    }
}
}