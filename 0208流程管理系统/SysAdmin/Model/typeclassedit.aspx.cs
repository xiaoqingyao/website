using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AllPower.BLL.SysManage;

namespace AllPower.WEB.SysAdmin.Model
{
    public partial class typeclassedit : System.Web.UI.Page
    {
        public string MenuID = string.Empty;
        public string action = string.Empty;
        public string typeid = string.Empty;
        public string IsParent = string.Empty;
        public string typeparent = string.Empty;

        AllPower.Model.SelectParams modsel = new AllPower.Model.SelectParams();
        AllPower.BLL.Types blltype = new AllPower.BLL.Types();

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
                    AllPower.BLL.Types bllpt = new AllPower.BLL.Types();
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


            AllPower.Model.Types modpt = new AllPower.Model.Types();
            AllPower.BLL.Types bllpt = new AllPower.BLL.Types();
           
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

                        typeids1 = AllPower.Common.Tools.SubStr(dt.Rows[0]["TypeId"].ToString(), dt.Rows[0]["TypeId"].ToString().Length - 3, "");    //截取去掉最后三位数的数字的字符串
                        //int TypeLast3num = Convert.ToInt32(dt.Rows[0]["TypeId"].ToString().Replace(AllPower.Common.Tools.SubStr(dt.Rows[0]["TypeId"].ToString(), dt.Rows[0]["TypeId"].ToString().Length - 3, ""), "").Replace("0", "")) + 1;    // 1 获取最后三位数   2 软换为int类型再加一  
                        int TypeLast3num = Convert.ToInt32(dt.Rows[0]["TypeId"].ToString().Replace(AllPower.Common.Tools.SubStr(dt.Rows[0]["TypeId"].ToString(), dt.Rows[0]["TypeId"].ToString().Length - 3, ""), "")) + 1;    // 1 获取最后三位数   2 软换为int类型再加一    

                        #region  对最后三位数进行处理(加上0，确保计算后的数是由三个数字组成 例如 "001")
                        string TypeLast3numString = "";
                        if (TypeLast3num.ToString().Length==1)
                        {
                            TypeLast3numString = "00" + TypeLast3num;
                        }
                        else if (TypeLast3num.ToString().Length==2)
                        {
                            TypeLast3numString = "0" + TypeLast3num;
                        }
                        else
                        {
                            TypeLast3numString = TypeLast3num.ToString();
                        }
                        #endregion

                        typeids1 = typeids1 + TypeLast3numString;     //最后把这两组字符串组合起来

                        //typeids1 = Convert.ToString(Convert.ToDouble(dt.Rows[0]["TypeId"].ToString()) + 1);
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
        protected void btnDel_Click(object sender, EventArgs e)
        {

            AllPower.BLL.Types bllpt = new AllPower.BLL.Types();

            string result = bllpt.TypesSet("Del", "", typeid);
            if (result == "1")
            {
                Response.Redirect("typeclasslist.aspx?NodeCode=" + MenuID + "");
            }
            Response.Redirect("typeclasslist.aspx?NodeCode=" + MenuID + "");


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
