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

public partial class Validate_Info : System.Web.UI.Page
{
    CtlOrder co = new CtlOrder();
    EntOrder eo = new EntOrder();
    public static string perid;
    DataBase db = new DataBase();
    CtlGather cg = new CtlGather();
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["perName"] == null)
        {
           
            string url = Request.Url.AbsoluteUri;
            Session["url"] = url;
            Response.Write("<script LANGUAGE='javascript'>alert('对不起！您还没有登陆请先登陆');window.location='login.aspx'</script>");
        }
        else
        {
            if (!IsPostBack)
            {
                data.RunSql("update g_gather set Number=Number+1 where ProductId='" + Request.QueryString["pid"] + "' ");
                //取用户信息
                string pername = System.Convert.ToString(Session["perName"]);
                DataTable dt = new DataTable();
                dt = cg.selectPer(pername);
                if (dt.Rows.Count > 0)
                {
                    int len = dt.Rows.Count - 1;//取最后一次的地址
                    this.address.Text = dt.Rows[len][2].ToString();
                    this.lianxi.Text = dt.Rows[len][4].ToString();
                    this.sex.Text = dt.Rows[len][6].ToString();
                    this.gphone.Text = dt.Rows[len][5].ToString();
                    this.mphone.Text = dt.Rows[len][3].ToString();
                    perid = dt.Rows[len][0].ToString();
                    dt.Clear();
                }
            }
        }
    }
    protected void btnok_Click(object sender, EventArgs e)
    {
        string sql = ""; ;
        string pname = System.Convert.ToString(Session["perName"]);
       
        string gid = Request["gid"].ToString();
        string pid = Request["pid"].ToString();
        string oid = CreateOrderId();

        eo.Oid = oid;
        eo.Gid = gid;
        eo.Pid = pid;
        eo.Pname = pname;
        eo.State = "未通过";
        eo.PersonalInfoid = perid;
        eo.Time = System.DateTime.Now.ToString();
        string gsql = "select gPrice  from g_gather where gatherId='" + gid + "'";
        DataTable dt = new DataTable();
        dt = db.RunDataSet(gsql).Tables[0];
        eo.Stotal = System.Convert.ToString(dt.Rows[0][0]);

        if (co.CreateOrder(sql, eo))
        {
            Session["oid"] = oid;
            Response.Redirect("OrderOk.aspx");
        }
        else
        {
            this.RegisterStartupScript("Startup", "<script language=javascript>alert('加入团购失败！请重试')</script>");
        }

    }
    private String CreateOrderId()//生成定单号
    {
        string pname = System.Convert.ToString(Session["pername"]);
        String r = pname.Substring(pname.Length - 1, 1).ToUpper();
        String t = pname.Substring(1, 1).ToUpper();
        DateTime dt = System.DateTime.Now;
        String s = dt.ToString().Replace("-", "").Replace(" ", "").Replace(":", "");
        String oid = "OZZ" + t + s + r;
        return oid;
    }
}
