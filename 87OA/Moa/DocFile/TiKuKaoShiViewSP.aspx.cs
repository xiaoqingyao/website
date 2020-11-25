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

public partial class DocFile_TiKuKaoShiViewSP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPTiKuKaoShi Modela = new ZWL.BLL.ERPTiKuKaoShi();
            Modela.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.lblUserName.Text = Modela.UserName.ToString();
            this.lblTimeStr.Text = Modela.TimeStr.ToString();
            this.lblShiJuanName.Text = Modela.ShiJuanName.ToString();


            //读取试卷信息
            ZWL.BLL.ERPTiKuShiJuan Model = new ZWL.BLL.ERPTiKuShiJuan();
            Model.GetModel(int.Parse(Modela.ShiJuanID.ToString()));
            string[] FenLeiSunXu = Model.FenLeiShunXu.Split('|');
            for (int j = 0; j < FenLeiSunXu.Length; j++)
            {
                string DaBiaoTi = "一";
                if (j == 0)
                {
                    DaBiaoTi = "一";
                }
                else if (j == 1)
                {
                    DaBiaoTi = "二";
                }
                else if (j == 2)
                {
                    DaBiaoTi = "三";
                }
                else if (j == 3)
                {
                    DaBiaoTi = "四";
                }
                else if (j == 4)
                {
                    DaBiaoTi = "五";
                }

                //绑定当前题目已有的题目
                string TiMuIDList = "0";
                if (FenLeiSunXu[j].ToString() == "简答题")
                {
                    TiMuIDList = ZWL.DBUtility.DbHelperSQL.GetStringList("select TiMuID from ERPTiKuKaoShiJieGuo where TiMuID in (select ID from ERPTiKu where FenLeiStr='简答题') and  KaoShiID="+Request.QueryString["ID"].ToString()).Replace('|',',');
                    this.Label2.Text = TiMuIDList;

                    if (TiMuIDList.Trim().Length > 0 && TiMuIDList.Trim() != "0")
                    {
                        this.Label1.Text = this.Label1.Text + DaBiaoTi + "、" + FenLeiSunXu[j].ToString() + "（每题" + Model.JianDaFenShu.ToString() + "分，共" + TiMuIDList.Split(',').Length.ToString() + "题，合计" + (Model.JianDaFenShu * TiMuIDList.Split(',').Length).ToString() + "分）<hr>";

                        DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                        for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                        {
                            int TempNum = i + 1;
                            this.Label1.Text = this.Label1.Text + TempNum.ToString() + "：" + MYDT.Tables[0].Rows[i]["TitleStr"].ToString() + "" + JieDaStr2(MYDT.Tables[0].Rows[i]["ID"].ToString(), Request.QueryString["ID"].ToString()) + "<br>";
                            this.Label1.Text = this.Label1.Text + "<P>";
                        }
                    }
                    else
                    {
                        this.Label1.Text = "该试卷无简答题，无需人工阅卷！";
                    }
                }
            }
        }
    }

    public string JieDaStr2(string TiMuIDStr, string KaoShiIDStr)
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

        return "<font color=\"#0000FF\"><br>&nbsp;&nbsp;&nbsp;本题标准答案：" + DaAnStr + "<br>&nbsp;&nbsp;&nbsp;用户答案：" + UserDaAn + "<br>&nbsp;&nbsp;&nbsp;得分：<input onkeyup=\"if(isNaN(value))execCommand('undo')\" onafterpaste=\"if(isNaN(value))execCommand('undo')\" type=\"text\" name=\"text-" + TiMuIDStr + "\" value=\"" + DeFenStr.ToString() + "\"></font>";
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string[] MYJianDa = this.Label2.Text.Split(',');
        for (int i = 0; i < MYJianDa.Length; i++)
        {
            string DeFenShu = "";
            try
            {
                DeFenShu = Request.Form["text-" + MYJianDa[i].ToString()].ToString().Trim();
            }
            catch { }

            if (DeFenShu == "")
            {
                DeFenShu = null;
            }
            ZWL.DBUtility.DbHelperSQL.ExecuteSQL("update ERPTiKuKaoShiJieGuo set DeFen=" + DeFenShu + " where KaoShiID="+Request.QueryString["ID"].ToString()+" and TiMuID="+MYJianDa[i].ToString());
        }

        ZWL.Common.MessageBox.ShowAndRedirect(this, "在线考试人工阅卷保存成功！", "TiKuKaoShiOK.aspx");

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户在线人工阅卷(" + this.lblUserName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
    }
}
