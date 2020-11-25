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

public partial class DocFile_TiKuShiJuanView : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPTiKuShiJuan Model = new ZWL.BLL.ERPTiKuShiJuan();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblShiJuanTitle.Text=Model.ShiJuanTitle.ToString();
			this.lblIFSuiJiChuTi.Text=Model.IFSuiJiChuTi.ToString();
			this.lblFenLeiShunXu.Text=Model.FenLeiShunXu.ToString();
			this.lblKaoShiXianShi.Text=Model.KaoShiXianShi.ToString();

			//this.lblPanDuanTiList.Text=Model.PanDuanTiList.ToString();
            //this.lblDanXuanTiList.Text = Model.DanXuanTiList.ToString();
            //this.lblDuoXuanTiList.Text = Model.DuoXuanTiList.ToString();
            //this.lblTianKongTiList.Text = Model.TianKongTiList.ToString();
            //this.lblJianDaTiList.Text = Model.JianDaTiList.ToString();

            if (Model.IFSuiJiChuTi.ToString() == "否")
            {
                string[] T1 = Model.PanDuanTiList.ToString().Split(',');
                int TLInt1 = T1.Length;
                if (T1.Length == 1 && T1[0].Trim().Length == 0)
                {
                    TLInt1 = 0;
                }
                Decimal FenShu1 = TLInt1 * Decimal.Parse(Model.PanDuanFenShu.ToString());
                this.lblPanDuanTiList.Text = "共&nbsp;" + TLInt1.ToString() + "&nbsp;题，每题&nbsp;" + Model.PanDuanFenShu.ToString() + "&nbsp;分，合计&nbsp;" + FenShu1 + "&nbsp;分。" + GetShiTiList(Model.PanDuanTiList.ToString());

                string[] T2 = Model.DanXuanTiList.ToString().Split(',');
                int TLInt2 = T2.Length;
                if (T2.Length == 1 && T2[0].Trim().Length == 0)
                {
                    TLInt2 = 0;
                }
                Decimal FenShu2 = TLInt2 * Decimal.Parse(Model.DanXuanFenShu.ToString());
                this.lblDanXuanTiList.Text = "共&nbsp;" + TLInt2.ToString() + "&nbsp;题，每题&nbsp;" + Model.DanXuanFenShu.ToString() + "&nbsp;分，合计&nbsp;" + FenShu2 + "&nbsp;分。" + GetShiTiList(Model.DanXuanTiList.ToString());


                string[] T3 = Model.DuoXuanTiList.ToString().Split(',');
                int TLInt3 = T3.Length;
                if (T3.Length == 1 && T3[0].Trim().Length == 0)
                {
                    TLInt3 = 0;
                }
                Decimal FenShu3 = TLInt3 * Decimal.Parse(Model.DuoXuanFenShu.ToString());
                this.lblDuoXuanTiList.Text = "共&nbsp;" + TLInt3.ToString() + "&nbsp;题，每题&nbsp;" + Model.DuoXuanFenShu.ToString() + "&nbsp;分，合计&nbsp;" + FenShu3 + "&nbsp;分。" + GetShiTiList(Model.DuoXuanTiList.ToString());


                string[] T4 = Model.TianKongTiList.ToString().Split(',');
                int TLInt4 = T4.Length;
                if (T4.Length == 1 && T4[0].Trim().Length == 0)
                {
                    TLInt4 = 0;
                }
                Decimal FenShu4 = TLInt4 * Decimal.Parse(Model.TianKongFenShu.ToString());
                this.lblTianKongTiList.Text = "共&nbsp;" + TLInt4.ToString() + "&nbsp;题，每题&nbsp;" + Model.TianKongFenShu.ToString() + "&nbsp;分，合计&nbsp;" + FenShu4 + "&nbsp;分。" + GetShiTiList(Model.TianKongTiList.ToString());


                string[] T5 = Model.JianDaTiList.ToString().Split(',');
                int TLInt5 = T5.Length;
                if (T5.Length == 1 && T5[0].Trim().Length == 0)
                {
                    TLInt5 = 0;
                }
                Decimal FenShu5 = TLInt5 * Decimal.Parse(Model.JianDaFenShu.ToString());
                this.lblJianDaTiList.Text = "共&nbsp;" + TLInt5.ToString() + "&nbsp;题，每题&nbsp;" + Model.JianDaFenShu.ToString() + "&nbsp;分，合计&nbsp;" + FenShu5 + "&nbsp;分。" + GetShiTiList(Model.JianDaTiList.ToString());
            }
            else
            {
                DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKuShiJuanSet where ShiJuanID=" + Request.QueryString["ID"].ToString());
                if (MYDT.Tables[0].Rows.Count > 0)
                {
                    this.lblPanDuanTiList.Text = "共&nbsp;" + MYDT.Tables[0].Rows[0]["PanDuanNum"].ToString() + "&nbsp;题，每题&nbsp;" + Model.PanDuanFenShu.ToString() + "&nbsp;分，合计&nbsp;" + (Decimal.Parse(MYDT.Tables[0].Rows[0]["PanDuanNum"].ToString()) * Decimal.Parse(Model.PanDuanFenShu.ToString())).ToString() + "&nbsp;分。";
                    this.lblDanXuanTiList.Text = "共&nbsp;" + MYDT.Tables[0].Rows[0]["DanXuanNum"].ToString() + "&nbsp;题，每题&nbsp;" + Model.DanXuanFenShu.ToString() + "&nbsp;分，合计&nbsp;" + (Decimal.Parse(MYDT.Tables[0].Rows[0]["DanXuanNum"].ToString()) * Decimal.Parse(Model.DanXuanFenShu.ToString())).ToString() + "&nbsp;分。";
                    this.lblDuoXuanTiList.Text = "共&nbsp;" + MYDT.Tables[0].Rows[0]["DuoXuanNum"].ToString() + "&nbsp;题，每题&nbsp;" + Model.DuoXuanFenShu.ToString() + "&nbsp;分，合计&nbsp;" + (Decimal.Parse(MYDT.Tables[0].Rows[0]["DuoXuanNum"].ToString()) * Decimal.Parse(Model.DuoXuanFenShu.ToString())).ToString() + "&nbsp;分。";
                    this.lblTianKongTiList.Text = "共&nbsp;" + MYDT.Tables[0].Rows[0]["TianKongNum"].ToString() + "&nbsp;题，每题&nbsp;" + Model.TianKongFenShu.ToString() + "&nbsp;分，合计&nbsp;" + (Decimal.Parse(MYDT.Tables[0].Rows[0]["TianKongNum"].ToString()) * Decimal.Parse(Model.TianKongFenShu.ToString())).ToString() + "&nbsp;分。";
                    this.lblJianDaTiList.Text = "共&nbsp;" + MYDT.Tables[0].Rows[0]["JianDaNum"].ToString() + "&nbsp;题，每题&nbsp;" + Model.JianDaFenShu.ToString() + "&nbsp;分，合计&nbsp;" + (Decimal.Parse(MYDT.Tables[0].Rows[0]["JianDaNum"].ToString()) * Decimal.Parse(Model.JianDaFenShu.ToString())).ToString() + "&nbsp;分。";
                }
            }

			this.lblPanDuanFenShu.Text=Model.PanDuanFenShu.ToString();
			this.lblDanXuanFenShu.Text=Model.DanXuanFenShu.ToString();
			this.lblDuoXuanFenShu.Text=Model.DuoXuanFenShu.ToString();
			this.lblTianKongFenShu.Text=Model.TianKongFenShu.ToString();
			this.lblJianDaFenShu.Text=Model.JianDaFenShu.ToString();
			this.lblBackInfo.Text=Model.BackInfo.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			
			//写系统日志
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看试卷管理信息(" + this.lblShiJuanTitle.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}

    public string GetShiTiList(string IDList)
    {
        string ReturnStr = "";
        //将题目以及答案列出
        DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + IDList.Replace(",", "','") + "')");
        for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
        {
            int TempNum = i + 1;
            ReturnStr = ReturnStr +  "<br>"+TempNum.ToString() + "：" + MYDT.Tables[0].Rows[i]["TitleStr"].ToString();
        }

        return ReturnStr;
    }
}
