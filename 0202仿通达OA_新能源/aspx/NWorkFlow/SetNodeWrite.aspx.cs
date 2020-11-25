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
 public partial class SetNodeWrite: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            
            //绑定所有的可写字段
            string[] ZiDuanList = FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 ItemsList from ERPNForm where ID=(select top 1 FormID from ERPNWorkFlow where ID="+Request.QueryString["WorkFlowID"].ToString()+")").Split('|');
            for (int i = 0; i < ZiDuanList.Length; i++)
            {
                if (ZiDuanList[i].Trim().Length > 0)
                {
                    ListItem MyItem = new ListItem(ZiDuanList[i].Split('_')[1], ZiDuanList[i].Split('_')[0]);
                    this.ListBox1.Items.Add(MyItem);
                }
            }

            //绑定当前节点已有选定的字段项目
            string[] ZiDuanList1 = FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 CanWriteSet from ERPNWorkFlowNode where ID="+Request.QueryString["ID"].ToString()).Split('|');
            for (int i = 0; i < ZiDuanList1.Length; i++)
            {
                if (ZiDuanList1[i].Trim().Length > 0)
                {
                    ListItem MyItem = new ListItem(ZiDuanList1[i].Split('_')[1], ZiDuanList1[i].Split('_')[0]);
                    this.ListBox2.Items.Add(MyItem);
                }
            }
        }
    }
    protected void iButton3_Click(object sender, EventArgs e)
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
    protected void iButton2_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < this.ListBox1.Items.Count; i++)
        {
            if (this.ListBox1.Items[i].Selected == true)
            {
                //备选列表中是否已存在
                if (ListBox2.Items.IndexOf(ListBox1.Items[i]) < 0)
                {
                    //选中项写入备选列表中
                    this.ListBox2.Items.Add(this.ListBox1.Items[i]);
                    this.ListBox2.Items[ListBox2.Items.Count - 1].Selected = false;
                }
            }
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        string CanWriteStr = "";
        for (int i = 0; i < ListBox2.Items.Count; i++)
        {
            CanWriteStr = CanWriteStr + "|" + ListBox2.Items[i].Value.ToString() + "_" + ListBox2.Items[i].Text.ToString();
        }

        FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPNWorkFlowNode set CanWriteSet='" + CanWriteStr + "' where ID="+Request.QueryString["ID"].ToString());

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户设置可写字段(节点ID：" + Request.QueryString["ID"].ToString() + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "可写字段设置成功！", "NWorkFlowNode.aspx?WorkFlowID=" + Request.QueryString["WorkFlowID"].ToString());
    }
}
}