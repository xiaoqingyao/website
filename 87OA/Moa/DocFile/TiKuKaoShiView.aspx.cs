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

public partial class DocFile_TiKuKaoShiView : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPTiKuKaoShi Modela = new ZWL.BLL.ERPTiKuKaoShi();
			Modela.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblUserName.Text=Modela.UserName.ToString();
			this.lblTimeStr.Text=Modela.TimeStr.ToString();
			this.lblShiJuanName.Text=Modela.ShiJuanName.ToString();


            //��ȡ�Ծ���Ϣ
            ZWL.BLL.ERPTiKuShiJuan Model = new ZWL.BLL.ERPTiKuShiJuan();
            Model.GetModel(int.Parse(Modela.ShiJuanID.ToString()));
            string[] FenLeiSunXu = Model.FenLeiShunXu.Split('|');
            for (int j = 0; j < FenLeiSunXu.Length; j++)
            {
                string DaBiaoTi = "һ";
                if (j == 0)
                {
                    DaBiaoTi = "һ";
                }
                else if (j == 1)
                {
                    DaBiaoTi = "��";
                }
                else if (j == 2)
                {
                    DaBiaoTi = "��";
                }
                else if (j == 3)
                {
                    DaBiaoTi = "��";
                }
                else if (j == 4)
                {
                    DaBiaoTi = "��";
                }

                //�󶨵�ǰ��Ŀ���е���Ŀ
                string TiMuIDList = "0";
                if (FenLeiSunXu[j].ToString() == "�ж���")
                {
                    TiMuIDList = ZWL.DBUtility.DbHelperSQL.GetStringList("select TiMuID from ERPTiKuKaoShiJieGuo where TiMuID in (select ID from ERPTiKu where FenLeiStr='" + FenLeiSunXu[j].ToString() + "') and  KaoShiID=" + Request.QueryString["ID"].ToString()).Replace('|', ',');
                    if (TiMuIDList.Trim().Length > 0 && TiMuIDList.Trim() != "0")
                    {
                        //һ��	�ж��⣨ÿ��1�֣���20�֣�
                        this.Label1.Text = this.Label1.Text + DaBiaoTi + "��" + FenLeiSunXu[j].ToString() + "��ÿ��" + Model.PanDuanFenShu.ToString() + "�֣���" + TiMuIDList.Split(',').Length.ToString() + "�⣬�ϼ�" + (Model.PanDuanFenShu * TiMuIDList.Split(',').Length).ToString() + "�֣�<hr>";

                        DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                        for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                        {
                            int TempNum = i + 1;
                            this.Label1.Text = this.Label1.Text + TempNum.ToString() + "��" + MYDT.Tables[0].Rows[i]["TitleStr"].ToString() + "" + JieDaStr(MYDT.Tables[0].Rows[i]["ID"].ToString(), Request.QueryString["ID"].ToString()) + "<br>";

                            if (MYDT.Tables[0].Rows[i]["ItemsA"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"A\"> A��" + MYDT.Tables[0].Rows[i]["ItemsA"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsB"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"B\"> B��" + MYDT.Tables[0].Rows[i]["ItemsB"].ToString() + "<br>";
                            }
                            this.Label1.Text = this.Label1.Text + "<P>";
                        }
                    }
                }
                else if (FenLeiSunXu[j].ToString() == "����ѡ����")
                {
                    TiMuIDList = ZWL.DBUtility.DbHelperSQL.GetStringList("select TiMuID from ERPTiKuKaoShiJieGuo where TiMuID in (select ID from ERPTiKu where FenLeiStr='" + FenLeiSunXu[j].ToString() + "') and  KaoShiID=" + Request.QueryString["ID"].ToString()).Replace('|', ',');
                    if (TiMuIDList.Trim().Length > 0 && TiMuIDList.Trim() != "0")
                    {

                        this.Label1.Text = this.Label1.Text + DaBiaoTi + "��" + FenLeiSunXu[j].ToString() + "��ÿ��" + Model.DanXuanFenShu.ToString() + "�֣���" + TiMuIDList.Split(',').Length.ToString() + "�⣬�ϼ�" + (Model.DanXuanFenShu * TiMuIDList.Split(',').Length).ToString() + "�֣�<hr>";

                        DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                        for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                        {
                            int TempNum = i + 1;
                            this.Label1.Text = this.Label1.Text + TempNum.ToString() + "��" + MYDT.Tables[0].Rows[i]["TitleStr"].ToString() + "" + JieDaStr(MYDT.Tables[0].Rows[i]["ID"].ToString(), Request.QueryString["ID"].ToString()) + "<br>";

                            if (MYDT.Tables[0].Rows[i]["ItemsA"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"A\"> A��" + MYDT.Tables[0].Rows[i]["ItemsA"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsB"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"B\"> B��" + MYDT.Tables[0].Rows[i]["ItemsB"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsC"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"C\"> C��" + MYDT.Tables[0].Rows[i]["ItemsC"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsD"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"D\"> D��" + MYDT.Tables[0].Rows[i]["ItemsD"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsE"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"E\"> E��" + MYDT.Tables[0].Rows[i]["ItemsE"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsF"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"F\"> F��" + MYDT.Tables[0].Rows[i]["ItemsF"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsG"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"G\"> G��" + MYDT.Tables[0].Rows[i]["ItemsG"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsH"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"H\"> H��" + MYDT.Tables[0].Rows[i]["ItemsH"].ToString() + "<br>";
                            }
                            this.Label1.Text = this.Label1.Text + "<P>";
                        }
                    }
                }
                else if (FenLeiSunXu[j].ToString() == "����ѡ����")
                {
                    TiMuIDList = ZWL.DBUtility.DbHelperSQL.GetStringList("select TiMuID from ERPTiKuKaoShiJieGuo where TiMuID in (select ID from ERPTiKu where FenLeiStr='" + FenLeiSunXu[j].ToString() + "') and  KaoShiID=" + Request.QueryString["ID"].ToString()).Replace('|', ',');
                    if (TiMuIDList.Trim().Length > 0 && TiMuIDList.Trim() != "0")
                    {
                        this.Label1.Text = this.Label1.Text + DaBiaoTi + "��" + FenLeiSunXu[j].ToString() + "��ÿ��" + Model.DuoXuanFenShu.ToString() + "�֣���" + TiMuIDList.Split(',').Length.ToString() + "�⣬�ϼ�" + (Model.DuoXuanFenShu * TiMuIDList.Split(',').Length).ToString() + "�֣�<hr>";

                        DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                        for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                        {
                            int TempNum = i + 1;
                            this.Label1.Text = this.Label1.Text + TempNum.ToString() + "��" + MYDT.Tables[0].Rows[i]["TitleStr"].ToString() + "" + JieDaStr(MYDT.Tables[0].Rows[i]["ID"].ToString(), Request.QueryString["ID"].ToString()) + "<br>";

                            if (MYDT.Tables[0].Rows[i]["ItemsA"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-A\" value=\"A\"> A��" + MYDT.Tables[0].Rows[i]["ItemsA"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsB"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-B\" value=\"B\"> B��" + MYDT.Tables[0].Rows[i]["ItemsB"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsC"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-C\" value=\"C\"> C��" + MYDT.Tables[0].Rows[i]["ItemsC"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsD"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-D\" value=\"D\"> D��" + MYDT.Tables[0].Rows[i]["ItemsD"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsE"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-E\" value=\"E\"> E��" + MYDT.Tables[0].Rows[i]["ItemsE"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsF"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-F\" value=\"F\"> F��" + MYDT.Tables[0].Rows[i]["ItemsF"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsG"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-G\" value=\"G\"> G��" + MYDT.Tables[0].Rows[i]["ItemsG"].ToString() + "<br>";
                            }
                            if (MYDT.Tables[0].Rows[i]["ItemsH"].ToString().Trim().Length > 0)
                            {
                                this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-H\" value=\"H\"> H��" + MYDT.Tables[0].Rows[i]["ItemsH"].ToString() + "<br>";
                            }
                            this.Label1.Text = this.Label1.Text + "<P>";
                        }
                    }
                }
                else if (FenLeiSunXu[j].ToString() == "�����")
                {
                    TiMuIDList = ZWL.DBUtility.DbHelperSQL.GetStringList("select TiMuID from ERPTiKuKaoShiJieGuo where TiMuID in (select ID from ERPTiKu where FenLeiStr='" + FenLeiSunXu[j].ToString() + "') and  KaoShiID=" + Request.QueryString["ID"].ToString()).Replace('|', ',');
                    if (TiMuIDList.Trim().Length > 0 && TiMuIDList.Trim() != "0")
                    {
                        this.Label1.Text = this.Label1.Text + DaBiaoTi + "��" + FenLeiSunXu[j].ToString() + "��ÿ��" + Model.TianKongFenShu.ToString() + "�֣���" + TiMuIDList.Split(',').Length.ToString() + "�⣬�ϼ�" + (Model.TianKongFenShu * TiMuIDList.Split(',').Length).ToString() + "�֣�<hr>";

                        DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                        for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                        {
                            int TempNum = i + 1;
                            this.Label1.Text = this.Label1.Text + TempNum.ToString() + "��" + MYDT.Tables[0].Rows[i]["TitleStr"].ToString() + "" + JieDaStr2(MYDT.Tables[0].Rows[i]["ID"].ToString(), Request.QueryString["ID"].ToString()) + "<br>";
                            this.Label1.Text = this.Label1.Text + "<P>";
                        }
                    }
                }
                else if (FenLeiSunXu[j].ToString() == "�����")
                {
                    TiMuIDList = ZWL.DBUtility.DbHelperSQL.GetStringList("select TiMuID from ERPTiKuKaoShiJieGuo where TiMuID in (select ID from ERPTiKu where FenLeiStr='" + FenLeiSunXu[j].ToString() + "') and  KaoShiID=" + Request.QueryString["ID"].ToString()).Replace('|', ',');
                    if (TiMuIDList.Trim().Length > 0 && TiMuIDList.Trim() != "0")
                    {
                        this.Label1.Text = this.Label1.Text + DaBiaoTi + "��" + FenLeiSunXu[j].ToString() + "��ÿ��" + Model.JianDaFenShu.ToString() + "�֣���" + TiMuIDList.Split(',').Length.ToString() + "�⣬�ϼ�" + (Model.JianDaFenShu * TiMuIDList.Split(',').Length).ToString() + "�֣�<hr>";

                        DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                        for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                        {
                            int TempNum = i + 1;
                            this.Label1.Text = this.Label1.Text + TempNum.ToString() + "��" + MYDT.Tables[0].Rows[i]["TitleStr"].ToString() + "" + JieDaStr2(MYDT.Tables[0].Rows[i]["ID"].ToString(), Request.QueryString["ID"].ToString()) + "<br>";
                            this.Label1.Text = this.Label1.Text + "<P>";
                        }
                    }
                }
            }



			
			//дϵͳ��־
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "�û��鿴���߿�����Ϣ(" + this.lblUserName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}

    public string JieDaStr2(string TiMuIDStr,string KaoShiIDStr)
    {
        string DaAnStr = "";
        string UserDaAn = "";
        string DeFenStr = "";

        DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select top 1  * from ERPTiKuKaoShiJieGuo where KaoShiID=" + KaoShiIDStr + " and TiMuID=" + TiMuIDStr);
        if (MYDT.Tables[0].Rows.Count > 0)
        {
            DaAnStr = MYDT.Tables[0].Rows[0]["DaAn"].ToString();
            UserDaAn = MYDT.Tables[0].Rows[0]["UserDaAn"].ToString();
            DeFenStr = MYDT.Tables[0].Rows[0]["DeFen"].ToString();
        }

        return "<font color=\"#0000FF\"><br>&nbsp;&nbsp;&nbsp;�����׼�𰸣�" + DaAnStr + "<br>&nbsp;&nbsp;&nbsp;�û��𰸣�" + UserDaAn + "<br>&nbsp;&nbsp;&nbsp;�÷֣�" + DeFenStr.ToString()+"</font>";
    }

    public string JieDaStr(string TiMuIDStr, string KaoShiIDStr)
    {
        string DaAnStr = "";
        string UserDaAn = "";
        string DeFenStr = "";

        DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select top 1  * from ERPTiKuKaoShiJieGuo where KaoShiID=" + KaoShiIDStr + " and TiMuID=" + TiMuIDStr);
        if (MYDT.Tables[0].Rows.Count > 0)
        {
            DaAnStr = MYDT.Tables[0].Rows[0]["DaAn"].ToString();
            UserDaAn = MYDT.Tables[0].Rows[0]["UserDaAn"].ToString();
            DeFenStr = MYDT.Tables[0].Rows[0]["DeFen"].ToString();
        }

        return "<font color=\"#0000FF\"><br>&nbsp;&nbsp;&nbsp;�����׼�𰸣�" + DaAnStr + "&nbsp;&nbsp;&nbsp;�û��𰸣�" + UserDaAn + "&nbsp;&nbsp;&nbsp;�÷֣�" + DeFenStr.ToString() + "</font>";
    }
}
