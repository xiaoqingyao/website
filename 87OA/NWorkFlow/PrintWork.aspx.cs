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

public partial class NWorkFlow_PrintWork : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //读取
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPNWorkToDo MyModel = new ZWL.BLL.ERPNWorkToDo();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label3.Text = MyModel.FormContent;
            this.Label1.Text = MyModel.ShenPiYiJian;

            //不改变字体颜色            
            this.Label3.Text = this.Label3.Text.Replace("disabled", "readonly").Replace("hidden", "visible"); ;//将所有的 disabled 去除掉，取消隐藏

            this.Label3.Text = this.Label3.Text.Replace("1px solid", " 0px solid ");//将所有的底部线条去除掉

            this.Label3.Text = this.Label3.Text.Replace("id=CHK", "style=\"position:absolute;clip: rect(6 17 17 6);background-color:#FFFFFF\" id=CHK");//将CheckBox框的边框去掉

            this.Label3.Text = this.Label3.Text.Replace("id=Drop", "style=\"width:150px;position:absolute;clip: rect(2 130 18 2);background-color:#FFFFFF\" id=Drop");//将下拉框的边框去掉

            this.Label3.Text = this.Label3.Text.Replace("#d8d8d8\" id=TextArea", "#d8d8d8;overflow-x:hidden;overflow-y:hidden;\" id=TextArea");//将多行文本框的滚动条去除

        }
    }
}
