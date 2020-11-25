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

public partial class Work_TongXunLuView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            //绑定页面数据
            ZWL.BLL.ERPTongXunLu Model = new ZWL.BLL.ERPTongXunLu();
            Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label2.Text = Model.IfShare;
            this.Label1.Text = Model.FenZu;
            this.Label3.Text = Model.NameStr;
            this.Label4.Text = Model.Sex;
            this.Label5.Text = Model.BirthDay;
            this.Label6.Text = Model.NiCheng;
            this.Label7.Text = Model.ZhiWu;
            this.Label8.Text = Model.PeiOu;
            this.Label9.Text = Model.ZiNv;
            this.Label10.Text = Model.DanWeiMingCheng;
            this.Label11.Text = Model.DanWeiDiZhi;
            this.Label12.Text = Model.DanWeiYouBian;
            this.Label13.Text = Model.DanWieDianHua;
            this.Label14.Text = Model.DanWeiChuanZhen;
            this.Label15.Text = Model.JiaTingZhuZhi;
            this.Label16.Text = Model.JiaTingYouBian;
            this.Label17.Text = Model.JiaTingDianHua;
            this.Label18.Text = Model.ShouJi;
            this.Label19.Text = Model.XiaoLingTong;
            this.Label20.Text = Model.Email;
            this.Label21.Text = Model.QQ;
            this.Label22.Text = Model.Msn;
            this.Label23.Text = Model.BackInfo;
        }
    }
}
