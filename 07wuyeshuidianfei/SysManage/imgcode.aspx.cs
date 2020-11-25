using System;
using System.Drawing.Imaging;
using System.IO;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class SysManage_imgcode : System.Web.UI.Page
{
    string t = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        t = Request.QueryString["t"];
        if (!IsPostBack)
        {
            string tmp = RndNum(4);
            //HttpCookie a = new HttpCookie("ImageV", tmp);
            //Response.Cookies.Add(a);
            this.ValidateCode(tmp);
        }
    }

    private void ValidateCode(string VNum)
    {
        Bitmap Img = null;
        Graphics g = null;
        MemoryStream ms = null;

        int gheight = VNum.Length * 12;
        Img = new Bitmap(gheight, 19);
        g = Graphics.FromImage(Img);
        //背景颜色
        g.Clear(Color.White);
        //文字字体
        Font f = new Font("Arial", 11);
        //文字颜色
        Color strclr;
        strclr = GetColor(0);
        SolidBrush s = new SolidBrush(strclr);
        g.DrawString(VNum, f, s, 3, 3);
        ms = new MemoryStream();
        Img.Save(ms, ImageFormat.Jpeg);
        Response.ClearContent();
        Response.ContentType = "image/Jpeg";
        Response.BinaryWrite(ms.ToArray());

        g.Dispose();
        Img.Dispose();
        Response.End();
    }
    private Color GetColor(int itemIndex)
    {
        Color color;
        switch (itemIndex)
        {
            case 0:
                color = Color.Blue;
                break;
            case 1:
                color = Color.Red;
                break;
            case 2:
                color = Color.Yellow;
                break;
            case 3:
                color = Color.Purple;
                break;
            case 4:
                color = Color.Orange;
                break;
            case 5:
                color = Color.Brown;
                break;
            default:
                color = Color.Blue;
                break;
        }
        return color;
    }

    private string RndNum(int VcodeNum)
    {
        //string Vchar = "0,1,2,3,4,5,6,7,8,9";
        //string[] VcArray = Vchar.Split(new Char[] { ',' });
        string VNum = string.Empty;
        //int temp = -1;

        if (!string.IsNullOrEmpty(t))
        {
            VNum = t.Substring(2, 4);
        }
        else
        {
            Random rand = new Random();
            VNum = rand.Next(1000, 9999).ToString();
        }
        //for (int i = 1; i < VcodeNum + 1; i++)
        //{
        //    if (temp != -1)
        //    {
        //        rand = new Random(i * temp * unchecked((int)DateTime.Now.Ticks));
        //    }

        //    int t = rand.Next(10);
        //    if (temp != -1 && temp == t)
        //    {
        //        return RndNum(VcodeNum);
        //    }
        //    temp = t;
        //    VNum += VcArray[t];
        //}

        HttpCookie cookie = new HttpCookie("code");
        cookie.Values["Lgcode"] = VNum;
        //cookie.Expires = DateTime.Now.AddMinutes(15);

        Response.AppendCookie(cookie);

        return VNum;
    }
}
