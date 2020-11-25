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
public partial class StoreManger_SubStore : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    public string DownPath;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList3.DataSource = data.GetDataReader("select * from  UsersInfo  ");
            DropDownList3.DataTextField = "Name";
            DropDownList3.DataValueField = "id";
            DropDownList3.DataBind();
            Type();
            GetChanp();
        }
    }
    /// <summary>
    /// 绑定类别
    /// </summary>
    private void Type()
    {
        DropDownList1.DataSource = data.GetDataReader("select * from  Class");
        DropDownList1.DataTextField = "Name";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
        DropDownList1.Items.Add(new ListItem("选择商品类别", "0")); //动态添加新项
    }
    private void GetChanp()
    {
        DropDownList2.DataSource = data.GetDataReader("select * from  ChanPin where TypeName='" + DropDownList1.SelectedItem.Text + "'   ");
        DropDownList2.DataTextField = "Name";
        DropDownList2.DataValueField = "id";
        DropDownList2.DataBind();
        this.DropDownList2.Items.Insert(0, new ListItem("请选择出库商品", "0"));
    }
    private void BinderChanpin()
    {
        SqlDataReader dr;
        dr = data.GetDataReader("select * from  Kucun where chanpinId='" + DropDownList2.SelectedValue + "'");
        if (dr.Read())
        {
            txtdanjia.Text = dr["danjia"].ToString();
            txtguige.Text = dr["guige"].ToString();
            txtCode.Text = dr["Code"].ToString();
            txtSL.Text = dr["shuliang"].ToString();
            TextBox2.Text = dr["StoreName"].ToString();
        }
        else
        {
            alert.Alertjs("没有商品信息！");
            return;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetChanp();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        BinderChanpin();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (int.Parse(txtSL.Text) < int.Parse(TextBox1.Text))
        {
            alert.Alertjs("数量不能大于库存数量！");
        }
        else
        {
            SqlDataReader dr;
            dr = data.GetDataReader("select   *  from kucun where GoodsId='" + DropDownList2.SelectedValue + "' ");
            if (dr.Read())
            {
                string sql = "update kucun set shuliang=shuliang" + -+float.Parse(TextBox1.Text) + " where GoodsId=" + DropDownList2.SelectedValue;
                data.RunSql(sql);
            }
            data.RunSql("insert into ChuKu(name,danjia,TypeName,TypeId,guige,shuliang,Code,CManger,GoodsId)values('" + DropDownList2.SelectedItem.Text + "','" + txtdanjia.Text + "','" + DropDownList1.SelectedItem.Text + "'," + DropDownList1.SelectedValue + ",'" + txtguige.Text + "'," + TextBox1.Text.Trim() + ",'" + txtCode.Text + "','" + DropDownList3.SelectedItem.Text + "','" + DropDownList2.SelectedValue + "')");

            Alert.AlertAndRedirect("出库成功！", "SubStore.aspx");
        }

    }
}
