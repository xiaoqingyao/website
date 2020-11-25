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

public partial class SysManage_ShouFeiOper : System.Web.UI.Page
{
    string id = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
        if (!IsPostBack)
        {
            DB.Bind_Dropdownlist("select * from suitype where parentid=2", qutype, "suitypename", "suitypename");
            DB.Bind_Dropdownlist("select * from suitype where parentid=1", suidiantype, "suitypename", "suitypename");
            if (!string.IsNullOrEmpty(id))
            {
                Get_Data();
            }
            else
            {
                txtShouFeiDate.Text = DateTime.Now.ToShortDateString();
            }
        }
    }

    void Get_Data()
    {
        try
        {
            DataTable dt = DB.getDataTable("select * from ShouFei where ShouFeiId=" + id);
            if (dt.Rows.Count == 1)
            {
                txtShouFeiDate.Text = dt.Rows[0]["ShouFeiDate"].ToString();

                qutype.SelectedValue = dt.Rows[0]["qutype"].ToString();
                ddlType.SelectedValue = dt.Rows[0]["typeid"].ToString();
                DB.Bind_Dropdownlist("select * from suitype where parentid=" + ddlType.SelectedValue, suidiantype, "suitypename", "suitypename");
                suidiantype.SelectedValue = dt.Rows[0]["suidiantype"].ToString();
                
                zhuhuname.Text = dt.Rows[0]["zhuhuname"].ToString();
                txtLiang.Text = dt.Rows[0]["Liang"].ToString();
                total.Text = dt.Rows[0]["total"].ToString();

                isjiaofei.SelectedValue = dt.Rows[0]["isjiaofei"].ToString();
                jiaofeitype.SelectedValue = dt.Rows[0]["jiaofeitype"].ToString();
                jiaofeitime.Text = dt.Rows[0]["jiaofeitime"].ToString();
                
            }
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "页面加载时出现异常。", "");
            return;
        }
    }

    /// <summary>
    /// 按钮事件：提交信息
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string sql2 = string.Empty;
            
            if (string.IsNullOrEmpty(id))//添加
            {
                sql2 = "insert into ShouFei(ShouFeiDate,typeid,typename,zhuhuid,zhuhuname,Liang,Total,isjiaofei,jiaofeitype,jiaofeitime,qutype,suidiantype) ";
                sql2 += "values('" + txtShouFeiDate.Text + "','" + ddlType.SelectedValue + "','" + ddlType.SelectedItem.Text + "','0','" + zhuhuname.Text + "','" + txtLiang.Text + "','" + total.Text + "'";
                sql2 += ",'" + isjiaofei.SelectedValue + "','" + jiaofeitype.SelectedValue + "','" + jiaofeitime.Text + "','" + qutype.SelectedValue + "','" + suidiantype.SelectedValue + "'";
                sql2 += ")";
            }
            else//修改
            {
                sql2 = "update ShouFei set ShouFeiDate='{0}',typeid='{1}',typename='{2}',zhuhuid='{3}',zhuhuname='{4}',Liang='{5}',Total='{6}',isjiaofei='{7}',jiaofeitype='{8}',jiaofeitime='{9}',qutype='{10}',suidiantype='{11}' where ShouFeiId=" + id;
                sql2 = string.Format(sql2, txtShouFeiDate.Text, ddlType.SelectedValue, ddlType.SelectedItem.Text, "0", zhuhuname.Text, txtLiang.Text, total.Text, isjiaofei.SelectedValue, jiaofeitype.SelectedValue, jiaofeitime.Text, qutype.SelectedValue, suidiantype.SelectedValue);
            }

            SqlConnection cn = DB.OpenConnection();
            SqlCommand cmd = new SqlCommand(sql2, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            cn.Dispose();
            Common.ShowMessage(this.Page, "信息保存成功！", "", "ShouFeimanage.aspx");
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "信息保存失败，请稍后重试。", "");
            return;
        }
    }


    //private double getdanjia(string typeid)
    //{
    //    double ss = 0;
    //    switch (typeid)
    //    {
    //        case "1": ss = 5; break;
    //        case "2": ss = 0.5; break;
    //        case "3": ss = 0.4; break;
    //        case "4": ss = 2; break;
    //        case "5": ss = 3; break;
    //    }

    //    return ss;
    //}

    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        DB.Bind_Dropdownlist("select * from suitype where parentid=" + ddlType.SelectedValue, suidiantype, "suitypename", "suitypename");
    }
}