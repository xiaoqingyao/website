
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

public partial class Office_SheBei : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview("");

            //�趨��ťȨ��            
            ImageButton1.Visible = ZWL.Common.PublicMethod.StrIFIn("|090A|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton5.Visible = ZWL.Common.PublicMethod.StrIFIn("|090M|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton3.Visible = ZWL.Common.PublicMethod.StrIFIn("|090D|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton2.Visible = ZWL.Common.PublicMethod.StrIFIn("|090E|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
        }
    }
    #region  ��ҳ����
    protected void ButtonGo_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (GoPage.Text.Trim().ToString() == "")
            {
                Response.Write("<script language='javascript'>alert('ҳ�벻����Ϊ��!');</script>");
            }
            else if (GoPage.Text.Trim().ToString() == "0" || Convert.ToInt32(GoPage.Text.Trim().ToString()) > GVData.PageCount)
            {
                Response.Write("<script language='javascript'>alert('ҳ�벻��һ����Чֵ!');</script>");
            }
            else if (GoPage.Text.Trim() != "")
            {
                int PageI = Int32.Parse(GoPage.Text.Trim()) - 1;
                if (PageI >= 0 && PageI < (GVData.PageCount))
                {
                    GVData.PageIndex = PageI;
                }
            }

            if (TxtPageSize.Text.Trim().ToString() == "")
            {
                Response.Write("<script language='javascript'>alert('ÿҳ��ʾ����������Ϊ��!');</script>");
            }
            else if (TxtPageSize.Text.Trim().ToString() == "0")
            {
                Response.Write("<script language='javascript'>alert('ÿҳ��ʾ��������һ����Чֵ!');</script>");
            }
            else if (TxtPageSize.Text.Trim() != "")
            {
                try
                {
                    int MyPageSize = int.Parse(TxtPageSize.Text.ToString().Trim());
                    this.GVData.PageSize = MyPageSize;
                }
                catch
                {
                    Response.Write("<script language='javascript'>alert('ÿҳ��ʾ��������һ����Чֵ!');</script>");
                }
            }

            DataBindToGridview("");
        }
        catch
        {
            DataBindToGridview("");
            Response.Write("<script language='javascript'>alert('��������Ч���֣�');</script>");
        }
    }
    protected void PagerButtonClick(object sender, ImageClickEventArgs e)
    {
        //���Button�Ĳ���ֵ
        string arg = ((ImageButton)sender).CommandName.ToString();
        switch (arg)
        {
            case ("Next"):
                if (this.GVData.PageIndex < (GVData.PageCount - 1))
                    GVData.PageIndex++;
                break;
            case ("Pre"):
                if (GVData.PageIndex > 0)
                    GVData.PageIndex--;
                break;
            case ("Last"):
                try
                {
                    GVData.PageIndex = (GVData.PageCount - 1);
                }
                catch
                {
                    GVData.PageIndex = 0;
                }

                break;
            default:
                //��ҳֵ
                GVData.PageIndex = 0;
                break;
        }
        DataBindToGridview("");
    }
    #endregion
    protected void GVData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ZWL.Common.PublicMethod.GridViewRowDataBound(e);
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        //������һ�β�ѯ���
        string JJ = "0";
        for (int i = 0; i < this.GVData.Rows.Count; i++)
        {
            Label LabV = (Label)GVData.Rows[i].FindControl("LabVisible");
            JJ = JJ + "," + LabV.Text.Trim();
        }
        DataBindToGridview(JJ);
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        DataBindToGridview("");
    }
	public void DataBindToGridview(string IDList)
	{
		ZWL.BLL.ERPSheBei MyModel = new ZWL.BLL.ERPSheBei();
		if (IDList.Trim().Length > 0)
		{
		    GVData.DataSource = MyModel.GetList(" " + DropDownList2.SelectedItem.Value.ToString() + " like '%" + this.TextBox3.Text.Trim() + "%' and ID in(" + IDList + ") order by ID desc");
		}
		else
		{
		    GVData.DataSource = MyModel.GetList(" " + DropDownList2.SelectedItem.Value.ToString() + " like '%" + this.TextBox3.Text.Trim() + "%' order by ID desc");
		}
		GVData.DataBind();
		LabPageSum.Text = Convert.ToString(GVData.PageCount);
		LabCurrentPage.Text = Convert.ToString(((int)GVData.PageIndex + 1));
		this.GoPage.Text = LabCurrentPage.Text.ToString();
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		Response.Redirect("SheBeiAdd.aspx");
	}
	protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
	{
		string IDlist = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
		if (ZWL.DBUtility.DbHelperSQL.ExecuteSQL("delete from ERPSheBei where ID in (" + IDlist + ")") == -1)
		{
			Response.Write("<script>alert('ɾ��ѡ�м�¼ʱ�������������µ�½�����ԣ�');</script>");
		}
		else
		{
			DataBindToGridview("");
			//дϵͳ��־
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "�û�ɾ�������豸��Ϣ";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
		}
	}
	protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
	{
		string IDList = "0";
		for (int i = 0; i < GVData.Rows.Count; i++)
		{
			Label LabVis = (Label)GVData.Rows[i].FindControl("LabVisible");
			IDList = IDList + "," + LabVis.Text.ToString();
		}
		Hashtable MyTable = new Hashtable();
		MyTable.Add("SheBeiName", "�豸����");
		MyTable.Add("YuanBianHao", "ԭ�ʲ����");
		MyTable.Add("CaiWuBianHao", "������");
		MyTable.Add("JiBuBianHao", "���ʲ����");
		MyTable.Add("SheBeiLeiBie", "�豸���");
		MyTable.Add("XingHao", "�ͺ�");
		MyTable.Add("XiangMu", "��Ŀ");
		MyTable.Add("ChuChangBianHao", "�������");
		MyTable.Add("ShiYongBuMen", "ʹ�ò���");
		MyTable.Add("ShengChanChangJia", "��������");
		MyTable.Add("DanWei", "��λ");
		MyTable.Add("DanJia", "����(Ԫ)");
		MyTable.Add("SuYuanFangShi", "��Դ��ʽ");
		MyTable.Add("SuYaunDanWei", "��Դ��λ");
		MyTable.Add("SuYuanZhouQi", "��Դ����(��)");
		MyTable.Add("ShangCiSuYuanDate", "�ϴ���Դ����");
		MyTable.Add("JiHuaSuYaunDate", "�ƻ���Դ����");
		MyTable.Add("ZhengShuBianHao", "֤����");
		MyTable.Add("CeLiangFanWei", "�춨/У׼���-������Χ");
		MyTable.Add("BuQueDingDu", "��ȷ���Ȼ�׼ȷ�ȵȼ�������������");
		MyTable.Add("ShiYongCeLiangFanWei", "ʹ��Ҫ��--������Χ");
		MyTable.Add("JingDu", "����");
		MyTable.Add("JieGuoPingJia", "У׼�������");
		MyTable.Add("PingJiaUser", "������Ա");
		MyTable.Add("QianZiDate", "ǩ������");
		MyTable.Add("ZhengGai", "�������ݼ����");
		MyTable.Add("ChuCiSuYuanDate", "������Դ����");
		MyTable.Add("QiYongDate", "��������");
		MyTable.Add("CunFangAddr", "���λ��");
		MyTable.Add("GuanLiUser", "������");
		MyTable.Add("JiFei", "�춨�Ʒ�");
		MyTable.Add("ZhuangTai", "�豸״̬");
		MyTable.Add("BeiZhu", "��ע");
		MyTable.Add("HeDuiUser", "�˶���");
		MyTable.Add("TiXingDate", "��������");
		MyTable.Add("TiXingUser", "��������");
		MyTable.Add("UserName", "¼����");
		MyTable.Add("TimeStr", "¼��ʱ��");
		ZWL.Common.DataToExcel.GridViewToExcel(ZWL.DBUtility.DbHelperSQL.GetDataSet("select  SheBeiName,YuanBianHao,CaiWuBianHao,JiBuBianHao,SheBeiLeiBie,XingHao,XiangMu,ChuChangBianHao,ShiYongBuMen,ShengChanChangJia,DanWei,DanJia,SuYuanFangShi,SuYaunDanWei,SuYuanZhouQi,ShangCiSuYuanDate,JiHuaSuYaunDate,ZhengShuBianHao,CeLiangFanWei,BuQueDingDu,ShiYongCeLiangFanWei,JingDu,JieGuoPingJia,PingJiaUser,QianZiDate,ZhengGai,ChuCiSuYuanDate,QiYongDate,CunFangAddr,GuanLiUser,JiFei,ZhuangTai,BeiZhu,HeDuiUser,TiXingDate,TiXingUser,UserName,TimeStr  from ERPSheBei where ID in (" + IDList + ") order by ID desc"), MyTable, "Excel����");
	}
	protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
	{
		string CheckStr = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
		string[] CheckStrArray = CheckStr.Split(',');
		Response.Redirect("SheBeiModify.aspx?ID=" + CheckStrArray[0].ToString());
	}
}
