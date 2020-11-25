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

public partial class CRM_CustomSetting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            SetLie();
            DataBindToGridview();            
        }
    }
    public void SetLie()  //选定表名后，绑定所有的列名
    {
        this.DropDownList2.Items.Clear();

        string CustomTextStr = "客户性质|客户来源|所在区域|客户状态|客户类别|客户级别|业务范围|所属行业|客户自定义A|客户自定义B|客户自定义C|收款情况|综合评分|信息化管理|订单及利润情况";
        string CustomValueStr = "XingZhi|LaiYuan|QuYu|ZhuangTai|LeiBie|JiBie|YeWuFanWei|HangYe|CusBakA|CusBakB|CusBakC|CusBakD|CusBakE|BackInfoA|DingDanCount";

        string LinkManTextStr = "性别|所处角色|职务|客户自定义A|客户自定义B|客户自定义C|客户自定义D|客户自定义E";
        string LinkManValueStr = "Sex|SuoChuJiaoSe|ZhiWu|CusBakA|CusBakB|CusBakC|CusBakD|CusBakE";

        string LinkLogTextStr = "联系主题|联系类型|联系结果|客户自定义A|客户自定义B|客户自定义C|客户自定义D|客户自定义E";
        string LinkLogValueStr = "LinkTitle|LinkType|LinkResult|CusBakA|CusBakB|CusBakC|CusBakD|CusBakE";

        string NeedTextStr = "需求内容|需求现状|需要产品|需求偏好|竞争对手|合作意愿|合作几率|需求障碍|客户自定义A|客户自定义B|客户自定义C|客户自定义D|客户自定义E";
        string NeedValueStr = "NeedContent|NeedNow|NeedProduct|NeedLike|JingZhengDuiShou|HeZuoYiYuan|HeZuoJiLv|NeedZhangAi|CusBakA|CusBakB|CusBakC|CusBakD|CusBakE";

        string BaoJiaTextStr = "报价主题|报价类别|报价内容|报价结果|客户自定义A|客户自定义B|客户自定义C|客户自定义D|客户自定义E|备注信息";
        string BaoJiaValueStr = "BaoJiaTitle|BaoJiaType|BaoJiaContent|BaoJiaResult|CusBakA|CusBakB|CusBakC|CusBakD|CusBakE|BackInfo";

        string FuWuTextStr = "服务主题|服务类别|服务结果|客户自定义A|客户自定义B|客户自定义C|客户自定义D|客户自定义E";
        string FuWuValueStr = "FuWuTitle|FuWuType|FuWuResult|CusBakA|CusBakB|CusBakC|CusBakD|CusBakE";

        string HuiFangTextStr = "回访主题|回访类别|回访结果|客户自定义A|客户自定义B|客户自定义C|客户自定义D|客户自定义E";
        string HuiFangValueStr = "HuiFangTitle|HuiFangType|HuiFangResult|CusBakA|CusBakB|CusBakC|CusBakD|CusBakE";

        string TouSuTextStr = "投诉内容|投诉类别|处理结果|客户自定义A|客户自定义B|客户自定义C|客户自定义D|客户自定义E";
        string TouSuValueStr = "TouSuWho|TouSuType|ChuLiResult|CusBakA|CusBakB|CusBakC|CusBakD|CusBakE";

        string SongYangTextStr = "样品编号|送样类型|送样结果|客户自定义A|客户自定义B|客户自定义C|客户自定义D|客户自定义E";
        string SongYangValueStr = "SongYangLiaoHao|SongYangType|SongYangResult|CusBakA|CusBakB|CusBakC|CusBakD|CusBakE";


        string TextStr = "";
        string ValueStr = "";
        if (this.DropDownList1.SelectedItem.Text.Trim() == "客户信息")
        {
            TextStr = CustomTextStr;
            ValueStr = CustomValueStr;
        }
        if (this.DropDownList1.SelectedItem.Text.Trim() == "客户联系人")
        {
            TextStr = LinkManTextStr;
            ValueStr =LinkManValueStr;
        }
        if (this.DropDownList1.SelectedItem.Text.Trim() == "联系记录")
        {
            TextStr =LinkLogTextStr;
            ValueStr =LinkLogValueStr;
        }
        if (this.DropDownList1.SelectedItem.Text.Trim() == "需求记录")
        {
            TextStr =NeedTextStr;
            ValueStr =NeedValueStr;
        }
        if (this.DropDownList1.SelectedItem.Text.Trim() == "报价记录")
        {
            TextStr =BaoJiaTextStr;
            ValueStr = BaoJiaValueStr;
        }
        if (this.DropDownList1.SelectedItem.Text.Trim() == "服务记录")
        {
            TextStr = FuWuTextStr;
            ValueStr = FuWuValueStr;
        }
        if (this.DropDownList1.SelectedItem.Text.Trim() == "回访记录")
        {
            TextStr = HuiFangTextStr;
            ValueStr = HuiFangValueStr;
        }
        if (this.DropDownList1.SelectedItem.Text.Trim() == "投诉记录")
        {
            TextStr = TouSuTextStr;
            ValueStr = TouSuValueStr;
        }
        if (this.DropDownList1.SelectedItem.Text.Trim() == "送样记录")
        {
            TextStr = SongYangTextStr;
            ValueStr = SongYangValueStr;
        }

        string[] TextArray = TextStr.Split('|');
        string[] ValueArray = ValueStr.Split('|');
        for (int jj = 0; jj < TextArray.Length; jj++)
        {
            ListItem MyItem = new ListItem();
            MyItem.Text = TextArray[jj].ToString();
            MyItem.Value = ValueArray[jj].ToString();
            this.DropDownList2.Items.Add(MyItem);
        }
    }
    public void DataBindToGridview()
    {
        GVData.DataSource = ZWL.DBUtility.DbHelperSQL.GetDataTable("select * from ERPCrmSetting where TableName='" + this.DropDownList1.SelectedItem.Value + "' and LieName='"+this.DropDownList2.SelectedItem.Value+"' order by ID desc");
        GVData.DataKeyNames = new string[] { "ID" };
        GVData.DataBind();
    }
    protected void GVData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ZWL.Common.PublicMethod.GridViewRowDataBound(e);
    }    
    protected void GVData_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            string SqlStr = "delete from ERPCrmSetting where ID=" + ID.ToString();
            ZWL.DBUtility.DbHelperSQL.ExecuteSQL(SqlStr);
            DataBindToGridview();
        }
    }
    protected void GVData_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GVData_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVData.EditIndex = e.NewEditIndex;
        DataBindToGridview();
    }
    protected void GVData_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string sqlstr = "update ERPCrmSetting set CanShuName='"
            + ((TextBox)(GVData.Rows[e.RowIndex].Cells[0].Controls[0])).Text.ToString().Trim() + "' where ID="
            + GVData.DataKeys[e.RowIndex].Value.ToString();
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL(sqlstr);
        GVData.EditIndex = -1;
        DataBindToGridview();
    }
    protected void GVData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVData.EditIndex = -1;
        DataBindToGridview();
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {        
        DataBindToGridview();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetLie();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (this.TextBox1.Text.Trim().Length > 0)
        {
            ZWL.DBUtility.DbHelperSQL.ExecuteSQL("insert into ERPCrmSetting(TableName,LieName,CanShuName) values('" + this.DropDownList1.SelectedItem.Value + "','" + this.DropDownList2.SelectedItem.Value + "','" + this.TextBox1.Text + "')");
            ZWL.Common.MessageBox.Show(this, "参数内容添加成功！");
            this.TextBox1.Text = "";
            DataBindToGridview();
        }
    }
}