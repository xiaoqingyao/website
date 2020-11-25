using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FTD.Web.UI.aspx.WorkPlanM
{
    public partial class SYZhuanXiangRight : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("0");
            dt.Columns.Add("1");
            dt.Columns.Add("2");
            dt.Columns.Add("3");
            dt.Columns.Add("4");
            dt.Columns.Add("5");
            dt.Columns.Add("6");
            dt.Columns.Add("7");
            dt.Columns.Add("8");
            dt.Columns.Add("9");

            DataRow dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月19日日报";
            dr[2] = "张国龙";
            dr[3] = "2019-3-19";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月20日日报";
            dr[2] = "李贺";
            dr[3] = "2019-3-20";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月21日日报";
            dr[2] = "王鹏";
            dr[3] = "2019-3-21";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月22日日报";
            dr[2] = "张国龙";
            dr[3] = "2019-3-22";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月23日日报";
            dr[2] = "崔志佳";
            dr[3] = "2019-3-23";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月19日日报";
            dr[2] = "张国龙";
            dr[3] = "2019-3-19";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月20日日报";
            dr[2] = "李贺";
            dr[3] = "2019-3-20";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月21日日报";
            dr[2] = "王鹏";
            dr[3] = "2019-3-21";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月22日日报";
            dr[2] = "张国龙";
            dr[3] = "2019-3-22";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月23日日报";
            dr[2] = "崔志佳";
            dr[3] = "2019-3-23";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月19日日报";
            dr[2] = "张国龙";
            dr[3] = "2019-3-19";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月20日日报";
            dr[2] = "李贺";
            dr[3] = "2019-3-20";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月21日日报";
            dr[2] = "王鹏";
            dr[3] = "2019-3-21";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月22日日报";
            dr[2] = "张国龙";
            dr[3] = "2019-3-22";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月23日日报";
            dr[2] = "崔志佳";
            dr[3] = "2019-3-23";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月19日日报";
            dr[2] = "张国龙";
            dr[3] = "2019-3-19";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月20日日报";
            dr[2] = "李贺";
            dr[3] = "2019-3-20";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月21日日报";
            dr[2] = "王鹏";
            dr[3] = "2019-3-21";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月22日日报";
            dr[2] = "张国龙";
            dr[3] = "2019-3-22";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月23日日报";
            dr[2] = "崔志佳";
            dr[3] = "2019-3-23";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月19日日报";
            dr[2] = "张国龙";
            dr[3] = "2019-3-19";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月20日日报";
            dr[2] = "李贺";
            dr[3] = "2019-3-20";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月21日日报";
            dr[2] = "王鹏";
            dr[3] = "2019-3-21";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月22日日报";
            dr[2] = "张国龙";
            dr[3] = "2019-3-22";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "2019年3月23日日报";
            dr[2] = "崔志佳";
            dr[3] = "2019-3-23";
            dr[4] = "2019-3-20";
            dr[5] = "2019-3-19";
            dr[6] = "下载";

            dt.Rows.Add(dr);

            this.GVData.DataSource = dt;
            this.GVData.DataBind();
        }
    }
}