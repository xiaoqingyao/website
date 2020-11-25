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

namespace OA.aspx.Main{ 
 public partial class MyDeskSetting: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.BLL.ERPUserDesk MyModel = new FTD.BLL.ERPUserDesk();
            DataSet MyDataSet = MyModel.GetList("UserName='"+FTD.Unit.PublicMethod.GetSessionValue("UserName")+"' order by ID asc");
            //记录集行数>0
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < MyDataSet.Tables[0].Rows.Count; i++)
                {
                    //循环在已选中加入
                    ListBox2.Items.Add(MyDataSet.Tables[0].Rows[i]["ModelName"].ToString());
                }
            }

            //权限判定，删除待选列表中，没有权限的项目
            for (int i = 0; i < ListBox1.Items.Count; i++)
            {
                if (FTD.Unit.PublicMethod.StrIFIn("|" + ListBox1.Items[i].Value + "|", FTD.Unit.PublicMethod.GetSessionValue("QuanXian")) == false)
                {
                    this.ListBox1.Items.Remove(ListBox1.Items[i]);
                    //将删除掉的序号加上
                    i--;
                }
            }
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        //删除旧有设置
        FTD.DBUnit.DbHelperSQL.ExecuteSQL("delete ERPUserDesk where UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName")+"'");
        //添加新设置
        for (int i = 0; i < ListBox2.Items.Count; i++)
        {
            FTD.BLL.ERPUserDesk MyModel = new FTD.BLL.ERPUserDesk();
            MyModel.LookNum = 5;
            MyModel.ModelName = ListBox2.Items[i].Text;
            MyModel.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyModel.Add();
        }
        FTD.Unit.MessageBox.ShowAndRedirect(this, "修改桌面设置成功！", "MyDesk.aspx");

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改桌面设置";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
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
                    this.ListBox2.Items[ListBox2.Items.Count-1].Selected = false;
                }
            }
        }
    }
    protected void iButton4_Click(object sender, EventArgs e)
    {
        //向上移动
        ListItem li = ListBox2.SelectedItem;
        int index = ListBox2.SelectedIndex;
        if (index >0)
        {
            ListBox2.Items.Remove(li);
            //上移
            ListBox2.Items.Insert(index - 1, li);
        }
    }
    protected void iButton5_Click(object sender, EventArgs e)
    {
        //向下移动
        ListItem li = ListBox2.SelectedItem;
        int index = ListBox2.SelectedIndex;
        if (index < ListBox2.Items.Count - 1 && index !=-1)
        {
            ListBox2.Items.Remove(li);
            //下移
            ListBox2.Items.Insert(index + 1, li);
        }
    }
}
}