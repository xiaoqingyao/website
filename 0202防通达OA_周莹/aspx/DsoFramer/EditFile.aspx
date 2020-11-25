<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditFile.aspx.cs" Inherits="OA.aspx.DsoFramer.EditFile" %>

<html>
<head>
    <title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
    <link href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">

    <script language="javascript" event="NotifyCtrlReady" for="WebOffice1" type="text/javascript">
        function OpenHelpDoc() {

            document.all.WebOffice1.LoadOriginalFile("../../UploadFile/<%=Request.QueryString["FilePath"].ToString() %>", "<%=FileType %>");
        }
        OpenHelpDoc();
    </script>

   

</head>
<body>
    <form id="form1" runat="server" method="post" enctype="multipart/form-data">
    <div>
        <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="middle" style=" height: 30px;">
                    &nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                    �ļ����߱༭
                </td>
                <td align="right" valign="middle" style=" height: 30px;">
                    �����ļ����Ҽ����Ϊ����<asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="green"
                    >[HyperLink1]</asp:HyperLink>&nbsp;
                    <img class="HerCss" onclick="selectyinzhang();" src="../../images/Button/InsertYinZhang.gif" />
                    <img class="HerCss" onclick="insertqianming();" src="../../images/Button/InsertQianMing.gif" />
                    <img class="HerCss" onclick="selectredhead();" src="../../images/Button/InsertRedHead.gif" />
                    
                    <input onclick="SaveToWeb()" style="width: 80px" type="button" value="�����ļ�" />
                    <input onclick="Track()" style="width: 80px" type="button" value="�ļ����" />
                    <input onclick="UnTrack()" size="20" style="width: 80px" type="button" value="ȡ�����" />
                    <input onclick="ShowTrack()" size="20" style="width: 85px" type="button" value="��ʾ�ۼ�" />
                    <input onclick="UnShowTrack()" size="20" style="width: 80px" type="button" value="���غۼ�" />&nbsp;
                </td>
            </tr>
        </table>
        <table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1"
            height="100%">
            <tr>
                <td style="padding-left: 5px; background-color: #ffffff">
                      <script src="../../JS/LoadWebOffice.js" type="text/javascript"></script>

                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

 <script language="javascript" type="text/javascript">
     var documentopenflag = 0;

     function SaveToWeb() {
         document.all.WebOffice1.HttpInit();
         document.all.WebOffice1.HttpAddPostString("RecordID", "200601022");
         document.all.WebOffice1.HttpAddPostString("UserID", "��ֳ�");
         document.all.WebOffice1.HttpAddPostCurrFile("FileData", '<%=Request.QueryString["FilePath"].ToString() %>');
         //alert(window.location.host);
         document.all.WebOffice1.HttpPost("http://" + window.location.host + "<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/DsoFramer/SaveDoc.aspx?FilePath=<%=Request.QueryString["FilePath"].ToString() %>");
         alert("���ļ����޸��Ѿ�����ɹ���");
         window.close();
     }

     function printviewexit() {
         document.all.WebOffice1.PrintPreviewExit();
     }
     function fileclose() {
         document.all.WebOffice1.Close();
     }

     function selectyinzhang() {
         var wName;
         var RadNum = Math.random();
         wName = window.showModalDialog('../Main/SelectYinZhang.aspx?Radstr=' + RadNum, '', 'dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
         if (wName == null || wName == "")
         { }
         else {
             var res = document.all.WebOffice1.InsertFile("http://" + window.location.host + "<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/" + wName, 8);

         }
     }

     function selectredhead() {
         var wName;
         var RadNum = Math.random();
         wName = window.showModalDialog('../Main/SelectRedHead.aspx?Radstr=' + RadNum, '', 'dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
         if (wName == null || wName == "")
         { }
         else {
             var res = document.all.WebOffice1.InsertFile("http://" + window.location.host + "<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/" + wName, 1);
         }
     }



     function insertqianming() {
         var wName;
         var RadNum = Math.random();
         wName = window.showModalDialog('../DsoFramer/InsertQianMing.aspx?Radstr=' + RadNum, '', 'dialogWidth:400px;DialogHeight=450px;status:no;help:no;resizable:yes;');
         if (wName == null || wName == "")
         { }
         else {
             document.all.WebOffice1.InsertFile("http://" + window.location.host + "<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/" + wName, 8);
         }
     }

     function Track() {
         alert("<%=FTD.Unit.PublicMethod.GetSessionValue("UserName")%>");
             document.all.WebOffice1.SetCurrUserName("<%=FTD.Unit.PublicMethod.GetSessionValue("UserName")%>");
             document.all.WebOffice1.SetTrackRevisions(1);
         }
         function UnTrack() {
             document.all.WebOffice1.SetTrackRevisions(0);
         }
         function ShowTrack() {
             document.all.WebOffice1.ShowRevisions(1);
         }
         function UnShowTrack() {
             document.all.WebOffice1.ShowRevisions(0);
         }
    </script>