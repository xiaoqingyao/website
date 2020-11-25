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

public partial class SystemManage_BuMenInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //判断是否是列表显示参数
            try
            {
                if (Request.QueryString["View"].ToString() == "List")
                {
                    this.RadioButtonList1.SelectedValue = "列表显示";
                    this.Panel1.Visible = true;
                    this.Panel2.Visible = false;
                }
            }
            catch { }


            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview();
            GetDaoHang(int.Parse(Request.QueryString["DirID"].ToString()));
            //绑定部门树
            BindBuMenTree(this.ListTreeView.Nodes, 0);
        }       

        if (this.RadioButtonList1.SelectedItem.Text == "列表显示")
        {
            //设定按钮权限
            ImageButton1.Visible = ZWL.Common.PublicMethod.StrIFIn("|085A|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton5.Visible = ZWL.Common.PublicMethod.StrIFIn("|085M|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton3.Visible = ZWL.Common.PublicMethod.StrIFIn("|085D|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton2.Visible = ZWL.Common.PublicMethod.StrIFIn("|085E|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
        }
        else
        {
            this.ImageButton1.Visible = false;
            this.ImageButton2.Visible = false;
            this.ImageButton3.Visible = false;
            this.ImageButton5.Visible = false;
        }

        //判断是否属于查询模块
        try
        {
            string SerchTypeStr = Request.QueryString["Type"].ToString();
            if (SerchTypeStr.Trim().Length > 0)
            {
                this.ImageButton1.Visible = false;
                this.ImageButton2.Visible = false;
                this.ImageButton3.Visible = false;
                this.ImageButton5.Visible = false;
            }
        }
        catch
        { }
    }
    /// <summary>
    /// 有权限就显示对应按钮
    /// </summary>
    /// <param name="ViewStr"></param>
    /// <param name="QuanXianStr"></param>
    /// <returns></returns>
    public string IFView(string ViewStr,string QuanXianStr)
    {
        if (ZWL.Common.PublicMethod.StrIFIn(QuanXianStr, ZWL.Common.PublicMethod.GetSessionValue("QuanXian")) == true)
        {
            return ViewStr;
        }
        else
        {
            return "";
        }
    }
    public void BindBuMenTree(TreeNodeCollection Nds, int IDStr)
    {
        DataSet MYDT=ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPBuMen where DirID=" + IDStr.ToString() + " order by ID asc");
        for(int i=0;i<MYDT.Tables[0].Rows.Count;i++)
        {
            TreeNode OrganizationNode = new TreeNode();
            string CharManStr = "";
            if (MYDT.Tables[0].Rows[i]["ChargeMan"].ToString().Trim().Length <= 0)
            {
                CharManStr = "<font color=\"Red\">[未设置负责人]</font>";
            }
            else
            {
                CharManStr = MYDT.Tables[0].Rows[i]["ChargeMan"].ToString().Trim();
            }

            OrganizationNode.Text = MYDT.Tables[0].Rows[i]["BuMenName"].ToString() + "&nbsp;部门主管：" + CharManStr + IFView("&nbsp;&nbsp;<a class=\"BlueCss\" href=\"BuMenInfoAdd.aspx?View=Tree&Type=&DirID=" + ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select DirID from ERPBuMen where ID=" + MYDT.Tables[0].Rows[i]["ID"].ToString()) + "\">[添加同级部门]</a>", "|085A|") + IFView("&nbsp;&nbsp;<a class=\"BlueCss\" href=\"BuMenInfoAdd.aspx?View=Tree&Type=&DirID=" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\">[添加下级部门]</a>", "|085A|") + IFView("&nbsp;&nbsp;<a class=\"BlueCss\" href=\"BuMenInfoModify.aspx?View=Tree&Type=&DirID=" + ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select DirID from ERPBuMen where ID=" + MYDT.Tables[0].Rows[i]["ID"].ToString()) + "&ID=" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\">[修改]</a>", "|085M|") + IFView("&nbsp;&nbsp;<a class=\"BlueCss\" onclick=\"return window.confirm('是否确认删除？');\" href=\"BuMenInfoDel.aspx?View=Tree&Type=&DirID=0&ID=" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\">[删除]</a>", "|085D|");
            OrganizationNode.ToolTip = "部门主管：" + MYDT.Tables[0].Rows[i]["ChargeMan"].ToString() + "\n电话：" + MYDT.Tables[0].Rows[i]["TelStr"].ToString() + "\n传真：" + MYDT.Tables[0].Rows[i]["ChuanZhen"].ToString() + "\n备注：" + MYDT.Tables[0].Rows[i]["BackInfo"].ToString();
            
            OrganizationNode.Value = MYDT.Tables[0].Rows[i]["ID"].ToString();
            int strId = int.Parse(MYDT.Tables[0].Rows[i]["ID"].ToString());
            OrganizationNode.ImageUrl = "~/images/user_group.gif";
            OrganizationNode.SelectAction = TreeNodeSelectAction.Expand;
            
            OrganizationNode.Expand();
            Nds.Add(OrganizationNode);
            //递归循环
            BindBuMenTree(Nds[Nds.Count - 1].ChildNodes, strId);
        }
    }
    public void GetDaoHang(int DirID)
    {
        if (DirID == 0)
        {
            if (this.Label1.Text.Trim() == "")
            {
                this.Label1.Text = "<a href=\"BuMenInfo.aspx?View=List&Type=" + Request.QueryString["Type"].ToString() + "&DirID=0\" >部门信息管理</a>";
            }
            else
            {
                this.Label1.Text = "<a href=\"BuMenInfo.aspx?View=List&Type=" + Request.QueryString["Type"].ToString() + "&DirID=0\" >部门信息管理</a>" + "\\" + this.Label1.Text;
            }
        }
        else
        {
            if (this.Label1.Text.Trim() == "")
            {
                this.Label1.Text = "<a href=\"BuMenInfo.aspx?View=List&Type=" + Request.QueryString["Type"].ToString() + "&DirID=" + DirID.ToString() + "\" >" + ZWL.DBUtility.DbHelperSQL.GetSHSL("select BuMenName from ERPBuMen where ID=" + DirID.ToString()) + "</a>";
            }
            else
            {
                this.Label1.Text = "<a href=\"BuMenInfo.aspx?View=List&Type=" + Request.QueryString["Type"].ToString() + "&DirID=" + DirID.ToString() + "\" >" + ZWL.DBUtility.DbHelperSQL.GetSHSL("select BuMenName from ERPBuMen where ID=" + DirID.ToString()) + "</a>" + "\\" + this.Label1.Text;
            }
            int FatherID = int.Parse(ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select DirID from ERPBuMen where ID=" + DirID.ToString()));
            if (FatherID == 0)
            {
                this.Label1.Text = this.Label1.Text = "<a href=\"BuMenInfo.aspx?View=List&Type=" + Request.QueryString["Type"].ToString() + "&DirID=0\" >部门信息管理</a>" + "\\" + this.Label1.Text;
            }
            else
            {
                GetDaoHang(FatherID);
            }
        }
    }
    public void DataBindToGridview()
    {
        ZWL.BLL.ERPBuMen MyERPBuMen = new ZWL.BLL.ERPBuMen();
        string DirID = "0";
        try
        {
            DirID = Request.QueryString["DirID"].ToString();
        }
        catch { }


        GVData.DataSource = MyERPBuMen.GetList("DirID=" + DirID + " and BuMenName Like '%"+this.TextBox1.Text+"%' order by ID desc");
        GVData.DataBind();
        LabPageSum.Text = Convert.ToString(GVData.PageCount);
        LabCurrentPage.Text = Convert.ToString(((int)GVData.PageIndex + 1));
        this.GoPage.Text = LabCurrentPage.Text.ToString();
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

            DataBindToGridview();
        }
        catch
        {
            DataBindToGridview();
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
        DataBindToGridview();
    }
    #endregion
    protected void GVData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ZWL.Common.PublicMethod.GridViewRowDataBound(e);
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        DataBindToGridview();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("BuMenInfoAdd.aspx?View=List&Type=" + Request.QueryString["Type"].ToString() + "&DirID=" + Request.QueryString["DirID"].ToString());
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        string IDlist = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        if (ZWL.DBUtility.DbHelperSQL.ExecuteSQL("delete from ERPBuMen where ID in (" + IDlist + ")") == -1)
        {
            Response.Write("<script>alert('删除选中记录时发生错误！请重新登陆后重试！');</script>");
        }
        else
        {
            DataBindToGridview();
            //写系统日志
            ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
            MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户删除部门信息";
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
        MyTable.Add("BuMenName", "部门名称");
        MyTable.Add("ChargeMan", "部门主管");
        MyTable.Add("TelStr", "联系电话");
        MyTable.Add("ChuanZhen", "传真号码");
        MyTable.Add("BackInfo", "备注信息");
        ZWL.Common.DataToExcel.GridViewToExcel(ZWL.DBUtility.DbHelperSQL.GetDataSet("select BuMenName,ChargeMan,TelStr,ChuanZhen,BackInfo from ERPBuMen where ID in (" + IDList + ") order by ID desc"), MyTable, "Excel报表");
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        string CheckStr = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        string[] CheckStrArray = CheckStr.Split(',');
        if (CheckStrArray[0].ToString().Trim().Length>0)
        {
            Response.Redirect("BuMenInfoModify.aspx?View=List&Type=" + Request.QueryString["Type"].ToString() + "&DirID=" + Request.QueryString["DirID"].ToString() + "&ID=" + CheckStrArray[0].ToString());
        }
        else
        {
            ZWL.Common.MessageBox.Show(this, "当前未选择任何待修改项，不可以进行修改！");
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "树形显示")
        {
            this.Panel2.Visible = true;
            this.Panel1.Visible = false;

            this.ImageButton1.Visible = false;
            this.ImageButton2.Visible = false;
            this.ImageButton3.Visible = false;
            this.ImageButton5.Visible = false;
        }
        else
        {
            this.Panel1.Visible = true;
            this.Panel2.Visible = false;
        }
    }
}
