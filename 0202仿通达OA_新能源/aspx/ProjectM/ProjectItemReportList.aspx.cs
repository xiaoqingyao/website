﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FTD.Web.UI.aspx.ProjectM
{
    public partial class ProjectItemReportList : System.Web.UI.Page
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

            DataRow
              dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "青岛力神动力电池生产基地项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = "项目以钛白粉副产品硫酸 并进而生产磷酸铁锂；……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "山东泛海阳光能源有限公司2GW高性能光伏瓦与光伏组件项目";
            dr[2] = "下载";
            dr[3] = "2019-2-21";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "刘桂升";
            dr[7] = "133274514";
            dr[8] = "间、1栋智能立体仓库、 、1栋研发楼，合计8条生产线……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "太阳能电池正银浆料用高结晶态银粉项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "常月亭";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = " 1.项目一期（2年规划） 中试、大试，形成产……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "青岛力神动力电池生产基地项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = "项目以钛白粉副产品硫酸 并进而生产磷酸铁锂；……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "山东泛海阳光能源有限公司2GW高性能光伏瓦与光伏组件项目";
            dr[2] = "下载";
            dr[3] = "2019-2-21";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "刘桂升";
            dr[7] = "133274514";
            dr[8] = "间、1栋智能立体仓库、 、1栋研发楼，合计8条生产线……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "太阳能电池正银浆料用高结晶态银粉项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "常月亭";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = " 1.项目一期（2年规划） 中试、大试，形成产……";
            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "青岛力神动力电池生产基地项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = "项目以钛白粉副产品硫酸 并进而生产磷酸铁锂；……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "山东泛海阳光能源有限公司2GW高性能光伏瓦与光伏组件项目";
            dr[2] = "下载";
            dr[3] = "2019-2-21";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "刘桂升";
            dr[7] = "133274514";
            dr[8] = "间、1栋智能立体仓库、 、1栋研发楼，合计8条生产线……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "太阳能电池正银浆料用高结晶态银粉项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "常月亭";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = " 1.项目一期（2年规划） 中试、大试，形成产……";
            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "青岛力神动力电池生产基地项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = "项目以钛白粉副产品硫酸 并进而生产磷酸铁锂；……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "山东泛海阳光能源有限公司2GW高性能光伏瓦与光伏组件项目";
            dr[2] = "下载";
            dr[3] = "2019-2-21";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "刘桂升";
            dr[7] = "133274514";
            dr[8] = "间、1栋智能立体仓库、 、1栋研发楼，合计8条生产线……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "太阳能电池正银浆料用高结晶态银粉项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "常月亭";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = " 1.项目一期（2年规划） 中试、大试，形成产……";
            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "青岛力神动力电池生产基地项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = "项目以钛白粉副产品硫酸 并进而生产磷酸铁锂；……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "山东泛海阳光能源有限公司2GW高性能光伏瓦与光伏组件项目";
            dr[2] = "下载";
            dr[3] = "2019-2-21";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "刘桂升";
            dr[7] = "133274514";
            dr[8] = "间、1栋智能立体仓库、 、1栋研发楼，合计8条生产线……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "太阳能电池正银浆料用高结晶态银粉项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "常月亭";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = " 1.项目一期（2年规划） 中试、大试，形成产……";
            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "青岛力神动力电池生产基地项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = "项目以钛白粉副产品硫酸 并进而生产磷酸铁锂；……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "山东泛海阳光能源有限公司2GW高性能光伏瓦与光伏组件项目";
            dr[2] = "下载";
            dr[3] = "2019-2-21";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "刘桂升";
            dr[7] = "133274514";
            dr[8] = "间、1栋智能立体仓库、 、1栋研发楼，合计8条生产线……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "太阳能电池正银浆料用高结晶态银粉项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "常月亭";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = " 1.项目一期（2年规划） 中试、大试，形成产……";
            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "青岛力神动力电池生产基地项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = "项目以钛白粉副产品硫酸 并进而生产磷酸铁锂；……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "山东泛海阳光能源有限公司2GW高性能光伏瓦与光伏组件项目";
            dr[2] = "下载";
            dr[3] = "2019-2-21";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "刘桂升";
            dr[7] = "133274514";
            dr[8] = "间、1栋智能立体仓库、 、1栋研发楼，合计8条生产线……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "太阳能电池正银浆料用高结晶态银粉项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "常月亭";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = " 1.项目一期（2年规划） 中试、大试，形成产……";
            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "青岛力神动力电池生产基地项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = "项目以钛白粉副产品硫酸 并进而生产磷酸铁锂；……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "山东泛海阳光能源有限公司2GW高性能光伏瓦与光伏组件项目";
            dr[2] = "下载";
            dr[3] = "2019-2-21";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "刘桂升";
            dr[7] = "133274514";
            dr[8] = "间、1栋智能立体仓库、 、1栋研发楼，合计8条生产线……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "太阳能电池正银浆料用高结晶态银粉项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "常月亭";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = " 1.项目一期（2年规划） 中试、大试，形成产……";
            dt.Rows.Add(dr);
            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "青岛力神动力电池生产基地项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = "项目以钛白粉副产品硫酸 并进而生产磷酸铁锂；……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "山东泛海阳光能源有限公司2GW高性能光伏瓦与光伏组件项目";
            dr[2] = "下载";
            dr[3] = "2019-2-21";
            dr[4] = "张永高";
            dr[5] = "新开工";
            dr[6] = "刘桂升";
            dr[7] = "133274514";
            dr[8] = "间、1栋智能立体仓库、 、1栋研发楼，合计8条生产线……";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "1";
            dr[1] = "太阳能电池正银浆料用高结晶态银粉项目";
            dr[2] = "下载";
            dr[3] = "2019-3-2";
            dr[4] = "张永高";
            dr[5] = "常月亭";
            dr[6] = "李雯雯";
            dr[7] = "1532274554";
            dr[8] = " 1.项目一期（2年规划） 中试、大试，形成产……";
            dt.Rows.Add(dr);


            GVData.DataSource = dt;
            GVData.DataBind();
        }
    }
}