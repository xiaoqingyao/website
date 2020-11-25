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

public partial class GongGao_VoteYiPiao : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ZWL.BLL.ERPVote MyModel = new ZWL.BLL.ERPVote();
        MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
        string[] ScoreList = MyModel.ScoreStr.Split('|');
        //当前得票数
        string DangQianInt = ScoreList[int.Parse(Request.QueryString["TouPiaoTextID"].ToString())];
        //得票+1
        int NewCount = int.Parse(DangQianInt) + 1;
        ScoreList[int.Parse(Request.QueryString["TouPiaoTextID"].ToString())] = NewCount.ToString();

        //获得新的得票数序列
        string UpdateStr = string.Empty;
        for (int i = 0; i < ScoreList.Length; i++)
        {
            if (UpdateStr.Length > 0)
            {
                UpdateStr = UpdateStr + "|" + ScoreList[i].ToString();
            }
            else
            {
                UpdateStr = UpdateStr + ScoreList[i].ToString();
            }
        }
        //更新投票，并把当前用户加入已投票用户
        string SqlStr = "update ERPVote set ScoreStr='" + UpdateStr + "',TouPiaoRenList=TouPiaoRenList+'|" + ZWL.Common.PublicMethod.GetSessionValue("UserName") +"|' where ID=" + Request.QueryString["ID"].ToString();
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL(SqlStr);
        Response.Write("<script>alert('投票成功！');window.location='VoteView.aspx?ID=" + Request.QueryString["ID"].ToString() + "'</script>");
    }
}
