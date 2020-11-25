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
    public partial class Expertlist : System.Web.UI.Page
    {
        public string department = string.Empty;
        public string nodecode = string.Empty;
        string sqlWhere = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            Account super = new Account();
            super = Session[SystemConst.SYSTEM_SESSION_LOGININFO] as Account;
            department = super.DepartMent;

            nodecode = Tools.CheckSql(Request.QueryString["NodeCode"]);
            if (nodecode == "105005005")
            {
                //sqlWhere += " and MenZhenType like '%1%' or MenZhenType like '%2%'";
                sqlWhere += "";
            }
            if (nodecode == "105005007")
            {
                sqlWhere += " and MenZhenType like '%2%'";
            }
            if (nodecode == "105005008")
            {
                sqlWhere += " and MenZhenType like '%1%'";
            }
            //①博士生导师 ②硕士生导师 ③151人才 ④131人才 ⑤南医大学教授 ⑥南医大学副教授 ⑦浙江省医学会主委/副主委 ⑧杭州市医学会主委

            if (nodecode == "105005009001")
            {
                sqlWhere += " and RCType like '%1%'";
            }
            if (nodecode == "105005009002")
            {
                sqlWhere += " and RCType like '%2%'";
            }
            if (nodecode == "105005009003")
            {
                sqlWhere += " and RCType like '%3%'";
            }
            if (nodecode == "105005009004")
            {
                sqlWhere += " and RCType like '%4%'";
            }
            if (nodecode == "105005009005")
            {
                sqlWhere += " and RCType like '%5%'";
            }
            if (nodecode == "105005009006")
            {
                sqlWhere += " and RCType like '%6%'";
            }
            if (nodecode == "105005009007")
            {
                sqlWhere += " and RCType like '%7%'";
            }
            if (nodecode == "105005009008")
            {
                sqlWhere += " and RCType like '%8%'";
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
                sSql = lblSearchKeyWord.Text+sqlWhere + " and DepartMent='" + department + "'";
            }
            else
            {
                sSql = lblSearchKeyWord.Text+sqlWhere;
            }

            if (sSql.Trim() == string.Empty)
                sSql = " 1=1 and IsDel=0 and SiteID=1 ";
            p.Condition = sSql;

            p.OrderAsc = "Orders asc";
            p.OrderDesc = "Orders desc";
            p.TableName = "K_U_Expert";
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

        public string GetShuxing(string shuxing)
        {
            string shuxingtype = string.Empty;
            if (shuxing.Contains("1"))
            {
                shuxingtype += "首页推荐";
            }
            return shuxingtype;
        }
        public string GetMenZheType(string type)
        {
            string menzhentype = string.Empty;
            if (type.Contains("1"))
            {
                menzhentype += "专家门诊 ";
            }
            if (type.Contains("2"))
            {
                menzhentype += "名医门诊";
            }
            return menzhentype;
        }
        public string GetRCType(string type)
        {
            string rctype = string.Empty;
            if (type.Contains("1"))
            {
                rctype += "博士生导师 ";
            }
            if (type.Contains("2"))
            {
                rctype += "硕士生导师 ";
            }
            if (type.Contains("3"))
            {
                rctype += "151人才 ";
            }
            if (type.Contains("4"))
            {
                rctype += "131人才 ";
            }
            if (type.Contains("5"))
            {
                rctype += "南医大学教授";
            }
            if (type.Contains("6"))
            {
                rctype += "南医大学副教授 ";
            }
            if (type.Contains("7"))
            {
                rctype += "浙江省医学会主委/副主委 ";
            }
            if (type.Contains("8"))
            {
                rctype += "杭州市医学会主委";
            }
            return rctype;
        }

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
            string sql = "delete from K_U_Expert where ID='" + id + "'";
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
                    string sql = "delete from K_U_Expert where ID=" + sid[i];
                    SQLHelper.ExecuteNonQuery(AllPower.Common.SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, null);
                }
                NewMethod(1);
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("Expertedit.aspx?action=add&NodeCode=" + nodecode);
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
                labOrders = "" + (rptMember.Items[i].FindControl("txtOrders") as TextBox).Text.ToString() + "";
                sql = "update K_U_Expert set Orders=" + labOrders + " where ID='" + Id + "'";
                SQLHelper.ExecuteNonQuery(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, null);
            }
            NewMethod(1);
        }
    }
}
