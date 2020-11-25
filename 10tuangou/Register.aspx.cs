using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
using System.Web.Mail;
using System.IO;

namespace ch33
{
	/// <summary>
	/// Verify ��ժҪ˵����
	/// </summary>
	public partial class Verify : System.Web.UI.Page
	{
        Common com = new Common();
        EntPersonal obj = new EntPersonal();
        CtlPersonal ctl = new CtlPersonal();
        DataTable dt = new DataTable();	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// �ڴ˴������û������Գ�ʼ��ҳ��
			AjaxPro.Utility.RegisterTypeForAjax(typeof(Verify));
            bindDdlQues();
		}

		[AjaxPro.AjaxMethod]
		public string GetReturnCode(string strUsername)
		{
            if (!IsValidUsername(strUsername))
            {
                return "1";
            }
            else if ((ctl.selectPersonal(strUsername)).Rows.Count==1)
            {
                return "2";
            }
            else
            {
                return "0";
            }
		}
		private bool IsValidUsername(string strUsername)
		{
			return (Regex.IsMatch(strUsername, @"^(\w{3,15})$"));
		}

		#region Web ������������ɵĴ���
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: �õ����� ASP.NET Web ���������������ġ�
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
		/// �˷��������ݡ�
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion

 
        protected void bnOk_Click(object sender, EventArgs e)
        {
            if (this.txtPerName.Text == "admin")
            {
                com.Alert("���û�����ע��");
                return;
            }

            string validateCode = Session["CheckCode"].ToString();
            if (this.txtValidateCode.Text == validateCode.ToLower())
            {
            }
            else
            {
                com.Alert("��֤�벻��ȷ,����������");
                return;
            }
            obj.perName = this.txtPerName.Text;
            obj.password = this.txtPassword.Text;
            obj.email = this.txtEmail.Text;
            obj.phone = this.txtPhone.Text;
            obj.address = this.ddlAddress.SelectedValue.ToString();
            obj.gender = this.ddlGender.SelectedValue.ToString();
            obj.msn = this.txtMSN.Text;
            obj.qq = this.txtQQ.Text;
            obj.functionId = "001";
            obj.score = "0";
            obj.regDate = System.DateTime.Now.ToString();
            obj.lastLoginDate = System.DateTime.Now.ToString();
            obj.pwQuestion = this.ddlquestion.SelectedValue.ToString();
            obj.pwAnswer = this.txtAnswer.Text;

            if (this.filePhoto.Value != "")
            {
                string sbname;

                String filetype = this.filePhoto.PostedFile.ContentType;
                if (filetype == "image/bmp" || filetype == "image/gif" || filetype == "image/pjpeg")
                {
                    int lent;
                    string name = filePhoto.PostedFile.FileName; // �ͻ����ļ�·�� 
                    System.IO.FileInfo file = new FileInfo(name);
                    lent = file.Name.Length;
                    String h = file.Name.Substring(lent - 4, 4);
                    sbname = (obj.perName + h);// "B" + System.DateTime.Now.ToString().Replace("-", "").Replace(" ", "").Replace(":", "") + h;
                    String path = Server.MapPath("~/Image/Personal/" + sbname);
                    filePhoto.PostedFile.SaveAs(path);
                    obj.photo = sbname;

                }
                else
                {
                    com.Alert("�ϴ�ͼ�����Ͳ���!");
                }


            }
            else
            {
                obj.photo = "moren.jpg";
        
            }

            try
            {
                bool flag = ctl.register(obj);
                if (flag)
                {
                    //sendMailBySmtp();
                    com.Alert("ע��ɹ�.");
                    Session["PerName"] = obj.perName;

                    Response.Redirect("PersonalManager.aspx");
                }
                else
                {
                    //com.Alert("ע�᲻�ɹ�");
                }
            }
            catch (Exception ex)
            {
                com.Alert("�Բ���ע�᲻�ɹ�,������ע��." + ex.Message.ToString());
            }
        }
        public void bindDdlQues()
        {
            try
            {
                dt = ctl.getAllQues();
            }
            catch (Exception ex)
            {
                com.Alert("Error!" + ex.Message.ToString());
            }
            this.ddlquestion.DataSource = dt;
            this.ddlquestion.DataValueField = dt.Columns["questionId"].ToString();
            this.ddlquestion.DataTextField = dt.Columns["question"].ToString();
            this.ddlquestion.DataBind();
        }

        protected void bnCheck_Click(object sender, EventArgs e)
        {
            if (this.txtPerName.Text == "")
            {
                com.Alert("�������û���");
                return;
            }
            try
            {
                dt = ctl.selectPersonal(this.txtPerName.Text);
            }
            catch (Exception ex)
            {
                com.Alert("Error!" + ex.Message.ToString());
            }
            if (dt.Rows.Count == 0)
            {
                com.Alert("������ʹ�ø��ʺ�");
            }
            else
            {
                com.Alert("�Բ���,���ʺ�������ʹ��");
            }
        }
}
}
