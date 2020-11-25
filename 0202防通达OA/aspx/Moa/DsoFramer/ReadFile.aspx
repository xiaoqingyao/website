<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReadFile.aspx.cs" Inherits="OA.aspx.Moa.DsoFramer.ReadFile" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
  <LINK href="../../Style/Style.css" type="text/css" rel="STYLESHEET">  
  
        <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		
    <SCRIPT language="javascript" event="NotifyCtrlReady" for="WebOffice1">
        function OpenHelpDoc() {
            document.all.WebOffice1.LoadOriginalFile("../../UploadFile/<%=Request.QueryString["FilePath"].ToString() %>", "<%=FileType %>");
        }
        OpenHelpDoc();
    </SCRIPT>
		<script language="javascript">
		    var documentopenflag = 0;
		    function NewDoc(filetype) {
		        if (filetype == 'xls')
		            document.all.WebOffice1.CreateNew("Excel.Sheet");
		        if (filetype == 'doc')
		            document.all.WebOffice1.CreateNew("Word.Document");
		        if (filetype == 'ppt')
		            document.all.WebOffice1.CreateNew("PowerPoint.Show");
		    }
		    function OpenDoc() {
		        document.all.WebOffice1.showdialog(1);
		    }
		    function OpenWebDoc(filetype) {
		        if (filetype == 'doc')
		            document.all.WebOffice1.Open("../../UploadFile/633520231204062500.doc", true);//docģ��
		        if (filetype == 'xls')
		            document.all.WebOffice1.Open("../../UploadFile/633520231204062500.doc", true);//xlsģ��
		    }
		    function SaveToLocal() {
		        alert('�������������Ե�c:\\mydoc.doc')
		        document.all.WebOffice1.Save("c:\\mydoc.doc", true);
		    }
		    function Track() {
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
        function print() {
            document.all.WebOffice1.PrintOut();
        }
        function printview() {
            document.all.WebOffice1.PrintPreview();
        }
        function printviewexit() {
            document.all.WebOffice1.PrintPreviewExit();
        }
        function fileclose() {
            document.all.WebOffice1.Close();
        }
		</script>
</head>
<body>
    <form id="form1" runat="server" method="post" encType="multipart/form-data" >
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style=" height: 30px;">&nbsp;<img src="../../images/BanKuaiJianTou.gif" />
                <a class="hei" href="../Main/MyDesk.aspx">����</a>&nbsp;>>&nbsp;�ļ������Ķ�</td>
                <td align="right" valign="middle" style=" height: 30px;">
                   <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="False" Font-Underline="False" ForeColor="green"
                        NavigateUrl="../../SetupFile/����OfficeDSO���.rar" Target="_blank">[�����Ķ���������ز������ѹ�󣬵��Reg.batע�ᣡ]</asp:HyperLink>
                    &nbsp; �����ļ����Ҽ����Ϊ����<asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True"
                        Font-Underline="False" ForeColor="green" >[HyperLink1]</asp:HyperLink>&nbsp;
                            <input  onclick="ShowTrack()" size="20" style="width: 85px" type="button"
                                value="��ʾ�ۼ�" />
                            <input  onclick="UnShowTrack()" size="20" style="width: 80px" type="button"
                                value="���غۼ�" />
                    &nbsp;
                    &nbsp;<button type="button" class="btn btn-yellow" onclick="javascript:window.history.go(-1)">����</button></td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
     <table style="width: 100%" bgcolor="#999999" class="gridview_m" border="0" cellpadding="2" cellspacing="1"
            height="100%">
            <tr>
                <td style="padding-left: 5px; background-color: #ffffff">
                      <script src="../../JS/LoadWebOffice.js" type="text/javascript"></script>

                </td>
            </tr>
        </table></div>
    </form>
</body>
</html>