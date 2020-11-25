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

public partial class shijuan_detail : System.Web.UI.Page
{
    public string nshijuanbianhao,nxuanzetishu, nxuanzetifenzhi, nxuanzeti;
    public string npanduantishu, npanduantifenzhi, npanduanti;
    public string ntiankongtishu, ntiankongtifenzhi, ntiankongti;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            string sql;
            sql = "select * from shijuanshengcheng where id=" + Request.QueryString["id"].ToString().Trim();
            DataSet result = new DataSet();
            result = new Class1().hsggetdata(sql);
            if (result != null)
            {
                if (result.Tables[0].Rows.Count > 0)
                {

                    nshijuanbianhao = result.Tables[0].Rows[0]["shijuanbianhao"].ToString().Trim();
                    nxuanzetishu = result.Tables[0].Rows[0]["xuanzetishu"].ToString().Trim();
                    nxuanzetifenzhi = result.Tables[0].Rows[0]["xuanzetifenzhi"].ToString().Trim();
                    nxuanzeti = result.Tables[0].Rows[0]["xuanzeti"].ToString().Trim();
                    npanduantishu = result.Tables[0].Rows[0]["panduantishu"].ToString().Trim();
                    npanduantifenzhi = result.Tables[0].Rows[0]["panduantifenzhi"].ToString().Trim();
                    npanduanti = result.Tables[0].Rows[0]["panduanti"].ToString().Trim();
                    ntiankongtishu = result.Tables[0].Rows[0]["tiankongtishu"].ToString().Trim();
                    ntiankongtifenzhi = result.Tables[0].Rows[0]["tiankongtifenzhi"].ToString().Trim();
                    ntiankongti = result.Tables[0].Rows[0]["tiankongti"].ToString().Trim();
                }
            }

            sql = "select * from xuanzeti where id in (" + nxuanzeti + ") ";
            //DataSet result = new DataSet();
            result = new Class1().hsggetdata(sql);
            if (result != null)
            {
                if (result.Tables[0].Rows.Count > 0)
                {

                    DataList1.DataSource = result.Tables[0];
                    DataList1.DataBind();

                }
                else
                {
                    DataList1.DataSource = null;
                    DataList1.DataBind();
                }
            }

            sql = "select * from panduanti where id in (" + npanduanti + ") ";
            //DataSet result = new DataSet();
            result = new Class1().hsggetdata(sql);
            if (result != null)
            {
                if (result.Tables[0].Rows.Count > 0)
                {

                    DataList2.DataSource = result.Tables[0];
                    DataList2.DataBind();

                }
                else
                {
                    DataList2.DataSource = null;
                    DataList2.DataBind();
                }
            }
            sql = "select * from tiankongti where id in (" + ntiankongti + ") ";
            //DataSet result = new DataSet();
            result = new Class1().hsggetdata(sql);
            if (result != null)
            {
                if (result.Tables[0].Rows.Count > 0)
                {

                    DataList3.DataSource = result.Tables[0];
                    DataList3.DataBind();

                }
                else
                {
                    DataList3.DataSource = null;
                    DataList3.DataBind();
                }
            }

            //生成单选题题号
            for (int tID1 = 1; tID1 <= DataList1.Items.Count; tID1++)
            {
                Label lblSelect = (Label)DataList1.Items[tID1 - 1].FindControl("Label2");
                lblSelect.Text = tID1.ToString() + "、";
            }
            for (int tID1 = 1; tID1 <= DataList2.Items.Count; tID1++)
            {
                Label lblSelect = (Label)DataList2.Items[tID1 - 1].FindControl("Label3");
                lblSelect.Text = tID1.ToString() + "、";
            }
            for (int tID1 = 1; tID1 <= DataList3.Items.Count; tID1++)
            {
                Label lblSelect = (Label)DataList3.Items[tID1 - 1].FindControl("Label4");
                lblSelect.Text = tID1.ToString() + "、";
            }
        }
    }
}
