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

namespace OA.aspx.BBS{ 
 public partial class BanKuaiView: System.Web.UI.Page
{
    public string BanKuaiName = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        BanKuaiName = FTD.DBUnit.DbHelperSQL.GetSHSL("select BanKuaiName from ERPBBSBanKuai where ID="+Request.QueryString["ID"].ToString());
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            DataBindToGridview();

            //判断是否能访问该版块
            if (CheckAllowIn() == false)
            {
                FTD.Unit.MessageBox.ShowAndRedirect(this, "您没有访问此版块的权限！请咨询系统管理员！", "BanKuaiList.aspx");
            }
            
            //判断是否显示 置顶、删除  按钮（版主所有）
            string BanZhuList = FTD.DBUnit.DbHelperSQL.GetSHSL("select BanZhuList from ERPBBSBanKuai where ID="+Request.QueryString["ID"].ToString());
            if (FTD.Unit.PublicMethod.StrIFIn("," + FTD.Unit.PublicMethod.GetSessionValue("UserName") + ",", "," + BanZhuList + ",") == true)
            {
                iButton3.Visible = true;
                iButton6.Visible = true;
                iButton7.Visible = true;
            }
            else
            {
                iButton3.Visible = false;
                iButton6.Visible = false;
                iButton7.Visible = false;
            }
        }
    }
    public bool CheckAllowIn()
    {
        bool IfExsit = false;

        string JiaoSeXianZhi = FTD.DBUnit.DbHelperSQL.GetSHSL("select JiaoSeXianZhiList from ERPBBSBanKuai where ID=" + Request.QueryString["ID"].ToString());
        string BuMenXianZhi = FTD.DBUnit.DbHelperSQL.GetSHSL("select BuMenXianZhi from ERPBBSBanKuai where ID=" + Request.QueryString["ID"].ToString());
        string UserXianZhi = FTD.DBUnit.DbHelperSQL.GetSHSL("select UserXianZhi from ERPBBSBanKuai where ID=" + Request.QueryString["ID"].ToString());

        if (FTD.Unit.PublicMethod.StrIFIn(",所有角色,", ","+JiaoSeXianZhi+",") == true)
        {
            IfExsit = true;
        }
        if (FTD.Unit.PublicMethod.StrIFIn(",所有部门,", "," + BuMenXianZhi + ",") == true)
        {
            IfExsit = true;
        }
        if (FTD.Unit.PublicMethod.StrIFIn(",所有用户,", "," + UserXianZhi + ",") == true)
        {
            IfExsit = true;
        }

        string[] JiaoSeXianZhiList=FTD.Unit.PublicMethod.GetSessionValue("JiaoSe").Split(',');
        for (int i = 0; i < JiaoSeXianZhiList.Length; i++)
        {
            if (JiaoSeXianZhiList[i].ToString().Trim().Length > 0)
            {
                if (FTD.Unit.PublicMethod.StrIFIn(JiaoSeXianZhiList[i].ToString(), JiaoSeXianZhi) == true)
                {
                    IfExsit = true;
                }
            }
        }

        if (FTD.Unit.PublicMethod.StrIFIn("," + FTD.Unit.PublicMethod.GetSessionValue("Department") + ",", "," + BuMenXianZhi + ",") == true)
        {
            IfExsit = true;
        }
        if (FTD.Unit.PublicMethod.StrIFIn("," + FTD.Unit.PublicMethod.GetSessionValue("UserName") + ",", "," + UserXianZhi + ",") == true)
        {
            IfExsit = true;
        }

        return IfExsit;
    }

    public void DataBindToGridview()
    {
        FTD.BLL.ERPBBSTieZi MyModel = new FTD.BLL.ERPBBSTieZi();
        GVData.DataSource = MyModel.GetList("TitleStr Like '%" + this.TextBox1.Text + "%' and BanKuaiID=" + Request.QueryString["ID"].ToString() + " order by PaiXu desc,ID desc");
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
            Image MyImage = (Image)e.Row.FindControl("Image1");
            if (MyImage.AlternateText != "1")
            {
                MyImage.Visible = false;
            }
            else
            {
                MyImage.AlternateText = "置顶标志";
            }
        }
    }
    protected void iButton4_Click(object sender, EventArgs e)
    {
        DataBindToGridview();
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("TieZiAdd.aspx?BanKuaiID="+Request.QueryString["ID"].ToString());
    }
    protected void iButton3_Click(object sender, EventArgs e)
    {       
        string IDlist = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        if (FTD.DBUnit.DbHelperSQL.ExecuteSQL("delete from ERPBBSTieZi where ID in (" + IDlist + ")") == -1)
        {
            Response.Write("<script>alert('删除选中记录时发生错误！请重新登陆后重试！');</script>");
        }
        else
        {
            DataBindToGridview();
            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户删除论坛帖子";
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
        MyTable.Add("TitleStr", "帖子主题");
        MyTable.Add("UserName", "作者");
        MyTable.Add("ZuiHouTime", "最后更新");
        MyTable.Add("ZuiHouUser", "最后回复");
        FTD.Unit.DataToExcel.GridViewToExcel(FTD.DBUnit.DbHelperSQL.GetDataSet("select TitleStr,UserName,ZuiHouTime,ZuiHouUser from ERPBBSTieZi where ID in (" + IDList + ") order by ID desc"), MyTable, "Excel报表");
    }
    protected void iButton5_Click(object sender, EventArgs e)
    {
        //个人能修改自己的帖子，版主可修改所有
        string CheckStr = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        string[] CheckStrArray = CheckStr.Split(',');

        string BanZhuList = FTD.DBUnit.DbHelperSQL.GetSHSL("select BanZhuList from ERPBBSBanKuai where ID="+Request.QueryString["ID"].ToString());
        if (FTD.Unit.PublicMethod.StrIFIn("," + FTD.Unit.PublicMethod.GetSessionValue("UserName") + ",", "," + BanZhuList + ",") == true)
        {
            //版主可修改所有            
            Response.Redirect("TieZiModify.aspx?BanKuaiID="+Request.QueryString["ID"].ToString()+"&ID=" + CheckStrArray[0].ToString());
        }
        else
        {
            //判断是否是自己的帖子
            if (FTD.DBUnit.DbHelperSQL.GetSHSL("select UserName from ERPBBSTieZi where ID=" + CheckStrArray[0].ToString()) == FTD.Unit.PublicMethod.GetSessionValue("UserName"))
            {
                Response.Redirect("TieZiModify.aspx?BanKuaiID="+Request.QueryString["ID"].ToString()+"&ID=" + CheckStrArray[0].ToString());
            }
            else
            {
                Response.Write("<script>alert('您不是版主和帖子所有者，不能对本帖进行编辑。');</script>");
            }
        }
    }
    protected void iButton6_Click(object sender, EventArgs e)
    {
        //版主可使用  置顶  操作
        string IDlist = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPBBSTieZi set PaiXu=1 where ID in (" + IDlist + ")");
        DataBindToGridview();
    }
    protected void iButton7_Click(object sender, EventArgs e)
    {
        //版主可使用  置顶  操作
        string IDlist = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPBBSTieZi set PaiXu=0 where ID in (" + IDlist + ")");
        DataBindToGridview();
    }
}}