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

public partial class communion_vote : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true);
        DataList1.DataSource = bc.GetDataSet("select * from vote","vote");
        DataList1.DataKeyField = "id";
        DataList1.DataBind();
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (Convert.ToString(Session["vote"])!=string.Empty)
        {
           Response.Write(bc.MessageBox("每人只有一次投票机会,谢谢!!"));
           return;
        }
        else
        {
            int voteQty = 0;
            int str = (int)DataList1.DataKeys[e.Item.ItemIndex];
            //检索　原有票　+１
            DataSet ds = bc.GetDataSet("select * from vote where id='" + str + "'", "vote");
            DataRow[] row = ds.Tables[0].Select();
            foreach (DataRow rs in row)  //将检索到的数据逐一,循环添加到Listbox1中
            {
                voteQty = Convert.ToInt16(rs["voteQty"]);
            }
            voteQty = voteQty + 1;


            //更新投票
            bool bl;
            bl = bc.ExecSQL("update vote set voteQty='" + voteQty + "' where id='" + str + "'");
            if (bl)
            {
                Response.Write(bc.MessageBox("投票成功！"));
            }
            DataList1.DataSource = bc.GetDataSet("select * from vote", "vote");
            DataList1.DataKeyField = "id";
            DataList1.DataBind();
            //标记本浏览器已经投过票
            Session["vote"] = "vote";
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
