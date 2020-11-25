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

public partial class NWorkFlow_NFormDesign : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPNForm Model = new ZWL.BLL.ERPNForm();
            Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.TxtContent.Text = Model.ContentStr.ToString();
            this.TextBox17.Text = Model.ItemsList.ToString();

            this.Label1.Text ="["+ ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 FormName from ERPNForm where ID="+Request.QueryString["ID"].ToString())+"]";
        }
    }
    /// <summary>
    /// 从现有列表中去除不存在的项，然后重新组合成新的列字符串
    /// </summary>
    /// <param name="NowListItem"></param>
    /// <param name="ContentStr"></param>
    /// <returns></returns>
    private string GetItemList(string NowListItem, string ContentStr)
    {
        string ReturnStr = "";
        string[] ListArray=NowListItem.Split('|');
        for (int i = 0; i < ListArray.Length; i++)
        {
            if(ZWL.Common.PublicMethod.StrIFIn("id=\""+ListArray[i].Split('_')[0].ToString()+"\"",ContentStr)==true)
            {
                ReturnStr = ReturnStr + "|" + ListArray[i];
            }
        }
        return ReturnStr;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPNForm Model = new ZWL.BLL.ERPNForm();

        Model.ID = int.Parse(Request.QueryString["ID"].ToString());
        Model.ContentStr = this.TxtContent.Text.ToString();
        Model.ItemsList = GetItemList(this.TextBox17.Text,this.TxtContent.Text);//  英文_中文|英文_中文|英文_中文
        Model.UpdateBD();

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改流程表单内容(ID：" + Request.QueryString["ID"].ToString() + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ResponseScript(this, "alert('表单内容数据更新完毕！');window.close();");
    }
}
