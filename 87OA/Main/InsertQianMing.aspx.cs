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
using System.Drawing;
using System.Drawing.Drawing2D;

public partial class Main_InsertQianMing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (tbSignData.Text.Trim() != "")
        {
            DrawSign(tbSignData.Text);
        }
        else
        {
            ZWL.Common.MessageBox.Show(this, "未发现任何签名数据！");
        }
    }
    private void DrawSign(string signdata)
    {
        System.Drawing.Bitmap image = new System.Drawing.Bitmap(400, 300);
        Graphics g = Graphics.FromImage(image);
        g.Clear(Color.White);
        //SolidBrush brush = new SolidBrush(Color.WhiteSmoke);
        //g.FillRectangle(brush, 0, 0, image.Width, image.Height);
        try
        {
            Pen pen = new Pen(Color.Black);
            string[] strokes = signdata.Split(new string[] { ";;" }, StringSplitOptions.RemoveEmptyEntries);
            string[] tmp = null, detail;
            int x1, x2, y1, y2;
            for (int i = 0; i < strokes.Length; i++)
            {
                if (strokes[i] == null) continue;
                tmp = strokes[i].Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);
                if (tmp == null || tmp.Length == 0) continue;
                detail = tmp[0].Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                int clr = Convert.ToInt32(detail[0], 16);
                pen.Color = Color.FromArgb((clr & 0xff), (clr & 0xff00) >> 8, (clr & 0xff0000) >> 16);
                pen.Width = Convert.ToInt32(detail[1], 16);
                x1 = Convert.ToInt32(detail[2], 16);
                y1 = Convert.ToInt32(detail[3], 16);
                for (int j = 1; j < tmp.Length; j++)
                {
                    detail = tmp[j].Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                    x2 = Convert.ToInt32(detail[0], 16);
                    y2 = Convert.ToInt32(detail[1], 16);
                    g.DrawLine(pen, x1, y1, x2, y2);
                    x1 = x2; y1 = y2;
                }
            }
            string TempStr = DateTime.Now.Ticks.ToString();
            image.Save(Server.MapPath("../UploadFile/") + "Sign" + TempStr + ".jpg", System.Drawing.Imaging.ImageFormat.Jpeg);
            //返回图片值
            Response.Write("<script language=javascript>window.returnValue =\"Sign" + TempStr + ".jpg\";window.close();</script>"); 
            //System.IO.MemoryStream ms = new System.IO.MemoryStream();
            ////Bmp最清晰.
            //image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            //Response.ClearContent();
            //Response.ContentType = "image/Jpeg";
            //Response.BinaryWrite(ms.ToArray());
        }
        catch (Exception e)
        {
            System.Diagnostics.Debug.WriteLine(e.Message);
        }
        finally
        {
            g.Dispose();
            image.Dispose();
        }
    }
}
