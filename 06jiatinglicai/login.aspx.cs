using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //�û���¼
    protected void Button1_Click(object sender, EventArgs e)
    {
        string err = "";

        //�ж�����
        if (lname.Value == "")
        {
            err += "�û�������Ϊ��!";
        }

        if (pwd.Value == "")
        {
            err += "���벻��Ϊ��!";
        }

        //��֤���룬������Ϸ��͵�����Ӧ��ʾ��������
        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        SqlDataReader sdr = null;
        if (DropDownList1.SelectedValue == "����Ա")
        {
            sdr = SqlHelper.ExecuteReader("select * from admin where adminLname='" + lname.Value + "' and adminPass='" + pwd.Value + "'");
        }
        else
        {
            sdr = SqlHelper.ExecuteReader("select * from family where family_Lname='" + lname.Value + "' and family_Pass='" + pwd.Value + "'");
        }


        //�ж��û��Ƿ����
        if (sdr.Read())
        {
            //���û���Ϣ���뵽Session
            if (DropDownList1.SelectedValue == "����Ա")
            {
                Session["uno"] = sdr["adminId"].ToString();
                Session["uname"] = sdr["adminLname"].ToString();
            }
            else
            {
                Session["uno"] = sdr["family_Id"].ToString();
                Session["uname"] = sdr["family_Name"].ToString();
            }
           
            Session["power"] = DropDownList1.SelectedValue;           

            //��ת����̨
            Response.Redirect("index.html");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('�û�����������������ԣ�');</script>");
            return;
        }
    }
}
