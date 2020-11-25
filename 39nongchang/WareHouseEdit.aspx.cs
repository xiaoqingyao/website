using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WareHouseEdit : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            object objCode = Request["code"];
            if (objCode != null)
            {
                string code = objCode.ToString();
                string sql = "select * from WareHouse where code='" + code + "'";
                DataTable dt = new sqlHelper().GetDataTable(sql, null);
                this.code.Value = dt.Rows[0]["code"].ToString();
                this.flg.SelectedValue = dt.Rows[0]["flg"].ToString();
                this.Name.Text = dt.Rows[0]["name"].ToString();
                this.Category.Text = dt.Rows[0]["category"].ToString();
                this.count.Text = dt.Rows[0]["count"].ToString();
                this.Note.Text = dt.Rows[0]["note"].ToString();
                this.createDate.Text = dt.Rows[0]["createDate"].ToString();
                this.Product.Text = dt.Rows[0]["Product"].ToString();
            }
            else
            {
                this.createDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        string flg = this.flg.SelectedValue;
        string name = this.Name.Text.Trim();
        string category = this.Category.SelectedValue;
        string count = this.count.Text.Trim();
        string note = this.Note.Text.Trim();
        string createDate = this.createDate.Text.Trim();
        string product = this.Product.Text.Trim();
        int icount = 0;
        if (!int.TryParse(count, out icount))
        {
            showMessage("数量必须为阿拉伯数字！", false, "");
            return;
        }
        string sql = "delete from WareHouse where code='{0}';insert into dbo.WareHouse(name,Product,Category,count,flg,Note,CreateUser) values('{1}','{2}','{3}','{4}','{5}','{6}','{7}')";
        sql = string.Format(sql,this.code.Value, name, product, category, count, flg, note, Session["userCode"].ToString());
        try
        {
          //  Response.Write(sql);
            new sqlHelper().ExecuteNonQuery(sql, null);
            showMessage("保存成功！", false, "window.parent.$.fancybox.close();");
        }
        catch (Exception ex)
        {
            showMessage(ex.Message, false, "");
        }

    }
}