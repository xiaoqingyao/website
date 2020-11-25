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
using System.Data.SqlClient;
public partial class BasicInfo_Modify_GoodsInfo : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    public string DownPath;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Type();
            GetInfo();
        }
    }
    /// <summary>
    /// 绑定类别
    /// </summary>
    private void Type()
    {

        DropDownList1.DataSource = data.GetDataReader("select * from  Class  ");
        DropDownList1.DataTextField = "Name";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();

    }
    private void GetInfo()
    {
        int id = int.Parse(Request.QueryString["id"].ToString());
        SqlDataReader dr;
        dr = data.GetDataReader("select * from  ChanPin where id=" + id);
        dr.Read();
        txtname.Text = dr["name"].ToString();
        txtds.Text = dr["ds"].ToString();
        DropDownList1.Items[0].Text = dr["TypeName"].ToString();
        txtdanjia.Text = dr["danjia"].ToString();
        txtguige.Text = dr["guige"].ToString();
        TextBox1.Text = dr["Code"].ToString();
        txtriqi.Text = dr["shengchanriqi"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["id"].ToString());
        data.RunSql("update   ChanPin set  shengchanriqi='" + txtriqi.Text + "',Code='" + TextBox1.Text + "', danjia='" + txtdanjia.Text + "',guige='" + txtguige.Text + "', name='" + txtname.Text + "',ds='" + txtds.Text + "',TypeName='" + DropDownList1.SelectedItem.Text + "',TypeId=" + DropDownList1.SelectedValue + "  where id=" + id);

        Alert.AlertAndRedirect("修改成功！", "GoodsInfoManger.aspx");
    }
}
