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
using KingTop.Common;

namespace KingTop.WEB.SysAdmin.SysManage
{
    public partial class shopset : KingTop.Web.Admin.AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataInit();
            }
        }

        private void DataInit()
        {
            string xmlPath = Server.MapPath("/" + SiteDir + "/config/ShopSet.config");
            this.radIsCartShowIntegral1.Checked = Utils.XmlRead(xmlPath, "ShopConfig/IsCartShowIntegral", "")=="0"?true:false;
            this.radIsCartShowProperty1.Checked = Utils.XmlRead(xmlPath, "ShopConfig/IsCartShowProperty", "") == "0" ? true : false;
            this.radIsShowNo1.Checked = Utils.XmlRead(xmlPath, "ShopConfig/IsCartShowNo", "") == "0" ? true : false;
            switch (Utils.XmlRead(xmlPath, "ShopConfig/CartShowGoodsStyle", ""))
            {
                case "0":
                    this.radCartShowGoodsStyle0.Checked=true;
                    break;
                case "1":
                    this.radCartShowGoodsStyle1.Checked=true;
                    break;
            }
            this.txtGoodsDefaultImg.Text = Utils.XmlRead(xmlPath, "ShopConfig/GoodsDefaultImg", "");
            this.txtIntegralConversionRatio.Text=Utils.XmlRead(xmlPath, "ShopConfig/IntegralConversionRatio", "");
            this.txtIntegralPayRatio.Text=Utils.XmlRead(xmlPath, "ShopConfig/IntegralPayRatio", "");
            this.txtMarketRatio.Text=Utils.XmlRead(xmlPath, "ShopConfig/MarketRatio", "");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            if (IsHaveRightByOperCode("Edit"))
            {
                string xmlPath = Server.MapPath("/" + SiteDir + "/config/ShopSet.config");

                Utils.XmlUpdate(xmlPath, "ShopConfig/IsCartShowIntegral", "", Request.Form["radIsCartShowIntegral"]);
                Utils.XmlUpdate(xmlPath, "ShopConfig/IsCartShowProperty", "", Request.Form["radIsCartShowProperty"]);
                Utils.XmlUpdate(xmlPath, "ShopConfig/IsCartShowNo", "", Request.Form["radIsShowNo"]);
                Utils.XmlUpdate(xmlPath, "ShopConfig/CartShowGoodsStyle", "", Request.Form["radCartShowGoodsStyle"]);
                Utils.XmlUpdate(xmlPath, "ShopConfig/GoodsDefaultImg", "", Request.Form["txtGoodsDefaultImg"]);
                Utils.XmlUpdate(xmlPath, "ShopConfig/IntegralConversionRatio", "", Request.Form["txtIntegralConversionRatio"]);
                Utils.XmlUpdate(xmlPath, "ShopConfig/IntegralPayRatio", "", Request.Form["txtIntegralPayRatio"]);
                Utils.XmlUpdate(xmlPath, "ShopConfig/MarketRatio", "", Request.Form["txtMarketRatio"]);

                WriteLog("商城设置成功！", "", 2);
                Utils.RunJavaScript(this, "alert({msg:'商城设置成功!',title:'提示信息'})");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有修改商城设置的权限，请联系站点管理员！',title:'提示信息'})");
            }
        }
    }
}
