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

public partial class SealManger_ChkSubSeal : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    public string DownPath;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BinderChanpin();
        }
    }
    private void BinderChanpin()
    {
        SqlDataReader dr;
        int id = int.Parse(Request.QueryString["id"].ToString());
        dr = data.GetDataReader("select * from  XiaoShou where id="+id);
        if (dr.Read())
        {
            txtGoodsName.Text = dr["name"].ToString();
            txtType.Text = dr["TypeName"].ToString();
            txtdanjia.Text = dr["danjia"].ToString();
            txtguige.Text = dr["guige"].ToString();
            txtCode.Text = dr["Code"].ToString();
            txtSL.Text = dr["shuliang"].ToString();
            txtSealDanJia.Text = dr["SealDanJia"].ToString();
            txtDanWei.Text = dr["GyS"].ToString();
            txtSumMoeny.Text = dr["SumMoeny"].ToString();
            Hidden1.Value = dr["TypeId"].ToString();
            Hidden2.Value = dr["GoodsId"].ToString();
        }
        else
        {
            alert.Alertjs("没有商品信息！");
            return;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["id"].ToString());
        if (int.Parse(TextBox5.Text) > int.Parse(txtSL.Text))
        {
            alert.Alertjs("退货数量不能大于销售数量！");
        }
        else
        {

            string sql = "update XiaoShou set shuliang='" + txtSL.Text + "',SumMoeny='"+txtSumMoeny.Text+"' where id=" + id;
            data.RunSql(sql);
            data.RunSql("insert into XiaoShouTuoHuoTuoHuo(name,danjia,TypeName,TypeId,guige,shuliang,Code,CManger,GoodsId,SumMoeny,GyS,SealDanJia)values('" + txtGoodsName.Text + "','" + txtdanjia.Text + "','" + txtType.Text + "'," + Hidden1.Value + ",'" + txtguige.Text + "'," + TextBox5.Text + ",'" + txtCode.Text + "','" + Session["admin"].ToString() + "','" + Hidden2.Value + "','" + TextBox1.Text + "','" + txtDanWei.Text + "','" + txtSealDanJia.Text + "')");

            Alert.AlertAndRedirect("退货成功！", "AddSeal.aspx");
        }

    }
    protected void TextBox5_TextChanged(object sender, EventArgs e)
    {
        txtSL.Text =Convert.ToString(int.Parse( txtSL.Text) - int.Parse( TextBox5.Text));
        txtSumMoeny.Text = Convert.ToString(float.Parse(txtSL.Text) * float.Parse(txtSealDanJia.Text));

      TextBox1.Text = Convert.ToString(float.Parse(TextBox5.Text) * float.Parse(txtSealDanJia.Text));
    }
}
