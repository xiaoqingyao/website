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

public partial class users_mybkinfo : System.Web.UI.Page
{
    DxxBlog.BLL.B_RoomInfo dal = new DxxBlog.BLL.B_RoomInfo();
    DxxBlog.Model.B_RoomInfo model = new DxxBlog.Model.B_RoomInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            InitData();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        model.StrTitle = txttitle.Text;
        model.StrDescription = txtContent.Text;
        
        string id = null;
        try
        {
            id = Session["userid"].ToString();
        }
        catch (Exception ex)
        { }
        if (!String.IsNullOrEmpty(id))
        {
            model.UserId = id;
            if (String.IsNullOrEmpty(hidid.Value))
            {
                int i = dal.Add(model);
                if (i>0)
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "", "<script language=\"javascript\">alert('操作成功!');</script>");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "", "<script language=\"javascript\">alert('操作失败!');</script>");
                }
            }
            else
            { 
                model.Id = int.Parse(hidid.Value);
                try
                {
                    dal.Update(model);
                    Page.ClientScript.RegisterStartupScript(GetType(), "", "<script language=\"javascript\">alert('操作成功!');</script>");
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "", "<script language=\"javascript\">alert('操作失败!');</script>");
                }
            }
        }
    }
    public void InitData()
    {
        string id = null;
        try
        {
            id = Session["userid"].ToString();

        }
        catch (Exception ex)
        { }
        if (!String.IsNullOrEmpty(id))
        {
            DataTable dt = dal.GetList(" UserId=" + id + "").Tables[0];

            if (dt.Rows.Count > 0)
            {
                hidid.Value = dt.Rows[0]["Id"].ToString();
                txttitle.Text = dt.Rows[0]["StrTitle"].ToString();
                txtContent.Text = dt.Rows[0]["StrDescription"].ToString();
            }
        }
    }
}
