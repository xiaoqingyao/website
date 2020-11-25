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
using dotnetCHARTING;

public partial class SysManage_TongJi : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Get_Data(1, Chart1, "统计用电抄表次数");
            Get_Data(2, Chart2, "统计用水抄表次数");
        }
    }

    /// <summary>
    /// 绑定数据
    /// </summary>
    void Get_Data(int act, Chart cha, string tit)
    {
        string sqltxt = string.Empty;
        if (act == 1)
        {
            sqltxt = @"select suidiantype as itemname,count(0) as itemvalue
from [shoufei]
where typeid=3
group by suidiantype";
        }
        else if (act == 2)
        {
            sqltxt = @"select suidiantype as itemname,count(0) as itemvalue
from [shoufei]
where typeid=1
group by suidiantype";
        }

        DataTable dt = DB.getDataTable(sqltxt);

        cha.YAxis.Label.Text = "抄表次数";
        cha.TempDirectory = "images";//路径
        cha.FileName = "Chart_1" + act;//文件名
        cha.Title = tit;
        cha.Type = ChartType.Combo;
        cha.Series.Type = SeriesType.Line;//折线图时启用
        cha.Series.Data = dt;
        cha.SeriesCollection.Add();
        cha.DefaultSeries.DefaultElement.ShowValue = true;
        cha.ShadingEffect = true;
        cha.Use3D = false;////折线图时false
        cha.Series.DefaultElement.ShowValue = true;

    }

    


}
