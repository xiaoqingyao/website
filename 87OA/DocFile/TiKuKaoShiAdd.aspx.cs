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

public partial class DocFile_TiKuKaoShiAdd : System.Web.UI.Page
{
    public int MaxTime = 90000000;//定义考试倒计时（秒）

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			//设置上传的附件为空
			 ZWL.Common.PublicMethod.SetSessionValue("WenJianList", "");

            //将试卷加载到下拉框中！！！！
             ZWL.DBUtility.DbHelperSQL.BindDropDownList("select * from ERPTiKuShiJuan order by ID desc", this.DropDownList1, "ShiJuanTitle", "ID");
		}
	}    
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        ZWL.BLL.ERPTiKuKaoShi Model0 = new ZWL.BLL.ERPTiKuKaoShi();
        Model0.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        Model0.TimeStr = DateTime.Now;
        Model0.ShiJuanName = this.DropDownList1.SelectedItem.Text;
        Model0.ShiJuanID = int.Parse(this.DropDownList1.SelectedValue);
        int MaxID=Model0.Add();

        this.Panel1.Visible = false;
        //读取试卷信息
        ZWL.BLL.ERPTiKuShiJuan Model = new ZWL.BLL.ERPTiKuShiJuan();
        Model.GetModel(int.Parse(this.DropDownList1.SelectedItem.Value.ToString()));
        MaxTime = int.Parse(Model.KaoShiXianShi.ToString()) * 60;//考试限时

        string[] FenLeiSunXu = Model.FenLeiShunXu.Split('|');
        for (int j = 0; j < FenLeiSunXu.Length; j++)
        {       
            //绑定当前题目已有的题目
            string TiMuIDList = "0";
            if (FenLeiSunXu[j].ToString() == "判断题")
            {
                TiMuIDList = this.Lab1.Text;                
                DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                {
                    ZWL.BLL.ERPTiKuKaoShiJieGuo Model1 = new ZWL.BLL.ERPTiKuKaoShiJieGuo();

                    Model1.KaoShiID = MaxID;
                    Model1.TiMuID =int.Parse(MYDT.Tables[0].Rows[i]["ID"].ToString());
                    Model1.DaAn = MYDT.Tables[0].Rows[i]["AnswerStr"].ToString();
                    string UserDaAnStr = "";
                    try
                    {
                        UserDaAnStr= Request.Form["rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString()].ToString();
                    }
                    catch { }
                    Model1.UserDaAn = UserDaAnStr;
                    if (UserDaAnStr == MYDT.Tables[0].Rows[i]["AnswerStr"].ToString())
                    {
                        Model1.DeFen = Model.PanDuanFenShu;
                    }
                    else
                    {
                        Model1.DeFen = 0;
                    }
                    Model1.Add();
                }
            }
            else if (FenLeiSunXu[j].ToString() == "单项选择题")
            {
                TiMuIDList = this.Lab2.Text;
                DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                {
                    ZWL.BLL.ERPTiKuKaoShiJieGuo Model1 = new ZWL.BLL.ERPTiKuKaoShiJieGuo();

                    Model1.KaoShiID = MaxID;
                    Model1.TiMuID = int.Parse(MYDT.Tables[0].Rows[i]["ID"].ToString());
                    Model1.DaAn = MYDT.Tables[0].Rows[i]["AnswerStr"].ToString();
                    string UserDaAnStr = "";
                    try
                    {
                        UserDaAnStr = Request.Form["rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString()].ToString();
                    }
                    catch { }
                    Model1.UserDaAn = UserDaAnStr;
                    if (UserDaAnStr == MYDT.Tables[0].Rows[i]["AnswerStr"].ToString())
                    {
                        Model1.DeFen = Model.DanXuanFenShu;
                    }
                    else
                    {
                        Model1.DeFen = 0;
                    }
                    Model1.Add();
                }
            }
            else if (FenLeiSunXu[j].ToString() == "多项选择题")
            {
                TiMuIDList = this.Lab3.Text;
                DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                {
                    ZWL.BLL.ERPTiKuKaoShiJieGuo Model1 = new ZWL.BLL.ERPTiKuKaoShiJieGuo();

                    Model1.KaoShiID = MaxID;
                    Model1.TiMuID = int.Parse(MYDT.Tables[0].Rows[i]["ID"].ToString());
                    Model1.DaAn = MYDT.Tables[0].Rows[i]["AnswerStr"].ToString();

                    string DangQianDaAnStr = "";
                    try
                    {
                        DangQianDaAnStr = DangQianDaAnStr + Request.Form["CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-A"].ToString();
                    }
                    catch { }
                    try
                    {
                        DangQianDaAnStr = DangQianDaAnStr + Request.Form["CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-B"].ToString();
                    }
                    catch { }
                    try
                    {
                        DangQianDaAnStr = DangQianDaAnStr + Request.Form["CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-C"].ToString();
                    }
                    catch { }
                    try
                    {
                        DangQianDaAnStr = DangQianDaAnStr + Request.Form["CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-D"].ToString();
                    }
                    catch { }
                    try
                    {
                        DangQianDaAnStr = DangQianDaAnStr + Request.Form["CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-E"].ToString();
                    }
                    catch { }
                    try
                    {
                        DangQianDaAnStr = DangQianDaAnStr + Request.Form["CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-F"].ToString();
                    }
                    catch { }
                    try
                    {
                        DangQianDaAnStr = DangQianDaAnStr + Request.Form["CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-G"].ToString();
                    }
                    catch { }
                    try
                    {
                        DangQianDaAnStr = DangQianDaAnStr + Request.Form["CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-H"].ToString();
                    }
                    catch { }


                    Model1.UserDaAn = DangQianDaAnStr;
                    if (DangQianDaAnStr == MYDT.Tables[0].Rows[i]["AnswerStr"].ToString())
                    {
                        Model1.DeFen = Model.DuoXuanFenShu;
                    }
                    else
                    {
                        Model1.DeFen = 0;
                    }
                    Model1.Add();
                }
            }
            else if (FenLeiSunXu[j].ToString() == "填空题")
            {
                TiMuIDList = this.Lab4.Text;
                DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                {
                    ZWL.BLL.ERPTiKuKaoShiJieGuo Model1 = new ZWL.BLL.ERPTiKuKaoShiJieGuo();

                    Model1.KaoShiID = MaxID;
                    Model1.TiMuID = int.Parse(MYDT.Tables[0].Rows[i]["ID"].ToString());
                    Model1.DaAn = MYDT.Tables[0].Rows[i]["AnswerStr"].ToString();
                    string UserDaAnStr = "";
                    try
                    {
                        UserDaAnStr = Request.Form["text-" + MYDT.Tables[0].Rows[i]["ID"].ToString()].ToString();
                    }
                    catch { }
                    Model1.UserDaAn = UserDaAnStr;
                    if (UserDaAnStr == MYDT.Tables[0].Rows[i]["AnswerStr"].ToString())
                    {
                        Model1.DeFen = Model.TianKongFenShu;
                    }
                    else
                    {
                        Model1.DeFen = 0;
                    }
                    Model1.Add();
                }
            }
            else if (FenLeiSunXu[j].ToString() == "简答题")
            {
                TiMuIDList = this.Lab5.Text;
                DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                {
                    ZWL.BLL.ERPTiKuKaoShiJieGuo Model1 = new ZWL.BLL.ERPTiKuKaoShiJieGuo();

                    Model1.KaoShiID = MaxID;
                    Model1.TiMuID = int.Parse(MYDT.Tables[0].Rows[i]["ID"].ToString());
                    Model1.DaAn = MYDT.Tables[0].Rows[i]["AnswerStr"].ToString();
                    string UserDaAnStr = "";
                    try
                    {
                        UserDaAnStr = Request.Form["textarea-" + MYDT.Tables[0].Rows[i]["ID"].ToString()].ToString();
                    }
                    catch { }
                    Model1.UserDaAn = UserDaAnStr;

                    Model1.DeFen =null;
                    Model1.Add();
                }
            }
        }

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加在线考试信息(" + this.DropDownList1.SelectedItem.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "在线考试信息添加成功！当前电脑阅卷得分：" + ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select sum(DeFen)  from ERPTiKuKaoShiJieGuo where KaoShiID=" + MaxID.ToString()) + "，此分数不包含人工阅卷分数！", "TiKuKaoShi.aspx");
	}
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.DropDownList1.Enabled = false;
        this.Button1.Enabled = false;
        this.Panel1.Visible = true;

        //读取试卷信息
        ZWL.BLL.ERPTiKuShiJuan Model = new ZWL.BLL.ERPTiKuShiJuan();
        Model.GetModel(int.Parse(this.DropDownList1.SelectedItem.Value.ToString()));

        MaxTime =int.Parse(Model.KaoShiXianShi.ToString()) * 60;//考试限时
        
        string[] FenLeiSunXu=Model.FenLeiShunXu.Split('|');
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
            if (FenLeiSunXu[j].ToString() == "判断题")
            {
                TiMuIDList = DongTaiOrJingTai(Model.PanDuanTiList, Model.IFSuiJiChuTi, "判断题");
                if (TiMuIDList.Trim().Length > 0 && TiMuIDList.Trim()!="0")
                {
                    //一、	判断题（每题1分，共20分）
                    this.Label1.Text = this.Label1.Text + DaBiaoTi + "、" + FenLeiSunXu[j].ToString() + "（每题" + Model.PanDuanFenShu.ToString() + "分，共" + TiMuIDList.Split(',').Length.ToString() + "题，合计" + (Model.PanDuanFenShu * TiMuIDList.Split(',').Length).ToString() + "分）<hr>";

                    DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                    for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                    {
                        int TempNum = i + 1;
                        this.Label1.Text = this.Label1.Text + TempNum.ToString() + "：" + MYDT.Tables[0].Rows[i]["TitleStr"].ToString() + "<br>";

                        if (MYDT.Tables[0].Rows[i]["ItemsA"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"A\"> A：" + MYDT.Tables[0].Rows[i]["ItemsA"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsB"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"B\"> B：" + MYDT.Tables[0].Rows[i]["ItemsB"].ToString() + "<br>";
                        }
                        this.Label1.Text = this.Label1.Text + "<P>";
                    }
                }
            }
            else if (FenLeiSunXu[j].ToString() == "单项选择题")
            {
                TiMuIDList = DongTaiOrJingTai(Model.DanXuanTiList, Model.IFSuiJiChuTi, "单项选择题");
                if (TiMuIDList.Trim().Length > 0 && TiMuIDList.Trim() != "0")
                {
                    this.Label1.Text = this.Label1.Text + DaBiaoTi + "、" + FenLeiSunXu[j].ToString() + "（每题" + Model.DanXuanFenShu.ToString() + "分，共" + TiMuIDList.Split(',').Length.ToString() + "题，合计" + (Model.DanXuanFenShu * TiMuIDList.Split(',').Length).ToString() + "分）<hr>";

                    DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                    for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                    {
                        int TempNum = i + 1;
                        this.Label1.Text = this.Label1.Text + TempNum.ToString() + "：" + MYDT.Tables[0].Rows[i]["TitleStr"].ToString() + "<br>";

                        if (MYDT.Tables[0].Rows[i]["ItemsA"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"A\"> A：" + MYDT.Tables[0].Rows[i]["ItemsA"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsB"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"B\"> B：" + MYDT.Tables[0].Rows[i]["ItemsB"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsC"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"C\"> C：" + MYDT.Tables[0].Rows[i]["ItemsC"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsD"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"D\"> D：" + MYDT.Tables[0].Rows[i]["ItemsD"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsE"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"E\"> E：" + MYDT.Tables[0].Rows[i]["ItemsE"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsF"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"F\"> F：" + MYDT.Tables[0].Rows[i]["ItemsF"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsG"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"G\"> G：" + MYDT.Tables[0].Rows[i]["ItemsG"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsH"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"radio\" name=\"rad-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" value=\"H\"> H：" + MYDT.Tables[0].Rows[i]["ItemsH"].ToString() + "<br>";
                        }
                        this.Label1.Text = this.Label1.Text + "<P>";
                    }
                }
            }
            else if (FenLeiSunXu[j].ToString() == "多项选择题")
            {
                TiMuIDList = DongTaiOrJingTai(Model.DuoXuanTiList, Model.IFSuiJiChuTi, "多项选择题");
                if (TiMuIDList.Trim().Length > 0 && TiMuIDList.Trim() != "0")
                {
                    this.Label1.Text = this.Label1.Text + DaBiaoTi + "、" + FenLeiSunXu[j].ToString() + "（每题" + Model.DuoXuanFenShu.ToString() + "分，共" + TiMuIDList.Split(',').Length.ToString() + "题，合计" + (Model.DuoXuanFenShu * TiMuIDList.Split(',').Length).ToString() + "分）<hr>";

                    DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                    for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                    {
                        int TempNum = i + 1;
                        this.Label1.Text = this.Label1.Text + TempNum.ToString() + "：" + MYDT.Tables[0].Rows[i]["TitleStr"].ToString() + "<br>";

                        if (MYDT.Tables[0].Rows[i]["ItemsA"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-A\" value=\"A\"> A：" + MYDT.Tables[0].Rows[i]["ItemsA"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsB"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-B\" value=\"B\"> B：" + MYDT.Tables[0].Rows[i]["ItemsB"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsC"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-C\" value=\"C\"> C：" + MYDT.Tables[0].Rows[i]["ItemsC"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsD"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-D\" value=\"D\"> D：" + MYDT.Tables[0].Rows[i]["ItemsD"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsE"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-E\" value=\"E\"> E：" + MYDT.Tables[0].Rows[i]["ItemsE"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsF"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-F\" value=\"F\"> F：" + MYDT.Tables[0].Rows[i]["ItemsF"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsG"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-G\" value=\"G\"> G：" + MYDT.Tables[0].Rows[i]["ItemsG"].ToString() + "<br>";
                        }
                        if (MYDT.Tables[0].Rows[i]["ItemsH"].ToString().Trim().Length > 0)
                        {
                            this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;<input type=\"checkbox\" name=\"CHK-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "-H\" value=\"H\"> H：" + MYDT.Tables[0].Rows[i]["ItemsH"].ToString() + "<br>";
                        }
                        this.Label1.Text = this.Label1.Text + "<P>";
                    }
                }
            }
            else if (FenLeiSunXu[j].ToString() == "填空题")
            {
                TiMuIDList = DongTaiOrJingTai(Model.TianKongTiList,Model.IFSuiJiChuTi,"填空题");
                if (TiMuIDList.Trim().Length > 0 && TiMuIDList.Trim() != "0")
                {
                    this.Label1.Text = this.Label1.Text + DaBiaoTi + "、" + FenLeiSunXu[j].ToString() + "（每题" + Model.TianKongFenShu.ToString() + "分，共" + TiMuIDList.Split(',').Length.ToString() + "题，合计" + (Model.TianKongFenShu * TiMuIDList.Split(',').Length).ToString() + "分）<hr>";

                    DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                    for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                    {
                        int TempNum = i + 1;
                        this.Label1.Text = this.Label1.Text + TempNum.ToString() + "：" + MYDT.Tables[0].Rows[i]["TitleStr"].ToString() + "<br>";
                        this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;答案：<input type=\"text\" name=\"text-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\" ><br>";
                        this.Label1.Text = this.Label1.Text + "<P>";
                    }
                }
            }
            else if (FenLeiSunXu[j].ToString() == "简答题")
            {
                TiMuIDList = DongTaiOrJingTai(Model.JianDaTiList,Model.IFSuiJiChuTi,"简答题");
                if (TiMuIDList.Trim().Length > 0 && TiMuIDList.Trim() != "0")
                {
                    this.Label1.Text = this.Label1.Text + DaBiaoTi + "、" + FenLeiSunXu[j].ToString() + "（每题" + Model.JianDaFenShu.ToString() + "分，共" + TiMuIDList.Split(',').Length.ToString() + "题，合计" + (Model.JianDaFenShu * TiMuIDList.Split(',').Length).ToString() + "分）<hr>";

                    DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPTiKu where ID in('" + TiMuIDList.Replace(",", "','") + "')");
                    for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
                    {
                        int TempNum = i + 1;
                        this.Label1.Text = this.Label1.Text + TempNum.ToString() + "：" + MYDT.Tables[0].Rows[i]["TitleStr"].ToString() + "<br>";
                        this.Label1.Text = this.Label1.Text + "&nbsp;&nbsp;答案：<textarea cols=\"50\" rows=\"10\" name=\"textarea-" + MYDT.Tables[0].Rows[i]["ID"].ToString() + "\"></textarea><br>";
                        this.Label1.Text = this.Label1.Text + "<P>";
                    }
                }
            }            
        }
    }

    public string  DongTaiOrJingTai(string MoRenList,string IFSuiJi,string FenLeiStr)
    {
        string ReturnStr = "";
        if(IFSuiJi=="否")
        {
            ReturnStr=MoRenList;
        }
        else
        {
            //动态抽取题目的数量
            string LieName = "DanXuanNum";
            if (FenLeiStr == "单项选择题")
            {
                LieName = "DanXuanNum";
            }
            else if (FenLeiStr == "多项选择题")
            {
                LieName = "DuoXuanNum";
            }
            else if (FenLeiStr == "判断题")
            {
                LieName = "PanDuanNum";
            }
            else if (FenLeiStr == "填空题")
            {
                LieName = "TianKongNum";
            }
            else if (FenLeiStr == "简答题")
            {
                LieName = "JianDaNum";
            }
            string TiMuShu = ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select top 1 " + LieName + " from ERPTiKuShiJuanSet where ShiJuanID="+this.DropDownList1.SelectedValue.ToString());//题目数量
            string TiKuID = ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select top 1 TiKuTypeID from ERPTiKuShiJuanSet where ShiJuanID=" + this.DropDownList1.SelectedValue.ToString());//题库TypeID

            string IDList = ZWL.DBUtility.DbHelperSQL.GetStringList("select top " + TiMuShu + " ID from ERPTiKu where TiKuID=" + TiKuID + " and FenLeiStr='" + FenLeiStr + "'  order by newid()").Replace('|', ',');

            ReturnStr=IDList;
        }

        if (FenLeiStr == "判断题")
        {
            Lab1.Text = ReturnStr;
        }
        else if (FenLeiStr == "单项选择题")
        {
            Lab2.Text = ReturnStr;
        }
        else if (FenLeiStr == "多项选择题")
        {
            Lab3.Text = ReturnStr;
        }
        else if (FenLeiStr == "填空题")
        {
            Lab4.Text = ReturnStr;
        }
        else if (FenLeiStr == "简答题")
        {
            Lab5.Text = ReturnStr;
        }

        return ReturnStr;
    }
}
