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
using JXCBLL;
using JXCMODEL;

public partial class KC_KC_JHDDJY : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            jhddDataBind();
        }
    }
    public void jhddDataBind() {
        gvJhddjy.DataSource = JhddManager.getAllJhdd("","3");
        gvJhddjy.DataBind();
    }
    protected void gvJhddjy_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
        }
    }
    protected void btnxg_Click(object sender, EventArgs e)
    {
        if (ddlzt.SelectedValue == "-1")
        {
            lblmassage.Text = "请选择修改后的状态！";
        }
        else
        {
            string jhddbhs = string.Empty;
            for (int i = 0; i < gvJhddjy.Rows.Count; i++)
            {
                CheckBox ckb = (gvJhddjy.Rows[i].FindControl("ckbzt")) as CheckBox;
                if (ckb.Checked == true)
                {
                    jhddbhs += (gvJhddjy.Rows[i].FindControl("lbljhddbh") as Label).Text + ",";
                }
            }
            if (jhddbhs.Length > 0)
            {
                jhddbhs = jhddbhs.Substring(0, jhddbhs.Length - 1);
                string zt = ddlzt.SelectedValue;
                JhddManager.modifyZtByDdbh(zt, jhddbhs);
                jhddDataBind();
                lblmassage.Text = "成功修改选中项的状态！";
            }
            else {
                lblmassage.Text = "请选择要修改的项！";
            }
        }
    }
    public string getSlBySpbhInCk(string spbh)
    {
        return KcManager.getSlBySpbh(spbh);
    }
    protected void gvJhddjy_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvJhddjy.PageIndex = e.NewPageIndex;
        jhddDataBind();
    }
    public string setZt(string zt) {
        string str = "错误";
        if (zt == "0")
            str = "未确定";
        if (zt == "1")
            str = "确定";
        if (zt == "2")
            str = "退货";;
        return str;
    }
    public string getYwymcByYwybh(string ywybh)
    {
        return YwyManager.getYwymcByYwybh(ywybh);
    }
    public string getGysmcByGysbh(string gysbh)
    {
        return GysManager.getGysByGysbh(Convert.ToInt32(gysbh)).Gysmc;
    }
    public string getSpmcBySpbh(string spbh)
    {
        return SpManager.getSpBySpbh(Convert.ToInt32(spbh)).Spmc;
    }
}
