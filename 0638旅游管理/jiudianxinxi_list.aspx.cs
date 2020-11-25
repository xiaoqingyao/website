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

public partial class jiudianxinxi_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            xingji.Items.Add("所有");
            xingji.Items.Add("一");
            xingji.Items.Add("二");
            xingji.Items.Add("三");
            xingji.Items.Add("四");
            xingji.Items.Add("五");
            string sql;
            sql = "select * from jiudianxinxi order by id desc";
            getdata(sql);
        }
    }

    private void getdata(string sql)
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {

            if (result.Tables[0].Rows.Count > 0)
            {
                DataGrid1.DataSource = result.Tables[0];
                DataGrid1.DataBind();
                Label1.Text = "以上数据中共" + result.Tables[0].Rows.Count+"条";
            }
            else
            {
                DataGrid1.DataSource = null;
                DataGrid1.DataBind();
                Label1.Text = "暂无任何数据";
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "select * from jiudianxinxi where 1=1";
        if (bianhao.Text.ToString().Trim()!="" ){ sql=sql+" and bianhao like '%" + bianhao.Text.ToString().Trim() + "%'";}if (mingcheng.Text.ToString().Trim()!="" ){ sql=sql+" and mingcheng like '%" + mingcheng.Text.ToString().Trim() + "%'";}if (xingji.Text.ToString().Trim()!="所有" ){ sql=sql+" and xingji like '%" + xingji.Text.ToString().Trim() + "%'";}if (dianhua.Text.ToString().Trim()!="" ){ sql=sql+" and dianhua like '%" + dianhua.Text.ToString().Trim() + "%'";}
        sql = sql + " order by id desc";

        getdata(sql);
    }

    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string sql;
        sql = "select * from jiudianxinxi order by id desc";
        getdata(sql);
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        DataGrid1.DataBind();
    }
	public string riqigeshi(object str)
    {
        string strTmp = str.ToString();
        DateTime dt = Convert.ToDateTime(strTmp);
        string ss = dt.ToShortDateString();
        return ss;
        
    } 
}

