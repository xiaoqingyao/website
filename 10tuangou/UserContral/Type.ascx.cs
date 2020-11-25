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
public partial class UserContral_Type : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String sql = "select top 4 * from g_type";
            this.DataList1.DataSource = getTable(sql);
            this.DataList1.DataBind();

        }
    }
    public DataTable getTable(String sql)
    {
        DataBase DB = new DataBase();
        SqlConnection con;
        con = DB.ReturnConn();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlDataAdapter sd = new SqlDataAdapter(sql, con);
        sd.Fill(ds);
        con.Close();
        dt = ds.Tables[0];
        return dt;
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            DataList dl = (DataList)e.Item.FindControl("DataList2");
            DataRowView dw = (DataRowView)e.Item.DataItem;
            String s = System.Convert.ToString(dw["gTypeId"]);
            String sql = "select top 4 gatherId,gTypeId,rtrim(pdPhoto) as productPhoto,productName ,companyId from vwGatherProduct where gTypeId='" + s + "' Order By heat Desc";
            DataTable dt = new DataTable();
            dt = getTable(sql);
            if (dt.Rows.Count < 4)
            {
                if (dt.Rows.Count == 3)
                {
                    dt.Rows.Add("0001", "0001", "~/Image/ProductIco/wu.jpg", "", 0);
                }
                if (dt.Rows.Count == 2)
                {
                    dt.Rows.Add("0001", "0001", "~/Image/ProductIco/wu.jpg", "", 0);
                    dt.Rows.Add("0001", "0001", "~/Image/ProductIco/wu.jpg", "", 0);

                }
                if (dt.Rows.Count == 1)
                {
                    dt.Rows.Add("0001", "0001", "~/Image/ProductIco/wu.jpg", "", 0);
                    dt.Rows.Add("0001", "0001", "~/Image/ProductIco/wu.jpg", "", 0);
                    dt.Rows.Add("0001", "0001", "~/Image/ProductIco/wu.jpg", "", 0);

                }
                if (dt.Rows.Count == 0)
                {
                    dt.Rows.Add("0001", "0001", "~/Image/ProductIco/wu.jpg", "", 0);
                    dt.Rows.Add("0001", "0001", "~/Image/ProductIco/wu.jpg", "", 0);
                    dt.Rows.Add("0001", "0001", "~/Image/ProductIco/wu.jpg", "", 0);
                    dt.Rows.Add("0001", "0001", "~/Image/ProductIco/wu.jpg", "", 0);
                }
                dl.DataSource = dt;
                dl.DataBind();
            }
            else
            {
                dl.DataSource = dt;
                dl.DataBind();
            }

        }
    }
}
