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

public partial class dd_list2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql;
            if (Request.QueryString["ztid"] != null)
            {
                if (Request.QueryString["yuan"].ToString().Trim() == "未发货")
                {
                    sql = "update gwc set zt='已发货' where id=" + Request.QueryString["ztid"].ToString().Trim();
                }
                else
                {
                    sql = "update gwc set zt='未发货' where id=" + Request.QueryString["ztid"].ToString().Trim();
                }
                int result;
                result = new Class1().hsgexucute(sql);
            }
            sql = "select gwc.shuliang,gwc.zt,gwc.id,yonghuzhuce.yonghuming,shangpinxinxi.mingcheng,shangpinxinxi.leibie,shangpinxinxi.jiage,shangpinxinxi.tupian,gwc.addtime from gwc,yonghuzhuce,shangpinxinxi where gwc.username=yonghuzhuce.yonghuming and shangpinxinxi.id=gwc.proid ";

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
            }
            else
            {
                DataGrid1.DataSource = null;
                DataGrid1.DataBind();
            }
        }
    }
}
