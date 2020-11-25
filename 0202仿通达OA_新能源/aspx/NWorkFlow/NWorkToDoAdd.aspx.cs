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

namespace OA.aspx.NWorkFlow{ 
 public partial class NWorkToDoAdd: System.Web.UI.Page
{
    public string PiLiangSet = "";//批量设置字段的可写、保密属性
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();

            //设置上传的附件为空
            FTD.Unit.PublicMethod.SetSessionValue("WenJianList", "");
            //加载表单内容
            GetFormContent(Request.QueryString["FormID"].ToString());
            //绑定工作名称
            this.txtWorkName.Text = FTD.Unit.PublicMethod.GetSessionValue("UserName") + "--" + FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 WorkFlowName from ERPNWorkFlow where ID=" + Request.QueryString["WorkFlowID"].ToString()) + "(" + DateTime.Now.ToShortDateString() + ")";

            //绑定下一节点
            string[] NextStrList = FTD.DBUnit.DbHelperSQL.GetSHSL("select NextNode from ERPNWorkFlowNode where WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString() + " and NodeAddr='开始'").Split(',');
            for (int i = 0; i < NextStrList.Length; i++)
            {
                ListItem MyItem = new ListItem();
                MyItem.Value = FTD.DBUnit.DbHelperSQL.GetSHSL("select ID from ERPNWorkFlowNode where NodeSerils='" + NextStrList[i].ToString() + "' and WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString());//根据序号和workflowID获得节点ID
                MyItem.Text = "节点序号：" + NextStrList[i].ToString() + "--节点名称：" + FTD.DBUnit.DbHelperSQL.GetSHSL("select NodeName from ERPNWorkFlowNode where NodeSerils='" + NextStrList[i].ToString() + "' and WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString());
                if (MyItem.Value.ToString().Length > 0)
                {
                    this.DropDownList3.Items.Add(MyItem);
                }
            }
            SetNodeInfoAndSet();
        }

        //刷新界面后，将label1赋值
        this.Label1.Text = this.TextBox3.Text;
    }
    /// <summary>
    /// 设置下一节点具体属性、当前判断权限、可写、保密等
    /// </summary>
    public void SetNodeInfoAndSet()
    {


        try
        {
            //根据选择的节点，绑定人员等信息。
            FTD.BLL.ERPNWorkFlowNode MyJieDian = new FTD.BLL.ERPNWorkFlowNode();
            MyJieDian.GetModel(int.Parse(this.DropDownList3.SelectedItem.Value.ToString()));
            this.TextBox1.Text = MyJieDian.PSType;
            this.TextBox2.Text = MyJieDian.SPType;
            //根据审批模式设置页面
            SetPageFromPSStr(MyJieDian.SPType, MyJieDian.SPDefaultList);

            //当前开始节点是否有查看、编辑、删除按钮？当前按钮属性
            string NowNodeID = FTD.DBUnit.DbHelperSQL.GetSHSLInt("select ID from ERPNWorkFlowNode where WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString() + " and NodeAddr='开始'");
            FTD.BLL.ERPNWorkFlowNode MyJieDianNow = new FTD.BLL.ERPNWorkFlowNode();
            MyJieDianNow.GetModel(int.Parse(NowNodeID));
            if (MyJieDianNow.IFCanDel == "否")
            {
                this.iButton3.Visible = false;
            }
            if (MyJieDianNow.IFCanView == "否")
            {
                this.iButton5.Visible = false;
            }
            if (MyJieDianNow.IFCanEdit == "否")
            {
                this.iButton6.Visible = false;
            }

            //获取当前表单对应的工作数据列
            string[] FormItemList = FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 ItemsList from ERPNForm where ID=" + Request.QueryString["FormID"].ToString()).Split('|');
            //获取当前节点的可写权限、保密权限
            string CanWriteStr = MyJieDianNow.CanWriteSet;
            string SecretStr = MyJieDianNow.SecretSet;

            for (int ItemNum = 0; ItemNum < FormItemList.Length; ItemNum++)
            {
                if (FormItemList[ItemNum].ToString().Trim().Length > 0)
                {
                    if (FTD.Unit.PublicMethod.StrIFIn(FormItemList[ItemNum].ToString(), CanWriteStr) == false)//不属于可写字段
                    {
                        PiLiangSet = PiLiangSet + "document.getElementById(\"" + FormItemList[ItemNum].ToString().Split('_')[0] + "\").disabled=true;";//readOnly
                    }
                    else
                    {
                        PiLiangSet = PiLiangSet + "document.getElementById(\"" + FormItemList[ItemNum].ToString().Split('_')[0] + "\").disabled=false;";//readOnly
                    }
                    if (FTD.Unit.PublicMethod.StrIFIn(FormItemList[ItemNum].ToString(), SecretStr) == true)//属于保密字段
                    {
                        PiLiangSet = PiLiangSet + "document.getElementById(\"" + FormItemList[ItemNum].ToString().Split('_')[0] + "\").style.visibility=\"hidden\";";
                    }
                    else
                    {
                        PiLiangSet = PiLiangSet + "document.getElementById(\"" + FormItemList[ItemNum].ToString().Split('_')[0] + "\").style.visibility=\"visible\";";
                    }
                }

            }
        }
        catch (Exception ex)
        {
            FTD.Unit.MessageBox.ShowAndRedirect(this, "该流程下一节点未定义完整，请配置完整！"+ex.Message, "NWorkToDoSelect.aspx");
        }
    }
    /// <summary>
    /// 根据审批模式字符串设置页面显示
    /// </summary>
    /// <param name="SPStr"></param>
    public void SetPageFromPSStr(string SPStr, string DefultStr)
    {
        if (SPStr == "审批时自由指定")
        {
            this.TextBox5.Text = "";
        }
        else if (SPStr == "从默认审批人中选择")
        {
            this.TextBox5.Text = DefultStr;
        }
        else if (SPStr == "从默认审批部门中选择")
        {
            string SqlWhere = "";
            string[] DefultList = DefultStr.Split(',');
            for (int i = 0; i < DefultList.Length; i++)
            {
                if (SqlWhere.Trim().Length > 0)
                {
                    SqlWhere = SqlWhere + " or  " + " ','+Department+',' like '%," + DefultList[i].ToString() + ",%' ";
                }
                else
                {
                    SqlWhere = " ','+Department+',' like '%," + DefultList[i].ToString() + ",%' ";
                }
            }

            this.TextBox5.Text = FTD.DBUnit.DbHelperSQL.GetStringList("select UserName from ERPUser where " + SqlWhere).Replace("|", ",");
        }
        else if (SPStr == "从默认审批角色中选择")
        {
            string SqlWhere = "";
            string[] DefultList = DefultStr.Split(',');
            for (int i = 0; i < DefultList.Length; i++)
            {
                if (SqlWhere.Trim().Length > 0)
                {
                    SqlWhere = SqlWhere + " or  " + " ','+JiaoSe+',' like '%," + DefultList[i].ToString() + ",%' ";
                }
                else
                {
                    SqlWhere = " ','+JiaoSe+',' like '%," + DefultList[i].ToString() + ",%' ";
                }
            }

            this.TextBox5.Text = FTD.DBUnit.DbHelperSQL.GetStringList("select UserName from ERPUser where " + SqlWhere).Replace("|", ",");
        }
        else if (SPStr == "自动选择流程发起人")
        {
            this.TextBox5.Text = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        }
        else if (SPStr == "自动选择本部门主管")
        {
            this.TextBox5.Text = FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 ChargeMan from ERPBuMen where BuMenName='" + FTD.Unit.PublicMethod.GetSessionValue("Department") + "'");
        }
        else if (SPStr == "自动选择上级部门主管")
        {
            this.TextBox5.Text = FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 ChargeMan from ERPBuMen where ID=(select top 1 DirID from ERPBuMen where BuMenName='" + FTD.Unit.PublicMethod.GetSessionValue("Department") + "')");
        }
    }

    /// <summary>
    /// 加载表单内容、初始化表单
    /// </summary>
    /// <param name="FormName"></param>
    protected void GetFormContent(string FormID)
    {
        this.TextBox3.Text = FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 ContentStr from ERPNForm where ID=" + FormID);
        this.TextBox3.Text = this.TextBox3.Text.Replace("宏控件-用户部门", FTD.Unit.PublicMethod.GetSessionValue("Department"));
        this.TextBox3.Text = this.TextBox3.Text.Replace("宏控件-用户姓名", FTD.Unit.PublicMethod.GetSessionValue("UserName"));
        this.TextBox3.Text = this.TextBox3.Text.Replace("宏控件-用户角色", FTD.Unit.PublicMethod.GetSessionValue("JiaoSe"));
        this.TextBox3.Text = this.TextBox3.Text.Replace("宏控件-用户职位", FTD.Unit.PublicMethod.GetSessionValue("ZhiWei"));
        this.TextBox3.Text = this.TextBox3.Text.Replace("宏控件-当前日期", DateTime.Now.ToShortDateString());
        this.TextBox3.Text = this.TextBox3.Text.Replace("宏控件-部门主管", FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 ChargeMan from ERPBuMen where BuMenName='" + FTD.Unit.PublicMethod.GetSessionValue("Department") + "'"));

    }
    /// <summary>
    /// 检测条件，然后返回下一字段，否则返回默认节点ID
    /// </summary>
    /// <returns></returns>
    public int CheckCondition(string DefaultNodeID)
    {
        //格式如：DEFG_请假天数→大于→10→3|ABCD_请假天数→大于→10→3
        string[] TiaoJianList = FTD.DBUnit.DbHelperSQL.GetSHSL("select ConditionSet from ERPNWorkFlowNode where WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString() + " and NodeAddr='开始'").Split('|');
        for (int i = 0; i < TiaoJianList.Length; i++)
        {
            if (TiaoJianList[i].Trim().Length > 0)
            {
                string NextIDStr = CheckTiaoJian(TiaoJianList[i].ToString());
                if (NextIDStr != "0")
                {
                    return int.Parse(NextIDStr);
                }
            }
        }
        return int.Parse(DefaultNodeID);
    }
    /// <summary>
    /// 比较两个字符串，返回结果是否正确
    /// </summary>
    /// <param name="Str1"></param>
    /// <param name="Str2"></param>
    /// <param name="BiJiaoTiaoJian"></param>
    /// <param name="LeiXing"></param>
    /// <returns></returns>
    protected bool BiaoJiaoTwoStr(string Str1, string Str2, string BiJiaoTiaoJian)
    {
        try
        {
            double A1 = double.Parse(Str1);
            double A2 = double.Parse(Str2); //大于  大于等于   小于  小于等于   等于   不等于  包含  不包含
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
            else if (BiJiaoTiaoJian == "包含" && FTD.Unit.PublicMethod.StrIFIn(Str2, Str1))
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "不包含")
            {
                if (FTD.Unit.PublicMethod.StrIFIn(Str2, Str1))
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
        catch
        {
            if (BiJiaoTiaoJian == "等于" && Str1 == Str2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "不等于" && Str1 != Str2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "包含" && FTD.Unit.PublicMethod.StrIFIn(Str2, Str1))
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "不包含")
            {
                if (FTD.Unit.PublicMethod.StrIFIn(Str2, Str1))
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

    /// <summary>
    /// 判断条件，返回下一节点ID
    /// </summary>
    /// <param name="FormCcontent"></param>
    /// <param name="TiaoJianStr"></param>
    /// <param name="WorkFlowIDStr"></param>
    /// <returns></returns>
    protected string CheckTiaoJian(string TiaoJianStr)
    {
        //条件格式如：ABCD_请假天数→大于→10→3        
        string ZiDuanStrEN = TiaoJianStr.Split('_')[0]; //字段名称EN 如：ABCD        
        string ZiDuanStrCN = TiaoJianStr.Split('_')[1]; //字段名称CN 如：请假天数        
        string BiJiaoStr = TiaoJianStr.Split('→')[1]; //条件比较  如：大于
        string ZhiStr = TiaoJianStr.Split('→')[2];//比较的值，如： 10
        string JieDianXuHaoStr = TiaoJianStr.Split('→')[3];//跳转的节点序号，如： 3

        string NowValue = "";
        try
        {
            NowValue = Request.Form[ZiDuanStrEN].ToString();
        }
        catch
        { }

        if (BiaoJiaoTwoStr(NowValue, ZhiStr, BiJiaoStr) == true)
        {
            return FTD.DBUnit.DbHelperSQL.GetSHSLInt("select top 1 ID from ERPNWorkFlowNode where NodeSerils='" + JieDianXuHaoStr + "' and WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString());
        }
        else
        {
            return "0";
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPNWorkToDo Model = new FTD.BLL.ERPNWorkToDo();
        Model.WorkName = this.txtWorkName.Text;
        Model.FormID = int.Parse(Request.QueryString["FormID"].ToString());
        Model.WorkFlowID = int.Parse(Request.QueryString["WorkFlowID"].ToString());
        Model.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        Model.TimeStr = DateTime.Now;
        Model.FormContent = this.TextBox3.Text;
        Model.FuJianList = FTD.Unit.PublicMethod.GetSessionValue("WenJianList");
        Model.ShenPiYiJian = "";
        try
        {
            if (CheckBox1.Checked == true)
            {
                //条件未找到或者没有匹配项时，采用选择好的节点
                Model.JieDianID = int.Parse(this.DropDownList3.SelectedValue.ToString());
                try
                {
                    ///////////根据条件获取下一审批节点信息                    
                    Model.JieDianID = CheckCondition(this.DropDownList3.SelectedValue.ToString());
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
            Model.JieDianName = FTD.DBUnit.DbHelperSQL.GetSHSL("select NodeName from ERPNWorkFlowNode where ID=" + Model.JieDianID.ToString());
            Model.StateNow = "正在办理";
        }
        catch
        {
            Model.JieDianName = "结束";
            Model.StateNow = "强制结束";
        }
        Model.ShenPiUserList = FTD.Unit.PublicMethod.WorkWeiTuoUserList(this.TextBox5.Text.Trim());
        Model.ChaoSongUserList = FTD.Unit.PublicMethod.WorkWeiTuoUserList(this.txtChaoSong.Text.Trim());
        Model.OKUserList = "默认";
        Model.LateTime = DateTime.Now.AddHours(double.Parse(FTD.DBUnit.DbHelperSQL.GetSHSLInt("select top 1 JieShuHours from ERPNWorkFlowNode where ID=" + Model.JieDianID.ToString())));
        Model.Add();

        if (Model.StateNow == "正在办理")
        {
            //发送短信
            SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "您有新的工作需要办理！(" + this.txtWorkName.Text + ")", FTD.Unit.PublicMethod.WorkWeiTuoUserList(this.TextBox5.Text.Trim()));
            SendMainAndSms.SendMessage(CHKSMS1, CHKMOB1, "您有新的抄送工作！(" + this.txtWorkName.Text + ")", FTD.Unit.PublicMethod.WorkWeiTuoUserList(this.txtChaoSong.Text.Trim()));
        }
        else
        {
            SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "您的工作已经被强制结束！(" + this.txtWorkName.Text + ")", FTD.Unit.PublicMethod.GetSessionValue("UserName"));
        }

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加新工作信息(" + this.txtWorkName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "审批工作添加成功！", "NWorkToDo.aspx?FormID=" + Request.QueryString["FormID"].ToString() + "&WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString());
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
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetNodeInfoAndSet();
    }
    protected void iButton5_Click(object sender, EventArgs e)
    {
        try
        {
            if (this.CheckBoxList1.SelectedItem.Text.Trim().Length > 0)
            {
                Response.Write("<script>window.open('../DsoFramer/ReadFile.aspx?FilePath=" + this.CheckBoxList1.SelectedItem.Value + "');</script>");
            }
        }
        catch
        { }
    }
    protected void iButton6_Click(object sender, EventArgs e)
    {
        try
        {
            if (this.CheckBoxList1.SelectedItem.Text.Trim().Length > 0)
            {
                Response.Write("<script>window.open('../DsoFramer/EditFile.aspx?FilePath=" + this.CheckBoxList1.SelectedItem.Value + "');</script>");
            }
        }
        catch
        { }
    }
}
}