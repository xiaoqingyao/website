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
using System.Collections.Generic;
using System.Timers;
using System.Threading;
using JXCBLL;
using JXCMODEL;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["ywy"] != null)
        {
            
            Ywy ywy = (Ywy)Session["ywy"];
            IList<Js_qx> js_qxs = new List<Js_qx>();
            js_qxs = Js_qxManager.getJs_qxsByJsbh(ywy.Jsbh);
            int urlid = Convert.ToInt32(Request.QueryString["urlid"]);
            if (urlid != 0)
            {
                if (js_qxs.Count > 0)
                {
                    for (int i = 0; i < js_qxs.Count; i++)
                    {
                        Js_qx js_qx = (Js_qx)js_qxs[i];
                        if (js_qx.Qxbh == urlid)
                            Response.Redirect(QxManager.getQxByQxbh(urlid).Qxurl, true);
                    }
                }
                else
                {
                    return;
                }
            }
            if(urlid == 88)
            {
                HttpCookie cookie = Request.Cookies[FormsAuthentication.FormsCookieName];
                if (cookie != null)
                {
                    FormsAuthentication.SignOut();
                }
                Request.Cookies.Clear();
                HttpContext.Current.Response.Cookies[FormsAuthentication.FormsCookieName].Value = null;
                HttpContext.Current.Response.Cookies[FormsAuthentication.FormsCookieName].Expires = DateTime.Now.AddYears(-100);//为什么是-100
                HttpContext.Current.Session.Abandon();
                Response.Redirect("/JCXX/JCXX_DL.aspx", true);
            }
        }
        else
        {
            Response.Redirect("/JCXX/JCXX_DL.aspx");
        }
     
     }
    
}
