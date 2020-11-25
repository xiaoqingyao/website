
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

public partial class Office_SheBei : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview("");

            //设定按钮权限            
            ImageButton1.Visible = ZWL.Common.PublicMethod.StrIFIn("|090A|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton5.Visible = ZWL.Common.PublicMethod.StrIFIn("|090M|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton3.Visible = ZWL.Common.PublicMethod.StrIFIn("|090D|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton2.Visible = ZWL.Common.PublicMethod.StrIFIn("|090E|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
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
		ZWL.BLL.ERPSheBei MyModel = new ZWL.BLL.ERPSheBei();
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
		Response.Redirect("SheBeiAdd.aspx");
	}
	protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
	{
		string IDlist = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
		if (ZWL.DBUtility.DbHelperSQL.ExecuteSQL("delete from ERPSheBei where ID in (" + IDlist + ")") == -1)
		{
			Response.Write("<script>alert('删除选中记录时发生错误！请重新登陆后重试！');</script>");
		}
		else
		{
			DataBindToGridview("");
			//写系统日志
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户删除仪器设备信息";
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
		MyTable.Add("SheBeiName", "设备名称");
		MyTable.Add("YuanBianHao", "原资产编号");
		MyTable.Add("CaiWuBianHao", "财务编号");
		MyTable.Add("JiBuBianHao", "技质部编号");
		MyTable.Add("SheBeiLeiBie", "设备类别");
		MyTable.Add("XingHao", "型号");
		MyTable.Add("XiangMu", "项目");
		MyTable.Add("ChuChangBianHao", "出厂编号");
		MyTable.Add("ShiYongBuMen", "使用部门");
		MyTable.Add("ShengChanChangJia", "生产厂家");
		MyTable.Add("DanWei", "单位");
		MyTable.Add("DanJia", "单价(元)");
		MyTable.Add("SuYuanFangShi", "溯源方式");
		MyTable.Add("SuYaunDanWei", "溯源单位");
		MyTable.Add("SuYuanZhouQi", "溯源周期(月)");
		MyTable.Add("ShangCiSuYuanDate", "上次溯源日期");
		MyTable.Add("JiHuaSuYaunDate", "计划溯源日期");
		MyTable.Add("ZhengShuBianHao", "证书编号");
		MyTable.Add("CeLiangFanWei", "检定/校准结果-测量范围");
		MyTable.Add("BuQueDingDu", "不确定度或准确度等级或最大允许误差");
		MyTable.Add("ShiYongCeLiangFanWei", "使用要求--测量范围");
		MyTable.Add("JingDu", "精度");
		MyTable.Add("JieGuoPingJia", "校准结果评价");
		MyTable.Add("PingJiaUser", "评价人员");
		MyTable.Add("QianZiDate", "签字日期");
		MyTable.Add("ZhengGai", "整改内容及结果");
		MyTable.Add("ChuCiSuYuanDate", "初次溯源日期");
		MyTable.Add("QiYongDate", "启用日期");
		MyTable.Add("CunFangAddr", "存放位置");
		MyTable.Add("GuanLiUser", "管理人");
		MyTable.Add("JiFei", "检定计费");
		MyTable.Add("ZhuangTai", "设备状态");
		MyTable.Add("BeiZhu", "备注");
		MyTable.Add("HeDuiUser", "核对人");
		MyTable.Add("TiXingDate", "提醒日期");
		MyTable.Add("TiXingUser", "被提醒人");
		MyTable.Add("UserName", "录入人");
		MyTable.Add("TimeStr", "录入时间");
		ZWL.Common.DataToExcel.GridViewToExcel(ZWL.DBUtility.DbHelperSQL.GetDataSet("select  SheBeiName,YuanBianHao,CaiWuBianHao,JiBuBianHao,SheBeiLeiBie,XingHao,XiangMu,ChuChangBianHao,ShiYongBuMen,ShengChanChangJia,DanWei,DanJia,SuYuanFangShi,SuYaunDanWei,SuYuanZhouQi,ShangCiSuYuanDate,JiHuaSuYaunDate,ZhengShuBianHao,CeLiangFanWei,BuQueDingDu,ShiYongCeLiangFanWei,JingDu,JieGuoPingJia,PingJiaUser,QianZiDate,ZhengGai,ChuCiSuYuanDate,QiYongDate,CunFangAddr,GuanLiUser,JiFei,ZhuangTai,BeiZhu,HeDuiUser,TiXingDate,TiXingUser,UserName,TimeStr  from ERPSheBei where ID in (" + IDList + ") order by ID desc"), MyTable, "Excel报表");
	}
	protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
	{
		string CheckStr = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
		string[] CheckStrArray = CheckStr.Split(',');
		Response.Redirect("SheBeiModify.aspx?ID=" + CheckStrArray[0].ToString());
	}
}
