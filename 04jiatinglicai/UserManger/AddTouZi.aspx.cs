using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserManger_AddTouZi : System.Web.UI.Page
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
                return;
            }
            this.txtTzr.Text = Session["name"].ToString();
            this.txtTzrq.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql = @"insert into TZ_Money([subName],[addDate],[UserName],[AddUserId],[je],[days],[endDate],[YjShouyi],[XyShouyi],[bz]) values 
            ('"+DropDownList1.SelectedItem.Text+"','"+txtTzrq.Text+"','"+txtTzr.Text+"','"+Session["UserId"].ToString()+"','"+txtTzje.Text+"','"+txtTzsc.Text+"','"+txtDqrq.Text+"','"+txtYjsy.Text+"','"+txtXysy.Text+"','"+this.TxtStatement.Text+ "')";
        
        data.RunSql(sql);

        Alert.AlertAndRedirect("添加成功！", "TouZiManger.aspx");

    }
}