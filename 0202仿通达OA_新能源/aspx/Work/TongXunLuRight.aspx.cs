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

namespace FTD.Web.UI.aspx.Work
{
    public partial class TongXunLuRight : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FTD.Unit.PublicMethod.CheckSession();
                DataBindToGridview();
            }
        }
        public void DataBindToGridview()
        {
            FTD.BLL.ERPTongXunLu MyModel = new FTD.BLL.ERPTongXunLu();
            if (Request.QueryString["TypeStr"].ToString().Trim() == "公共通讯簿")
            {
                GVData.DataSource = MyModel.GetList("TypeStr='" + Request.QueryString["TypeStr"].ToString().Trim() + "' and NameStr Like '%" + this.TextBox1.Text + "%' order by ID desc");

                //设定按钮权限            
                iButton1.Visible = FTD.Unit.PublicMethod.StrIFIn("|008A|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
                iButton5.Visible = FTD.Unit.PublicMethod.StrIFIn("|008M|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
                iButton3.Visible = FTD.Unit.PublicMethod.StrIFIn("|008D|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
                iButton2.Visible = FTD.Unit.PublicMethod.StrIFIn("|008E|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
            }
            else if (Request.QueryString["TypeStr"].ToString().Trim() == "个人通讯簿")
            {
                GVData.DataSource = MyModel.GetList("TypeStr='" + Request.QueryString["TypeStr"].ToString().Trim() + "' and UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' and NameStr Like '%" + this.TextBox1.Text + "%' order by ID desc");
                //设定按钮权限            
                iButton1.Visible = FTD.Unit.PublicMethod.StrIFIn("|010A|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
                iButton5.Visible = FTD.Unit.PublicMethod.StrIFIn("|010M|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
                iButton3.Visible = FTD.Unit.PublicMethod.StrIFIn("|010D|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
                iButton2.Visible = FTD.Unit.PublicMethod.StrIFIn("|010E|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
            }
            else
            {
                //所有共享的通讯录
                GVData.DataSource = MyModel.GetList("IfShare='是' and NameStr Like '%" + this.TextBox1.Text + "%' order by ID desc");
                //隐藏添加、修改、删除
                this.iButton1.Visible = false;
                this.iButton5.Visible = false;
                this.iButton3.Visible = false;
                //设定按钮权限
                iButton2.Visible = FTD.Unit.PublicMethod.StrIFIn("|009E|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian"));
            }
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
            Response.Redirect("TongXunLuAdd.aspx?TypeStr=" + Request.QueryString["TypeStr"].ToString());
        }
        protected void iButton3_Click(object sender, EventArgs e)
        {
            string IDlist = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
            if (FTD.DBUnit.DbHelperSQL.ExecuteSQL("delete from ERPTongXunLu where ID in (" + IDlist + ")") == -1)
            {
                Response.Write("<script>alert('删除选中记录时发生错误！请重新登陆后重试！');</script>");
            }
            else
            {
                DataBindToGridview();
                //写系统日志
                FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
                MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
                MyRiZhi.DoSomething = "用户删除通讯录信息";
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
            MyTable.Add("NameStr", "姓名");
            MyTable.Add("Sex", "性别");
            MyTable.Add("DanWeiMingCheng", "单位名称");
            MyTable.Add("DanWieDianHua", "单位电话");
            MyTable.Add("JiaTingDianHua", "家庭电话");
            MyTable.Add("ShouJi", "手机");
            MyTable.Add("Email", "电子邮件");

            FTD.Unit.DataToExcel.GridViewToExcel(FTD.DBUnit.DbHelperSQL.GetDataSet("select NameStr,Sex,DanWeiMingCheng,DanWieDianHua,JiaTingDianHua,ShouJi,Email from ERPTongXunLu where ID in (" + IDList + ") order by ID desc"), MyTable, "Excel报表");
        }
        protected void iButton5_Click(object sender, EventArgs e)
        {
            string CheckStr = FTD.Unit.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
            string[] CheckStrArray = CheckStr.Split(',');
            Response.Redirect("TongXunLuModify.aspx?TypeStr=" + Request.QueryString["TypeStr"].ToString() + "&ID=" + CheckStrArray[0].ToString());
        }
    }
}