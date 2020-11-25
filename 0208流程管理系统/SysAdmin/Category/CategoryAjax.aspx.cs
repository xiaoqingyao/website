using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;

using Wuqi.Webdiyer;
using AllPower.Common;
using AllPower.BLL.Content;
using AllPower.Web.Admin;
using AllPower.BLL.SysManage;
namespace AllPower.WEB.SysAdmin.Category
{
    public partial class CategoryAjax : System.Web.UI.Page
    {
          
        public static Hashtable hash = new Hashtable();
        public static string state = "";
        AllPower.BLL.Categorys.Category bll = new AllPower.BLL.Categorys.Category();   
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.ContentType = "text/plain";
                string Parentid = Request["id"].ToString();
                string Sta = Request["state"].ToString();
                DataTable dtTrunk;
                dtTrunk = bll.GetList("VALIDCHILD1", Utils.getOneParams(Parentid));

                if (hash[Parentid] == null || hash[Parentid].ToString() == "close" || Sta == "1")
                {
                    if (hash.Contains(Parentid))
                    {
                        hash[Parentid] = "open";
                    }
                    else
                    {
                        hash.Add(Parentid, "open");
                    }
                    string json = "[";
                    foreach (DataRow dr in dtTrunk.Rows)
                    {

                        DataTable dtcount;
                        dtcount = bll.GetList("ChildCount", Utils.getOneParams(dr["ID"].ToString()));
                        json += "{Name:'" + dr["Name"].ToString() + "',ID:" + dr["ID"].ToString() + ",IsValid:'" + dr["Isvalid"].ToString() + "'";
                        foreach (DataRow dow in dtcount.Rows)
                        {
                            json += ",Num:" + dow["Num"].ToString() + "";
                        }
                        json += "},";
                    }
                    json = json.Substring(0, json.LastIndexOf(",")) + "]";
                    Response.Write(json);

                }
                else
                {
                    hash[Parentid] = "close";
                    Response.Write("{1:1}");
                    //Response.Write(hash[Parentid]);
                }
            }
        }
    }
}
