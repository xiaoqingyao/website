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

namespace OA.aspx.SystemManage{ 
 public partial class SystemUserModify: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            //绑定页面数据
            FTD.BLL.ERPUser MyBuMen = new FTD.BLL.ERPUser();
            MyBuMen.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.TextBox1.Text = MyBuMen.UserName;
            this.TextBox2.Text =FTD.Unit.DEncrypt.DESEncrypt.Decrypt(MyBuMen.UserPwd);
            this.TextBox3.Text = MyBuMen.TrueName;
            this.TextBox4.Text = MyBuMen.Serils;
            this.TextBox5.Text = MyBuMen.Department;
            this.TextBox6.Text = MyBuMen.JiaoSe;
            this.TextBox7.Text = MyBuMen.ZhiWei;
            this.TextBox8.Text = MyBuMen.ZaiGang;
            this.TextBox9.Text = MyBuMen.EmailStr;
            this.RadioButtonList1.SelectedValue = MyBuMen.IfLogin;
            this.TextBox10.Text = MyBuMen.Sex;
            this.TextBox11.Text = MyBuMen.BackInfo;
            this.TextBox12.Text = MyBuMen.BirthDay;
            this.TextBox13.Text = MyBuMen.MingZu;
            this.TextBox14.Text = MyBuMen.SFZSerils;
            this.TextBox15.Text = MyBuMen.HunYing;
            this.TextBox16.Text = MyBuMen.ZhengZhiMianMao;
            this.TextBox17.Text = MyBuMen.JiGuan;
            this.TextBox18.Text = MyBuMen.HuKou;
            this.TextBox19.Text = MyBuMen.XueLi;
            this.TextBox20.Text = MyBuMen.ZhiCheng;
            this.TextBox21.Text = MyBuMen.BiYeYuanXiao;
            this.TextBox22.Text = MyBuMen.ZhuanYe;
            this.TextBox23.Text = MyBuMen.CanJiaGongZuoTime;
            this.TextBox24.Text = MyBuMen.JiaRuBenDanWeiTime;
            this.TextBox25.Text = MyBuMen.JiaTingDianHua;
            this.TextBox26.Text = MyBuMen.JiaTingAddress;
            this.TextBox27.Text = MyBuMen.GangWeiBianDong;
            this.TextBox28.Text = MyBuMen.JiaoYueBeiJing;
            this.TextBox29.Text = MyBuMen.GongZuoJianLi;
            this.TextBox30.Text = MyBuMen.SheHuiGuanXi;
            this.TextBox31.Text = MyBuMen.JiangChengJiLu;
            this.TextBox32.Text = MyBuMen.ZhiWuQingKuang;
            this.TextBox33.Text = MyBuMen.PeiXunJiLu;
            this.TextBox34.Text = MyBuMen.DanBaoJiLu;
            this.TextBox35.Text = MyBuMen.NaoDongHeTong;
            this.TextBox36.Text = MyBuMen.SheBaoJiaoNa;
            this.TextBox37.Text = MyBuMen.TiJianJiLu;
            this.TextBox38.Text = MyBuMen.BeiZhuStr;
            FTD.Unit.PublicMethod.SetSessionValue("WenJianList", MyBuMen.FuJian);
            FTD.Unit.PublicMethod.BindDDL(this.CheckBoxList1, FTD.Unit.PublicMethod.GetSessionValue("WenJianList"));
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        if (FTD.Unit.PublicMethod.IFExists("UserName", "ERPUser", int.Parse(Request.QueryString["ID"].ToString()), this.TextBox1.Text) == true)
        {
            if (FTD.Unit.PublicMethod.IFExists("Serils", "ERPUser", int.Parse(Request.QueryString["ID"].ToString()), this.TextBox4.Text) == true)
            {
                FTD.BLL.ERPUser MyBuMen = new FTD.BLL.ERPUser();
                MyBuMen.ID = int.Parse(Request.QueryString["ID"].ToString());
                MyBuMen.UserName = this.TextBox1.Text;
                MyBuMen.UserPwd = FTD.Unit.DEncrypt.DESEncrypt.Encrypt(this.TextBox2.Text);
                MyBuMen.TrueName = this.TextBox3.Text;
                MyBuMen.Serils = this.TextBox4.Text;
                MyBuMen.Department = this.TextBox5.Text;
                MyBuMen.JiaoSe = this.TextBox6.Text;
                MyBuMen.ZhiWei = this.TextBox7.Text;
                MyBuMen.ZaiGang = this.TextBox8.Text;
                MyBuMen.EmailStr = this.TextBox9.Text;
                MyBuMen.IfLogin = this.RadioButtonList1.SelectedItem.Text;
                MyBuMen.Sex = this.TextBox10.Text;
                MyBuMen.BackInfo = this.TextBox11.Text;
                MyBuMen.BirthDay = this.TextBox12.Text;
                MyBuMen.MingZu = this.TextBox13.Text;
                MyBuMen.SFZSerils = this.TextBox14.Text;
                MyBuMen.HunYing = this.TextBox15.Text;
                MyBuMen.ZhengZhiMianMao = this.TextBox16.Text;
                MyBuMen.JiGuan = this.TextBox17.Text;
                MyBuMen.HuKou = this.TextBox18.Text;
                MyBuMen.XueLi = this.TextBox19.Text;
                MyBuMen.ZhiCheng = this.TextBox20.Text;
                MyBuMen.BiYeYuanXiao = this.TextBox21.Text;
                MyBuMen.ZhuanYe = this.TextBox22.Text;
                MyBuMen.CanJiaGongZuoTime = this.TextBox23.Text;
                MyBuMen.JiaRuBenDanWeiTime = this.TextBox24.Text;
                MyBuMen.JiaTingDianHua = this.TextBox25.Text;
                MyBuMen.JiaTingAddress = this.TextBox26.Text;
                MyBuMen.GangWeiBianDong = this.TextBox27.Text;
                MyBuMen.JiaoYueBeiJing = this.TextBox28.Text;
                MyBuMen.GongZuoJianLi = this.TextBox29.Text;
                MyBuMen.SheHuiGuanXi = this.TextBox30.Text;
                MyBuMen.JiangChengJiLu = this.TextBox31.Text;
                MyBuMen.ZhiWuQingKuang = this.TextBox32.Text;
                MyBuMen.PeiXunJiLu = this.TextBox33.Text;
                MyBuMen.DanBaoJiLu = this.TextBox34.Text;
                MyBuMen.NaoDongHeTong = this.TextBox35.Text;
                MyBuMen.SheBaoJiaoNa = this.TextBox36.Text;
                MyBuMen.TiJianJiLu = this.TextBox37.Text;
                MyBuMen.BeiZhuStr = this.TextBox38.Text;
                MyBuMen.FuJian = FTD.Unit.PublicMethod.GetSessionValue("WenJianList");
                MyBuMen.Update();
                //写系统日志
                FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
                MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
                MyRiZhi.DoSomething = "用户修改用户信息(" + this.TextBox1.Text + ")";
                MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
                MyRiZhi.Add();
                FTD.Unit.MessageBox.ShowAndRedirect(this, "用户信息修改成功！", "SystemUser.aspx");
            }
            else
            {
                FTD.Unit.MessageBox.Show(this, "该用户编号已经存在，请更换其他用户编号！");
            }
        }
        else
        {
            FTD.Unit.MessageBox.Show(this, "该用户名已经存在，请更换其他用户名！");
        }
    }

    protected void iButton2_Click(object sender, EventArgs e)
    {
        string FileNameStr = FTD.Unit.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (FTD.Unit.PublicMethod.GetSessionValue("WenJianList").Trim() == "")
        {
            FTD.Unit.PublicMethod.SetSessionValue("WenJianList", FileNameStr);
        }
        else
        {
            FTD.Unit.PublicMethod.SetSessionValue("WenJianList", FTD.Unit.PublicMethod.GetSessionValue("WenJianList") + "|" + FileNameStr);
        }
        FTD.Unit.PublicMethod.BindDDL(this.CheckBoxList1, FTD.Unit.PublicMethod.GetSessionValue("WenJianList"));
    }
    protected void iButton3_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
            {
                if (this.CheckBoxList1.Items[i].Selected == true)
                {
                    FTD.Unit.PublicMethod.SetSessionValue("WenJianList", FTD.Unit.PublicMethod.GetSessionValue("WenJianList").Replace(this.CheckBoxList1.Items[i].Value, "").Replace("||", "|"));
                }
            }
            FTD.Unit.PublicMethod.BindDDL(this.CheckBoxList1, FTD.Unit.PublicMethod.GetSessionValue("WenJianList"));
        }
        catch
        { }
    }
}}