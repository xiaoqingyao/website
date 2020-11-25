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
    public string PiLiangSet = "";//批量设置字段的可写、保密属性
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
			
			//写系统日志
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "用户查看工作管理信息(" + this.lblWorkName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();

            SetNodeInfoAndSet();
		}
	}

    /// <summary>
    /// 设置具体属性、当前判断权限、可写、保密等
    /// </summary>
    public void SetNodeInfoAndSet()
    {       
        ZWL.BLL.ERPNWorkToDo MyModelWork = new ZWL.BLL.ERPNWorkToDo();
        MyModelWork.GetModel(int.Parse(Request.QueryString["ID"].ToString()));

        //获取当前表单对应的工作数据列
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
        SendMainAndSms.SendMessage(CHKSMS, CHKMOB, "您有新的抄送工作！(" + Model.WorkName + ")", ZWL.Common.PublicMethod.WorkWeiTuoUserList(this.txtChaoSong.Text.Trim()));

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户抄送工作信息(" + Model.WorkName + ")！被抄送用户为：" + this.txtChaoSong.Text.Trim();
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "抄送工作添加成功！", "SerchWorkFlow.aspx");
    }

}
