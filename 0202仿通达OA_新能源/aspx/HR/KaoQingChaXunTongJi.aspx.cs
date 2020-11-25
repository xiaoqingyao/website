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

namespace OA.aspx.HR{ 
 public partial class KaoQingChaXunTongJi: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();            
            //设置月初和当前时间
            this.TextBox2.Text = DateTime.Now.AddDays(1 - DateTime.Now.Day).ToShortDateString();
            this.TextBox3.Text = DateTime.Now.Date.ToShortDateString();

            DataBindToGridview();


            iButton2.Visible = FTD.Unit.PublicMethod.StrIFIn("|108E|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
        }
    }
    public void DataBindToGridview()
    {
        FTD.BLL.ERPUser MyModel = new FTD.BLL.ERPUser();
        GVData.DataSource = MyModel.GetList("Department like '%" + this.TextBox1.Text.Trim() + "%' order by UserName asc");
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
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            
            //绑定正常登记的次数
            Label MyLabel = (Label)e.Row.FindControl("Label1");
            int i1 = 0;
            string s1 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime1<=GuiDingTime1 and DengJiTime1 is not null");
            string s2 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime2>=GuiDingTime2 and DengJiTime2 is not null");
            string s3 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime3<=GuiDingTime3 and DengJiTime3 is not null");
            string s4 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime4>=GuiDingTime4 and DengJiTime4 is not null");
            string s5 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime5<=GuiDingTime5 and DengJiTime5 is not null");
            string s6 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime6>=GuiDingTime6 and DengJiTime6 is not null");
            if (s1.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s1.Trim());
            }
            if (s2.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s2.Trim());
            }
            if (s3.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s3.Trim());
            }
            if (s4.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s4.Trim());
            }
            if (s5.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s5.Trim());
            }
            if (s6.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s6.Trim());
            }
            MyLabel.Text = i1.ToString();
            if (MyLabel.Text == "0")
            {
                MyLabel.Text = "";
            }

            //绑定考勤工作日数量
            Label MyLabelx = (Label)e.Row.FindControl("Label44");
            MyLabelx.Text = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')");
           

            //绑定迟到登记的次数
            Label MyLabel2 = (Label)e.Row.FindControl("Label2");
            i1 = 0;
            s1 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime1>GuiDingTime1 and DengJiTime1 is not null");
            s2 = "0";
            s3 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime3>GuiDingTime3 and DengJiTime3 is not null");
            s4 = "0";
            s5 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime5>GuiDingTime5 and DengJiTime5 is not null");
            s6 = "0";
            if (s1.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s1.Trim());
            }
            if (s2.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s2.Trim());
            }
            if (s3.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s3.Trim());
            }
            if (s4.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s4.Trim());
            }
            if (s5.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s5.Trim());
            }
            if (s6.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s6.Trim());
            }
            MyLabel2.Text = i1.ToString();
            if (MyLabel2.Text == "0")
            {
                MyLabel2.Text = "";
            }

            //绑定早退登记的次数
            Label MyLabel3 = (Label)e.Row.FindControl("Label3");
            i1 = 0;
            s1 = "0";
            s2 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime2<GuiDingTime2 and DengJiTime2 is not null");
            s3 = "0";
            s4 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime4<GuiDingTime4 and DengJiTime4 is not null");
            s5 = "0";
            s6 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime6<GuiDingTime6 and DengJiTime6 is not null");
            if (s1.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s1.Trim());
            }
            if (s2.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s2.Trim());
            }
            if (s3.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s3.Trim());
            }
            if (s4.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s4.Trim());
            }
            if (s5.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s5.Trim());
            }
            if (s6.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s6.Trim());
            }
            MyLabel3.Text = i1.ToString();
            if (MyLabel3.Text == "0")
            {
                MyLabel3.Text = "";
            }
            //绑定未登记的次数
            Label MyLabel4 = (Label)e.Row.FindControl("Label4");
            i1 = 0;

            DataRow MyDataRow = FTD.DBUnit.DbHelperSQL.GetDataRow("select * from ERPKaoQinSetting");
            if (MyDataRow == null)
            {
                s1 = "0";
                s2 = "0";
                s3 = "0";
                s4 = "0";
                s5 = "0";
                s6 = "0";
            }
            else
            {
                if (FTD.Unit.PublicMethod.StrIFIn("未设置", FTD.Unit.DataValidate.ValidateDataRow_S(MyDataRow, "GuiDingTime1")) == false)
                {
                    s1 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime1 is null");
                }
                else
                {
                    s1 = "0";
                }
                if (FTD.Unit.PublicMethod.StrIFIn("未设置", FTD.Unit.DataValidate.ValidateDataRow_S(MyDataRow, "GuiDingTime2")) == false)
                {
                    s2 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime2 is null");
                }
                else
                {
                    s2 = "0";
                }
                if (FTD.Unit.PublicMethod.StrIFIn("未设置", FTD.Unit.DataValidate.ValidateDataRow_S(MyDataRow, "GuiDingTime3")) == false)
                {
                    s3 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime3 is null");
                }
                else
                {
                    s3 = "0";
                }
                if (FTD.Unit.PublicMethod.StrIFIn("未设置", FTD.Unit.DataValidate.ValidateDataRow_S(MyDataRow, "GuiDingTime4")) == false)
                {
                    s4 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime4 is null");
                }
                else
                {
                    s4 = "0";
                }
                if (FTD.Unit.PublicMethod.StrIFIn("未设置", FTD.Unit.DataValidate.ValidateDataRow_S(MyDataRow, "GuiDingTime5")) == false)
                {
                    s5 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime5 is null");
                }
                else
                {
                    s5 = "0";
                }
                if (FTD.Unit.PublicMethod.StrIFIn("未设置", FTD.Unit.DataValidate.ValidateDataRow_S(MyDataRow, "GuiDingTime6")) == false)
                {
                    s6 = FTD.DBUnit.DbHelperSQL.GetSHSL("select count(*) from ERPKaoQin where UserName='" + MyLabel.ToolTip.Trim() + "' and (KaoQinRiQi BETWEEN '" + this.TextBox2.Text.Trim() + " 00:00:00' and '" + this.TextBox3.Text.Trim() + " 23:59:59')  and DengJiTime6 is null");
                }
                else
                {
                    s6 = "0";
                }
            }
            if (s1.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s1.Trim());
            }
            if (s2.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s2.Trim());
            }
            if (s3.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s3.Trim());
            }
            if (s4.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s4.Trim());
            }
            if (s5.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s5.Trim());
            }
            if (s6.Trim().Length > 0)
            {
                i1 = i1 + int.Parse(s6.Trim());
            }
            MyLabel4.Text = i1.ToString();
            if (MyLabel4.Text == "0")
            {
                MyLabel4.Text = "";
            }
        }
    }
    protected void iButton4_Click(object sender, EventArgs e)
    {
        DataBindToGridview();
    }
    protected void iButton2_Click(object sender, EventArgs e)
    {
        DisableControls(GVData);
        Response.ClearContent();
        Response.Charset = "GB2312";
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        Response.AddHeader("content-disposition", "attachment; filename=" + DateTime.Now.ToShortDateString() + ".xls");
        Response.ContentType = "application/ms-excel";
        System.IO.StringWriter sw = new System.IO.StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        GVData.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        // 空方法，必须有
    }
    private void DisableControls(Control gv)
    {
        LinkButton lb = new LinkButton();
        Literal l = new Literal();
        string name = String.Empty;

        for (int i = 0; i < gv.Controls.Count; i++)
        {
            if (gv.Controls[i].GetType() == typeof(LinkButton))
            {
                l.Text = (gv.Controls[i] as LinkButton).Text;
                gv.Controls.Remove(gv.Controls[i]);
                gv.Controls.AddAt(i, l);
            }
            else if (gv.Controls[i].GetType() == typeof(DropDownList))
            {
                l.Text = (gv.Controls[i] as DropDownList).SelectedItem.Text;
                gv.Controls.Remove(gv.Controls[i]);
                gv.Controls.AddAt(i, l);
            }

            if (gv.Controls[i].HasControls())
            {
                DisableControls(gv.Controls[i]);
            }
        }
    }
}
}