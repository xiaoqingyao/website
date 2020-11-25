using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MessageEdit :BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            object objCode = Request["code"];
            if (objCode != null)
            {
                string code = objCode.ToString();
                string sql = "select * from message where id='" + code + "'";
                DataTable dt = new sqlHelper().GetDataTable(sql, null);
                this.id.Text = dt.Rows[0]["id"].ToString();
                this.txtTitle.Text = dt.Rows[0]["title"].ToString();
                this.txtContent.Text = dt.Rows[0]["content"].ToString();
            }
            else {
                this.id.Text = "0";
            }
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        string id = this.id.Text.Trim();
        string title = this.txtTitle.Text.Trim();
        string content = this.txtContent.Text.Trim();
        if (string.IsNullOrEmpty(id))
        {
            showMessage("编号不能为空！", false, "");
            return;
        }
        string sql = "delete from message where id='{0}';insert into dbo.message(title,content) values('{1}','{2}')";
        sql = string.Format(sql,id,title,content);
        try
        {
            new sqlHelper().ExecuteNonQuery(sql, null);
            showMessage("保存成功！", false, "window.parent.$.fancybox.close();");
        }
        catch (Exception ex)
        {

            showMessage(ex.Message, false, "");
        }

    }
}