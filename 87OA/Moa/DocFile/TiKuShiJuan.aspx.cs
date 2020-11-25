
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

public partial class DocFile_TiKuShiJuan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview("");

            //设定按钮权限            
            ImageButton1.Visible = ZWL.Common.PublicMethod.StrIFIn("|045A|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton5.Visible = ZWL.Common.PublicMethod.StrIFIn("|045M|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton3.Visible = ZWL.Common.PublicMethod.StrIFIn("|045D|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton2.Visible = ZWL.Common.PublicMethod.StrIFIn("|045E|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
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

        //判定是否有权限
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label MyLab = (Label)e.Row.FindControl("Label100");
            MyLab.Visible = ZWL.Common.PublicMethod.StrIFIn("|045N|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));

            Label LabV = (Label)e.Row.FindControl("LabVisible");
            if (ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 IFSuiJiChuTi from ERPTiKuShiJuan where ID=" + LabV.Text) == "否")
            {                
                MyLab.Text = "[<a class=\"BlueCss\" href=\"TiKuShiJuanSet.aspx?ID=" + LabV.Text + "&FenLeiStr=单项选择题\">单选题</a>]";
                MyLab.Text = MyLab.Text + "[<a class=\"BlueCss\" href=\"TiKuShiJuanSet.aspx?ID=" + LabV.Text + "&FenLeiStr=多项选择题\">多选题</a>]";
                MyLab.Text = MyLab.Text + "[<a class=\"BlueCss\" href=\"TiKuShiJuanSet.aspx?ID=" + LabV.Text + "&FenLeiStr=判断题\">判断题</a>]";
                MyLab.Text = MyLab.Text + "[<a class=\"BlueCss\" href=\"TiKuShiJuanSet.aspx?ID=" + LabV.Text + "&FenLeiStr=填空题\">填空题</a>]";
                MyLab.Text = MyLab.Text + "[<a class=\"BlueCss\" href=\"TiKuShiJuanSet.aspx?ID=" + LabV.Text + "&FenLeiStr=简答题\">简答题</a>]";
            }
            else
            {
                MyLab.Text = "[<a class=\"BlueCss\" href=\"TiKuShiJuanSetDongTai.aspx?ID=" + LabV.Text + "\">设置题目</a>]";
            }
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
		ZWL.BLL.ERPTiKuShiJuan MyModel = new ZWL.BLL.ERPTiKuShiJuan();
		if (IDList.Trim().Length > 0)
		{
		    GVData.DataSource = MyModel.GetList(" " + DropDownList2.SelectedItem.Value.ToString() + " like '%" + this.TextBox3.Text.Trim() + "%' and ID in(" + IDList + ") order by ID desc");
		}
		else
		{
		    GVData.DataSource = MyModel.GetList(" " + DropDownList2.SelectedItem.Value.ToString() + " like '%" + this.TextBox3.Text.Trim() + "%' order by ID desc");
		}
		GVData.DataBind();
		LabPageSum.Text = Convert.ToString(GVData.PageCount);
		LabCurrentPage.Text = Convert.ToString(((int)GVData.PageIndex + 1));
		this.GoPage.Text = LabCurrentPage.Text.ToString();
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		Response.Redirect("TiKuShiJuanAdd.aspx");
	}
	protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
	{
		string IDlist = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
		if (ZWL.DBUtility.DbHelperSQL.ExecuteSQL("delete from ERPTiKuShiJuan where ID in (" + IDlist + ")") == -1)
		{
			Response.Write("<script>alert('删除选中记录时发生错误！请重新登陆后重试！');</script>");
		}
		else
		{
			DataBindToGridview("");
			//写系统日志
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户删除试卷管理信息";
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
		MyTable.Add("ShiJuanTitle", "试卷标题");
		MyTable.Add("IFSuiJiChuTi", "是否随机出题");
		MyTable.Add("FenLeiShunXu", "题目显示顺序");
		MyTable.Add("KaoShiXianShi", "考试限时（分）");
		MyTable.Add("PanDuanTiList", "判断题");
		MyTable.Add("DanXuanTiList", "单选题");
		MyTable.Add("DuoXuanTiList", "多选题");
		MyTable.Add("TianKongTiList", "填空题");
		MyTable.Add("JianDaTiList", "简答题");
		MyTable.Add("PanDuanFenShu", "判断题每题分数");
		MyTable.Add("DanXuanFenShu", "单选题每题分数");
		MyTable.Add("DuoXuanFenShu", "多选题每题分数");
		MyTable.Add("TianKongFenShu", "填空题每题分数");
		MyTable.Add("JianDaFenShu", "简答题每题分数");
		MyTable.Add("BackInfo", "备注说明");
		MyTable.Add("UserName", "录入人");
		MyTable.Add("TimeStr", "录入时间");
		ZWL.Common.DataToExcel.GridViewToExcel(ZWL.DBUtility.DbHelperSQL.GetDataSet("select  ShiJuanTitle,IFSuiJiChuTi,FenLeiShunXu,KaoShiXianShi,PanDuanTiList,DanXuanTiList,DuoXuanTiList,TianKongTiList,JianDaTiList,PanDuanFenShu,DanXuanFenShu,DuoXuanFenShu,TianKongFenShu,JianDaFenShu,BackInfo,UserName,TimeStr  from ERPTiKuShiJuan where ID in (" + IDList + ") order by ID desc"), MyTable, "Excel报表");
	}
	protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
	{
		string CheckStr = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
		string[] CheckStrArray = CheckStr.Split(',');
		Response.Redirect("TiKuShiJuanModify.aspx?ID=" + CheckStrArray[0].ToString());
	}
}
