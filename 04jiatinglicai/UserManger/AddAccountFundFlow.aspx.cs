using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserManger_AddAccountFundFlow : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Alert.AlertAndRedirect("对不起您没有登录！", "Login.aspx");
            }
            DataSet dsAccount = data.GetDs("select * from Account where addUserId='" + Session["UserId"] + "'", "a");

            this.outAccount.DataSource = dsAccount;
            this.outAccount.DataTextField = "name";
            this.outAccount.DataValueField = "id";
            this.outAccount.DataBind();

            this.inAccount.DataSource = dsAccount;
            this.inAccount.DataTextField = "name";
            this.inAccount.DataValueField = "id";
            this.inAccount.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlTemp = "insert into AccountFundFlow(accountid,accountname,amount,type,flag,bz,addUserId) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}');";
        string sql = string.Empty;

        string inaccount = this.inAccount.SelectedValue;
        string inaccountName = this.inAccount.SelectedItem.Text;
        int type = qichu.Checked ? 0 : 1;
        string amount = this.txtJe.Text.Trim();
        string bz = this.txtBz.Text.Trim();
        //增加一条转入
        sql = string.Format(sqlTemp, inaccount, inaccountName, amount, type, 1, bz, Session["UserId"].ToString());
        //如果是账户转入，需要增加一条转出
        if (account.Checked)
        {
            string outaccount = this.outAccount.SelectedValue;
            string outaccountName = this.outAccount.SelectedItem.Text;
            sql += string.Format(sqlTemp, outaccount, outaccountName, decimal.Parse(amount), type, 0, bz, Session["UserId"].ToString());
        }
        data.RunSql(sql);
        Response.Redirect("AmountTj.aspx");
    }

    protected void qichu_CheckedChanged(object sender, EventArgs e)
    {
        if (account.Checked)
        {
            this.trOutAccount.Visible = true;
        }
        else
        {
            this.trOutAccount.Visible = false;
        }
    }
}