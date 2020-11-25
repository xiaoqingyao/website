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
	/// Verify 的摘要说明。
	/// </summary>
	public partial class Verify : System.Web.UI.Page
	{
        Common com = new Common();
        EntPersonal obj = new EntPersonal();
        CtlPersonal ctl = new CtlPersonal();
        DataTable dt = new DataTable();	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
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

		#region Web 窗体设计器生成的代码
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion

 
        protected void bnOk_Click(object sender, EventArgs e)
        {
            if (this.txtPerName.Text == "admin")
            {
                com.Alert("该用户不能注册");
                return;
            }

            string validateCode = Session["CheckCode"].ToString();
            if (this.txtValidateCode.Text == validateCode.ToLower())
            {
            }
            else
            {
                com.Alert("验证码不正确,请重新输入");
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
                    string name = filePhoto.PostedFile.FileName; // 客户端文件路径 
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
                    com.Alert("上传图标类型不对!");
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
                    com.Alert("注册成功.");
                    Session["PerName"] = obj.perName;

                    Response.Redirect("PersonalManager.aspx");
                }
                else
                {
                    //com.Alert("注册不成功");
                }
            }
            catch (Exception ex)
            {
                com.Alert("对不起注册不成功,请重新注册." + ex.Message.ToString());
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
                com.Alert("请输入用户名");
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
                com.Alert("您可以使用该帐号");
            }
            else
            {
                com.Alert("对不起,该帐号已有人使用");
            }
        }
}
}
