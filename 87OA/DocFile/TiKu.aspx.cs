
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

public partial class DocFile_TiKu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview("");

            //�趨��ťȨ��            
            ImageButton1.Visible = ZWL.Common.PublicMethod.StrIFIn("|044A|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton5.Visible = ZWL.Common.PublicMethod.StrIFIn("|044M|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton3.Visible = ZWL.Common.PublicMethod.StrIFIn("|044D|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));
            ImageButton2.Visible = ZWL.Common.PublicMethod.StrIFIn("|044E|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));

            if (Request.QueryString["TiKuID"].ToString().Trim() == "0")
            {
                ImageButton1.Visible = false;
                ImageButton2.Visible = false;
                ImageButton3.Visible = false;
                ImageButton5.Visible = false;
            }

            this.Label1.Text = "[" + ZWL.DBUtility.DbHelperSQL.GetSHSL("select TiKuName from ERPTiKuType where ID=" + Request.QueryString["TiKuID"].ToString().Trim()) + "-" + Request.QueryString["FenLeiStr"].ToString() + "]";

            //�ж���ʾ��Щ��
            if (Request.QueryString["FenLeiStr"].ToString() == "�ж���")
            {
                this.GVData.Columns[4].Visible = false;
                this.GVData.Columns[5].Visible = false;
            }
            else if (Request.QueryString["FenLeiStr"].ToString() == "�����" || Request.QueryString["FenLeiStr"].ToString() == "�����")
            {
                this.GVData.Columns[2].Visible = false;
                this.GVData.Columns[3].Visible = false;
                this.GVData.Columns[4].Visible = false;
                this.GVData.Columns[5].Visible = false;
            }
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
		ZWL.BLL.ERPTiKu MyModel = new ZWL.BLL.ERPTiKu();
		if (IDList.Trim().Length > 0)
		{
            GVData.DataSource = MyModel.GetList(" " + DropDownList2.SelectedItem.Value.ToString() + " like '%" + this.TextBox3.Text.Trim() + "%' and ID in(" + IDList + ") and TiKuID=" + Request.QueryString["TiKuID"].ToString() + " and FenLeiStr='" + Request.QueryString["FenLeiStr"].ToString() + "' order by ID desc");
		}
		else
		{
            GVData.DataSource = MyModel.GetList(" " + DropDownList2.SelectedItem.Value.ToString() + " like '%" + this.TextBox3.Text.Trim() + "%'  and TiKuID=" + Request.QueryString["TiKuID"].ToString() + " and FenLeiStr='" + Request.QueryString["FenLeiStr"].ToString() + "'  order by ID desc");
		}
		GVData.DataBind();
		LabPageSum.Text = Convert.ToString(GVData.PageCount);
		LabCurrentPage.Text = Convert.ToString(((int)GVData.PageIndex + 1));
		this.GoPage.Text = LabCurrentPage.Text.ToString();
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		Response.Redirect("TiKuAdd.aspx?TiKuID=" + Request.QueryString["TiKuID"].ToString() + "&FenLeiStr=" + Request.QueryString["FenLeiStr"].ToString());
	}
	protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
	{
		string IDlist = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
		if (ZWL.DBUtility.DbHelperSQL.ExecuteSQL("delete from ERPTiKu where ID in (" + IDlist + ")") == -1)
		{
			Response.Write("<script>alert('ɾ��ѡ�м�¼ʱ�������������µ�½�����ԣ�');</script>");
		}
		else
		{
			DataBindToGridview("");
			//дϵͳ��־
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "�û�ɾ����������Ϣ";
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
		MyTable.Add("TitleStr", "��Ŀ����");
		MyTable.Add("ItemsA", "A");
		MyTable.Add("ItemsB", "B");
		MyTable.Add("ItemsC", "C");
		MyTable.Add("ItemsD", "D");
		MyTable.Add("ItemsE", "E");
		MyTable.Add("ItemsF", "F");
		MyTable.Add("ItemsG", "G");
		MyTable.Add("ItemsH", "H");
		MyTable.Add("AnswerStr", "��ȷ��");
		ZWL.Common.DataToExcel.GridViewToExcel(ZWL.DBUtility.DbHelperSQL.GetDataSet("select  TitleStr,ItemsA,ItemsB,ItemsC,ItemsD,ItemsE,ItemsF,ItemsG,ItemsH,AnswerStr  from ERPTiKu where ID in (" + IDList + ") order by ID desc"), MyTable, "Excel����");
	}
	protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
	{
		string CheckStr = ZWL.Common.PublicMethod.CheckCbx(this.GVData, "CheckSelect", "LabVisible");
		string[] CheckStrArray = CheckStr.Split(',');
        Response.Redirect("TiKuModify.aspx?ID=" + CheckStrArray[0].ToString() + "&TiKuID=" + Request.QueryString["TiKuID"].ToString() + "&FenLeiStr=" + Request.QueryString["FenLeiStr"].ToString());
	}
}
