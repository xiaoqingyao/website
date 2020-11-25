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

public partial class WorkFlow_WorkAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();
            //设置上传的附件为空
            SDLX.Common.PublicMethod.SetSessionValue("WenJianList", "");
            try
            {
                //绑定所有表单   限制使用人
                SDLX.DBUtility.DbHelperSQL.BindDropDownList("select distinct FormName from ERPWorkFlow where FormName in(select FormName from ERPForm where ShiYongUserList='' or ','+ShiYongUserList+',' like '%," + SDLX.Common.PublicMethod.GetSessionValue("UserName") + ",%') order by FormName asc", this.DropDownList1, "FormName", "FormName");

                //获取表单内容
                GetFormContent(this.DropDownList1.SelectedItem.Text);
             
                //绑定该表单下的所有工作流    限制使用人
                SDLX.DBUtility.DbHelperSQL.BindDropDownList("select ID,WorkFlowName from ERPWorkFlow where (UserList='' and  FormName='" + this.DropDownList1.SelectedItem.Text + "') or (','+UserList+',' like '%," + SDLX.Common.PublicMethod.GetSessionValue("UserName") + ",%' and  FormName='" + this.DropDownList1.SelectedItem.Text + "') order by WorkFlowName asc", this.DropDownList2, "WorkFlowName", "ID");

                //绑定工作名称
                this.TextBox1.Text = SDLX.Common.PublicMethod.GetSessionValue("UserName") + "--" + this.DropDownList2.SelectedItem.Text + "(" + DateTime.Now.ToShortDateString() + ")";
            
                //绑定下一节点
                string[] NextStrList = SDLX.DBUtility.DbHelperSQL.GetSHSL("select NextJieDianSerils from ERPWorkFlowJieDian where WorkFlowID=" + this.DropDownList2.SelectedItem.Value.ToString() + " and JieDianAddr='开始'").Split(',');
                for (int i = 0; i < NextStrList.Length; i++)
                {
                    ListItem MyItem = new ListItem();
                    MyItem.Value = SDLX.DBUtility.DbHelperSQL.GetSHSL("select ID from ERPWorkFlowJieDian where JieDianSerils='" + NextStrList[i].ToString() + "' and WorkFlowID=" + this.DropDownList2.SelectedItem.Value.ToString());//根据序号和workflowID获得节点ID
                    MyItem.Text = "节点序号：" + NextStrList[i].ToString() + "--节点名称：" + SDLX.DBUtility.DbHelperSQL.GetSHSL("select JieDianName from ERPWorkFlowJieDian where JieDianSerils='" + NextStrList[i].ToString() + "' and WorkFlowID=" + this.DropDownList2.SelectedItem.Value.ToString());
                    if (MyItem.Value.ToString().Length > 0)
                    {
                        this.DropDownList3.Items.Add(MyItem);
                    }
                }
                //根据选择的节点，绑定人员等信息。
                SDLX.BLL.ERPWorkFlowJieDian MyJieDian = new SDLX.BLL.ERPWorkFlowJieDian();
                MyJieDian.GetModel(int.Parse(this.DropDownList3.SelectedItem.Value.ToString()));
                this.Label2.Text = MyJieDian.PingShenMoShi + "&nbsp;&nbsp;&nbsp;&nbsp;" + MyJieDian.ShengPiUserSetting;
                this.Label3.Text = MyJieDian.JingBanRenYuanList;
                this.TextBox5.Text = MyJieDian.JingBanRenYuanList;
                //设定选择审批人员是自由指定还是定向指定
                if (MyJieDian.ShengPiUserSetting == "审批时自由指定")
                {
                    this.TextBox2.Text = "";
                }
                else
                {
                    this.TextBox2.Text = this.DropDownList3.SelectedItem.Value.ToString();
                }
            }
            catch 
            { }
        }
    }

    protected bool BiaoJiaoTwoStr(string Str1, string Str2, string BiJiaoTiaoJian,string LeiXing)
    {
        if (LeiXing.Trim() == "[数字型]")
        {
            int A1 = int.Parse(Str1);
            int A2 = int.Parse(Str2); //大于  大于等于   小于  小于等于   等于   不等于  包含  不包含
            if (BiJiaoTiaoJian == "大于" && A1 > A2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "大于等于" && A1 >= A2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "小于" && A1 < A2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "小于等于" && A1 <= A2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "等于" && A1 == A2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "不等于" && A1 != A2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "包含" && SDLX.Common.PublicMethod.StrIFIn(Str2,Str1))
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "不包含")
            {
                if (SDLX.Common.PublicMethod.StrIFIn(Str2, Str1))
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            else
            {
                return false;
            }
        }
        else
        {
            if (BiJiaoTiaoJian == "等于" && Str1 == Str2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "不等于" && Str1 != Str2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "包含" && SDLX.Common.PublicMethod.StrIFIn(Str2, Str1))
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "不包含")
            {
                if (SDLX.Common.PublicMethod.StrIFIn(Str2, Str1))
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            else
            {
                return false;
            }
        }        
    }
    //判断条件，返回下一节点ID
    protected string CheckTiaoJian(string FormCcontent,string TiaoJianStr,string WorkFlowIDStr)
    {
        //条件格式如：请假天数[数字型]'大于'10→3
        //一：判断FormCcontent中是否包含字段 请假天数[数字型]
        string[] TiaoJianSplit = TiaoJianStr.Split('\'');

        string ZiDuanStr = TiaoJianSplit[0].Split('[')[0]; //字段名称 如：请假天数
        string LeiXingStr = "[" + TiaoJianSplit[0].Split('[')[1]; //字段类型 如：[数字型]
        string BiJiaoStr = TiaoJianSplit[1]; //条件比较  如：大于
        string ZhiStr = TiaoJianSplit[2].Split('→')[0];//比较的值，如： 10
        string JieDianXuHaoStr = TiaoJianSplit[2].Split('→')[1];//跳转的节点序号，如： 3

        //获取 name=TIaoJianZiDuan_请假部门  这个字符串在表单内容中的位置，从该位置向前选30字符，按照 value=  分隔，最后一个字符数组即为值
        int StrIndex = FormCcontent.IndexOf("name=TIaoJianZiDuan_" + ZiDuanStr);
        if (StrIndex > 0)
        {
            string GetSubString = FormCcontent.Substring(StrIndex - 30, 30);            
            int ValueIndex = GetSubString.IndexOf("value=");
            if (ValueIndex >= 0)
            {
                string ValueStr = GetSubString.Substring(ValueIndex + 6, GetSubString.Length - ValueIndex - 6).Trim();
                if (BiaoJiaoTwoStr(ValueStr, ZhiStr.Trim(), BiJiaoStr, LeiXingStr) == true)
                {
                    return SDLX.DBUtility.DbHelperSQL.GetSHSLInt("select top 1 ID from ERPWorkFlowJieDian where JieDianSerils='" + JieDianXuHaoStr + "' and WorkFlowID=" + WorkFlowIDStr);
                }
            }
        }
        return "0";
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        SDLX.BLL.ERPWorkToDo Model = new SDLX.BLL.ERPWorkToDo();
        Model.FormContent = this.TextBox3.Text;
        Model.FormName = this.DropDownList1.SelectedItem.Text;
        Model.FuJianList = SDLX.Common.PublicMethod.GetSessionValue("WenJianList");
        string JingBanRenStr = "";//条件判断时读取经办人

        try
        {
            if (CheckBox1.Checked == true)
            {
                //条件未找到或者没有匹配项时，采用选择好的节点
                Model.JieDianID = int.Parse(this.DropDownList3.SelectedValue.ToString());
                try
                {
                    //根据条件跳转    //分析当前节点中的条件字段，如果有，则分析跳转的步骤，如存在，则跳转，否则，按照选择好的进行
                    //从开始节点中找到条件字段，如果找不到采用选定的，找到则，根据条件跳转
                    //格式如：请假天数[数字型]'大于'10→3|请假天数[数字型]'小于等于'10→2|请假部门[常规型]'等于'开发部→3|请假部门[常规型]'不等于'开发部→2
                    string[] TiaoJianList = SDLX.DBUtility.DbHelperSQL.GetSHSL("select TiaoJianTiaoZhuan from ERPWorkFlowJieDian where WorkFlowID=" + this.DropDownList2.SelectedItem.Value.ToString() + " and JieDianAddr='开始'").Split('|');
                    for (int i = 0; i < TiaoJianList.Length; i++)
                    {
                        string NextIDStr = CheckTiaoJian(this.TextBox3.Text, TiaoJianList[i].ToString(), this.DropDownList2.SelectedItem.Value.ToString());
                        if (NextIDStr != "0")
                        {
                            Model.JieDianID = int.Parse(NextIDStr);
                            JingBanRenStr = SDLX.DBUtility.DbHelperSQL.GetSHSL("select top 1 JingBanRenYuanList from ERPWorkFlowJieDian where ID=" + NextIDStr);
                            break; //跳出当前循环
                        }
                    }
                }
                catch
                {
                    Model.JieDianID = int.Parse(this.DropDownList3.SelectedValue.ToString());
                }
            }
            else
            {
                Model.JieDianID = int.Parse(this.DropDownList3.SelectedValue.ToString());
            }
            Model.StateNow = "正在办理";
            Model.JieDianName = SDLX.DBUtility.DbHelperSQL.GetSHSL("select JieDianName from ERPWorkFlowJieDian where ID=" + Model.JieDianID.ToString());
        }
        catch
        {            
            Model.StateNow = "强制结束";
            Model.JieDianName = "结束";
        }
        if (JingBanRenStr == "")
        {
            Model.ShenPiRenList = this.TextBox5.Text;
        }
        else
        {
            Model.ShenPiRenList = JingBanRenStr;
        }
        Model.ShenPiYiJian = "";       

        Model.TimeStr =DateTime.Now;
        Model.TongGuoRenList = "";
        Model.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        Model.WorkFlowID =int.Parse(this.DropDownList2.SelectedItem.Value.ToString());
        Model.WorkName = this.TextBox1.Text;
        Model.Add();




        
        if (Model.StateNow == "正在办理")
        {
            //发送短信
            SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "您有新的工作需要办理！(" + this.TextBox1.Text + ")", this.TextBox5.Text.Trim());
        }
        else
        {            
            SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "您的工作已经被强制结束！(" + this.TextBox1.Text + ")", SDLX.Common.PublicMethod.GetSessionValue("UserName"));            
        }




        //写系统日志
        SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
        MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加新工作信息(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        SDLX.Common.MessageBox.ShowAndRedirect(this, "新工作添加成功！", "MyWorkFlow.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string FileNameStr = SDLX.Common.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (SDLX.Common.PublicMethod.GetSessionValue("WenJianList").Trim() == "")
        {
            SDLX.Common.PublicMethod.SetSessionValue("WenJianList", FileNameStr);
        }
        else
        {
            SDLX.Common.PublicMethod.SetSessionValue("WenJianList", SDLX.Common.PublicMethod.GetSessionValue("WenJianList") + "|" + FileNameStr);
        }
        SDLX.Common.PublicMethod.BindDDL(this.CheckBoxList1, SDLX.Common.PublicMethod.GetSessionValue("WenJianList"));
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
            {
                if (this.CheckBoxList1.Items[i].Selected == true)
                {
                    SDLX.Common.PublicMethod.SetSessionValue("WenJianList", SDLX.Common.PublicMethod.GetSessionValue("WenJianList").Replace(this.CheckBoxList1.Items[i].Text, "").Replace("||", "|"));
                }
            }
            SDLX.Common.PublicMethod.BindDDL(this.CheckBoxList1, SDLX.Common.PublicMethod.GetSessionValue("WenJianList"));
        }
        catch
        { }
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (this.CheckBoxList1.SelectedItem.Text.Trim().Length > 0)
            {
                Response.Write("<script>window.open('../DsoFramer/ReadFile.aspx?FilePath=" + this.CheckBoxList1.SelectedItem.Text + "');</script>");
            }
        }
        catch
        { }
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (this.CheckBoxList1.SelectedItem.Text.Trim().Length > 0)
            {
                Response.Write("<script>window.open('../DsoFramer/EditFile.aspx?FilePath=" + this.CheckBoxList1.SelectedItem.Text + "');</script>");
            }
        }
        catch
        { }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.DropDownList2.Items.Clear();
        this.DropDownList3.Items.Clear();

        //获取表单内容
        GetFormContent(this.DropDownList1.SelectedItem.Text);

        //绑定该表单下的所有工作流    限制使用人
        SDLX.DBUtility.DbHelperSQL.BindDropDownList("select ID,WorkFlowName from ERPWorkFlow where (UserList='' and  FormName='" + this.DropDownList1.SelectedItem.Text + "') or (','+UserList+',' like '%," + SDLX.Common.PublicMethod.GetSessionValue("UserName") + ",%' and  FormName='" + this.DropDownList1.SelectedItem.Text + "')  order by WorkFlowName asc", this.DropDownList2, "WorkFlowName", "ID");

        try
        {
            //绑定工作名称
            this.TextBox1.Text = SDLX.Common.PublicMethod.GetSessionValue("UserName") + "--" + this.DropDownList2.SelectedItem.Text + "(" + DateTime.Now.ToShortDateString() + ")";

            //绑定下一节点
            string[] NextStrList = SDLX.DBUtility.DbHelperSQL.GetSHSL("select NextJieDianSerils from ERPWorkFlowJieDian where WorkFlowID=" + this.DropDownList2.SelectedItem.Value.ToString() + " and JieDianAddr='开始'").Split(',');
            for (int i = 0; i < NextStrList.Length; i++)
            {
                ListItem MyItem = new ListItem();
                MyItem.Value = SDLX.DBUtility.DbHelperSQL.GetSHSL("select ID from ERPWorkFlowJieDian where JieDianSerils='" + NextStrList[i].ToString() + "' and WorkFlowID=" + this.DropDownList2.SelectedItem.Value.ToString());//根据序号和workflowID获得节点ID
                MyItem.Text = "节点序号：" + NextStrList[i].ToString() + "--节点名称：" + SDLX.DBUtility.DbHelperSQL.GetSHSL("select JieDianName from ERPWorkFlowJieDian where JieDianSerils='" + NextStrList[i].ToString() + "' and WorkFlowID=" + this.DropDownList2.SelectedItem.Value.ToString());
                if (MyItem.Value.ToString().Length > 0)
                {
                    this.DropDownList3.Items.Add(MyItem);
                }
            }
            //根据选择的节点，绑定人员等信息。
            SDLX.BLL.ERPWorkFlowJieDian MyJieDian = new SDLX.BLL.ERPWorkFlowJieDian();
            MyJieDian.GetModel(int.Parse(this.DropDownList3.SelectedItem.Value.ToString()));
            this.Label2.Text = MyJieDian.PingShenMoShi + "&nbsp;&nbsp;&nbsp;&nbsp;" + MyJieDian.ShengPiUserSetting;
            this.Label3.Text = MyJieDian.JingBanRenYuanList;
            this.TextBox5.Text = MyJieDian.JingBanRenYuanList;
            //设定选择审批人员是自由指定还是定向指定
            if (MyJieDian.ShengPiUserSetting == "审批时自由指定")
            {
                this.TextBox2.Text = "";
            }
            else
            {
                this.TextBox2.Text = this.DropDownList3.SelectedItem.Value.ToString();
            }
        }
        catch
        { }
    }
    protected void GetFormContent(string FormName)
    {
        this.Label1.Text = SDLX.DBUtility.DbHelperSQL.GetSHSL("select top 1 ContentStr from ERPForm where FormName='" + FormName + "'");
        //替换各种宏控件
        this.Label1.Text = this.Label1.Text.Replace("宏控件-用户部门", SDLX.Common.PublicMethod.GetSessionValue("Department"));
        this.Label1.Text = this.Label1.Text.Replace("宏控件-用户姓名", SDLX.Common.PublicMethod.GetSessionValue("UserName"));
        this.Label1.Text = this.Label1.Text.Replace("宏控件-用户角色", SDLX.Common.PublicMethod.GetSessionValue("JiaoSe"));
        this.Label1.Text = this.Label1.Text.Replace("宏控件-用户职位", SDLX.Common.PublicMethod.GetSessionValue("ZhiWei"));
        this.Label1.Text = this.Label1.Text.Replace("宏控件-当前时间(日期)", DateTime.Now.ToShortDateString());
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.DropDownList3.Items.Clear();
        //绑定工作名称
        this.TextBox1.Text = SDLX.Common.PublicMethod.GetSessionValue("UserName") + "--" + this.DropDownList2.SelectedItem.Text + "(" + DateTime.Now.ToShortDateString() + ")";

        try
        {
            //绑定下一节点
            string[] NextStrList = SDLX.DBUtility.DbHelperSQL.GetSHSL("select NextJieDianSerils from ERPWorkFlowJieDian where WorkFlowID=" + this.DropDownList2.SelectedItem.Value.ToString() + " and JieDianAddr='开始'").Split(',');
            for (int i = 0; i < NextStrList.Length; i++)
            {
                ListItem MyItem = new ListItem();
                MyItem.Value = SDLX.DBUtility.DbHelperSQL.GetSHSL("select ID from ERPWorkFlowJieDian where JieDianSerils='" + NextStrList[i].ToString() + "' and WorkFlowID=" + this.DropDownList2.SelectedItem.Value.ToString());//根据序号和workflowID获得节点ID
                MyItem.Text = "节点序号：" + NextStrList[i].ToString() + "--节点名称：" + SDLX.DBUtility.DbHelperSQL.GetSHSL("select JieDianName from ERPWorkFlowJieDian where JieDianSerils='" + NextStrList[i].ToString() + "' and WorkFlowID=" + this.DropDownList2.SelectedItem.Value.ToString());
                if (MyItem.Value.ToString().Length > 0)
                {
                    this.DropDownList3.Items.Add(MyItem);
                }
            }
            //根据选择的节点，绑定人员等信息。
            SDLX.BLL.ERPWorkFlowJieDian MyJieDian = new SDLX.BLL.ERPWorkFlowJieDian();
            MyJieDian.GetModel(int.Parse(this.DropDownList3.SelectedItem.Value.ToString()));
            this.Label2.Text = MyJieDian.PingShenMoShi + "&nbsp;&nbsp;&nbsp;&nbsp;" + MyJieDian.ShengPiUserSetting;
            this.Label3.Text = MyJieDian.JingBanRenYuanList;
            this.TextBox5.Text = MyJieDian.JingBanRenYuanList;
            //设定选择审批人员是自由指定还是定向指定
            if (MyJieDian.ShengPiUserSetting == "审批时自由指定")
            {
                this.TextBox2.Text = "";
            }
            else
            {
                this.TextBox2.Text = this.DropDownList3.SelectedItem.Value.ToString();
            }
        }
        catch
        { }
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //根据选择的节点，绑定人员等信息。
            SDLX.BLL.ERPWorkFlowJieDian MyJieDian = new SDLX.BLL.ERPWorkFlowJieDian();
            MyJieDian.GetModel(int.Parse(this.DropDownList3.SelectedItem.Value.ToString()));
            this.Label2.Text = MyJieDian.PingShenMoShi + "&nbsp;&nbsp;&nbsp;&nbsp;" + MyJieDian.ShengPiUserSetting;
            this.Label3.Text = MyJieDian.JingBanRenYuanList;
            this.TextBox5.Text = MyJieDian.JingBanRenYuanList;
            //设定选择审批人员是自由指定还是定向指定
            if (MyJieDian.ShengPiUserSetting == "审批时自由指定")
            {
                this.TextBox2.Text = "";
            }
            else
            {
                this.TextBox2.Text = this.DropDownList3.SelectedItem.Value.ToString();
            }
        }
        catch
        { }
    }
}