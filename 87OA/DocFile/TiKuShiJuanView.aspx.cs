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

            if (Model.IFSuiJiChuTi.ToString() == "��")
            {
                string[] T1 = Model.PanDuanTiList.ToString().Split(',');
                int TLInt1 = T1.Length;
                if (T1.Length == 1 && T1[0].Trim().Length == 0)
                {
                    TLInt1 = 0;
                }
                Decimal FenShu1 = TLInt1 * Decimal.Parse(Model.PanDuanFenShu.ToString());
                this.lblPanDuanTiList.Text = "��&nbsp;" + TLInt1.ToString() + "&nbsp;�⣬ÿ��&nbsp;" + Model.PanDuanFenShu.ToString() + "&nbsp;�֣��ϼ�&nbsp;" + FenShu1 + "&nbsp;�֡�" + GetShiTiList(Model.PanDuanTiList.ToString());

                string[] T2 = Model.DanXuanTiList.ToString().Split(',');
                int TLInt2 = T2.Length;
                if (T2.Length == 1 && T2[0].Trim().Length == 0)
                {
                    TLInt2 = 0;
                }
                Decimal FenShu2 = TLInt2 * Decimal.Parse(Model.DanXuanFenShu.ToString());
                this.lblDanXuanTiList.Text = "��&nbsp;" + TLInt2.ToString() + "&nbsp;�⣬ÿ��&nbsp;" + Model.DanXuanFenShu.ToString() + "&nbsp;�֣��ϼ�&nbsp;" + FenShu2 + "&nbsp;�֡�" + GetShiTiList(Model.DanXuanTiList.ToString());


                string[] T3 = Model.DuoXuanTiList.ToString().Split(',');
                int TLInt3 = T3.Length;
                if (T3.Length == 1 && T3[0].Trim().Length == 0)
                {
                    TLInt3 = 0;
                }
                Decimal FenShu3 = TLInt3 * Decimal.Parse(Model.DuoXuanFenShu.ToString());
                this.lblDuoXuanTiList.Text = "��&nbsp;" + TLInt3.ToString() + "&nbsp;�⣬ÿ��&nbsp;" + Model.DuoXuanFenShu.ToString() + "&nbsp;�֣��ϼ�&nbsp;" + FenShu3 + "&nbsp;�֡�" + GetShiTiList(Model.DuoXuanTiList.ToString());


                string[] T4 = Model.TianKongTiList.ToString().Split(',');
                int TLInt4 = T4.Length;
                if (T4.Length == 1 && T4[0].Trim().Length == 0)
                {
                    TLInt4 = 0;
                }
                Decimal FenShu4 = TLInt4 * Decimal.Parse(Model.TianKongFenShu.ToString());
                this.lblTianKongTiList.Text = "��&nbsp;" + TLInt4.ToString() + "&nbsp;�⣬ÿ��&nbsp;" + Model.TianKongFenShu.ToString() + "&nbsp;�֣��ϼ�&nbsp;" + FenShu4 + "&nbsp;�֡�" + GetShiTiList(Model.TianKongTiList.ToString());


                string[] T5 = Model.JianDaTiList.ToString().Split(',');
                int TLInt5 = T5.Length;
                if (T5.Length == 1 && T5[0].Trim().Length == 0)
                {
                    TLInt5 = 0;
                }
                Decimal FenShu5 = TLInt5 * Decimal.Parse(Model.JianDaFenShu.ToString());
                this.lblJianDaTiList.Text = "��&nbsp;" + TLInt5.ToString() + "&nbsp;�⣬ÿ��&nbsp;" + Model.JianDaFenShu.ToString() + "&nbsp;�֣��ϼ�&nbsp;" + FenShu5 + "&nbsp;�֡�" + GetShiTiList(Model.JianDaTiList.ToString());
            }
            else
            {
                DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKuShiJuanSet where ShiJuanID=" + Request.QueryString["ID"].ToString());
                if (MYDT.Tables[0].Rows.Count > 0)
                {
                    this.lblPanDuanTiList.Text = "��&nbsp;" + MYDT.Tables[0].Rows[0]["PanDuanNum"].ToString() + "&nbsp;�⣬ÿ��&nbsp;" + Model.PanDuanFenShu.ToString() + "&nbsp;�֣��ϼ�&nbsp;" + (Decimal.Parse(MYDT.Tables[0].Rows[0]["PanDuanNum"].ToString()) * Decimal.Parse(Model.PanDuanFenShu.ToString())).ToString() + "&nbsp;�֡�";
                    this.lblDanXuanTiList.Text = "��&nbsp;" + MYDT.Tables[0].Rows[0]["DanXuanNum"].ToString() + "&nbsp;�⣬ÿ��&nbsp;" + Model.DanXuanFenShu.ToString() + "&nbsp;�֣��ϼ�&nbsp;" + (Decimal.Parse(MYDT.Tables[0].Rows[0]["DanXuanNum"].ToString()) * Decimal.Parse(Model.DanXuanFenShu.ToString())).ToString() + "&nbsp;�֡�";
                    this.lblDuoXuanTiList.Text = "��&nbsp;" + MYDT.Tables[0].Rows[0]["DuoXuanNum"].ToString() + "&nbsp;�⣬ÿ��&nbsp;" + Model.DuoXuanFenShu.ToString() + "&nbsp;�֣��ϼ�&nbsp;" + (Decimal.Parse(MYDT.Tables[0].Rows[0]["DuoXuanNum"].ToString()) * Decimal.Parse(Model.DuoXuanFenShu.ToString())).ToString() + "&nbsp;�֡�";
                    this.lblTianKongTiList.Text = "��&nbsp;" + MYDT.Tables[0].Rows[0]["TianKongNum"].ToString() + "&nbsp;�⣬ÿ��&nbsp;" + Model.TianKongFenShu.ToString() + "&nbsp;�֣��ϼ�&nbsp;" + (Decimal.Parse(MYDT.Tables[0].Rows[0]["TianKongNum"].ToString()) * Decimal.Parse(Model.TianKongFenShu.ToString())).ToString() + "&nbsp;�֡�";
                    this.lblJianDaTiList.Text = "��&nbsp;" + MYDT.Tables[0].Rows[0]["JianDaNum"].ToString() + "&nbsp;�⣬ÿ��&nbsp;" + Model.JianDaFenShu.ToString() + "&nbsp;�֣��ϼ�&nbsp;" + (Decimal.Parse(MYDT.Tables[0].Rows[0]["JianDaNum"].ToString()) * Decimal.Parse(Model.JianDaFenShu.ToString())).ToString() + "&nbsp;�֡�";
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
			
			//дϵͳ��־
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "�û��鿴�Ծ������Ϣ(" + this.lblShiJuanTitle.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}

    public string GetShiTiList(string IDList)
    {
        string ReturnStr = "";
        //����Ŀ�Լ����г�
        DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + IDList.Replace(",", "','") + "')");
        for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
        {
            int TempNum = i + 1;
            ReturnStr = ReturnStr +  "<br>"+TempNum.ToString() + "��" + MYDT.Tables[0].Rows[i]["TitleStr"].ToString();
        }

        return ReturnStr;
    }
}
