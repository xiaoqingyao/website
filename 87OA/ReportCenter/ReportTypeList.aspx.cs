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

public partial class ReportCenter_ReportTypeList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindTree();
        }
    }
    private void BindTree()
    {
        //先绑定所有分类，作为根节点
        DataSet MyDataSet1 = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPReportType order by PaiXuStr asc,ID desc");
        for (int j = 0; j < MyDataSet1.Tables[0].Rows.Count; j++)
        {
            TreeNode MyNode = new TreeNode();
            MyNode.Text = MyDataSet1.Tables[0].Rows[j]["TypeName"].ToString();
            MyNode.Value = MyDataSet1.Tables[0].Rows[j]["ID"].ToString();
            MyNode.ToolTip = MyDataSet1.Tables[0].Rows[j]["BackInfo"].ToString();
            MyNode.ImageUrl = "../images/Dir.gif";
            MyNode.NavigateUrl = "Report.aspx?TypeID=" + MyDataSet1.Tables[0].Rows[j]["ID"].ToString();
            MyNode.Target = "Mid2";
            this.ListTreeView.Nodes.Add(MyNode);
        }
    }
}
