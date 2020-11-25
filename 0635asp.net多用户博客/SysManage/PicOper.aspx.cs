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

public partial class SysManage_PicOper : System.Web.UI.Page
{
    string id = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
        if (!IsPostBack)
        {
            DB.Bind_Dropdownlist("select * from PicClass", ddlPicClass, "PicClassId", "PicClassName");
            if (!string.IsNullOrEmpty(id))
            {
                Image1.Visible = true;
                Get_Data();
            }
            else
            {
                Image1.Visible = false;
            }
        }
    }

    void Get_Data()
    {
        try
        {
            DataTable dt = DB.getDataTable("select * from Pic where PicId=" + id);
            if (dt.Rows.Count == 1)
            {
                txtPicName.Text = dt.Rows[0]["PicName"].ToString();
                ddlPicClass.SelectedValue = dt.Rows[0]["PicClassId"].ToString();
                txtContent.Value = dt.Rows[0]["jieshao"].ToString();
                Image1.ImageUrl = ".." + dt.Rows[0]["PicAddress"].ToString();
            }
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "页面加载时出现异常。", "");
            return;
        }
    }

    /// <summary>
    /// 按钮事件：提交信息
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string picaddress = string.Empty;
            string sql2 = string.Empty;
            if (string.IsNullOrEmpty(id))//添加
            {
                picaddress = Common.UploadFile(FileUpload1, this.Page, "false");
                if (picaddress == "false")
                {
                    return;
                }
                sql2 = "insert into Pic(PicName,PicClassId,PicClassName,PicAddress,jieshao) ";
                sql2 += "values('" + txtPicName.Text + "','" + ddlPicClass.SelectedItem.Value + "','" + ddlPicClass.SelectedItem.Text + "','" + picaddress + "','" + txtContent.Value + "')";
            }
            else//修改
            {
                if (FileUpload1.HasFile)
                {
                    picaddress = Common.UploadFile(FileUpload1, this.Page, "false");
                }
                else
                {
                    picaddress = Image1.ImageUrl.Replace("..", "");
                }
                sql2 = "update Pic set PicName='{0}',PicClassId='{1}',PicClassName='{2}',PicAddress='{3}',jieshao='{4}' where PicId=" + id;
                sql2 = string.Format(sql2, txtPicName.Text, ddlPicClass.SelectedItem.Value, ddlPicClass.SelectedItem.Text, picaddress, txtContent.Value);
            }

            SqlConnection cn = DB.OpenConnection();
            SqlCommand cmd = new SqlCommand(sql2, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            cn.Dispose();
            Common.ShowMessage(this.Page, "信息保存成功！", "", "Picmanage.aspx");
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "信息保存失败，请稍后重试。"+ex.Message, "");
            return;
        }
    }

}
