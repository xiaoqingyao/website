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

public partial class _Default : System.Web.UI.Page
{
    public string sql,ncontent;
    public string npics,nlinks,ntexts;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            sql = "select top 5 id,title,shouyetupian from allgonggao where shouyetupian<>'' order by id desc";
            getsyt(sql);
            sql = "select top 6 id,title,addtime,leibie from allgonggao where leibie='旅游资讯' order by id desc";
            getdata(sql);
            sql = "select top 5 * from mingshengfengjing  where tupian<>'' order by id desc";
            getdata2(sql);
            //sql = "select top 5 * from allgonggao  where leibie='签证告知' order by id desc";
            //getdata2(sql);
            //sql = "select top 5 * from kaoshizhidao   order by id desc";
            //getdata3(sql);
            //sql = "select top 5 * from shangpinxinxi where tupian<>''   order by id desc";
            //getdata4(sql);
            sql = "select content from dx where leibie='系统简介'";
            getdatextjj(sql);
        }
    }
    private void getdatextjj(string sql)
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                ncontent = result.Tables[0].Rows[0][0].ToString().Trim();
            }
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
    private void getdata2(string sql)
    {
        DataSet result = new DataSet();
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
    }
    private void getsyt(string sql)
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                int i=0;
                for(i=0;i<result.Tables[0].Rows.Count;i++)
                {
                    npics = npics + result.Tables[0].Rows[i]["shouyetupian"].ToString().Trim()+"|";
                    nlinks = nlinks + "ggdetail.aspx?id="+result.Tables[0].Rows[i]["id"].ToString().Trim()+"|";
                    ntexts = ntexts + result.Tables[0].Rows[i]["title"].ToString().Trim()+"|";

                }
                npics=npics.Substring(0,npics.Length-1);
                nlinks = nlinks.Substring(0, nlinks.Length - 1);
                ntexts = ntexts.Substring(0, ntexts.Length - 1);
            }
        }
    }
    public string CutStr(object str)
    {
        string strTmp = str.ToString();
        //     截取长度20 
        if (strTmp.Length > 22)
        {
            return strTmp.Substring(0, 20) + "... ";
        }
        else
        {
            return strTmp;
        }
    } 
}
