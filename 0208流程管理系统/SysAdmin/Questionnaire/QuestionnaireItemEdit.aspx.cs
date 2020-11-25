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
    public partial class QuestionnaireItemEdit : System.Web.UI.Page
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
            selParam = new SqlParameter[] { new SqlParameter("@ID", Request.QueryString["ID"]) };

            if (action == "edit")
            {
                btnEdit.Text = "修改";
            }

            try
            {
                sqlReader = SQLHelper.ExecuteReader(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, "select * from K_QuestionnaireItem where ID=@ID", selParam);
                dt.Load(sqlReader);
            }
            catch { dt = null; }

            if (dt != null && dt.Rows.Count > 0)
            {
                dr = dt.Rows[0];
                txtTitle.Text = dr["Title"].ToString();
                txtItem.Text = dr["Item"].ToString();
                radlItemType.SelectedValue = dr["ItemType"].ToString();
                chkIsEnable.Checked = Common.Utils.ParseBool(dr["IsEnable"]);
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
                editSQL = "update K_QuestionnaireItem set Title=@Title,ItemType=@ItemType,Item=@Item,IsEnable=@IsEnable,ItemCount=@ItemCount where ID=@ID";
            }
            else
            {
                lstEditParam.Add(new SqlParameter("@QID", Request.QueryString["QID"]));
                editSQL = "insert into K_QuestionnaireItem(Title,ItemType,Item,QID,IsEnable,ItemCount)values(@Title,@ItemType,@Item,@QID,@IsEnable,@ItemCount)";
            }

            lstEditParam.Add(new SqlParameter("@ItemCount",txtItem.Text.Split(new string[]{"\r\n"},StringSplitOptions.RemoveEmptyEntries).Length));
            lstEditParam.Add(new SqlParameter("@Title", txtTitle.Text.Trim()));
            lstEditParam.Add(new SqlParameter("@ItemType", radlItemType.SelectedValue));

            if (radlItemType.SelectedValue != "3")
            {
                lstEditParam.Add(new SqlParameter("@Item", txtItem.Text.Trim()));
            }
            else
            {
                lstEditParam.Add(new SqlParameter("@Item", DBNull.Value));
            }

            lstEditParam.Add(new SqlParameter("@IsEnable",chkIsEnable.Checked ));

            try
            {
                effectRow = SQLHelper.ExecuteNonQuery(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, editSQL, lstEditParam.ToArray());
            }
            catch { }

            if (effectRow > 0)
            {
                jsMessage = "alertClose({title:\"操作提示\",msg:\"恭喜您，操作成功！\"},function(data){location.href='QuestionnaireItemList.aspx?QID=" + Request.QueryString["QID"] + "';});";
            }
            else
            {
                jsMessage = "alert({title:\"操作提示\",msg:\"对不起，操作失败，请重试。\"});";
            }
        }
    }
}
