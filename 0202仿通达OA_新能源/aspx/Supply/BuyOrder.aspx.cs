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

namespace OA.aspx.Supply{ 
 public partial class BuyOrder: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            DataBindToGridview();

            //设定按钮权限            
            iButton1.Visible = FTD.Unit.PublicMethod.StrIFIn("|A016A|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
            iButton5.Visible = FTD.Unit.PublicMethod.StrIFIn("|A016M|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
            iButton3.Visible = FTD.Unit.PublicMethod.StrIFIn("|A016D|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
            iButton2.Visible = FTD.Unit.PublicMethod.StrIFIn("|A016E|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
        }
    }

   

    public void DataBindToGridview()
    {
        FTD.BLL.ERPBuyOrder MyModel = new FTD.BLL.ERPBuyOrder();
        MyModel.HZ();
        string XiaShuUser = FTD.DBUnit.DbHelperSQL.GetSHSLInt("select top 1 XiaShuUser from ERPUser where UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "'");
        string SSTempSTR = "";
        if (XiaShuUser != "全部")
        {
            SSTempSTR = "and UserName in(" + "'" + XiaShuUser.Replace(",", "','") + "'" + ")";
        }
        string sql = "";
        if (!string.IsNullOrEmpty(this.TextBox1.Text))
        {
            sql += "(OrderName Like '%" + this.TextBox1.Text + "%' or GongYingShangName Like '%" + this.TextBox1.Text + "%' or Serils Like '%" + this.TextBox1.Text + "%' or DingDanLeiXing Like '%" + this.TextBox1.Text + "%' or UserName Like '%" + this.TextBox1.Text + "%' or SFJF Like '%" + this.TextBox1.Text + "%')";
        }
        if (!string.IsNullOrEmpty(this.TextBox3.Text))
        {
            if (string.IsNullOrEmpty(sql))
            {
                sql += " (TimeStr >='" + this.TextBox3.Text.Trim() + " 00:00:00' and TimeStr<='" + this.TextBox4.Text.Trim() + " 23:59:59')  or (LaiHuoDate >='" + this.TextBox3.Text.Trim() + " 00:00:00' and LaiHuoDate<='" + this.TextBox4.Text.Trim() + " 23:59:59') or (TiXingDate >='" + this.TextBox3.Text.Trim() + " 00:00:00' and TiXingDate<='" + this.TextBox4.Text.Trim() + " 23:59:59') ";
            }
            else
            {
                sql += "and (TimeStr >='" + this.TextBox3.Text.Trim() + " 00:00:00' and TimeStr<='" + this.TextBox4.Text.Trim() + " 23:59:59')  or (LaiHuoDate >='" + this.TextBox3.Text.Trim() + " 00:00:00' and LaiHuoDate<='" + this.TextBox4.Text.Trim() + " 23:59:59') or (TiXingDate >='" + this.TextBox3.Text.Trim() + " 00:00:00' and TiXingDate<='" + this.TextBox4.Text.Trim() + " 23:59:59')";
            }
            sql += " " + SSTempSTR + " order by ID desc";

        }
        GVData.DataSource = MyModel.GetList(sql);
        GVData.DataBind();
        LabPageSum.Text = Convert.ToString(GVData.PageCount);
        LabCurrentPage.Text = Convert.ToString(((int)GVData.PageIndex + 1));
        this.GoPage.Text = LabCurrentPage.Text.ToString();
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

            DataBindToGridview();
        }
        catch
        {
            DataBindToGridview();
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
        DataBindToGridview();
    }
    #endregion
    protected void GVData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        FTD.Unit.PublicMethod.GridViewRowDataBound(e);
    }
    protected void iButton4_Click(object sender, EventArgs e)
    {
        DataBindToGridview();
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        //通过审批
        string IDlist = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        if (FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPBuyOrder set NowState='通过审核'  where  ID in (" + IDlist + ")") == -1)
        {
            Response.Write("<script>alert('审批选中记录时发生错误！请重新登陆后重试！');</script>");
        }
        else
        {
            DataBindToGridview();
            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户批准通过采购订单";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();
        }
    }
    protected void iButton3_Click(object sender, EventArgs e)
    {
        string IDlist = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        if (FTD.DBUnit.DbHelperSQL.ExecuteSQL("delete from ERPBuyOrder where ID in (" + IDlist + ")") == -1)
        {
            Response.Write("<script>alert('删除选中记录时发生错误！请重新登陆后重试！');</script>");
        }
        else
        {
            DataBindToGridview();
            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户删除采购订单信息";
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
        MyTable.Add("OrderName", "订单名称");
        MyTable.Add("Serils", "订单编码");
        MyTable.Add("DingDanLeiXing", "订单类别");
        MyTable.Add("GongYingShangName", "供应商");
        MyTable.Add("ChuangJianRen", "创建人");
        MyTable.Add("CreateDate", "创建时间");
        MyTable.Add("NowState", "当前状态");

        FTD.Unit.DataToExcel.GridViewToExcel(FTD.DBUnit.DbHelperSQL.GetDataSet("select OrderName,Serils,DingDanLeiXing,GongYingShangName,ChuangJianRen,CreateDate,NowState from ERPBuyOrder where ID in (" + IDList + ") order by ID desc"), MyTable, "Excel报表");
    }
    protected void iButton5_Click(object sender, EventArgs e)
    {
        //拒绝审批
        string IDlist = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        if (FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPBuyOrder set NowState='审核未通过'  where  ID in (" + IDlist + ")") == -1)
        {
            Response.Write("<script>alert('审批选中记录时发生错误！请重新登陆后重试！');</script>");
        }
        else
        {
            DataBindToGridview();
            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户审核未通过采购订单信息";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();
        }
    }
}}