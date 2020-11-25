using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SaleEdit : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //绑定产品
            string sqlProduct = @"select 
                        Product
                        from dbo.WareHouse
                        where Category = '收货产品' 
and createUser='" + Session["userCode"] + "'         group by Product having SUM(case flg when '入库' then[count] else -[count] end )> 0";
            DataTable dtProduct = new sqlHelper().GetDataTable(sqlProduct, null);
            this.productName.DataSource = dtProduct;
            this.productName.DataTextField = "Product";
            this.productName.DataTextField = "Product";
            this.productName.DataBind();
            this.productName.Items.Insert(0, new ListItem("请选择", ""));

            //加载当前记录
            object objCode = Request["code"];
            if (objCode != null)
            {
                string code = objCode.ToString();
                string sql = "select * from Sale where code='" + code + "'";
                DataTable dt = new sqlHelper().GetDataTable(sql, null);
                this.code.Value = dt.Rows[0]["code"].ToString();
                this.Name.Text = dt.Rows[0]["Name"].ToString();
                this.productName.Text = dt.Rows[0]["productName"].ToString();
                this.count.Text = dt.Rows[0]["count"].ToString();
                this.Note.Text = dt.Rows[0]["Note"].ToString();
            }
            else
            {
                this.createDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        string maxCount = this.txtMaxCount.Text.Trim();
        string count = this.count.Text.Trim();
        int imaxCount = 0;
        int icount = 0;
        if (!int.TryParse(maxCount, out imaxCount))
        {
            showMessage("最大数量必须为阿拉伯数字！", false, "");
            return;
        }
        if (!int.TryParse(count, out icount))
        {
            showMessage("数量必须为阿拉伯数字！", false, "");
            return;
        }
        if (icount > imaxCount)
        {
            showMessage("销售数量不得大于库存量！", false, "");
            return;
        }

        string code = this.code.Value;
        string name = this.Name.Text.Trim();
        string productName = this.productName.Text.Trim();

        string note = this.Note.Text.Trim();
        string sql = "delete from Sale where code='{0}';insert into dbo.Sale(name,productname,count,note,CreateUser) values('{1}','{2}','{3}','{4}','{5}')";
        sql = string.Format(sql, code, name, productName, count, note, Session["userCode"].ToString());
        string sqlWareHouse = "insert into dbo.WareHouse(name,Product,Category,count,flg,Note,CreateUser) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}')";
        sqlWareHouse = string.Format(sqlWareHouse,"销售订单对应出库单，销售概要："+name,productName, "收货产品",count,"出库",note, Session["userCode"].ToString());
        try
        {
            //  Response.Write(sql);
            new sqlHelper().ExecuteNonQuery(sql, null);
            new sqlHelper().ExecuteNonQuery(sqlWareHouse, null);
            showMessage("保存成功！", false, "window.parent.$.fancybox.close();");
        }
        catch (Exception ex)
        {
            showMessage(ex.Message, false, "");
        }

    }

    protected void productName_SelectedIndexChanged(object sender, EventArgs e)
    {
        string productname = productName.SelectedValue;

        string sql = @"select 
                        SUM(
                        case flg when '入库' then[count] else -[count] end) ct
                        from dbo.WareHouse
                        where Category = '收货产品' and createUser='" + Session["userCode"] + "' and product='" + productname + "'   group by Product";
        object obj = new sqlHelper().ExecuteScalar(sql);
        this.txtMaxCount.Text = obj.ToString();
    }
}