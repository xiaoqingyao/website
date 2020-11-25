using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Data;
using System.Data.SqlClient;

namespace AllPower.WEB.SysAdmin.Questionnaire
{
    public partial class QuestionnaireItemList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        protected void SetIsEnable(object sender, CommandEventArgs e)
        {
            string editSQL;
            List<SqlParameter> lstEditParam;

            lstEditParam = new List<SqlParameter>();

            lstEditParam.Add(new SqlParameter("@ID", e.CommandName));
            editSQL = "update K_QuestionnaireItem set IsEnable=@IsEnable where ID=@ID";

            if (Common.Utils.ParseBool(e.CommandArgument))
            {
                lstEditParam.Add(new SqlParameter("@IsEnable", false));
            }
            else
            {
                lstEditParam.Add(new SqlParameter("@IsEnable", true));
            }

            try
            {
                SQLHelper.ExecuteNonQuery(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, editSQL, lstEditParam.ToArray());
            }
            catch { }

            PageInit();
        }

        protected void Delete(object sender, CommandEventArgs e)
        {
            string editSQL;
            List<SqlParameter> lstEditParam;

            lstEditParam = new List<SqlParameter>();

            lstEditParam.Add(new SqlParameter("@ID", e.CommandArgument));
            editSQL = "DELETE FROM  K_QuestionnaireItem where ID=@ID";

            try
            {
                SQLHelper.ExecuteNonQuery(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, editSQL, lstEditParam.ToArray());
            }
            catch { }

            Response.Redirect("QuestionnaireItemList.aspx");

        }

        void PageInit()
        {
            DataTable dt;
            SqlDataReader sqlReader;
            string selSQL;
            SqlParameter[] selParam;

            dt = new DataTable();
            selParam = new SqlParameter[] { new SqlParameter("@QID",Request.QueryString["QID"]) };
            selSQL = "select * from K_QuestionnaireItem where QID=@QID";

            try
            {
                sqlReader = SQLHelper.ExecuteReader(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, selSQL, selParam);
                dt.Load(sqlReader);
                rptQuest.DataSource = dt;
                rptQuest.DataBind();
            }
            catch { }
        }

        protected string GetItemType(object type)
        {
            string itemType;

            itemType = string.Empty;

            switch (type.ToString().Trim())
            {
                case "1":
                    itemType = "单选";
                    break;
                case "2":
                    itemType = "多选";
                    break;
                case "3":
                    itemType = "问答";
                    break;
            }

            return itemType;
        }
    }
}
