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
using System.Data.SqlClient;
public partial class Admin_ModifyUser : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        
            Get_Data();
        }
    }
 
    private void Get_Data()
    {
        int id = int.Parse(Session["UserId"].ToString());

        SqlDataReader dr;
        dr = data.GetDataReader("select * from  UserInfo where id=" + id);
        dr.Read();
        Name.Text = dr["Name"].ToString();
        loginName.Text = dr["loginName"].ToString();
        NianLing.Text = dr["NianLing"].ToString();
        Ds.Text = dr["Ds"].ToString();

        SFZ.Text = dr["SFZ"].ToString();
        XueLI.Text = dr["XueLI"].ToString();
        TEl.Text = dr["TEl"].ToString();
        if (Convert.ToString(dr["Sex"]).Trim() == "男")
        {
            Sex.SelectedIndex = 0;
        }
        if (Convert.ToString(dr["Sex"]).Trim() == "女")
        {
            Sex.SelectedIndex = 1;
        }
    


    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int id = int.Parse(Session["UserId"].ToString());
        data.RunSql("update   UserInfo set  Name='" + Name.Text + "', loginName='" + loginName.Text + "',NianLing='" + NianLing.Text + "' ,Sex='" + Sex.SelectedValue + "',Ds='" + Ds.Text + "',SFZ='" + SFZ.Text + "',XueLI='" + XueLI.Text + "',TEl='" + TEl.Text + "'   where id=" + id);

        Alert.AlertAndRedirect("修改成功！", "ModifyUser.aspx");
    }
}
