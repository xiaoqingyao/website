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

public partial class PicInfo : System.Web.UI.Page
{
    string id;
    protected string  picaddress, jieshao, hits, username;
    protected void Page_Load(object sender, EventArgs e)
    {
        id=Request.QueryString["id"];
        if (!IsPostBack)
        {
            DataTable dt = DB.getDataTable("select * from Pic where PicId="+id);
            if (dt.Rows.Count > 0)
            {
                DB.ExecuteSql("update Pic set hits=hits+1 where Picid=" + id);

                Picname.Text = dt.Rows[0]["PicName"].ToString();
                picaddress = dt.Rows[0]["picaddress"].ToString().Substring(1);
                hits = dt.Rows[0]["hits"].ToString();
                username = dt.Rows[0]["username"].ToString();
                typename.Text=dt.Rows[0]["picclassname"].ToString();
                addtime.Text = dt.Rows[0]["addtime"].ToString();
            }
        }
    }


    
}
