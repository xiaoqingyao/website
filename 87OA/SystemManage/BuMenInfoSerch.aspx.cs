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

            OrganizationNode.Text = MYDT.Tables[0].Rows[i]["BuMenName"].ToString() + "&nbsp;部门主管：" + CharManStr;
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
                this.Label1.Text = "<a href=\"BuMenInfoSerch.aspx?View=List&DirID=0\" >部门信息查询</a>";
            }
            else
            {
                this.Label1.Text = "<a href=\"BuMenInfoSerch.aspx?View=List&DirID=0\" >部门信息查询</a>" + "\\" + this.Label1.Text;
            }
        }
        else
        {
            if (this.Label1.Text.Trim() == "")
            {
                this.Label1.Text = "<a href=\"BuMenInfoSerch.aspx?View=List&DirID=" + DirID.ToString() + "\" >" + ZWL.DBUtility.DbHelperSQL.GetSHSL("select BuMenName from ERPBuMen where ID=" + DirID.ToString()) + "</a>";
            }
            else
            {
                this.Label1.Text = "<a href=\"BuMenInfoSerch.aspx?View=List&DirID=" + DirID.ToString() + "\" >" + ZWL.DBUtility.DbHelperSQL.GetSHSL("select BuMenName from ERPBuMen where ID=" + DirID.ToString()) + "</a>" + "\\" + this.Label1.Text;
            }
            int FatherID = int.Parse(ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select DirID from ERPBuMen where ID=" + DirID.ToString()));
            if (FatherID == 0)
            {
                this.Label1.Text = this.Label1.Text = "<a href=\"BuMenInfoSerch.aspx?View=List&DirID=0\" >部门信息查询</a>" + "\\" + this.Label1.Text;
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
    
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "树形显示")
        {
            this.Panel2.Visible = true;
            this.Panel1.Visible = false;

        }
        else
        {
            this.Panel1.Visible = true;
            this.Panel2.Visible = false;
        }
    }
}
