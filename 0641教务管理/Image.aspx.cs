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
using System.Drawing.Imaging;


public partial class Image : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 在此处放置用户代码以初始化页面
        //rndnum是一个自定义函数
        string vnum = rndnum(4); //这里的数字4代表显示的是4位的验证字符串！
        Session["vnum"] = vnum;
        validatecode(vnum);
    }
    //生成图像函数
    private void validatecode(string vnum)
    {
        int gheight = (int)(vnum.Length * 11.5);
        //gheight为图片宽度,根据字符长度自动更改图片宽度
        System.Drawing.Bitmap img = new System.Drawing.Bitmap(gheight, 20);
        Graphics g = Graphics.FromImage(img);
        g.DrawString(vnum, new System.Drawing.Font("arial", 10), new System.Drawing.SolidBrush(Color.Red), 3, 3);
        //在矩形内绘制字串（字串，字体，画笔颜色，左上x.左上y） 
        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        img.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
        Response.ClearContent(); //需要输出图象信息 要修改http头 
        Response.ContentType = "image/png";
        Response.BinaryWrite(ms.ToArray());
        g.Dispose();
        img.Dispose();
        Response.End();
    }

    //生成随机数函数中从vchar数组中随机抽取
    //字母区分大小写
    public string rndnum(int vcodenum)
    {
        string vchar = "1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,p,q,r,s,t,u,w,x,y,z";

        string[] vcarray = vchar.Split(',');
        string vnum = "";//由于字符串很短，就不用stringbuilder了
        int temp = -1;//记录上次随机数值，尽量避免生产几个一样的随机数

        //采用一个简单的算法以保证生成随机数的不同
        Random rand = new Random();
        for (int i = 1; i < vcodenum + 1; i++)
        {
            if (temp != -1)
            {
                rand = new Random(i * temp * unchecked((int)DateTime.Now.Ticks));
            }
            //int t =  rand.next(35) ;
            int t = rand.Next(33);
            if (temp != -1 && temp == t)
            {
                return rndnum(vcodenum);
            }
            temp = t;
            vnum += vcarray[t];

        }
        return vnum;
    }
}

