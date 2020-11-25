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

public partial class DocFile_TiKuShiJuanSetDongTai : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.DBUtility.DbHelperSQL.BindDropDownList("select * from ERPTiKuType order by PaiXu asc,ID desc", this.DropDownList1, "TiKuName", "ID");

            //查询已有设置，自动赋值
            DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKuShiJuanSet where ShiJuanID=" + Request.QueryString["ID"].ToString());
            if (MYDT.Tables[0].Rows.Count>0)
            {
                this.TextBox1.Text = MYDT.Tables[0].Rows[0]["DanXuanNum"].ToString();
                this.TextBox2.Text = MYDT.Tables[0].Rows[0]["DuoXuanNum"].ToString();
                this.TextBox3.Text = MYDT.Tables[0].Rows[0]["PanDuanNum"].ToString();
                this.TextBox4.Text = MYDT.Tables[0].Rows[0]["TianKongNum"].ToString();
                this.TextBox5.Text = MYDT.Tables[0].Rows[0]["JianDaNum"].ToString();
                this.DropDownList1.SelectedValue = MYDT.Tables[0].Rows[0]["TiKuTypeID"].ToString();
            }
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //查询记录是否存在，存在的话就更新，不存在就添加
        string SetIDStr = ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select top 1 ID from ERPTiKuShiJuanSet where ShiJuanID="+Request.QueryString["ID"].ToString());
        if (SetIDStr.Trim() != "0")
        {
            ZWL.DBUtility.DbHelperSQL.ExecuteSQL("update ERPTiKuShiJuanSet set TiKuTypeID="+this.DropDownList1.SelectedValue.ToString()+",DanXuanNum='" + this.TextBox1.Text.Trim() + "',DuoXuanNum='" + this.TextBox2.Text.Trim() + "',PanDuanNum='" + this.TextBox3.Text.Trim() + "',TianKongNum='" + this.TextBox4.Text.Trim() + "',JianDaNum='" + this.TextBox5.Text.Trim() + "' where ShiJuanID=" + Request.QueryString["ID"].ToString());
        }
        else
        {
            ZWL.DBUtility.DbHelperSQL.ExecuteSQL("insert into ERPTiKuShiJuanSet(DanXuanNum,DuoXuanNum,PanDuanNum,TianKongNum,JianDaNum,ShiJuanID,TiKuTypeID) values(" + this.TextBox1.Text.Trim() + "," + this.TextBox2.Text.Trim() + "," + this.TextBox3.Text.Trim() + "," + this.TextBox4.Text.Trim() + "," + this.TextBox5.Text.Trim() + "," + Request.QueryString["ID"].ToString() + ","+this.DropDownList1.SelectedValue.ToString()+")");
        }

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户设置试卷题目信息(试卷ID：" + Request.QueryString["ID"].ToString() + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "试题设置完成！", "TiKuShiJuan.aspx");
    }
}
