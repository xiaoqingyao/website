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

namespace OA.aspx.DocFile{ 
 public partial class TiKuShiJuanSet: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.DBUnit.DbHelperSQL.BindDropDownList("select * from ERPTiKuType order by PaiXu asc,ID desc", this.DropDownList1, "TiKuName", "ID");
            this.Label1.Text = Request.QueryString["FenLeiStr"].ToString();
            DataBindToGridview();

            //绑定当前题目已有的题目
            string LieName = "PanDuanTiList";
            if (Request.QueryString["FenLeiStr"].ToString() == "判断题")
            {
                LieName = "PanDuanTiList";
            }
            else if (Request.QueryString["FenLeiStr"].ToString() == "单项选择题")
            {
                LieName = "DanXuanTiList";
            }
            else if (Request.QueryString["FenLeiStr"].ToString() == "多项选择题")
            {
                LieName = "DuoXuanTiList";
            }
            else if (Request.QueryString["FenLeiStr"].ToString() == "填空题")
            {
                LieName = "TianKongTiList";
            }
            else if (Request.QueryString["FenLeiStr"].ToString() == "简答题")
            {
                LieName = "JianDaTiList";
            }

            this.TextBox4.Text = FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 " + LieName + " from ERPTiKuShiJuan where ID=" + Request.QueryString["ID"].ToString());
            string YiCunStr=","+this.TextBox4.Text+",";
            for (int i = 0; i <this.ListBox1.Items.Count; i++)
            {
                if (FTD.Unit.PublicMethod.StrIFIn("," + ListBox1.Items[i].Value + ",", YiCunStr) == true)
                {
                    this.ListBox2.Items.Add(ListBox1.Items[i]);
                }
            }
        }
    }

    protected void iButton1_Click(object sender, EventArgs e)
    {
        string LieName = "PanDuanTiList";
        if (Request.QueryString["FenLeiStr"].ToString() == "判断题")
        {
            LieName = "PanDuanTiList";
        }
        else if (Request.QueryString["FenLeiStr"].ToString() == "单项选择题")
        {
            LieName = "DanXuanTiList";
        }
        else if (Request.QueryString["FenLeiStr"].ToString() == "多项选择题")
        {
            LieName = "DuoXuanTiList";
        }
        else if (Request.QueryString["FenLeiStr"].ToString() == "填空题")
        {
            LieName = "TianKongTiList";
        }
        else if (Request.QueryString["FenLeiStr"].ToString() == "简答题")
        {
            LieName = "JianDaTiList";
        }

        FTD.DBUnit.DbHelperSQL.ExecuteSql("update ERPTiKuShiJuan set " + LieName + "='"+this.TextBox4.Text.ToString()+"' where ID="+Request.QueryString["ID"].ToString());

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户设置试卷题目信息(试卷ID：" + Request.QueryString["ID"].ToString() + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "试题设置完成！", "TiKuShiJuan.aspx");
    }

    public void DataBindToGridview()
    {
        FTD.DBUnit.DbHelperSQL.BindItemList("select TitleStr,ID from ERPTiKu where TiKuID="+this.DropDownList1.SelectedValue+" and FenLeiStr='"+Request.QueryString["FenLeiStr"].ToString()+"' and TitleStr like '%" + this.TextBox3.Text + "%'  order by ID asc", this.ListBox1, "TitleStr", "ID");
    }

    protected void iButton4_Click(object sender, EventArgs e)
    {
        DataBindToGridview();
    }
    protected void iButton2_Click(object sender, EventArgs e)
    {
        this.TextBox4.Text = FTD.Unit.PublicMethod.GetListStr(this.ListBox1, this.ListBox2, "添加", "部分");
    }
    protected void iButton3_Click(object sender, EventArgs e)
    {
        this.TextBox4.Text = FTD.Unit.PublicMethod.GetListStr(this.ListBox1, this.ListBox2, "添加", "全部");
    }
    protected void iButton40_Click(object sender, EventArgs e)
    {
        this.TextBox4.Text = FTD.Unit.PublicMethod.GetListStr(this.ListBox1, this.ListBox2, "去除", "部分");
    }
    protected void iButton5_Click(object sender, EventArgs e)
    {
        this.TextBox4.Text = FTD.Unit.PublicMethod.GetListStr(this.ListBox1, this.ListBox2, "去除", "全部");
    }
}
}