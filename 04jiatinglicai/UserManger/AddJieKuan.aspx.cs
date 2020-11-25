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

public partial class AddJieKuan : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Alert.AlertAndRedirect("对不起您没有登录！", "../Login.aspx");
            }
            this.txtJksj.Text = DateTime.Now.ToString("yyyy-MM-dd");
            if (Request["type"] == "1")
            {
                DropDownList1.SelectedValue = "借入款";
            }
            else {
                DropDownList1.SelectedValue = "借出款";
                title.Text = "新增借出款：";
                Label1.Text = "借出人：";
                Label2.Text = "借出日期：";
                Label3.Text = "应收本息：";
                Label4.Text = "收回日期：";
                Label5.Text = "现已收回金额：";
                Label6.Text = "待收回金额：";
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "insert into Jie_Money(name,AddMoney,Ds,AddUserId,UserName,TypeName,ReturnTime,ReturnMoney,unReturnMoeny)values('" + txtjkr.Text + "','" + TxtMoney.Text + "','" + TxtStatement.Text + "','" + Session["UserId"].ToString() + "','" + Session["Name"].ToString() + "','" + DropDownList1.SelectedValue + "','"+this.txtShrq.Text+"','"+txtYsh.Text+"','"+txtDsh.Text+"')";

        data.RunSql(sql);

        Alert.AlertAndRedirect("添加成功！", "JieMoneyManger.aspx");

    }
}
