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

public partial class UserContral_DisplayControl : System.Web.UI.UserControl
{
    public static SqlDataAdapter drt = new SqlDataAdapter();
    private const int PAGESIZE = 4;//声明每一页包含的记录数
    //public String st ;
    CtlGather cg = new CtlGather();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["list"] == null)
            {
                string tid = Request["gtypeId"];
             
                drt = cg.selectgather(tid);
                this.DataListBind(this.getDataView());
                int currentPageIndex = 1;//指定当前页
                ViewState["currentPageIndex"] = currentPageIndex;
                
            }
            else
            {
                drt = (SqlDataAdapter)Session["list"];
                this.DataListBind(this.getDataView());
                int currentPageIndex = 1;//指定当前页
                ViewState["currentPageIndex"] = currentPageIndex;
            }
        }

    }
    private int CaculateRecordCount()
    {
       
        int rc;
        DataSet ds = new DataSet();
        //DataTable dt = new DataTable();
        drt.Fill(ds);
        rc = ds.Tables[0].Rows.Count;
        return rc;
    }
    private DataView getDataView()
    {
       
      
        DataSet ds = new DataSet();
        drt.Fill(ds);
        return ds.Tables[0].DefaultView;
    }
    private DataView getDataView(int recordIndex, int pageSize)
    {
       
        DataSet ds = new DataSet();
        drt.Fill(ds, recordIndex, pageSize, "tt");//将首记录索引为recordIndex开始的pagesize条记录填充到数据集
        return ds.Tables[0].DefaultView;
    }
    private void DataListBind(DataView dv)
    {
        PagedDataSource pds = new PagedDataSource();
        pds.PageSize = PAGESIZE;
        pds.AllowPaging = true;
        pds.DataSource = dv;
        this.DataList1.DataSource = pds;
        this.DataList1.DataBind();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        //首先判断显示的记录数是否已经超过了所有的记录数
        if ((int)ViewState["currentPageIndex"] * PAGESIZE < CaculateRecordCount())
        {
            int recordIndex = ((int)ViewState["currentPageIndex"]) * PAGESIZE;//计算当前页要显示的记录的索引
            this.DataListBind(this.getDataView(recordIndex, PAGESIZE));//绑定到DATALIST
            ViewState["currentPageIndex"] = (int)ViewState["currentPageIndex"] + 1;//当前页加1
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "kk", "alert('到达最后一页')", true);
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((int)ViewState["currentPageIndex"] > 1)
        {
            int recordIndex = ((int)ViewState["currentPageIndex"] - 2) * PAGESIZE;//计算当前也要显示的首记录的索引
            this.DataListBind(this.getDataView(recordIndex, PAGESIZE));//绑定
            ViewState["currentPageIndex"] = (int)ViewState["currentPageIndex"] - 1;//当前页码减1
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "kk", "alert('到达第一页!')", true);
        }
    }

}
