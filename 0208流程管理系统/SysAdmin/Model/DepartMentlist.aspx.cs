using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using AllPower.Common;
using AllPower.Model.SysManage;

namespace AllPower.WEB.SysAdmin.Model
{
    public partial class DepartMentlist : System.Web.UI.Page
    {
        public string department = string.Empty;
        string nodecode = string.Empty;

        string sqlwhere = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            Account super = new Account();
            super = Session[SystemConst.SYSTEM_SESSION_LOGININFO] as Account;
            department = super.DepartMent;

            nodecode = Tools.CheckSql(Request.QueryString["NodeCode"]);
            if (nodecode == "105004010")//临床科室
            {
                sqlwhere += " and Islckj=1";
            }
            if (nodecode == "105004011")//省市重点
            {
                sqlwhere += " and IsKey=1";
            }
            if (nodecode == "105004012")//特色专科
            {
                sqlwhere += " and Istszk=1";
            }
            if (nodecode == "105004013")//医技科室
            {
                sqlwhere += " and Isyjks=1";
            }
            if (nodecode == "105004014")//职能科室
            {
                sqlwhere += " and Isznkj=1";
            }

            if (!IsPostBack)
            {
                NewMethod(1);
            }
        }

        #region 绑定某一页
        private void NewMethod(int PageIndex)
        {
            if (int.Parse("0" + this.lblBackPageCount.Text) < PageIndex)
                PageIndex = int.Parse(this.lblBackPageCount.Text);

            if (PageIndex < 1)
                PageIndex = 1;

            Pager p = new Pager();
            string sSql = string.Empty;
            if (department != null)
            {
                sSql = lblSearchKeyWord.Text + " and Title='" + department + "'"+sqlwhere+"";
            }
            else
            {
                sSql = lblSearchKeyWord.Text+sqlwhere;
            }

            if (sSql.Trim() == string.Empty)
                sSql = " 1=1 and IsDel=0 and SiteID=1 ";
            p.Condition = sSql;

            p.OrderAsc = "Orders asc";
            p.OrderDesc = "Orders desc";
            p.TableName = "K_U_DepartMent";
            p.PageSize = 20;
            p.PageIndex = PageIndex;

            rptMember.DataSource = p.GetPageData();
            rptMember.DataBind();

            int iRc = p.RecordCount;
            int iPs = p.PageSize;
            int iLastPage = 0;
            if (iRc % iPs == 0)
                iLastPage = iRc / iPs;
            else
                iLastPage = iRc / iPs + 1;
            lnkbtnOne.Enabled = true;
            lnkbtnUp.Enabled = true;
            lnkbtnNext.Enabled = true;
            lnkbtnBack.Enabled = true;
            if (PageIndex == 1)
            {
                lnkbtnOne.Enabled = false;
                lnkbtnUp.Enabled = false;
            }
            if (PageIndex == iLastPage || iLastPage == 0)
            {
                lnkbtnNext.Enabled = false;
                lnkbtnBack.Enabled = false;
            }



            this.lblPageIndex.Text = PageIndex.ToString();
            this.lblBackPage.Text = iLastPage.ToString();
            this.lblBackPageCount.Text = iLastPage.ToString();
            this.lblCurrentPage.Text = PageIndex.ToString();
            this.lblPageSize.Text = p.PageSize.ToString();
            this.lblRecordCount.Text = iRc.ToString();
            this.lblRecordCount.Text = iRc.ToString();
            if (drpPage.Items.Count <= 0)
            {
                for (int i = 1; i <= int.Parse(lblBackPage.Text); i++)
                {
                    drpPage.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
            }
        }
        #endregion

        #region 分页
        protected void lnkbtnOne_Click(object sender, EventArgs e)
        {
            NewMethod(1);
        }
        protected void lnkbtnUp_Click(object sender, EventArgs e)
        {
            NewMethod(int.Parse(this.lblPageIndex.Text) - 1);
        }
        protected void lnkbtnNext_Click(object sender, EventArgs e)
        {
            NewMethod(int.Parse(this.lblPageIndex.Text) + 1);
        }
        protected void lnkbtnBack_Click(object sender, EventArgs e)
        {
            NewMethod(int.Parse(this.lblBackPageCount.Text));
        }
        protected void btn_Click(object sender, EventArgs e)
        {
            NewMethod(int.Parse(drpPage.SelectedValue));
        }
        #endregion

        protected void rptMember_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string commendName = e.CommandName;
            string Id = e.CommandArgument.ToString();
            switch (commendName)
            {
                case "del":
                    DeleteByID(Id);
                    break;
            }
        }

        private void DeleteByID(string id)
        {
            string sql = "delete from K_U_DepartMent where ID='" + id + "'";
            if (SQLHelper.ExecuteNonQuery(AllPower.Common.SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, null) > 0)
            {
                NewMethod(1);
            }
            else
            {
                NewMethod(1);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string IdList = Request.Form["cbId"];
            if (!string.IsNullOrEmpty(IdList))
            {
                string[] sid = IdList.Split(',');
                for (int i = 0; i < sid.Length; i++)
                {
                    string sql = "delete from K_U_DepartMent where ID=" + sid[i];
                    SQLHelper.ExecuteNonQuery(AllPower.Common.SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, null);
                }
                NewMethod(1);
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("DepartMentedit.aspx?action=add&NodeCode=105004007");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();

            StringBuilder sb = new StringBuilder(" 1=1 ");
            if (!string.IsNullOrEmpty(title))
            {
                sb.Append(" and Title like '%" + title + "%'");
            }
            lblSearchKeyWord.Text = sb.ToString();
            NewMethod(1);
        }

        protected void txtOrders_TextChanged(object sender, EventArgs e)
        {
            string Id = string.Empty;
            string labOrders = string.Empty;
            string sql = string.Empty;

            for (int i = 0; i < rptMember.Items.Count; i++)
            {
                Id = "" + (rptMember.Items[i].FindControl("labID") as Label).Text.ToString() + "";
                labOrders=""+(rptMember.Items[i].FindControl("txtOrders") as TextBox).Text.ToString()+"";
                sql="update K_U_DepartMent set Orders="+labOrders+" where ID='"+Id+"'";
                SQLHelper.ExecuteNonQuery(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, null);
            }
            NewMethod(1);          
        }
    }
}
