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

public partial class WorkFlow_GoToNextNode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //该节点根据传过来的工作的ID信息，查询到使用的工作流、当前节点信息（全部通过往下流转、一个通过往下流转）
        //根据节点信息、该工作的通过人列表信息、审批人列表信息===>该节点是否应该继续往下流转
        //如果要往下流转则显示页面上的下一节点设置信息，否则用程序跳转回待办事项页面。

        //根据Type参数属性，Type为0时为正常下一节点，Type为1时为绑定所有节点供选择。
        if (!Page.IsPostBack)
        {
            SDLX.BLL.ERPWorkToDo MyModel = new SDLX.BLL.ERPWorkToDo();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label1.Text = MyModel.WorkName;
            //判断 当前节点信息（全部通过往下流转、一个通过往下流转）  该工作的通过人列表信息、审批人列表信息
            string SPMoShi = SDLX.DBUtility.DbHelperSQL.GetSHSL("select top 1 PingShenMoShi from ERPWorkFlowJieDian where ID=" + MyModel.JieDianID.ToString());
            if (CheCkIfOk(MyModel.TongGuoRenList, MyModel.ShenPiRenList, SPMoShi) == true)
            {
                //绑定下一个节点
                try
                {
                    //绑定下一节点  正常状态

                    if (Request.QueryString["Type"].ToString().Trim() == "0")
                    {
                        string[] NextStrList = SDLX.DBUtility.DbHelperSQL.GetSHSL("select NextJieDianSerils from ERPWorkFlowJieDian where ID=" + MyModel.JieDianID.ToString()).Split(',');
                        for (int i = 0; i < NextStrList.Length; i++)
                        {
                            ListItem MyItem = new ListItem();
                            MyItem.Value = SDLX.DBUtility.DbHelperSQL.GetSHSL("select ID from ERPWorkFlowJieDian where JieDianSerils='" + NextStrList[i].ToString() + "' and WorkFlowID=" + MyModel.WorkFlowID.ToString());//根据序号和workflowID获得节点ID
                            MyItem.Text = "节点序号：" + NextStrList[i].ToString() + "--节点名称：" + SDLX.DBUtility.DbHelperSQL.GetSHSL("select JieDianName from ERPWorkFlowJieDian where JieDianSerils='" + NextStrList[i].ToString() + "' and WorkFlowID=" + MyModel.WorkFlowID.ToString());
                            if (MyItem.Value.ToString().Length > 0)
                            {
                                this.DropDownList3.Items.Add(MyItem);
                            }
                        }
                    }
                    else //绑定所有节点（除开始节点）
                    {
                        //清除根据条件决定下一节点选项
                        this.CheckBox1.Checked = false;
                        this.CheckBox1.Enabled = false;


                        DataSet MyDS = SDLX.DBUtility.DbHelperSQL.GetDataSet("select ID,JieDianSerils,JieDianName from ERPWorkFlowJieDian where JieDianAddr!='开始' and WorkFlowID=" + MyModel.WorkFlowID.ToString());
                        for (int jjj = 0; jjj < MyDS.Tables[0].Rows.Count; jjj++)
                        {
                            ListItem MyItem = new ListItem();
                            MyItem.Value = MyDS.Tables[0].Rows[jjj]["ID"].ToString();
                            MyItem.Text = "节点序号：" + MyDS.Tables[0].Rows[jjj]["JieDianSerils"].ToString() + "--节点名称：" + MyDS.Tables[0].Rows[jjj]["JieDianName"].ToString();
                            if (MyItem.Value.ToString().Length > 0)
                            {
                                this.DropDownList3.Items.Add(MyItem);
                            }
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
            else
            {
                SDLX.Common.MessageBox.ShowAndRedirect(this, "该节点工作需要等待其他人办理后才能继续往下流转，请继续等待！", "NowWorkFlow.aspx");
            }
        }
    }
    protected bool CheCkIfOk(string TongGuoStr, string ShenPiList, string TiaoJianStr)
    {
        if (TiaoJianStr == "一人通过可向下流转")
        {
            return true;
        }
        else
        {
            //判断审批人列表是否全部在通过人列表中
            string[] ShenPiArry=ShenPiList.Split(',');
            for (int i = 0; i < ShenPiArry.Length; i++)
            {
                if (SDLX.Common.PublicMethod.StrIFIn("," + ShenPiArry[i] + ",", "," + TongGuoStr + ",") == false)
                {
                    //检测到任何一个审批人不在已经通过列表中，则返回false
                    return false;
                }
            }
            return true;
        }
    }
    protected bool BiaoJiaoTwoStr(string Str1, string Str2, string BiJiaoTiaoJian, string LeiXing)
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
    protected string CheckTiaoJian(string FormCcontent, string TiaoJianStr, string WorkFlowIDStr)
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
    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        //如果选择了下一节点，就必须指定审批人
        if (this.DropDownList3.SelectedValue.Trim() != "")
        {
            if (this.TextBox5.Text.Trim().Length <= 0)
            {
                SDLX.Common.MessageBox.Show(this, "必须指定下一节点的审批人！");
                return;
            }
        }
        
        
        SDLX.BLL.ERPWorkToDo XMyModel = new SDLX.BLL.ERPWorkToDo();
        XMyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));

        //初始化
        string XJieDianIDStr = "0";
        string XJieDianNameStr = "";
        string XShenPiRenListStr = "";
        string XTongGuoRenListStr = "";
        string XStateNowStr = "正在办理";

        string JingBanRenStr = "";//条件判断时读取经办人
        try
        {
            if (CheckBox1.Checked == true)
            {
                //条件未找到或者没有匹配项时，采用选择好的节点
                XJieDianIDStr = this.DropDownList3.SelectedValue.ToString();
                try
                {
                    //根据条件跳转    //分析当前节点中的条件字段，如果有，则分析跳转的步骤，如存在，则跳转，否则，按照选择好的进行
                    //从开始节点中找到条件字段，如果找不到采用选定的，找到则，根据条件跳转
                    //格式如：请假天数[数字型]'大于'10→3|请假天数[数字型]'小于等于'10→2|请假部门[常规型]'等于'开发部→3|请假部门[常规型]'不等于'开发部→2
                    string[] TiaoJianList = SDLX.DBUtility.DbHelperSQL.GetSHSL("select TiaoJianTiaoZhuan from ERPWorkFlowJieDian where ID=" + XMyModel.JieDianID.ToString()).Split('|');
                    for (int i = 0; i < TiaoJianList.Length; i++)
                    {
                        string NextIDStr = CheckTiaoJian(XMyModel.FormContent, TiaoJianList[i].ToString(), XMyModel.WorkFlowID.ToString());
                        if (NextIDStr != "0")
                        {
                            XJieDianIDStr = NextIDStr;
                            JingBanRenStr = SDLX.DBUtility.DbHelperSQL.GetSHSL("select top 1 JingBanRenYuanList from ERPWorkFlowJieDian where ID=" + NextIDStr);
                            break; //跳出当前循环
                        }
                    }
                }
                catch
                {
                    XJieDianIDStr = this.DropDownList3.SelectedValue.ToString();
                }
            }
            else
            {
                XJieDianIDStr = this.DropDownList3.SelectedValue.ToString();
            }
            XStateNowStr = "正在办理";
            XJieDianNameStr = SDLX.DBUtility.DbHelperSQL.GetSHSL("select JieDianName from ERPWorkFlowJieDian where ID=" + XJieDianIDStr);
        }
        catch
        {
            if (SDLX.DBUtility.DbHelperSQL.GetSHSL("select JieDianAddr from ERPWorkFlowJieDian where ID=" + XMyModel.JieDianID.ToString()) == "结束")
            {
                XStateNowStr = "正常结束";
                XJieDianIDStr = XMyModel.JieDianID.ToString();
            }
            else
            {
                XStateNowStr = "强制结束";
                XJieDianIDStr = XMyModel.JieDianID.ToString();
            }
            XJieDianNameStr = "结束";
        }
        if (JingBanRenStr == "")
        {
            XShenPiRenListStr = this.TextBox5.Text;
        }
        else
        {
            XShenPiRenListStr = JingBanRenStr;
        }
        XTongGuoRenListStr = ""; 
        //执行uodate语句
        SDLX.DBUtility.DbHelperSQL.ExecuteSQL("update ERPWorkToDo set LateTime=getdate(),JieDianID=" + XJieDianIDStr + ",JieDianName='" + XJieDianNameStr + "',ShenPiRenList='" + XShenPiRenListStr + "',TongGuoRenList='" + XTongGuoRenListStr + "',StateNow='" + XStateNowStr + "' where ID=" + Request.QueryString["ID"].ToString());





        if (XStateNowStr == "正在办理")
        {
            //发送短信
            SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "您有新的工作需要办理！(" + this.Label1.Text + ")", this.TextBox5.Text.Trim());
        }
        else if (XStateNowStr == "正常结束")
        {
            SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "您的工作已经正常结束！(" + this.Label1.Text + ")", XMyModel.UserName);
        }
        else
        {
            SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "您的工作已经被强制结束！(" + this.Label1.Text + ")", XMyModel.UserName);
        }





        //写系统日志
        SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
        MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户办理工作(" + this.Label1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        SDLX.Common.MessageBox.ShowAndRedirect(this, "工作办理成功！", "NowWorkFlow.aspx");
    }
}
