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

public partial class BBS_BanKuaiView : System.Web.UI.Page
{
    public string BanKuaiName = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        BanKuaiName = ZWL.DBUtility.DbHelperSQL.GetSHSL("select BanKuaiName from ERPBBSBanKuai where ID="+Request.QueryString["ID"].ToString());
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview();

            //判断是否能访问该版块
            if (CheckAllowIn() == false)
            {
                ZWL.Common.MessageBox.ShowAndRedirect(this, "您没有访问此版块的权限！请咨询系统管理员！", "BanKuaiList.aspx");
            }
            
            //判断是否显示 置顶、删除  按钮（版主所有）
            string BanZhuList = ZWL.DBUtility.DbHelperSQL.GetSHSL("select BanZhuList from ERPBBSBanKuai where ID="+Request.QueryString["ID"].ToString());
            if (ZWL.Common.PublicMethod.StrIFIn("," + ZWL.Common.PublicMethod.GetSessionValue("UserName") + ",", "," + BanZhuList + ",") == true)
            {
                ImageButton3.Visible = true;
                ImageButton6.Visible = true;
                ImageButton7.Visible = true;
            }
            else
            {
                ImageButton3.Visible = false;
                ImageButton6.Visible = false;
                ImageButton7.Visible = false;
            }
        }
    }
    public bool CheckAllowIn()
    {
        bool IfExsit = false;

        string JiaoSeXianZhi = ZWL.DBUtility.DbHelperSQL.GetSHSL("select JiaoSeXianZhiList from ERPBBSBanKuai where ID=" + Request.QueryString["ID"].ToString());
        string BuMenXianZhi = ZWL.DBUtility.DbHelperSQL.GetSHSL("select BuMenXianZhi from ERPBBSBanKuai where ID=" + Request.QueryString["ID"].ToString());
        string UserXianZhi = ZWL.DBUtility.DbHelperSQL.GetSHSL("select UserXianZhi from ERPBBSBanKuai where ID=" + Request.QueryString["ID"].ToString());

        if (ZWL.Common.PublicMethod.StrIFIn(",所有角色,", ","+JiaoSeXianZhi+",") == true)
        {
            IfExsit = true;
        }
        if (ZWL.Common.PublicMethod.StrIFIn(",所有部门,", "," + BuMenXianZhi + ",") == true)
        {
            IfExsit = true;
        }
        if (ZWL.Common.PublicMethod.StrIFIn(",所有用户,", "," + UserXianZhi + ",") == true)
        {
            IfExsit = true;
        }

        string[] JiaoSeXianZhiList=ZWL.Common.PublicMethod.GetSessionValue("JiaoSe").Split(',');
        for (int i = 0; i < JiaoSeXianZhiList.Length; i++)
        {
            if (JiaoSeXianZhiList[i].ToString().Trim().Length > 0)
            {
                if (ZWL.Common.PublicMethod.StrIFIn(JiaoSeXianZhiList[i].ToString(), JiaoSeXianZhi) == true)
                {
                    IfExsit = true;
                }
            }
        }

        if (ZWL.Common.PublicMethod.StrIFIn("," + ZWL.Common.PublicMethod.GetSessionValue("Department") + ",", "," + BuMenXianZhi + ",") == true)
        {
            IfExsit = true;
        }
        if (ZWL.Common.PublicMethod.StrIFIn("," + ZWL.Common.PublicMethod.GetSessionValue("UserName") + ",", "," + UserXianZhi + ",") == true)
        {
            IfExsit = true;
        }

        return IfExsit;
    }

    public void DataBindToGridview()
    {
        ZWL.BLL.ERPBBSTieZi MyModel = new ZWL.BLL.ERPBBSTieZi();
        GVData.DataSource = MyModel.GetList("TitleStr Like '%" + this.TextBox1.Text + "%' and BanKuaiID=" + Request.QueryString["ID"].ToString() + " order by PaiXu desc,ID desc");
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
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        DataBindToGridview();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("TieZiAdd.aspx?BanKuaiID="+Request.QueryString["ID"].ToString());
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {       
        string IDlist = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        if (ZWL.DBUtility.DbHelperSQL.ExecuteSQL("delete from ERPBBSTieZi where ID in (" + IDlist + ")") == -1)
        {
            Response.Write("<script>alert('删除选中记录时发生错误！请重新登陆后重试！');</script>");
        }
        else
        {
            DataBindToGridview();
            //写系统日志
            ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
            MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户删除论坛帖子";
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
        MyTable.Add("TitleStr", "帖子主题");
        MyTable.Add("UserName", "作者");
        MyTable.Add("ZuiHouTime", "最后更新");
        MyTable.Add("ZuiHouUser", "最后回复");
        ZWL.Common.DataToExcel.GridViewToExcel(ZWL.DBUtility.DbHelperSQL.GetDataSet("select TitleStr,UserName,ZuiHouTime,ZuiHouUser from ERPBBSTieZi where ID in (" + IDList + ") order by ID desc"), MyTable, "Excel报表");
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        //个人能修改自己的帖子，版主可修改所有
        string CheckStr = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        string[] CheckStrArray = CheckStr.Split(',');

        string BanZhuList = ZWL.DBUtility.DbHelperSQL.GetSHSL("select BanZhuList from ERPBBSBanKuai where ID="+Request.QueryString["ID"].ToString());
        if (ZWL.Common.PublicMethod.StrIFIn("," + ZWL.Common.PublicMethod.GetSessionValue("UserName") + ",", "," + BanZhuList + ",") == true)
        {
            //版主可修改所有            
            Response.Redirect("TieZiModify.aspx?BanKuaiID="+Request.QueryString["ID"].ToString()+"&ID=" + CheckStrArray[0].ToString());
        }
        else
        {
            //判断是否是自己的帖子
            if (ZWL.DBUtility.DbHelperSQL.GetSHSL("select UserName from ERPBBSTieZi where ID=" + CheckStrArray[0].ToString()) == ZWL.Common.PublicMethod.GetSessionValue("UserName"))
            {
                Response.Redirect("TieZiModify.aspx?BanKuaiID="+Request.QueryString["ID"].ToString()+"&ID=" + CheckStrArray[0].ToString());
            }
            else
            {
                Response.Write("<script>alert('您不是版主和帖子所有者，不能对本帖进行编辑。');</script>");
            }
        }
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        //版主可使用  置顶  操作
        string IDlist = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL("update ERPBBSTieZi set PaiXu=1 where ID in (" + IDlist + ")");
        DataBindToGridview();
    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        //版主可使用  置顶  操作
        string IDlist = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL("update ERPBBSTieZi set PaiXu=0 where ID in (" + IDlist + ")");
        DataBindToGridview();
    }
}