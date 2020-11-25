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

namespace OA.aspx.GongGao
{
    public partial class VoteView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FTD.Unit.PublicMethod.CheckSession();
                FTD.BLL.ERPVote MyModel = new FTD.BLL.ERPVote();
                MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
                this.Label1.Text = MyModel.TitleStr;
                this.Label2.Text = FTD.Unit.PublicMethod.GetVoteTable(MyModel.ContentStr, MyModel.ScoreStr, Request.QueryString["ID"].ToString(), FTD.Unit.PublicMethod.StrIFIn("|" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "|", FTD.DBUnit.DbHelperSQL.GetSHSL("select TouPiaoRenList from ERPVote where ID=" + Request.QueryString["ID"].ToString())));
                this.Label3.Text = MyModel.UserName;
                this.Label4.Text = MyModel.TimeStr.ToString();
            }
        }
    }
}