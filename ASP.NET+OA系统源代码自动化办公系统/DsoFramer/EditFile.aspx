<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditFile.aspx.cs" Inherits="DsoFramer_EditFile" %>
<html>
	<head>
		<title>企业OA综合管理平台</title>
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">  
  
        <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		
    <SCRIPT language="javascript" event="NotifyCtrlReady" for="FramerControl1">		
        function OpenHelpDoc()
        {
            document.all.FramerControl1.Open("../UploadFile/<%=Request.QueryString["FilePath"].ToString() %>", true);
        }
        OpenHelpDoc();        
    </SCRIPT>
		<script language="javascript">
		var documentopenflag=0;
        function NewDoc(filetype){
        if (filetype=='xls')
        document.all.FramerControl1.CreateNew("Excel.Sheet");
        if (filetype=='doc')
        document.all.FramerControl1.CreateNew("Word.Document");
        if (filetype=='ppt')
        document.all.FramerControl1.CreateNew("PowerPoint.Show");
        }
        function OpenDoc(){        
                document.all.FramerControl1.showdialog(1);
        }
        function OpenWebDoc(filetype){
            if (filetype=='doc')
            document.all.FramerControl1.Open("../UploadFile/633520231204062500.doc", true);//doc模板
            if (filetype=='xls')
            document.all.FramerControl1.Open("../UploadFile/633520231204062500.doc", true);//xls模板
        }
        function SaveToLocal(){
        alert('将保存在您电脑的c:\\mydoc.doc')
            document.all.FramerControl1.Save("c:\\mydoc.doc",true);
        }
        function SaveToWeb(){
            document.all.FramerControl1.HttpInit();
            
            document.all.FramerControl1.HttpAddPostString("RecordID","200601022");
            document.all.FramerControl1.HttpAddPostString("UserID","李局长");
            document.all.FramerControl1.HttpAddPostCurrFile("FileData", "<%=Request.QueryString["FilePath"].ToString() %>");
            //alert(window.location.host);
            document.all.FramerControl1.HttpPost("http://"+window.location.host+"<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/DsoFramer/SaveDoc.aspx?FilePath=<%=Request.QueryString["FilePath"].ToString() %>"); 
            alert("对文件的修改已经保存成功！");
            window.close();          
        }
        function Track(){
            document.all.FramerControl1.SetCurrUserName("<%=SDLX.Common.PublicMethod.GetSessionValue("UserName")%>");
            document.all.FramerControl1.SetTrackRevisions(1);
        }
        function UnTrack(){
            document.all.FramerControl1.SetTrackRevisions(0);            
        }
        function ShowTrack(){
            document.all.FramerControl1.ShowRevisions(1);            
        }
        function UnShowTrack(){
            document.all.FramerControl1.ShowRevisions(0);           
        }
        function print(){
            document.all.FramerControl1.PrintOut();           
         }
         function printview(){        
            document.all.FramerControl1.PrintPreview();           
         }
         function printviewexit(){        
            document.all.FramerControl1.PrintPreviewExit();           
         }
        function fileclose(){
          document.all.FramerControl1.Close();
        }
        
        function selectyinzhang()
        {
            var wName;
            var RadNum=Math.random();
            wName=window.showModalDialog('../Main/SelectYinZhang.aspx?Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
            if(wName==null||wName=="")
            {}
            else
            {
                document.all.FramerControl1.InSertFile("http://"+window.location.host+"<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/"+wName,8);
            }
        }
        
        function selectredhead()
        {
            var wName;
            var RadNum=Math.random();
            wName=window.showModalDialog('../Main/SelectRedHead.aspx?Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');
            if(wName==null||wName=="")
            {}
            else
            {
                document.all.FramerControl1.InSertFile("http://"+window.location.host+"<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/"+wName,0);
            }
        }
        
        
        
        function insertqianming()
        {
            var wName;
            var RadNum=Math.random();
            wName=window.showModalDialog('../DsoFramer/InsertQianMing.aspx?Radstr='+RadNum,'','dialogWidth:400px;DialogHeight=450px;status:no;help:no;resizable:yes;');
            if(wName==null||wName=="")
            {}
            else
            {
                document.all.FramerControl1.InSertFile("http://"+window.location.host+"<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/"+wName,8);
            }
        }
        
        
		</script>
</head>
<body>
    <form id="form1" runat="server" method="post" encType="multipart/form-data" >
    <div>    
     <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">            
            <tr>
                <td valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">&nbsp;<img src="../images/BanKuaiJianTou.gif" />
                文件在线编辑</td>
                <td align="right" valign="middle" style="border-bottom: #006633 1px dashed; height: 30px;">
                
                
            <img class="HerCss" onclick="selectyinzhang();"
                        src="../images/Button/InsertYinZhang.gif" />
                        
                         <img class="HerCss" onclick="insertqianming();"
                        src="../images/Button/InsertQianMing.gif" />
                        
                    <img class="HerCss" onclick="selectredhead();"
                        src="../images/Button/InsertRedHead.gif" />
                        
                        
                        
                        
                    <img src="../images/Button/JianGe.jpg" />
                    <input onclick="SaveToWeb()" style="width: 80px" type="button"
                                value="保存文件" />
                            <input  onclick="Track()" style="width: 80px" type="button"
                                value="文件留痕" />
                            <input  onclick="UnTrack()" size="20" style="width: 80px" type="button"
                                value="取消留痕" />
                            <input  onclick="ShowTrack()" size="20" style="width: 85px" type="button"
                                value="显示痕迹" />
                            <input  onclick="UnShowTrack()" size="20" style="width: 80px" type="button"
                                value="隐藏痕迹" />&nbsp;</td>
            </tr>
            <tr>
            <td height="3px" colspan="2" style="background-color: #ffffff"></td>
        </tr>
        </table>
    <table style="width: 100%" bgcolor="#999999" border="0" cellpadding="2" cellspacing="1" height="100%">            
        <tr>
            <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                <object id="FramerControl1" classid="clsid:00460182-9E5E-11D5-B7C8-B8269041DD57"
                    codebase="dsoframer.ocx" height="95%" width="100%">
                    <param name="_ExtentX" value="16960">
                    <param name="_ExtentY" value="13600">
                    <param name="BorderColor" value="-2147483632">
                    <param name="BackColor" value="-2147483643">
                    <param name="ForeColor" value="-2147483640">
                    <param name="TitlebarColor" value="-2147483635">
                    <param name="TitlebarTextColor" value="-2147483634">
                    <param name="BorderStyle" value="1">
                    <param name="Titlebar" value="0">
                    <param name="Toolbars" value="1">
                    <param name="Menubar" value="1">
                </object>
                </td>
        </tr>
        </table></div>
    </form>
</body>
</html>