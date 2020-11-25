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

public partial class HR_ShangXiaBanDengJi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();

            ZWL.BLL.ERPKaoQinSetting MyModel = new ZWL.BLL.ERPKaoQinSetting();
            MyModel.GetModel(int.Parse(ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select top 1 [ID] FROM ERPKaoQinSetting")));

            this.Label3.Text = MyModel.GuiDingTime1;
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label3.Text) == true)
            {
                this.Label3.Text = "未设置&nbsp;&nbsp;&nbsp;&nbsp;";
            }
            this.Label7.Text = MyModel.GuiDingTime2;
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label7.Text) == true)
            {
                this.Label7.Text = "未设置&nbsp;&nbsp;&nbsp;&nbsp;";
            }
            this.Label11.Text = MyModel.GuiDingTime3;
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label11.Text) == true)
            {
                this.Label11.Text = "未设置&nbsp;&nbsp;&nbsp;&nbsp;";
            }
            this.Label15.Text = MyModel.GuiDingTime4;
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label15.Text) == true)
            {
                this.Label15.Text = "未设置&nbsp;&nbsp;&nbsp;&nbsp;";
            }
            this.Label19.Text = MyModel.GuiDingTime5;
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label19.Text) == true)
            {
                this.Label19.Text = "未设置&nbsp;&nbsp;&nbsp;&nbsp;";
            }
            this.Label23.Text = MyModel.GuiDingTime6;
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label23.Text) == true)
            {
                this.Label23.Text = "未设置&nbsp;&nbsp;&nbsp;&nbsp;";
            }

            //获取当前已经打了卡的考勤时钟，今日没考勤数据时生成空记录
            GetKaoQin();
        }
    }
    protected void GetKaoQin()
    {
        DataRow MyDataRow = ZWL.DBUtility.DbHelperSQL.GetDataRow("select * from ERPKaoQin where UserName='" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "' and datediff(day,KaoQinRiQi,getdate())=0");
        if (MyDataRow == null)
        {
            //加入考勤空记录
            string LieName = "";
            string CanShu = "";
            Hashtable MyHashTable = new Hashtable();
            MyHashTable.Add("@UserName|string", ZWL.Common.PublicMethod.GetSessionValue("UserName"));
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label3.Text) == false)
            {
                MyHashTable.Add("@GuiDingTime1|datetime", DateTime.Now.ToShortDateString() + " " + this.Label3.Text);
                LieName = LieName + ",GuiDingTime1";
                CanShu = CanShu + ",@GuiDingTime1";
            }
            else
            {
                this.Button1.Visible = false;
            }
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label7.Text) == false)
            {
                MyHashTable.Add("@GuiDingTime2|datetime", DateTime.Now.ToShortDateString() + " " + this.Label7.Text);
                LieName = LieName + ",GuiDingTime2";
                CanShu = CanShu + ",@GuiDingTime2";
            }
            else
            {
                this.Button2.Visible = false;
            }
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label11.Text) == false)
            {
                MyHashTable.Add("@GuiDingTime3|datetime", DateTime.Now.ToShortDateString() + " " + this.Label11.Text);
                LieName = LieName + ",GuiDingTime3";
                CanShu = CanShu + ",@GuiDingTime3";
            }
            else
            {
                this.Button3.Visible = false;
            }
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label15.Text) == false)
            {
                MyHashTable.Add("@GuiDingTime4|datetime", DateTime.Now.ToShortDateString() + " " + this.Label15.Text);
                LieName = LieName + ",GuiDingTime4";
                CanShu = CanShu + ",@GuiDingTime4";
            }
            else
            {
                this.Button4.Visible = false;
            }
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label19.Text) == false)
            {
                MyHashTable.Add("@GuiDingTime5|datetime", DateTime.Now.ToShortDateString() + " " + this.Label19.Text);
                LieName = LieName + ",GuiDingTime5";
                CanShu = CanShu + ",@GuiDingTime5";
            }
            else
            {
                this.Button5.Visible = false;
            }
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label23.Text) == false)
            {
                MyHashTable.Add("@GuiDingTime6|datetime", DateTime.Now.ToShortDateString() + " " + this.Label23.Text);
                LieName = LieName + ",GuiDingTime6";
                CanShu = CanShu + ",@GuiDingTime6";
            }
            else
            {
                this.Button6.Visible = false;
            }
            MyHashTable.Add("@KaoQinRiQi|datetime", DateTime.Now.ToString());
            string SqlStr = "insert into ERPKaoQin(UserName" + LieName + ",KaoQinRiQi) values(@UserName" + CanShu + ",@KaoQinRiQi)";
            ZWL.DBUtility.DbHelperSQL.ExecuteSQL(SqlStr, MyHashTable);
        }
        else
        {
            DateTime t1 =ZWL.Common.DataValidate.ValidateDataRow_T(MyDataRow, "DengJiTime1");
            if (t1 == System.DateTime.MinValue)
            {
                this.Label4.Text = "未登记";
            }
            else
            {
                this.Label4.Text = t1.ToShortTimeString();
                this.Button1.Visible = false;
                //判断是迟到、早退、正常
                int jj = DateTime.Compare(DateTime.Parse(this.Label4.Text + ":00"), DateTime.Parse(this.Label3.Text));
                if (jj <= 0)
                {
                    this.Label4.Text = this.Label4.Text + "（正常）";
                }
                else
                {
                    this.Label4.Text = this.Label4.Text + "<font color=Red>（迟到）</font>";
                }
            }
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label3.Text) == true)
            {
                this.Label4.Text = "未设置&nbsp;&nbsp;&nbsp;&nbsp;";
                this.Button1.Visible = false;
            }
            DateTime t2 = ZWL.Common.DataValidate.ValidateDataRow_T(MyDataRow, "DengJiTime2");
            if (t2 == System.DateTime.MinValue)
            {
                this.Label8.Text = "未登记";
            }
            else
            {
                this.Label8.Text = t2.ToShortTimeString();
                this.Button2.Visible = false;
                //判断是迟到、早退、正常
                int jj = DateTime.Compare(DateTime.Parse(this.Label8.Text + ":00"), DateTime.Parse(this.Label7.Text));
                if (jj < 0)
                {
                    this.Label8.Text = this.Label8.Text + "<font color=Red>（早退）</font>";
                }
                else
                {
                    this.Label8.Text = this.Label8.Text + "（正常）";
                }
            }
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label7.Text) == true)
            {
                this.Label8.Text = "未设置&nbsp;&nbsp;&nbsp;&nbsp;";
                this.Button2.Visible = false;
            }
            DateTime t3 = ZWL.Common.DataValidate.ValidateDataRow_T(MyDataRow, "DengJiTime3");
            if (t3 == System.DateTime.MinValue)
            {
                this.Label12.Text = "未登记";
            }
            else
            {
                this.Label12.Text = t3.ToShortTimeString();
                this.Button3.Visible = false;
                //判断是迟到、早退、正常
                int jj = DateTime.Compare(DateTime.Parse(this.Label12.Text + ":00"), DateTime.Parse(this.Label11.Text));
                if (jj <= 0)
                {
                    this.Label12.Text = this.Label12.Text + "（正常）";
                }
                else
                {
                    this.Label12.Text = this.Label12.Text + "<font color=Red>（迟到）</font>";
                }
            }
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label11.Text) == true)
            {
                this.Label12.Text = "未设置&nbsp;&nbsp;&nbsp;&nbsp;";
                this.Button3.Visible = false;
            }
            DateTime t4 = ZWL.Common.DataValidate.ValidateDataRow_T(MyDataRow, "DengJiTime4");
            if (t4 == System.DateTime.MinValue)
            {
                this.Label16.Text = "未登记";
            }
            else
            {
                this.Label16.Text = t4.ToShortTimeString();
                this.Button4.Visible = false;
                //判断是迟到、早退、正常
                int jj = DateTime.Compare(DateTime.Parse(this.Label16.Text + ":00"), DateTime.Parse(this.Label15.Text));
                if (jj < 0)
                {
                    this.Label16.Text = this.Label16.Text + "<font color=Red>（早退）</font>";
                }
                else
                {
                    this.Label16.Text = this.Label16.Text + "（正常）";
                }
            }
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label15.Text) == true)
            {
                this.Label16.Text = "未设置&nbsp;&nbsp;&nbsp;&nbsp;";
                this.Button4.Visible = false;
            }
            DateTime t5 = ZWL.Common.DataValidate.ValidateDataRow_T(MyDataRow, "DengJiTime5");
            if (t5 == System.DateTime.MinValue)
            {
                this.Label20.Text = "未登记";
            }
            else
            {
                this.Label20.Text = t5.ToShortTimeString();
                this.Button5.Visible = false;
                //判断是迟到、早退、正常
                int jj = DateTime.Compare(DateTime.Parse(this.Label20.Text + ":00"), DateTime.Parse(this.Label19.Text));
                if (jj <= 0)
                {
                    this.Label20.Text = this.Label20.Text + "（正常）";
                }
                else
                {
                    this.Label20.Text = this.Label20.Text + "<font color=Red>（迟到）</font>";
                }
            }
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label19.Text) == true)
            {
                this.Label20.Text = "未设置&nbsp;&nbsp;&nbsp;&nbsp;";
                this.Button5.Visible = false;
            }
            DateTime t6 = ZWL.Common.DataValidate.ValidateDataRow_T(MyDataRow, "DengJiTime6");
            if (t6 == System.DateTime.MinValue)
            {
                this.Label24.Text = "未登记";
            }
            else
            {
                this.Label24.Text = t6.ToShortTimeString();
                this.Button6.Visible = false;
                //判断是迟到、早退、正常
                int jj = DateTime.Compare(DateTime.Parse(this.Label24.Text + ":00"), DateTime.Parse(this.Label23.Text));
                if (jj < 0)
                {
                    this.Label24.Text = this.Label24.Text + "<font color=Red>（早退）</font>";
                }
                else
                {
                    this.Label24.Text = this.Label24.Text + "（正常）";
                }
            }
            if (ZWL.Common.PublicMethod.StrIFIn("未设置", this.Label23.Text) == true)
            {
                this.Label24.Text = "未设置&nbsp;&nbsp;&nbsp;&nbsp;";
                this.Button6.Visible = false;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //获得Button的参数值
        string arg = ((Button)sender).CommandName.ToString();
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL("update ERPKaoQin set " + arg + "=getdate() where UserName='" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "' and datediff(day,KaoQinRiQi,getdate())=0");
        Response.Write("<script>alert('考勤时间已登记！');window.location='../Main/MyDesk.aspx'</script>");
    }
}
