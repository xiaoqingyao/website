using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text.RegularExpressions ;

namespace AllPower.Web.Admin.Editor.eWebEditor
{
    public partial class i : AllPower.Web.Admin.Editor.eWebEditor.config
    {
        List<string> lstStyle;
        protected void Page_Load(object sender, EventArgs e)
        {
            string sAction;
            string sStyle;

            sAction = Request.QueryString["Action"];
            sStyle = Request.QueryString["Style"];

            if (!string.IsNullOrEmpty(sAction))
            {
                sAction = sAction.ToLower();
            }

            if (!string.IsNullOrEmpty(sStyle))
            {
                sStyle = sStyle.ToLower();
            }

            lstStyle = aStyle();

            if (sAction == "config")
            {
                string[] aCurrStyle;
                for (int i = 0; i < lstStyle.Count; i++)
                {
                    aCurrStyle = Regex.Split(lstStyle[i].ToString(), @"\|\|\|", RegexOptions.IgnoreCase);
                    if (sStyle == aCurrStyle[0].Trim())
                    {
                        ShowStyle(i+1);
                        break;
                    }
                }
            }
        }

        private void ShowStyle(int StyleID)
        {
            List<string> lstToolbar=aToolbar ();
            string sStyleName;
            string sFixWidth;
            string sSkin;
            string sStyleUploadDir;
            string sStyleWidth;
            string sStyleHeight;
            string sStyleMemo;
            string sStyleStateFlag;
            string sStyleDetectFromWord;
            string sStyleInitMode;
            string sStyleBaseUrl;
            string sStyleUploadObject;
            string sStyleAutoDir;
            string sStyleBaseHref;
            string sStyleContentPath;
            string sStyleAutoRemote;
            string sStyleShowBorder;
            string sStyleAllowBrowse;

            string sSLTFlag;
            string sSLTMinSize;
            string sSLTOkSize;
            string sSYWZFlag;
            string sSYText;
            string sSYFontColor;
            string sSYFontSize;
            string sSYFontName;
            string sSYPicPath;
            string sSLTSYObject;
            string sSLTSYExt;
            string sSYWZMinWidth;
            string sSYShadowColor;
            string sSYShadowOffset;
            string sSYWZMinHeight;
            string sSYWZPosition;
            string sSYWZTextWidth;
            string sSYWZTextHeight;
            string sSYWZPaddingH;
            string sSYWZPaddingV;
            string sSYTPFlag;
            string sSYTPMinWidth;
            string sSYTPMinHeight;
            string sSYTPPosition;
            string sSYTPPaddingH;
            string sSYTPPaddingV;
            string sSYTPImageWidth;
            string sSYTPImageHeight;
            string sSYTPOpacity;
            string sCusDirFlag;

            string sStyleFileExt;
            string sStyleFlashExt;
            string sStyleImageExt;
            string sStyleMediaExt;
            string sStyleRemoteExt;
            string sStyleLocalExt;
            string sStyleFileSize;
            string sStyleFlashSize;
            string sStyleImageSize;
            string sStyleMediaSize;
            string sStyleRemoteSize;
            string sStyleLocalSize;

            //string sToolBarID;
            //string sToolBarName;
            //string sToolBarOrder;
            //string sToolBarButton;

            string sSBCode;
            string sSBEdit;
            string sSBText;
            string sSBView;

            string sEnterMode;
            string sAreaCssMode;

            string[] sCurrStyle;

            int styleCount = lstStyle.Count ;
            if (StyleID <= styleCount)
            {
                sCurrStyle = Regex.Split(lstStyle[StyleID], @"\|\|\|",RegexOptions.IgnoreCase);
            }
            else
                return;

            sStyleName = sCurrStyle[0];
            sFixWidth = sCurrStyle[1];
            sSkin = sCurrStyle[2];
            sStyleUploadDir = sCurrStyle[3];
            sStyleBaseHref = sCurrStyle[22];
            sStyleContentPath = sCurrStyle[23];
            sStyleWidth = sCurrStyle[4];
            sStyleHeight = sCurrStyle[5];
            sStyleMemo = sCurrStyle[26];
            sStyleFileExt = sCurrStyle[6];
            sStyleFlashExt = sCurrStyle[7];
            sStyleImageExt = sCurrStyle[8];
            sStyleMediaExt = sCurrStyle[9];
            sStyleRemoteExt = sCurrStyle[10];
            sStyleFileSize = sCurrStyle[11];
            sStyleFlashSize = sCurrStyle[12];
            sStyleImageSize = sCurrStyle[13];
            sStyleMediaSize = sCurrStyle[14];
            sStyleRemoteSize = sCurrStyle[15];
            sStyleStateFlag = sCurrStyle[16];
            sSBCode = sCurrStyle[62];
            sSBEdit = sCurrStyle[63];
            sSBText = sCurrStyle[64];
            sSBView = sCurrStyle[65];
            sEnterMode = sCurrStyle[66];
            sAreaCssMode = sCurrStyle[67];
            sStyleAutoRemote = sCurrStyle[24];
            sStyleShowBorder = sCurrStyle[25];
            sStyleUploadObject = sCurrStyle[20];
            sStyleAutoDir = sCurrStyle[21];
            sStyleDetectFromWord = sCurrStyle[17];
            sStyleInitMode = sCurrStyle[18];
            sStyleBaseUrl = sCurrStyle[19];
            sSLTFlag = sCurrStyle[29];
            sSLTMinSize = sCurrStyle[30];
            sSLTOkSize = sCurrStyle[31];
            sSYWZFlag = sCurrStyle[32];
            sSYText = sCurrStyle[33];
            sSYFontColor = sCurrStyle[34];
            sSYFontSize = sCurrStyle[35];
            sSYFontName = sCurrStyle[36];
            sSYPicPath = sCurrStyle[37];
            sSLTSYObject = sCurrStyle[38];
            sSLTSYExt = sCurrStyle[39];
            sSYWZMinWidth = sCurrStyle[40];
            sSYShadowColor = sCurrStyle[41];
            sSYShadowOffset = sCurrStyle[42];
            sStyleAllowBrowse = sCurrStyle[43];
            sStyleLocalExt = sCurrStyle[44];
            sStyleLocalSize = sCurrStyle[45];
            sSYWZMinHeight = sCurrStyle[46];
            sSYWZPosition = sCurrStyle[47];
            sSYWZTextWidth = sCurrStyle[48];
            sSYWZTextHeight = sCurrStyle[49];
            sSYWZPaddingH = sCurrStyle[50];
            sSYWZPaddingV = sCurrStyle[51];
            sSYTPFlag = sCurrStyle[52];
            sSYTPMinWidth = sCurrStyle[53];
            sSYTPMinHeight = sCurrStyle[54];
            sSYTPPosition = sCurrStyle[55];
            sSYTPPaddingH = sCurrStyle[56];
            sSYTPPaddingV = sCurrStyle[57];
            sSYTPImageWidth = sCurrStyle[58];
            sSYTPImageHeight = sCurrStyle[59];
            sSYTPOpacity = sCurrStyle[60];
            sCusDirFlag = sCurrStyle[61];

            System.Web.HttpContext.Current.Response.Write("config.FixWidth = '" + sFixWidth + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.UploadUrl = '" + sStyleUploadDir + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.InitMode = '" + sStyleInitMode + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AutoDetectPaste = '1';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.BaseUrl = '" + sStyleBaseUrl + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.BaseHref = '" + sStyleBaseHref + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AutoRemote = '" + sStyleAutoRemote + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.ShowBorder = '" + sStyleShowBorder + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.StateFlag = '" + sStyleStateFlag + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.SBCode = '" + sSBCode + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.SBEdit = '" + sSBEdit + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.SBText = '" + sSBText + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.SBView = '" + sSBView + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.EnterMode = '" + sEnterMode + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.Skin = '" + sSkin + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AutoDetectLanguage = '1';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.DefaultLanguage = 'zh-cn';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AllowBrowse = '" + sStyleAllowBrowse + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AllowImageSize = '" + sStyleImageSize + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AllowFlashSize = '" + sStyleFlashSize + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AllowMediaSize = '" + sStyleMediaSize + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AllowFileSize = '" + sStyleFileSize + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AllowRemoteSize = '" + sStyleRemoteSize + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AllowLocalSize = '" + sStyleLocalSize + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AllowImageExt = '" + sStyleImageExt + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AllowFlashExt = '" + sStyleFlashExt + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AllowMediaExt = '" + sStyleMediaExt + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AllowFileExt = '" + sStyleFileExt + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AllowRemoteExt = '" + sStyleRemoteExt + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AllowLocalExt = '" + sStyleLocalExt + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.AreaCssMode = '" + sAreaCssMode + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.SYWZFlag = '" + sSYWZFlag + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.SYTPFlag = '" + sSYTPFlag + "';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.HttpFlag = '0';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.L = 'ok';\r\n");
            System.Web.HttpContext.Current.Response.Write("config.ServerExt = 'aspx';\r\n");

            System.Web.HttpContext.Current.Response.Write("config.Toolbars = [\r\n");
            int ToolBarNum;
            int sToolBarNum;
            int Toolbari;
            string[] arrToolbar;
            string strToolBar;
            string TempStrToolBar;

            TempStrToolBar = "";
            ToolBarNum = 0;
            sToolBarNum = 1;
            //得出工具栏总数

            for (Toolbari = 0; Toolbari < lstToolbar.Count; Toolbari++)
            {
                arrToolbar = Regex.Split(lstToolbar[Toolbari].ToString(), @"\|\|\|",RegexOptions.IgnoreCase);
                if (StyleID == int.Parse(arrToolbar[0]))
                {
                    ToolBarNum++;
                }
            }

            //输出工具栏
            for (Toolbari = 0; Toolbari < lstToolbar.Count; Toolbari++)
            {
                strToolBar = "";
                arrToolbar = Regex.Split(lstToolbar[Toolbari].ToString(), @"\|\|\|", RegexOptions.IgnoreCase);
                if (StyleID == int.Parse(arrToolbar[0].ToString()))
                {
                    strToolBar = arrToolbar[1].ToString();
                    TempStrToolBar = TempStrToolBar + "['" + strToolBar.Replace("|", "','") + "']";
                    if (sToolBarNum < ToolBarNum)
                    {
                        TempStrToolBar = TempStrToolBar + ",\r\n";
                    }
                    else
                        TempStrToolBar = TempStrToolBar + "\r\n";

                    sToolBarNum = sToolBarNum + 1;
                }
            }
            System.Web.HttpContext.Current.Response.Write(TempStrToolBar);

            System.Web.HttpContext.Current.Response.Write("];\r\n");

        }

    }
}
