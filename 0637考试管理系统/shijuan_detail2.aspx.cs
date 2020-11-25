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

public partial class shijuan_detail2 : System.Web.UI.Page
{
    public string nshijuanbianhao, nxuanzetishu, nxuanzetifenzhi, nxuanzeti;
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

             for (int tID1 = 1; tID1 <= DataList1.Items.Count; tID1++)
            {
               
                TextBox txtSelect = (TextBox)DataList1.Items[tID1 - 1].FindControl("TextBox1");
                txtSelect.Text = result.Tables[0].Rows[tID1 - 1]["daan"].ToString().Trim();
                txtSelect.Visible = false;

                TextBox txtSelecttmid = (TextBox)DataList1.Items[tID1 - 1].FindControl("TextBoxtmid");
                txtSelecttmid.Text = result.Tables[0].Rows[tID1 - 1]["id"].ToString().Trim();
                txtSelecttmid.Visible = false;
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

            for (int tID1 = 1; tID1 <= DataList2.Items.Count; tID1++)
            {

                TextBox txtSelect = (TextBox)DataList2.Items[tID1 - 1].FindControl("TextBox2");
                txtSelect.Text = result.Tables[0].Rows[tID1 - 1]["daan"].ToString().Trim();
                 txtSelect.Visible = false;

                 TextBox txtSelecttmid2 = (TextBox)DataList2.Items[tID1 - 1].FindControl("TextBoxtmid2");
                 txtSelecttmid2.Text = result.Tables[0].Rows[tID1 - 1]["id"].ToString().Trim();
                 txtSelecttmid2.Visible = false;
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

            for (int tID1 = 1; tID1 <= DataList3.Items.Count; tID1++)
            {

                TextBox txtSelect = (TextBox)DataList3.Items[tID1 - 1].FindControl("TextBox3");
                txtSelect.Text = result.Tables[0].Rows[tID1 - 1]["daan"].ToString().Trim();
                 txtSelect.Visible = false;
                 TextBox txtSelecttmid3 = (TextBox)DataList3.Items[tID1 - 1].FindControl("TextBoxtmid3");
                 txtSelecttmid3.Text = result.Tables[0].Rows[tID1 - 1]["id"].ToString().Trim();
                 txtSelecttmid3.Visible = false;
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        string nfz1="";
        string nfz2 = "";
        string nfz3 = "";
         string sql;
            sql = "select * from shijuanshengcheng where id=" + Request.QueryString["id"].ToString().Trim();
            DataSet result = new DataSet();
            result = new Class1().hsggetdata(sql);
            if (result != null)
            {
                if (result.Tables[0].Rows.Count > 0)
                {
                    nshijuanbianhao=result.Tables[0].Rows[0]["shijuanbianhao"].ToString().Trim();
                    nfz1 = result.Tables[0].Rows[0]["xuanzetifenzhi"].ToString().Trim();
                    nfz2 = result.Tables[0].Rows[0]["panduantifenzhi"].ToString().Trim();
                    nfz3 = result.Tables[0].Rows[0]["tiankongtifenzhi"].ToString().Trim();
                }
            }



        int int_row1 = 0;
        float int_row1Point = 0;
        float hsgzf1 = 0;
        float hsgzf2 = 0;
        float hsgzf3 = 0;
        float hsgzf = 0;
        for (int tID1 = 1; tID1 <= DataList1.Items.Count; tID1++)
        {
            int_row1 += 1;
            RadioButtonList rbl = (RadioButtonList)(DataList1.Items[int_row1 - 1].FindControl("RadioButtonList1"));
            TextBox txtSelect = (TextBox)DataList1.Items[tID1 - 1].FindControl("TextBox1");

            TextBox txtSelecttmid = (TextBox)DataList1.Items[tID1 - 1].FindControl("TextBoxtmid");
               

            if (rbl.SelectedValue == "")
            {
               
                sql = "insert into cuotijilu(ctid,lx,username) values('" + txtSelecttmid.Text.ToString().Trim() + "','选择题','" + Session["username"].ToString().Trim() + "')";
               
                int resultss;
                resultss = new Class1().hsgexucute(sql);
            }
            else
            {
                if (txtSelect.Text.ToString().Trim() == rbl.SelectedValue.ToString().Trim())
                {
                    hsgzf1 = hsgzf1 + float.Parse(nfz1);
                }
                else
                {
                    sql = "insert into cuotijilu(ctid,lx,username) values('" + txtSelecttmid.Text.ToString().Trim() + "','选择题','" + Session["username"].ToString().Trim() + "')";
                   
                    int resultss;
                    resultss = new Class1().hsgexucute(sql);
                }
            }
        }

        int_row1 = 0;
        for (int tID1 = 1; tID1 <= DataList2.Items.Count; tID1++)
        {
            int_row1 += 1;
            RadioButtonList rbl = (RadioButtonList)(DataList2.Items[int_row1 - 1].FindControl("RadioButtonList2"));
            TextBox txtSelect = (TextBox)DataList2.Items[tID1 - 1].FindControl("TextBox2");
            TextBox txtSelecttmid2 = (TextBox)DataList2.Items[tID1 - 1].FindControl("TextBoxtmid2");
            if (rbl.SelectedValue == "")
            {
                sql = "insert into cuotijilu(ctid,lx,username) values('" + txtSelecttmid2.Text.ToString().Trim() + "','判断题','" + Session["username"].ToString().Trim() + "')";
                int resultss;
                resultss = new Class1().hsgexucute(sql);
            }
            else
            {
                if (txtSelect.Text.ToString().Trim() == rbl.SelectedValue.ToString().Trim())
                {
                    hsgzf2 = hsgzf2 + float.Parse(nfz2);
                }
                else
                {
                    sql = "insert into cuotijilu(ctid,lx,username) values('" + txtSelecttmid2.Text.ToString().Trim() + "','判断题','" + Session["username"].ToString().Trim() + "')";
                    int resultss;
                    resultss = new Class1().hsgexucute(sql);
                }
            }
        }

        int_row1 = 0;
        for (int tID1 = 1; tID1 <= DataList3.Items.Count; tID1++)
        {
            int_row1 += 1;
            TextBox rbl = (TextBox)(DataList3.Items[int_row1 - 1].FindControl("TextBoxListtkt"));
            TextBox txtSelect = (TextBox)DataList3.Items[tID1 - 1].FindControl("TextBox3");
            TextBox txtSelecttmid3 = (TextBox)DataList3.Items[tID1 - 1].FindControl("TextBoxtmid3");
            if (rbl.Text.ToString().Trim() == "")
            {
                sql = "insert into cuotijilu(ctid,lx,username) values('" + txtSelecttmid3.Text.ToString().Trim() + "','填空题','" + Session["username"].ToString().Trim() + "')";
                int resultss;
                resultss = new Class1().hsgexucute(sql);
            }
            else
            {
                if (txtSelect.Text.ToString().Trim() == rbl.Text.ToString().Trim())
                {
                    hsgzf3 = hsgzf3 + float.Parse(nfz3);
                }
                else
                {
                    sql = "insert into cuotijilu(ctid,lx,username) values('" + txtSelecttmid3.Text.ToString().Trim() + "','填空题','" + Session["username"].ToString().Trim() + "')";
                    int resultss;
                    resultss = new Class1().hsgexucute(sql);
                }
            }
        }

        hsgzf = hsgzf1 + hsgzf2 + hsgzf3;
       // Response.Write(hsgzf);
      //  Response.End();
        string sql2;
        sql2 = "insert into chengji(xh,xm,bj,xzt,pdt,tkt,zf,sjbh) values('" + Session["username"].ToString().Trim() + "','" + Session["xm"].ToString().Trim() + "','" + Session["bj"].ToString().Trim() + "'," + hsgzf1 + "," + hsgzf2 + "," + hsgzf3 + "," + hsgzf + ",'" + nshijuanbianhao + "')";
        int result2;
        result2 = new Class1().hsgexucute(sql2);


        Response.Write("<script>javascript:alert('本次成绩总分：" + hsgzf.ToString().Trim() + "，已保存在您的成绩记录表中');</script>");
    }
}
