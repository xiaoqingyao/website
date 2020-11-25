using FTD.Unit;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OA.aspx{ 
 public partial class Index: Page
{
    public string _MenuObj = "[]";
    public string _UserName = string.Empty;
    public string _Department = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Buffer = true;
        Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
        Response.Expires = 0;
        Response.CacheControl = "no-cache";
        Response.AddHeader("Pragma", "No-Cache");

        if (!IsPostBack)
        {
            PublicMethod.CheckSession();
            if (Session["UserName"] == null) 
            {
                Response.Redirect("Login.aspx");
            }

            InitMenu();

            _UserName = Session["TrueName"].ToString().Replace("\r","").Replace("\n","");
            _Department = Session["Department"].ToString().Replace("\r", "").Replace("\n", "");
        }
    }


    protected void InitMenu()
    {
        DataSet dsMenus = FTD.DBUnit.DbHelperSQL.GetDataSet("select * from ERPTreeList order by PaiXuStr asc,ID asc");

        _MenuObj = GetChildMenu(dsMenus,0,0);
    }

    protected string GetChildMenu(DataSet dsMenus, int parentID,int level) 
    {
        DataRow[] drMenus = dsMenus.Tables[0].Select("ParentID="+parentID);
        string strMenuList = string.Empty;
        string[] colorList = new string[] { "#4ccfe1", "#fdc006", "#ef6191", "#fe8562", "#90a5fe", "#a0887e", "#4ccfe1", "#fe8562", "#98d055", "#fdc006", "#fe8562", "#4ccfe1", "#fdc006", "#ef6191", "#fe8562", "#90a5fe", "#a0887e", "#4ccfe1", "#fe8562", "#98d055", "#fdc006", "#fe8562" };
        int counter = 0;

        foreach (DataRow r in drMenus)
        {
            string strMenuSingle = string.Empty;
            string valueStr = r["ValueStr"].ToString();
            

            if (level == 0)
            {
                int menuID = int.Parse(r["ID"].ToString());
                string strChildMenus = GetChildMenu(dsMenus,menuID,1);

                strMenuSingle += "{";
                strMenuSingle += "firstMenuId: \"f"+r["ID"].ToString()+"\",";
                strMenuSingle += "firstMenuIcon: \"" + r["ParentClass"].ToString() + "\",";
                strMenuSingle += "firstMenuIconColor: \""+colorList[counter++]+"\",";//背景颜色的设定
                strMenuSingle += "firstMenuTitle: \""+r["TextStr"]+"\",";
                strMenuSingle += "secondMenu: "+ strChildMenus;
                if (strChildMenus.Length > 2)
                {
                    strMenuSingle += ",thirdMenu: " + strChildMenus;
                }
                strMenuSingle += "}";


                if (string.IsNullOrEmpty(r["NavigateUrlStr"].ToString()) == true)
                {
                    if (strChildMenus.Length == 2)
                    {
                        strMenuSingle = string.Empty;
                    }
                }
                else 
                {
                    if (PublicMethod.StrIFIn("|" + valueStr + "|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian")) == false)
                    {
                        strMenuSingle = string.Empty;
                    }
                }
            }
            else if (level == 1) 
            {
                int menuID = int.Parse(r["ID"].ToString());
                string strChildMenus = GetChildMenu(dsMenus, menuID, 2);

                strMenuSingle += "{";
                strMenuSingle += "secondMenuId: \"f" + r["ID"].ToString() + "\",";
                strMenuSingle += "secondMenuItem: \"" + r["TextStr"] + "\",";
                strMenuSingle += "secondMenuUrl: \"" + r["NavigateUrlStr"] + "\"";
                if (strChildMenus.Length > 2)
                {
                    strMenuSingle += ",thirdMenu: " + strChildMenus;
                }
                strMenuSingle += "}";


                if (string.IsNullOrEmpty(r["NavigateUrlStr"].ToString()) == true)
                {
                    if (strChildMenus.Length == 2)
                    {
                        strMenuSingle = string.Empty;
                    }
                }
                else
                {
                    if (PublicMethod.StrIFIn("|" + valueStr + "|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian")) == false)
                    {
                        strMenuSingle = string.Empty;
                    }
                }
            }
            else if (level == 2) 
            {
                
                int menuID = int.Parse(r["ID"].ToString());

                strMenuSingle += "{";
                strMenuSingle += "thirdMenuId: \"f" + r["ID"].ToString() + "\",";
                strMenuSingle += "thirdMenuUrl: \"" + r["NavigateUrlStr"].ToString() + "\",";
                strMenuSingle += "thirdMenuItem: \"" + r["TextStr"] + "\"";
                strMenuSingle += "}";

                if (PublicMethod.StrIFIn("|" + valueStr + "|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian")) == false)
                {
                    strMenuSingle = string.Empty;
                }
            }


            if (string.IsNullOrEmpty(strMenuSingle) == false) 
            { 
                strMenuList += (string.IsNullOrEmpty(strMenuList) == true ? "" : ",") + strMenuSingle;
            }
        }

        return "[" + strMenuList + "]";
    }
}}