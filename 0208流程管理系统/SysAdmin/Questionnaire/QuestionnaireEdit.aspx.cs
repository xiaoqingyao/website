using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using AllPower.Common;

namespace AllPower.WEB.SysAdmin.Questionnaire
{
    public partial class QuestionnaireEdit : System.Web.UI.Page
    {
        private string action;
        protected string jsMessage;

        protected void Page_Load(object sender, EventArgs e)
        {
            action = Request.QueryString["action"];

            if (!IsPostBack)
            {
                PageInit();
            }
        }

        void PageInit()
        {
            DataTable dt;
            DataRow dr;
            SqlDataReader sqlReader;
            SqlParameter[] selParam;

            dt = new DataTable();
            selParam = new SqlParameter[]{new SqlParameter("@ID",Request.QueryString["ID"])};

            if (action == "edit")
            {
                btnEdit.Text = "修改";
            }

            try
            {
                sqlReader = SQLHelper.ExecuteReader(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, "select * from K_Questionnaire where ID=@ID", selParam);
                dt.Load(sqlReader);
            }
            catch { dt = null; }

            if (dt != null && dt.Rows.Count > 0)
            {
                dr = dt.Rows[0];
                txtTitle.Text = dr["Title"].ToString();
                txtIntegral.Text = dr["Integral"].ToString();
                txtBulletin.Text = dr["Bulletin"].ToString();
                txtEmailTemplate.Text = dr["EmailTemplate"].ToString();
                chkIsEnable.Checked = Common.Utils.ParseBool(dr["IsEnable"]);
                chkIsSendEmail.Checked = Common.Utils.ParseBool(dr["IsSendEmail"]);

                if (chkIsSendEmail.Checked)
                {
                    txtSendEmail.Text = dr["SendEmail"].ToString();
                    txtPort.Text = dr["Port"].ToString();
                    txtEmailUID.Text = dr["EmailUID"].ToString();
                    txtEmailSmtp.Text = dr["EmailSmtp"].ToString();
                    txtEmailPWD.Text = dr["EmailPWD"].ToString();
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string editSQL;
            List<SqlParameter> lstEditParam;
            int effectRow;

            lstEditParam = new List<SqlParameter>();

            effectRow = 0;

            if (action == "edit")
            {
                lstEditParam.Add(new SqlParameter("@ID", Request.QueryString["ID"]));
                editSQL = "update K_Questionnaire set EmailSmtp=@EmailSmtp,EmailUID=@EmailUID,EmailPWD=@EmailPWD,Port=@Port,SendEmail=@SendEmail, Title=@Title,Bulletin=@Bulletin,EmailTemplate=@EmailTemplate,Integral=@Integral,IsEnable=@IsEnable,IsSendEmail=@IsSendEmail where ID=@ID";
            }
            else
            {
                editSQL = "insert into K_Questionnaire(Title,Bulletin,EmailTemplate,Integral,IsEnable,IsSendEmail,EmailSmtp,EmailUID,EmailPWD,Port,SendEmail)values(@Title,@Bulletin,@EmailTemplate,@Integral,@IsEnable,@IsSendEmail,@EmailSmtp,@EmailUID,@EmailPWD,@Port,@SendEmail)";
            }

            lstEditParam.Add(new SqlParameter("@Title", txtTitle.Text.Trim()));
            lstEditParam.Add(new SqlParameter("@Bulletin", txtBulletin.Text.Trim()));
            lstEditParam.Add(new SqlParameter("@EmailTemplate", txtBulletin.Text.Trim()));
            lstEditParam.Add(new SqlParameter("@Integral", Common.Utils.ParseInt(txtBulletin.Text, 0)));
            lstEditParam.Add(new SqlParameter("@IsSendEmail", chkIsSendEmail.Checked));
            lstEditParam.Add(new SqlParameter("@IsEnable", chkIsEnable.Checked));
            lstEditParam.Add(new SqlParameter("@EmailSmtp", txtEmailSmtp.Text.Trim()));
            lstEditParam.Add(new SqlParameter("@EmailUID", txtEmailUID.Text.Trim()));
            lstEditParam.Add(new SqlParameter("@EmailPWD", txtEmailPWD.Text.Trim()));
            lstEditParam.Add(new SqlParameter("@Port", txtPort.Text.Trim()));
            lstEditParam.Add(new SqlParameter("@SendEmail", txtSendEmail.Text.Trim()));

            try
            {
                effectRow = SQLHelper.ExecuteNonQuery(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, editSQL, lstEditParam.ToArray());
            }
            catch { }

            if (effectRow > 0)
            {
                jsMessage = "alertClose({title:\"操作提示\",msg:\"恭喜您，操作成功！\"},function(data){location.href='QuestionnaireList.aspx';});";
            }
            else
            {
                jsMessage = "alert({title:\"操作提示\",msg:\"对不起，操作失败，请重试。\"});";
            }
        }

    }
}
