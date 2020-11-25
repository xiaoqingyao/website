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
using Microsoft.Office.Interop.Owc11;//添加Office组件引用
using System.Data.SqlClient;
public partial class MoneyTJImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Alert.AlertAndRedirect("对不起您没有登录！", "Login.aspx");

            }
            this.df.Text = DateTime.Now.AddMonths(-3).ToString("yyyy-MM-dd");
            this.dt.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string strSeriesName = "图例1";
        string ConnectString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string Sql = "SELECT Name,sum(AddMoney) AS Total FROM F_Money  where AddUserId='" + Session["UserId"].ToString() + "' and AddTime>='" + df.Text + "' and AddTime<='" + dt.Text + "'  GROUP BY Name";
        SqlConnection myConn = new SqlConnection(ConnectString);
        myConn.Open();
        SqlDataAdapter Da = new SqlDataAdapter(Sql, myConn);
        DataSet ds = new DataSet();
        Da.Fill(ds);
        string[] ProjectType = new string[14];
        string[] ProjectTotal = new string[14];
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ProjectType[i] = ds.Tables[0].Rows[i][0].ToString();
            ProjectTotal[i] = ds.Tables[0].Rows[i][1].ToString();
        }
        string strXdata = String.Empty;
        foreach (string strData in ProjectType)
        {
            strXdata += strData + "\t";
        }
        string strYdata = String.Empty;
        foreach (string strValue in ProjectTotal)
        {
            strYdata += strValue + "\t";
        }
        ChartSpace laySpace = new ChartSpaceClass();
        ChChart InsertChart = laySpace.Charts.Add(0);
        InsertChart.Type = ChartChartTypeEnum.chChartTypeColumnClustered;
        InsertChart.HasLegend = false;
        InsertChart.HasTitle = true;
        InsertChart.Title.Caption = "收支信息统计图";
        InsertChart.Axes[0].HasTitle = true;
        InsertChart.Axes[0].Title.Caption = "";
        InsertChart.Axes[1].HasTitle = true;

        InsertChart.Axes[1].Scaling.SplitMinimum = 0;
        InsertChart.Axes[1].Title.Caption = "收支金额";
        InsertChart.SeriesCollection.Add(0);
        InsertChart.SeriesCollection[0].SetData(ChartDimensionsEnum.chDimSeriesNames,
        +(int)ChartSpecialDataSourcesEnum.chDataLiteral, strSeriesName);
        InsertChart.SeriesCollection[0].SetData(ChartDimensionsEnum.chDimCategories,
        +(int)ChartSpecialDataSourcesEnum.chDataLiteral, strXdata);
        InsertChart.SeriesCollection[0].SetData(ChartDimensionsEnum.chDimValues,
        (int)ChartSpecialDataSourcesEnum.chDataLiteral, strYdata);
        string strAbsolutePath = (Server.MapPath(".")) + "\\ShowData.gif";
        laySpace.ExportPicture(strAbsolutePath, "GIF", 600, 400);
        string strRelativePath = (Server.MapPath(".")) + "\\ShowData.gif";
        string strImageTag = "<IMG SRC='" + strRelativePath + "?kkd=" + Guid.NewGuid().ToString() + "&dd=" + DateTime.Now.ToString() + "'/>";

        //this.PlaceHolder1.Controls.Add(new LiteralControl(strImageTag));
    }
}
