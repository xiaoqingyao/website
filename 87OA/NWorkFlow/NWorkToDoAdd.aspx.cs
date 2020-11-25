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

public partial class NWorkFlow_NWorkToDoAdd : System.Web.UI.Page
{
    public string PiLiangSet = "";//���������ֶεĿ�д����������
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();

            //�����ϴ��ĸ���Ϊ��
            ZWL.Common.PublicMethod.SetSessionValue("WenJianList", "");
            //���ر�����
            GetFormContent(Request.QueryString["FormID"].ToString());
            //�󶨹�������
            this.txtWorkName.Text = ZWL.Common.PublicMethod.GetSessionValue("UserName") + "--" + ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 WorkFlowName from ERPNWorkFlow where ID=" + Request.QueryString["WorkFlowID"].ToString()) + "(" + DateTime.Now.ToShortDateString() + ")";

            //����һ�ڵ�
            string[] NextStrList = ZWL.DBUtility.DbHelperSQL.GetSHSL("select NextNode from ERPNWorkFlowNode where WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString() + " and NodeAddr='��ʼ'").Split(',');
            for (int i = 0; i < NextStrList.Length; i++)
            {
                ListItem MyItem = new ListItem();
                MyItem.Value = ZWL.DBUtility.DbHelperSQL.GetSHSL("select ID from ERPNWorkFlowNode where NodeSerils='" + NextStrList[i].ToString() + "' and WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString());//������ź�workflowID��ýڵ�ID
                MyItem.Text = "�ڵ���ţ�" + NextStrList[i].ToString() + "--�ڵ����ƣ�" + ZWL.DBUtility.DbHelperSQL.GetSHSL("select NodeName from ERPNWorkFlowNode where NodeSerils='" + NextStrList[i].ToString() + "' and WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString());
                if (MyItem.Value.ToString().Length > 0)
                {
                    this.DropDownList3.Items.Add(MyItem);
                }
            }
            SetNodeInfoAndSet();
        }

        //ˢ�½���󣬽�label1��ֵ
        this.Label1.Text = this.TextBox3.Text;
    }
    /// <summary>
    /// ������һ�ڵ�������ԡ���ǰ�ж�Ȩ�ޡ���д�����ܵ�
    /// </summary>
    public void SetNodeInfoAndSet()
    {


        try
        {
            //����ѡ��Ľڵ㣬����Ա����Ϣ��
            ZWL.BLL.ERPNWorkFlowNode MyJieDian = new ZWL.BLL.ERPNWorkFlowNode();
            MyJieDian.GetModel(int.Parse(this.DropDownList3.SelectedItem.Value.ToString()));
            this.TextBox1.Text = MyJieDian.PSType;
            this.TextBox2.Text = MyJieDian.SPType;
            //��������ģʽ����ҳ��
            SetPageFromPSStr(MyJieDian.SPType, MyJieDian.SPDefaultList);

            //��ǰ��ʼ�ڵ��Ƿ��в鿴���༭��ɾ����ť����ǰ��ť����
            string NowNodeID = ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select ID from ERPNWorkFlowNode where WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString() + " and NodeAddr='��ʼ'");
            ZWL.BLL.ERPNWorkFlowNode MyJieDianNow = new ZWL.BLL.ERPNWorkFlowNode();
            MyJieDianNow.GetModel(int.Parse(NowNodeID));
            if (MyJieDianNow.IFCanDel == "��")
            {
                this.ImageButton3.Visible = false;
            }
            if (MyJieDianNow.IFCanView == "��")
            {
                this.ImageButton5.Visible = false;
            }
            if (MyJieDianNow.IFCanEdit == "��")
            {
                this.ImageButton6.Visible = false;
            }

            //��ȡ��ǰ����Ӧ�Ĺ���������
            string[] FormItemList = ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 ItemsList from ERPNForm where ID=" + Request.QueryString["FormID"].ToString()).Split('|');
            //��ȡ��ǰ�ڵ�Ŀ�дȨ�ޡ�����Ȩ��
            string CanWriteStr = MyJieDianNow.CanWriteSet;
            string SecretStr = MyJieDianNow.SecretSet;

            for (int ItemNum = 0; ItemNum < FormItemList.Length; ItemNum++)
            {
                if (FormItemList[ItemNum].ToString().Trim().Length > 0)
                {
                    if (ZWL.Common.PublicMethod.StrIFIn(FormItemList[ItemNum].ToString(), CanWriteStr) == false)//�����ڿ�д�ֶ�
                    {
                        PiLiangSet = PiLiangSet + "document.getElementById(\"" + FormItemList[ItemNum].ToString().Split('_')[0] + "\").disabled=true;";//readOnly
                    }
                    else
                    {
                        PiLiangSet = PiLiangSet + "document.getElementById(\"" + FormItemList[ItemNum].ToString().Split('_')[0] + "\").disabled=false;";//readOnly
                    }
                    if (ZWL.Common.PublicMethod.StrIFIn(FormItemList[ItemNum].ToString(), SecretStr) == true)//���ڱ����ֶ�
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
            ZWL.Common.MessageBox.ShowAndRedirect(this, "��������һ�ڵ�δ����������������������"+ex.Message, "NWorkToDoSelect.aspx");
        }
    }
    /// <summary>
    /// ��������ģʽ�ַ�������ҳ����ʾ
    /// </summary>
    /// <param name="SPStr"></param>
    public void SetPageFromPSStr(string SPStr, string DefultStr)
    {
        if (SPStr == "����ʱ����ָ��")
        {
            this.TextBox5.Text = "";
        }
        else if (SPStr == "��Ĭ����������ѡ��")
        {
            this.TextBox5.Text = DefultStr;
        }
        else if (SPStr == "��Ĭ������������ѡ��")
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

            this.TextBox5.Text = ZWL.DBUtility.DbHelperSQL.GetStringList("select UserName from ERPUser where " + SqlWhere).Replace("|", ",");
        }
        else if (SPStr == "��Ĭ��������ɫ��ѡ��")
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

            this.TextBox5.Text = ZWL.DBUtility.DbHelperSQL.GetStringList("select UserName from ERPUser where " + SqlWhere).Replace("|", ",");
        }
        else if (SPStr == "�Զ�ѡ�����̷�����")
        {
            this.TextBox5.Text = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        }
        else if (SPStr == "�Զ�ѡ�񱾲�������")
        {
            this.TextBox5.Text = ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 ChargeMan from ERPBuMen where BuMenName='" + ZWL.Common.PublicMethod.GetSessionValue("Department") + "'");
        }
        else if (SPStr == "�Զ�ѡ���ϼ���������")
        {
            this.TextBox5.Text = ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 ChargeMan from ERPBuMen where ID=(select top 1 DirID from ERPBuMen where BuMenName='" + ZWL.Common.PublicMethod.GetSessionValue("Department") + "')");
        }
    }

    /// <summary>
    /// ���ر����ݡ���ʼ����
    /// </summary>
    /// <param name="FormName"></param>
    protected void GetFormContent(string FormID)
    {
        this.TextBox3.Text = ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 ContentStr from ERPNForm where ID=" + FormID);
        this.TextBox3.Text = this.TextBox3.Text.Replace("��ؼ�-�û�����", ZWL.Common.PublicMethod.GetSessionValue("Department"));
        this.TextBox3.Text = this.TextBox3.Text.Replace("��ؼ�-�û�����", ZWL.Common.PublicMethod.GetSessionValue("UserName"));
        this.TextBox3.Text = this.TextBox3.Text.Replace("��ؼ�-�û���ɫ", ZWL.Common.PublicMethod.GetSessionValue("JiaoSe"));
        this.TextBox3.Text = this.TextBox3.Text.Replace("��ؼ�-�û�ְλ", ZWL.Common.PublicMethod.GetSessionValue("ZhiWei"));
        this.TextBox3.Text = this.TextBox3.Text.Replace("��ؼ�-��ǰ����", DateTime.Now.ToShortDateString());
        this.TextBox3.Text = this.TextBox3.Text.Replace("��ؼ�-��������", ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 ChargeMan from ERPBuMen where BuMenName='" + ZWL.Common.PublicMethod.GetSessionValue("Department") + "'"));

    }
    /// <summary>
    /// ���������Ȼ�󷵻���һ�ֶΣ����򷵻�Ĭ�Ͻڵ�ID
    /// </summary>
    /// <returns></returns>
    public int CheckCondition(string DefaultNodeID)
    {
        //��ʽ�磺DEFG_������������ڡ�10��3|ABCD_������������ڡ�10��3
        string[] TiaoJianList = ZWL.DBUtility.DbHelperSQL.GetSHSL("select ConditionSet from ERPNWorkFlowNode where WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString() + " and NodeAddr='��ʼ'").Split('|');
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
    /// �Ƚ������ַ��������ؽ���Ƿ���ȷ
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
            double A2 = double.Parse(Str2); //����  ���ڵ���   С��  С�ڵ���   ����   ������  ����  ������
            if (BiJiaoTiaoJian == "����" && A1 > A2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "���ڵ���" && A1 >= A2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "С��" && A1 < A2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "С�ڵ���" && A1 <= A2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "����" && A1 == A2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "������" && A1 != A2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "����" && ZWL.Common.PublicMethod.StrIFIn(Str2, Str1))
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "������")
            {
                if (ZWL.Common.PublicMethod.StrIFIn(Str2, Str1))
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
            if (BiJiaoTiaoJian == "����" && Str1 == Str2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "������" && Str1 != Str2)
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "����" && ZWL.Common.PublicMethod.StrIFIn(Str2, Str1))
            {
                return true;
            }
            else if (BiJiaoTiaoJian == "������")
            {
                if (ZWL.Common.PublicMethod.StrIFIn(Str2, Str1))
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
    /// �ж�������������һ�ڵ�ID
    /// </summary>
    /// <param name="FormCcontent"></param>
    /// <param name="TiaoJianStr"></param>
    /// <param name="WorkFlowIDStr"></param>
    /// <returns></returns>
    protected string CheckTiaoJian(string TiaoJianStr)
    {
        //������ʽ�磺ABCD_������������ڡ�10��3        
        string ZiDuanStrEN = TiaoJianStr.Split('_')[0]; //�ֶ�����EN �磺ABCD        
        string ZiDuanStrCN = TiaoJianStr.Split('_')[1]; //�ֶ�����CN �磺�������        
        string BiJiaoStr = TiaoJianStr.Split('��')[1]; //�����Ƚ�  �磺����
        string ZhiStr = TiaoJianStr.Split('��')[2];//�Ƚϵ�ֵ���磺 10
        string JieDianXuHaoStr = TiaoJianStr.Split('��')[3];//��ת�Ľڵ���ţ��磺 3

        string NowValue = "";
        try
        {
            NowValue = Request.Form[ZiDuanStrEN].ToString();
        }
        catch
        { }

        if (BiaoJiaoTwoStr(NowValue, ZhiStr, BiJiaoStr) == true)
        {
            return ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select top 1 ID from ERPNWorkFlowNode where NodeSerils='" + JieDianXuHaoStr + "' and WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString());
        }
        else
        {
            return "0";
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPNWorkToDo Model = new ZWL.BLL.ERPNWorkToDo();
        Model.WorkName = this.txtWorkName.Text;
        Model.FormID = int.Parse(Request.QueryString["FormID"].ToString());
        Model.WorkFlowID = int.Parse(Request.QueryString["WorkFlowID"].ToString());
        Model.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        Model.TimeStr = DateTime.Now;
        Model.FormContent = this.TextBox3.Text;
        Model.FuJianList = ZWL.Common.PublicMethod.GetSessionValue("WenJianList");
        Model.ShenPiYiJian = "";
        try
        {
            if (CheckBox1.Checked == true)
            {
                //����δ�ҵ�����û��ƥ����ʱ������ѡ��õĽڵ�
                Model.JieDianID = int.Parse(this.DropDownList3.SelectedValue.ToString());
                try
                {
                    ///////////����������ȡ��һ�����ڵ���Ϣ                    
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
            Model.JieDianName = ZWL.DBUtility.DbHelperSQL.GetSHSL("select NodeName from ERPNWorkFlowNode where ID=" + Model.JieDianID.ToString());
            Model.StateNow = "���ڰ���";
        }
        catch
        {
            Model.JieDianName = "����";
            Model.StateNow = "ǿ�ƽ���";
        }
        Model.ShenPiUserList = ZWL.Common.PublicMethod.WorkWeiTuoUserList(this.TextBox5.Text.Trim());
        Model.ChaoSongUserList = ZWL.Common.PublicMethod.WorkWeiTuoUserList(this.txtChaoSong.Text.Trim());
        Model.OKUserList = "Ĭ��";
        Model.LateTime = DateTime.Now.AddHours(double.Parse(ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select top 1 JieShuHours from ERPNWorkFlowNode where ID=" + Model.JieDianID.ToString())));
        Model.Add();

        if (Model.StateNow == "���ڰ���")
        {
            //���Ͷ���
            SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "�����µĹ�����Ҫ����(" + this.txtWorkName.Text + ")", ZWL.Common.PublicMethod.WorkWeiTuoUserList(this.TextBox5.Text.Trim()));
            SendMainAndSms.SendMessage(CHKSMS1, CHKMOB1, "�����µĳ��͹�����(" + this.txtWorkName.Text + ")", ZWL.Common.PublicMethod.WorkWeiTuoUserList(this.txtChaoSong.Text.Trim()));
        }
        else
        {
            SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "���Ĺ����Ѿ���ǿ�ƽ�����(" + this.txtWorkName.Text + ")", ZWL.Common.PublicMethod.GetSessionValue("UserName"));
        }

        //дϵͳ��־
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "�û�����¹�����Ϣ(" + this.txtWorkName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "����������ӳɹ���", "NWorkToDo.aspx?FormID=" + Request.QueryString["FormID"].ToString() + "&WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString());
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string FileNameStr = ZWL.Common.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (ZWL.Common.PublicMethod.GetSessionValue("WenJianList").Trim() == "")
        {
            ZWL.Common.PublicMethod.SetSessionValue("WenJianList", FileNameStr);
        }
        else
        {
            ZWL.Common.PublicMethod.SetSessionValue("WenJianList", ZWL.Common.PublicMethod.GetSessionValue("WenJianList") + "|" + FileNameStr);
        }
        ZWL.Common.PublicMethod.BindDDL(this.CheckBoxList1, ZWL.Common.PublicMethod.GetSessionValue("WenJianList"));
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
            {
                if (this.CheckBoxList1.Items[i].Selected == true)
                {
                    ZWL.Common.PublicMethod.SetSessionValue("WenJianList", ZWL.Common.PublicMethod.GetSessionValue("WenJianList").Replace(this.CheckBoxList1.Items[i].Value, "").Replace("||", "|"));
                }
            }
            ZWL.Common.PublicMethod.BindDDL(this.CheckBoxList1, ZWL.Common.PublicMethod.GetSessionValue("WenJianList"));
        }
        catch
        { }
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetNodeInfoAndSet();
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
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
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
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
