using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using KingTop.BLL.SysManage;

namespace KingTop.WEB.SysAdmin.Model
{
    public partial class typeclassedit : System.Web.UI.Page
    {
        public string MenuID = string.Empty;
        public string action = string.Empty;
        public string typeid = string.Empty;
        public string IsParent = string.Empty;
        public string typeparent = string.Empty;

        KingTop.Model.SelectParams modsel = new KingTop.Model.SelectParams();
        KingTop.BLL.Types blltype = new KingTop.BLL.Types();

        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            MenuID = Request.QueryString["menuid"];
            action = Request.QueryString["Action"];
            typeid = Request.QueryString["typeid"];
              IsParent = Request.QueryString["IsParent"];
              typeparent = Request.QueryString["typeparent"];
            //Action=New&typeid=100&menuid=105015002&IsParent=1

            if (!Page.IsPostBack)
            {





                if (action == "New")//新增页面样式设定
                {
                    this.btnUpdate.Text = "新 增";
                }

                if (action == "Edit")//更新页面样式设定
                {
                    KingTop.BLL.Types bllpt = new KingTop.BLL.Types();
                    modsel.S1 = typeid;
                    DataTable dt = bllpt.GetList("ONE", modsel);
                    if (dt.Rows.Count > 0)
                    {
                        txtName.Text = dt.Rows[0]["typename"].ToString();
                        txtOrd.Value = dt.Rows[0]["orders"].ToString();
                        txtDigest.Text = dt.Rows[0]["Digest"].ToString();
                        txtCurrentImg.Text = dt.Rows[0]["TypeExpandChar1"].ToString();


                        if (dt.Rows[0]["TypeExpandInt"].ToString() == "1")
                            RadioButton1.Checked = true;


                        if (dt.Rows[0]["IsPub"].ToString() == "1")
                            RadioButton2.Checked = true;


                    }
                }

            }
        }
        #endregion

        #region 显示编辑页面
        protected void lbClose_Click(object sender, EventArgs e)
        {
           
        }
        #endregion

        #region 数据提交
        protected void btnUpdate_Click(object sender, EventArgs e)
        {


            KingTop.Model.Types modpt = new KingTop.Model.Types();
            KingTop.BLL.Types bllpt = new KingTop.BLL.Types();
           
            string typename = Request.Form["txtName"];
            string typeorders = Request.Form["txtOrd"];
            string typecon = Request.Form["txtDigest"];



            
           
            modpt.TypeName = typename;
            modpt.Orders = Convert.ToInt32(typeorders);
            modpt.AddDate = DateTime.Now;
            modpt.MenuID = MenuID;
            modpt.TypeExpandChar1 = txtCurrentImg.Text;
          
            modpt.Digest = typecon;
            if (RadioButton1.Checked)
                modpt.TypeExpandInt = 1;
            else
                modpt.TypeExpandInt = 0;

            if (RadioButton2.Checked)
                modpt.IsPub = 1;
            else
                modpt.IsPub = 0;


            if (action == "New")//新增页面样式设定
            {
                modsel.S1 = typeid;
                modpt.TypeParent = typeid;
                DataTable dt = bllpt.GetList("MAXID", modsel);
                string typeids1 = "";
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["TypeId"].ToString() == "")
                    {
                        typeids1 = typeid + "001";
                    }
                    else
                    {
                        typeids1 = Convert.ToString(Convert.ToInt32(dt.Rows[0]["TypeId"].ToString()) + 1);
                    }
                }
                else
                {
                    typeids1 =typeid+ "001";
                }
               //typeids = typeids1;
                modpt.TypeId = typeids1;
            
                string result = bllpt.Save("NEW", modpt);
                if (result == "1")
                {
                    Response.Redirect("typeclasslist.aspx?NodeCode=" + MenuID + "");
                }
                Response.Redirect("typeclasslist.aspx?NodeCode=" + MenuID + "");
            }

            if (action == "Edit")//更新页面样式设定
            {
                modpt.TypeId = typeid;

                modpt.TypeParent = typeparent;
                string result = bllpt.Save("EDIT", modpt);
                if (result == "1")
                {
                    Response.Redirect("typeclasslist.aspx?NodeCode=" + MenuID + "");
                }
                Response.Redirect("typeclasslist.aspx?NodeCode=" + MenuID + "");
            }


        }
        #endregion

        #region 根据NodeCode得到当前位置导航
        public void GetPageNav(string nodeCode)
        {
            if (string.IsNullOrEmpty(nodeCode))
                return;

            ModuleNode nodeObj = new ModuleNode();
            int i = 0;
            string parentCode = string.Empty;
            DataTable dt = nodeObj.GetModeNodeFromCache();
            DataRow[] dr;
            while (i != nodeCode.Length)
            {
                i = i + 3;
                parentCode = nodeCode.Substring(0, i);
                dr = dt.Select("NodeCode='" + parentCode + "'");
                if (dr.Length > 0)
                {
                    if (i != 3)
                    {
                        Response.Write(" &gt; ");
                    }
                    Response.Write("<a href=\"#\">" + dr[0]["NodeName"].ToString() + "</a>");
                }
            }
        }
        #endregion



    }
}
