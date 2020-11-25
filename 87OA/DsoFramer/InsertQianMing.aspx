<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InsertQianMing.aspx.cs" Inherits="Main_InsertQianMing" %>

<HTML>
	<HEAD>
		<title>选择条件</title>
		<meta http-equiv="Content-Language" content="zh-cn">
		<LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<base target=_self />	
		<script  language="javascript">
           function  sendFromChild()  
            {       
                window.returnValue="InsertQianZhang.jpg";  
//                window.close();  
            }
            
            function  CCC()  
            {       
                window.returnValue="";  
//                window.close();  
            }
        </script>
</HEAD>
	<body scroll="no">
	<input type="button" value=" 撤销 " onclick="undo()"/>
    <input type="button" value=" 重做 " onclick="redo()"/>
    <input type="button" value=" 清除 " onclick="Clear()"/>
    <input type="button" value=" 加粗 " onclick="ChangeWidth(1)"/>
    <input type="button" value=" 变细 " onclick="ChangeWidth(-1)"/><br/>
    <input type="button" value=" 黑笔 " onclick="ChangeColor(0x000000)"/>
    <input type="button" value=" 红笔 " onclick="ChangeColor(0x0000ff)"/>
    <input type="button" value=" 绿笔 " onclick="ChangeColor(0x00ff00)"/>
    <input type="button" value=" 蓝笔 " onclick="ChangeColor(0xff0000)"/>
    <div id="containerDiv" style="border:1px solid #9db3c5; width:400px; height:300px">
    <object id="SignPanel" classid="CLSID:6F752F76-0FFD-4FE2-B9FB-051400791462" codeBase="sw.cab#Version=1,0,0,1">
    </object>
    </div><form id="form1" method="post" runat="server"><asp:Button ID="Button1" runat="server" OnClientClick="javascript:show()" Text="确认提交" OnClick="Button1_Click" />
    <asp:TextBox Width="0" Height="0" ID="tbSignData" runat="server"></asp:TextBox>
		</form>
		
		<script type="text/javascript">
	SignPanel.width=400;
	SignPanel.height=300;
	//alert(SignPanel.borderWidth+"=="+SignPanel.borderColor+"\n"+SignPanel.SignData);
	function show(){
		var str = SignPanel.SignData;
		document.getElementById("tbSignData").value = str;
		document.getElementById("form1").submit();
		//alert(str);
	}
	var sign = "0,2,37,49;38,48;3A,47;3D,47;41,46;45,46;49,46;4D,46;51,47;54,49;55,4A;59,4D;5A,50;5C,52;5D,57;5E,5C;5E,63;5E,68;5D,6F;5C"
							+",75;5A,7A;57,7F;53,85;51,87;4C,8C;49,8E;46,8F;44,90;42,91;41,91;3F,91;3F,90;3F,8F;3E,8D;3E,89;3E,83;3F,7D;45,76;50,6B;58"
							+",65;62,62;6A,60;72,60;78,60;7D,60;83,63;88,67;8C,6B;8F,70;91,75;92,7B;92,82;92,88;8F,91;8C,98;88,A0;83,A9;7C,B2;76,B8;70"
							+",BF;6B,C5;67,CB;63,CF;61,D1;61,D2;62,D2;63,D0;68,CD;71,C6;7D,BD;8D,B2;9F,A8;B2,9E;C0,98;CD,92;DC,8F;E8,8A;F2,87;F9,85;FF"
							+",83;102,83;102,82;103,81;103,80;;";
	function setvalue(){
		SignPanel.SignData=sign;
	}
	function undo(){
		SignPanel.Undo();
	}
	function redo(){
		SignPanel.Redo();
	}
	function ChangeWidth(delta){
		SignPanel.StrokeWidth=SignPanel.StrokeWidth+delta;
	}
	function ChangeColor(color){
		SignPanel.StrokeColor=color;
	}
	function Clear(color){
		SignPanel.Clear();
	}
	function About(color){
		SignPanel.About();
	}
	function Size(){
		var container = document.getElementById("containerDiv");
		if(SignPanel.width==400){
			SignPanel.width=600;
			container.style.width=600;
			SignPanel.height=400;
			container.style.height=400;
		}
		else{
			SignPanel.width=400;
			container.style.width=400;
			SignPanel.height=300;
			container.style.height=300;
		}
	}
</script>

	</body>			
</HTML>