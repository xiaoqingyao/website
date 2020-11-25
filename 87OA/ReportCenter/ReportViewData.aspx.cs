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

public partial class ReportCenter_ReportViewData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview();
        }
    }

    public void DataBindToGridview()
    {
        ZWL.BLL.ERPReport Model = new ZWL.BLL.ERPReport();
        Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
        GVData.DataSource = ZWL.DBUtility.DbHelperSQL.GetDataSet(Model.ReportSql.ToString());        
        GVData.DataBind();        
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        if (this.RadioButtonList1.SelectedItem.Text == "电子表格")
        {
            DisableControls(GVData);
            Response.ClearContent();
            Response.Charset = "GB2312";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");

            Response.AddHeader("content-disposition", "attachment; filename="+DateTime.Now.Year.ToString()+DateTime.Now.Month.ToString()+DateTime.Now.Day.ToString()+".xls");
            Response.ContentType = "application/ms-excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();

            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GVData.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
        else
        {
            DisableControls(GVData);
            Response.ClearContent();
            Response.Charset = "GB2312";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");

            Response.AddHeader("content-disposition", "attachment; filename=" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + ".htm");
            Response.ContentType = "text/HTML";
            System.IO.StringWriter sw = new System.IO.StringWriter();

            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GVData.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
    }

    private void DisableControls(Control gv)
    {
        LinkButton lb = new LinkButton();
        Literal l = new Literal();
        string name = String.Empty;

        for (int i = 0; i < gv.Controls.Count; i++)
        {
            if (gv.Controls[i].GetType() == typeof(LinkButton))
            {
                l.Text = (gv.Controls[i] as LinkButton).Text;
                gv.Controls.Remove(gv.Controls[i]);
                gv.Controls.AddAt(i, l);
            }
            else if (gv.Controls[i].GetType() == typeof(DropDownList))
            {
                l.Text = (gv.Controls[i] as DropDownList).SelectedItem.Text;
                gv.Controls.Remove(gv.Controls[i]);
                gv.Controls.AddAt(i, l);
            }

            if (gv.Controls[i].HasControls())
            {
                DisableControls(gv.Controls[i]);
            }
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        // 空方法，必须有
    }
}
