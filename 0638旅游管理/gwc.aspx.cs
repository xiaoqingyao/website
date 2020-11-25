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

public partial class gwc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql;
        if(Session["username"]==null)
			{
				Response.Write("<script>javascript:alert('对不起,请您先登陆!');history.back();</script>");
				Response.End();
			}
			else
			{
				
				if(Request.QueryString["id"] != null)
				{

                    sql = "insert into gwc(proid,username,shuliang) values(" + Request["id"].ToString().Trim() + ",'" + Session["username"].ToString().Trim() + "',"+Request.QueryString["sl"].ToString().Trim()+")";
					int result2;
					result2=new Class1().hsgexucute(sql);
					if (result2==1)
					{
						//Session["nuser"]=username.Text.ToString().Trim();
						Response.Write("<script>javascript:alert('该玩具已经成功放入您的购物车');location.href='default.aspx';</script>");
					}
					else
					{
						Response.Write("<script>javascript:alert('系统错误');</script>");
					}
				}
			}

           
		}

    
}
