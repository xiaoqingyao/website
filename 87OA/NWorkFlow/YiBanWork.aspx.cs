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

public partial class NWorkFlow_YiBanWork : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview("");

            //设定按钮权限                        
            ImageButton2.Visible = ZWL.Common.PublicMethod.StrIFIn("|017E|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
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
            HyperLink MyHyp = (HyperLink)e.Row.FindControl("HyperLink21");
            if (ZWL.Common.PublicMethod.StrIFIn("," + ZWL.Common.PublicMethod.GetSessionValue("UserName") + ",", "," + MyHyp.ToolTip + ",") == false)
            {
                MyHyp.Visible = false;
            }
            else
            {
                MyHyp.Visible = ZWL.Common.PublicMethod.StrIFIn("|017M|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
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
        ZWL.BLL.ERPNWorkToDo MyModel = new ZWL.BLL.ERPNWorkToDo();
        if (IDList.Trim().Length > 0)
        {
            GVData.DataSource = MyModel.GetList(" ShenPiYiJian like '%<font color=#0000FF>" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "&nbsp;&nbsp;%' and " + DropDownList2.SelectedItem.Value.ToString() + " like '%" + this.TextBox3.Text.Trim() + "%' and ID in(" + IDList + ") order by ID desc");
        }
        else
        {
            GVData.DataSource = MyModel.GetList(" ShenPiYiJian like '%<font color=#0000FF>" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "&nbsp;&nbsp;%' and " + DropDownList2.SelectedItem.Value.ToString() + " like '%" + this.TextBox3.Text.Trim() + "%' order by ID desc");
        }
        GVData.DataBind();
        LabPageSum.Text = Convert.ToString(GVData.PageCount);
        LabCurrentPage.Text = Convert.ToString(((int)GVData.PageIndex + 1));
        this.GoPage.Text = LabCurrentPage.Text.ToString();
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
        MyTable.Add("WorkName", "工作名称");
        MyTable.Add("FormID", "所用表单");
        MyTable.Add("WorkFlowID", "所用工作流程");
        MyTable.Add("UserName", "发起人");
        MyTable.Add("TimeStr", "发起时间");
        MyTable.Add("FuJianList", "附件文件");
        MyTable.Add("JieDianID", "当前所在节点");
        MyTable.Add("JieDianName", "当前节点名称");
        MyTable.Add("ShenPiUserList", "当前审批用户");
        MyTable.Add("OKUserList", "当前已审批通过的用户");
        MyTable.Add("StateNow", "当前状态");
        MyTable.Add("LateTime", "超时时间");
        ZWL.Common.DataToExcel.GridViewToExcel(ZWL.DBUtility.DbHelperSQL.GetDataSet("select  WorkName,FormID,WorkFlowID,UserName,TimeStr,FuJianList,JieDianID,JieDianName,ShenPiUserList,OKUserList,StateNow,LateTime  from ERPNWorkToDo where ID in (" + IDList + ") order by ID desc"), MyTable, "Excel报表");
    }
}
