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

public partial class DocFile_JiXiaoView : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPJiXiao Model = new ZWL.BLL.ERPJiXiao();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblJXName.Text=Model.JXName.ToString();
			this.lblJianJie.Text=Model.JianJie.ToString();
			this.lblUserName.Text=Model.UserName.ToString();
			this.lblTimeStr.Text=Model.TimeStr.ToString();
			
			//дϵͳ��־
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "�û��鿴��Ч������Ϣ(" + this.lblJXName.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();

            //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

            //��ȡ��̬������        
            DataSet CanShuDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select ItemName,ID from ERPJiXiaoCanShu order by BackInfo");

            //�����ݵ��б���
            DataSet UserDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select UserName from ERPUser order by UserName asc");

            //�ϼ�������
            string HeJiStr = "<tr><td align=center height=30px style=\"background-color: #ffffff\">�ϼ�</td><td align=center style=\"background-color: #ffffff\"></td>";

            //���ɱ��ͷ����������
            Label1.Text = "<table width=100% bgcolor=\"#999999\" border=\"0\" cellpadding=\"2\" cellspacing=\"1\" ><tr><td align=center height=30px style=\"background-color: #ffffff\">���</td><td align=center style=\"background-color: #ffffff\">�û���</td>";
            for (int i = 0; i < CanShuDT.Tables[0].Rows.Count; i++)
            {
                Label1.Text = Label1.Text + "<td align=center style=\"background-color: #ffffff\">" + CanShuDT.Tables[0].Rows[i]["ItemName"].ToString() + "</td>";
                HeJiStr = HeJiStr + "<td align=center style=\"background-color: #ffffff\">" + GetFenXiangHeJi(i.ToString(), UserDT, CanShuDT) + "</td>";
            }
            Label1.Text = Label1.Text + "<td align=center style=\"background-color: #ffffff\">С��</td></tr>";
            HeJiStr = HeJiStr + "<td align=center style=\"background-color: #ffffff\">" + GetZongTiHeJi(UserDT, CanShuDT) + "</td></tr>";


            //����������
            for (int j = 0; j < UserDT.Tables[0].Rows.Count; j++)
            {
                Label1.Text = Label1.Text + "<tr><td align=center height=30px style=\"background-color: #ffffff\">" + (j + 1).ToString() + "</td>";
                Label1.Text = Label1.Text + "<td align=center height=30px style=\"background-color: #ffffff\">" + UserDT.Tables[0].Rows[j]["UserName"].ToString() + "</td>";

                for (int K = 0; K < CanShuDT.Tables[0].Rows.Count; K++)
                {
                    Label1.Text = Label1.Text + "<td align=center style=\"background-color: #ffffff\"><INPUT readOnly style=\"border:0px\"  value=\"" + ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 NumStr from ERPJXDetails where JXID=" + Request.QueryString["ID"].ToString() + " and ItemsID=" + CanShuDT.Tables[0].Rows[K]["ID"].ToString() + " and UserName='" + UserDT.Tables[0].Rows[j]["UserName"].ToString() + "'") + "\" id=InP-" + j.ToString() + "-" + K.ToString() + " name=InP-" + UserDT.Tables[0].Rows[j]["UserName"].ToString() + "-" + CanShuDT.Tables[0].Rows[K]["ID"].ToString() + " SIZE=10></td>";
                }
                Label1.Text = Label1.Text + "<td align=center style=\"background-color: #ffffff\">" + GetUserXiaoJi(j.ToString(), UserDT, CanShuDT) + "</td>";
            }
            Label1.Text = Label1.Text + "</tr>";


            Label1.Text = Label1.Text + HeJiStr + "</table>";
		}
	}

    /// <summary>
    /// ��������ĺϼ�����
    /// </summary>
    /// <returns></returns>
    public string GetZongTiHeJi(DataSet UserData, DataSet CanShuData)
    {
        string ReturnStr = "<INPUT readOnly  style=\"border:0px\" id=\"ZongJiTongJi\" name=\"ZongJiTongJi\" SIZE=10>";
        string DingYiBianLiang = "";//��������������������������ӡ�
        string ShuZhiAdd = "0";//��ӵ���ֵ
        for (int j = 0; j < CanShuData.Tables[0].Rows.Count; j++)
        {
            DingYiBianLiang = DingYiBianLiang + "var Item" + j.ToString() + "=0;Item" + j.ToString() + "=document.getElementById(\"FenXiang" + j.ToString() + "\").value/1;";
            ShuZhiAdd = ShuZhiAdd + "+Item" + j.ToString() + "";
        }
        //���js����
        ReturnStr = ReturnStr + "<script>function Load_ZongJi(){setTimeout(\"Load_ZongJi()\",5000);" + DingYiBianLiang + "document.getElementById(\"ZongJiTongJi\").value=" + ShuZhiAdd + ";}</script><script>Load_ZongJi();</script>";
        return ReturnStr;
    }

    /// <summary>
    /// ���ط���ĺϼ�����
    /// </summary>
    /// <param name="FenXiangNum">�����ڲ����ж�Ӧ��˳���</param>
    /// <returns></returns>
    public string GetFenXiangHeJi(string FenXiangNum, DataSet UserData, DataSet CanShuData)
    {
        string ReturnStr = "<INPUT readOnly  style=\"border:0px\" id=FenXiang" + FenXiangNum + " name=FenXiang" + FenXiangNum + " SIZE=10>";
        string DingYiBianLiang = "";//��������������������������ӡ�
        string ShuZhiAdd = "0";//��ӵ���ֵ
        for (int j = 0; j < UserData.Tables[0].Rows.Count; j++)
        {
            //InP-" + j.ToString() + "-" + K.ToString() + "
            DingYiBianLiang = DingYiBianLiang + "var Item" + j.ToString() + "=0;Item" + j.ToString() + "=document.getElementById(\"InP-" + j.ToString() + "-" + FenXiangNum + "\").value/1;";
            ShuZhiAdd = ShuZhiAdd + "+Item" + j.ToString() + "";
        }
        //���js����
        ReturnStr = ReturnStr + "<script>function Load_DoFenXiang" + FenXiangNum + "(){setTimeout(\"Load_DoFenXiang" + FenXiangNum + "()\",5000);" + DingYiBianLiang + "document.getElementById(\"FenXiang" + FenXiangNum + "\").value=" + ShuZhiAdd + ";}</script><script>Load_DoFenXiang" + FenXiangNum + "();</script>";
        return ReturnStr;
    }

    /// <summary>
    /// ����һ�е�С������
    /// </summary>
    /// <param name="UserNum">�û���Data�ж�Ӧ��˳���</param>
    /// <returns></returns>
    public string GetUserXiaoJi(string UserNum, DataSet UserData, DataSet CanShuData)
    {
        string ReturnStr = "<INPUT readOnly  style=\"border:0px\" id=XiaoJi" + UserNum + " name=XiaoJi" + UserNum + " SIZE=10>";
        string DingYiBianLiang = "";//��������������������������ӡ�
        string ShuZhiAdd = "0";//��ӵ���ֵ
        for (int j = 0; j < CanShuData.Tables[0].Rows.Count; j++)
        {
            //InP-" + j.ToString() + "-" + K.ToString() + "
            DingYiBianLiang = DingYiBianLiang + "var Item" + j.ToString() + "=0;Item" + j.ToString() + "=document.getElementById(\"InP-" + UserNum.ToString() + "-" + j.ToString() + "\").value/1;";
            ShuZhiAdd = ShuZhiAdd + "+Item" + j.ToString() + "";
        }
        //���js����
        ReturnStr = ReturnStr + "<script>function Load_DoXiaoJi" + UserNum + "(){setTimeout(\"Load_DoXiaoJi" + UserNum + "()\",5000);" + DingYiBianLiang + "document.getElementById(\"XiaoJi" + UserNum + "\").value=" + ShuZhiAdd + ";}</script><script>Load_DoXiaoJi" + UserNum + "();</script>";
        return ReturnStr;
    }
}
