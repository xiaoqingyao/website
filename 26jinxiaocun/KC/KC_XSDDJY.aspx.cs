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
using JXCMODEL;
using JXCBLL;

public partial class KC_KC_XSDDJY : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            xsddDataBind();
        }
    }
    //绑定销售订单
    public void xsddDataBind() {
        gvXsddjy.DataSource = XsddManager.getAllXsdd("","3");
        gvXsddjy.DataBind();
    }
    //修改事件
    protected void btnxg_Click(object sender, EventArgs e)
    {
        if(ddlzt.SelectedValue == "-1"){
            lblmassage.Text = "请选择修改后的状态！";
        }
        else{
            string xsddbhs = string.Empty;
            for (int i = 0; i < gvXsddjy.Rows.Count;i++ )//遍历所有行
            {
                CheckBox ckb = (gvXsddjy.Rows[i].FindControl("ckbzt")) as CheckBox;//获得id为ckbzt的控件并转化为CheckBox
                if(ckb.Checked == true){//如果选中
                    xsddbhs += (gvXsddjy.Rows[i].FindControl("lblxsddbh") as Label).Text + ",";//把选中项的编号累加到字符串中
                }
            }
            if (xsddbhs.Length > 0)
            {
                xsddbhs = xsddbhs.Substring(0, xsddbhs.Length - 1);//去掉末尾的逗号
                string zt = ddlzt.SelectedValue;//
                XsddManager.modifyZtByDdbh(zt, xsddbhs);//
                xsddDataBind();//
                lblmassage.Text = "成功修改选中项的状态！";
            }
            else {
                lblmassage.Text = "请选择要修改的项！";
            }
           
        }
    }
    protected void gvXsddjy_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#CCFF99'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
        }
    }
    //获得仓库中某商品的数量
    public string getSlBySpbhInCk(string spbh) {
        return KcManager.getSlBySpbh(spbh);
    }
    protected void gvXsddjy_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvXsddjy.PageIndex = e.NewPageIndex;
        xsddDataBind();
    }
    //绑定状态
    public string setZt(string zt)
    {
        string str = "错误";
        if (zt == "0")
            str = "未确定";
        if (zt == "1")
            str = "确定";
        if (zt == "2")
            str = "退货";
        return str;
    }
    public string getYwymcByYwybh(string ywybh) {
        return YwyManager.getYwymcByYwybh(ywybh);
    }
    public string getKhmcByKhbh(string khbh) {
        return KhManager.getKhByKhbh(Convert.ToInt32(khbh)).Khmc;
    }
    public string getSpmcBySpbh(string spbh) {
        return SpManager.getSpBySpbh(Convert.ToInt32(spbh)).Spmc;
    }
}
