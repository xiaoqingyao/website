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

public partial class BasicInfo_AddGoodsInfo : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.DataSource = data.GetDataReader("select * from  Class  ");
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataBind();

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        data.RunSql("insert into ChanPin(Code,name,ds,danjia,TypeName,TypeId,guige,shengchanriqi)values('" + TextBox1.Text + "','" + txtname.Text + "','" + txtds.Text + "','" + txtdanjia.Text + "','" + DropDownList1.SelectedItem.Text + "'," + DropDownList1.SelectedValue + ",'" + txtguige.Text + "','" + txtriqi.Text + "')");


        Alert.AlertAndRedirect("添加成功！", "GoodsInfoManger.aspx");

    }
}
