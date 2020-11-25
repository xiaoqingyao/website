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

public partial class NWorkFlow_NWorkToDoChaoSong : System.Web.UI.Page
{
    public string PiLiangSet = "";//���������ֶεĿ�д����������
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPNWorkToDo Model = new ZWL.BLL.ERPNWorkToDo();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblWorkName.Text=Model.WorkName.ToString();
            //this.lblFormID.Text=Model.FormID.ToString();
            //this.lblWorkFlowID.Text=Model.WorkFlowID.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			this.lblFormContent.Text=Model.FormContent.ToString();
			this.lblFuJianList.Text=ZWL.Common.PublicMethod.GetWenJian(Model.FuJianList.ToString(),"../UpLoadFile/");
			this.lblShenPiYiJian.Text=Model.ShenPiYiJian.ToString();
			//this.lblJieDianID.Text=Model.JieDianID.ToString();
            this.lblJieDianName.Text = "<a href=\"NWorkFlowReView.aspx?WorkFlowID=" + Model.WorkFlowID.ToString() + "&FormID=" + Model.FormID.ToString() + "\" target=\"_blank\">" + Model.JieDianName.ToString() + "</a>";
			this.lblShenPiUserList.Text=Model.ShenPiUserList.ToString();
			this.lblOKUserList.Text=Model.OKUserList.ToString();
			this.lblStateNow.Text=Model.StateNow.ToString();
			this.lblLateTime.Text=Model.LateTime.ToString();
			
			//дϵͳ��־
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "�û��鿴����������Ϣ(" + this.lblWorkName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();

            SetNodeInfoAndSet();
		}
	}

    /// <summary>
    /// ���þ������ԡ���ǰ�ж�Ȩ�ޡ���д�����ܵ�
    /// </summary>
    public void SetNodeInfoAndSet()
    {       
        ZWL.BLL.ERPNWorkToDo MyModelWork = new ZWL.BLL.ERPNWorkToDo();
        MyModelWork.GetModel(int.Parse(Request.QueryString["ID"].ToString()));

        //��ȡ��ǰ����Ӧ�Ĺ���������
        string[] FormItemList = ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 ItemsList from ERPNForm where ID=" + MyModelWork.FormID.ToString()).Split('|');        

        for (int ItemNum = 0; ItemNum < FormItemList.Length; ItemNum++)
        {
            if (FormItemList[ItemNum].ToString().Trim().Length > 0)
            {
                
                PiLiangSet = PiLiangSet + "document.getElementById(\"" + FormItemList[ItemNum].ToString().Split('_')[0] + "\").disabled=true;";//readOnly
            }
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("PrintWork.aspx?ID=" + Request.QueryString["ID"].ToString());
    }
    public void btnDownloadFile_Click(object sender, EventArgs e)
    {
        try
        {
            ZWL.Common.PublicMethod.DownloadFile(Server.MapPath("~"), this.hdnFileURL.Value.Trim());
        }
        catch
        {
        }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPNWorkToDo Model = new ZWL.BLL.ERPNWorkToDo();
        Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
        Model.ID = int.Parse(Request.QueryString["ID"].ToString());
        if (Model.ChaoSongUserList.ToString() != "")
        {
            Model.ChaoSongUserList = Model.ChaoSongUserList + "," + ZWL.Common.PublicMethod.WorkWeiTuoUserList(this.txtChaoSong.Text.Trim());
        }
        else
        {
            Model.ChaoSongUserList = ZWL.Common.PublicMethod.WorkWeiTuoUserList(this.txtChaoSong.Text.Trim());
        }
        Model.Update();
        SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "�����µĳ��͹�����(" + Model.WorkName + ")", ZWL.Common.PublicMethod.WorkWeiTuoUserList(this.txtChaoSong.Text.Trim()));

        //дϵͳ��־
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "�û����͹�����Ϣ(" + Model.WorkName + ")���������û�Ϊ��" + this.txtChaoSong.Text.Trim();
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "���͹�����ӳɹ���", "SerchWorkFlow.aspx");
    }

}
