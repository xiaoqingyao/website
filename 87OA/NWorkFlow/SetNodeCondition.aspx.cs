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

public partial class NWorkFlow_SetNodeCondition : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            //绑定所有字段
            string[] ZiDuanList = ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 ItemsList from ERPNForm where ID=(select top 1 FormID from ERPNWorkFlow where ID=" + Request.QueryString["WorkFlowID"].ToString() + ")").Split('|');
            for (int i = 0; i < ZiDuanList.Length; i++)
            {
                if (ZiDuanList[i].Trim().Length > 0)
                {
                    ListItem MyItem = new ListItem(ZiDuanList[i].Split('_')[1], ZiDuanList[i].Split('_')[0]);
                    this.DropDownList7.Items.Add(MyItem);
                }
            }

            //加载已有项目
            string[] ZiDuanList1 = ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 ConditionSet from ERPNWorkFlowNode where ID=" + Request.QueryString["ID"].ToString()).Split('|');
            for (int i = 0; i < ZiDuanList1.Length; i++)
            {
                if (ZiDuanList1[i].Trim().Length > 0)
                {
                    ListItem MyItem = new ListItem(ZiDuanList1[i]);
                    this.ListBox2.Items.Add(MyItem);
                }
            }
        }
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        //请假天数 '>' 10→3|请假天数 '<=' 10→2 | 请假部门'=='开发部→5
        if (this.TextBox4.Text.Trim().Length > 0 && this.TextBox7.Text.Trim().Length > 0 && this.DropDownList7.SelectedValue.Trim().Length > 0)
        {
            this.ListBox2.Items.Add(this.DropDownList7.SelectedItem.Value + "_" + this.DropDownList7.SelectedItem.Text + "→" + this.DropDownList8.SelectedItem.Text + "→" + this.TextBox4.Text + "→" + this.TextBox7.Text);            
        }
        else
        {
            ZWL.Common.MessageBox.Show(this, "条件字段、条件比较的值与跳转的节点都不可为空！");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < this.ListBox2.Items.Count; i++)
        {
            if (this.ListBox2.Items[i].Selected == true)
            {
                this.ListBox2.Items.Remove(ListBox2.Items[i]);
                //将删除掉的序号加上
                i--;
            }
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string ConditionStr = "";
        for (int i = 0; i < ListBox2.Items.Count; i++)
        {
            ConditionStr = ConditionStr + "|" + ListBox2.Items[i].Value.ToString();
        }

        ZWL.DBUtility.DbHelperSQL.ExecuteSQL("update ERPNWorkFlowNode set ConditionSet='" + ConditionStr + "' where ID=" + Request.QueryString["ID"].ToString());

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户设置条件字段(节点ID：" + Request.QueryString["ID"].ToString() + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "条件字段设置成功！", "NWorkFlowNode.aspx?WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString());
    }
}
