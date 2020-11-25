<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testupload.aspx.cs" Inherits="AllPower.WEB.SysAdmin.upfiles.testupload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>

<script language="javascript" src="../js/func.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
    
    function OpenWindow(URL,WindowName,Width,Height,Left,Top,Scro)
    {
        // window.open(URL,WindowName,'width='+Width+',height='+Height+',left='+Left+',top='+Top+',toolbar=no,menubar=no,scrollbars='+Scro)
        open(URL,'', 'width=' + Width + ',height=' + Height + ',left=' + Left + ',top=' + Top + ',toolbar=no,menubar=no,scrollbars=' + Scro);
	}

	//FormName:表单名，例如：form1
	//ElementName:控件名称，例如：txtSmallImage
	//ControlType:控件类型，0=select，其他为input
	//SaveType:保存文件名类型，1=原文件名，否则用时间重命名
	//UpType:上传文件类型：image=图片类型，file=文件类型，media=媒体类型
	//=============================以下3个参数用于自定义字段设置。如果非自定义字段设置的上传控件，则不用传参
	//ExtType:允许上传的文件类型，例如：jpg|gif|bmp
	//MaxSize:允许上传文件大小，单位K，例如：2048（表示2M）
	//GetSizeControl:如果上传设置了需要保存文件大小，则填写保存文件大小控件名称，否则不用填写,返回字节数。例如：ImageSize
	function InputFile(FormName, ElementName, UpType, ControlType, ExtType, MaxSize, GetSizeControl) {
	    //tmp = eval(FormName + "." + ElementName);
	    File = "11";
	    OpenWindow('../upfiles/upfile.aspx?pFile=' + File + '&FormName=' + FormName + '&ElementName=' + ElementName + '&ControlType=' + ControlType + '&UpType=' + UpType + '&ExtType=' + ExtType + '&MaxSize=' + MaxSize + '&GetSizeControl=' + GetSizeControl, 'Uploadfile', '430', '152', '100', '190', 'no')
	}

	function ShowFile(FormName, ElementName, SavePath) {
	    tmp = eval(FormName + "." + ElementName);
	    File = tmp.value;
	    if (File != "") {
	        OpenWindow('../upfiles/FileShow.aspx?pFile=' + File + '&SavePath=' + SavePath, 'LookFile', "600", "400", "100", "100", "yes");
	    }
	}

	//FormName:表单名，例如：form1
	//ElementName:控件名称，例如：txtSmallImage
	//ControlType:控件类型，0=select，其他为input
	function DelFile(FormName, ElementName, ControlType) {
	    var File = "";   //文件名称 ，如果为下拉列表，则为选择的选项
	    var selectIndex = "";  //下拉列表选择的选项索引
	    var objControl = document.getElementById(ElementName);
	    if (ControlType == "0") {
	        for (i = 0; i < objControl.options.length; i++) {
	            if (objControl.options[i].selected) {
	                if (File == "") {
	                    File = objControl.options[i].value;
	                    selectIndex = i;
	                }
	                else {
	                    File = File + "," + objControl.options[i].value;
	                    selectIndex = selectIndex + "," + i;
	                }
	            }
	        }
	    }
	    else if(objControl!="") {
	        File = objControl.value;
	    }

	    if (File != "") {
	        OpenWindow('../upfiles/FileDel.aspx?pFile=' + File + '&FormName=' + FormName + '&ElementName=' + ElementName + '&ControlType=' + ControlType + '&SelectIndex=' + selectIndex, "DelUploadFile", "400", "152", "100", "100", "yes");
	    }
	}	

    </script>

<body>
    <form id="form1" runat="server">
    
    <div>
    <table>
     <tr class="bg2" id="trTitlePic" runat ="server">
            <th><asp:Label ID="lbTitlePic" runat="server">文章图片</asp:Label>:</th>
            <td align="left">
                <asp:TextBox ID="txtSmallImage" runat="server" MaxLength="100" Width ="250" ReadOnly="true"></asp:TextBox><span style="color:#ff6600"> </span>
                <input type="button" id="upload" value="浏 览" runat="server" class="btn" onclick="InputFile('form1','txtSmallImage','image','','');" />
                <input type="button" id="txtSmallImage_Del" value="删 除" class="btn" runat="server" onclick="DelFile('form1','txtSmallImage','../../upfile/');" />
                <input type="button" id="txtSmallImage_Look" value="预 览" class="btn" runat="server" onclick="ShowFile('form1','txtSmallImage','../../upfile/');" />
                <label id="lblHDP" runat ="server" ><input name="IsHDP" id="IsHDP" runat ="server" type="checkbox" value="1" />是否幻灯片&nbsp; </label>
                <br />只能上传.jpg|.gif|.png|.bmp|.jpeg,2M以内的文件
                <span id="spanTitlePicHelp" runat ="server"></span>    
                <span id="spanTitlePic" runat ="server" style="color:red;display:none"></span>
           </td>
        </tr> 
        
        <tr class="bg2" id="tr1" runat ="server">
            <th><asp:Label ID="Label1" runat="server">文章附件</asp:Label>:</th>
            <td align="left">
                <asp:TextBox ID="txtFile" runat="server" MaxLength="100" Width ="250" ReadOnly="true"></asp:TextBox><span style="color:#ff6600"> </span>
                <input type="button" id="Button1" value="浏 览" runat="server" class="btn" onclick="InputFile('form1','txtFile','file','','htm');" />
                <input type="button" id="Button2" value="删 除" class="btn" runat="server" onclick="DelFile('form1','txtFile','../../upfile/');" />
                
                <label id="Label2" runat ="server" ><input name="IsHDP" id="Checkbox1" runat ="server" type="checkbox" value="1" />是否幻灯片&nbsp; </label>
                <br />只能上传.jpg|.gif|.png|.bmp|.jpeg,2M以内的文件
                <span id="span1" runat ="server"></span>    
                <span id="span2" runat ="server" style="color:red;display:none"></span>
           </td>
        </tr> 
        
        <tr class="bg2" id="tr2" runat ="server">
            <th><asp:Label ID="Label3" runat="server">图片组</asp:Label>:</th>
            <td align="left">
                <select size=4 style="width:120px" name="selImageList" multiple>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                </select><span style="color:#ff6600"> </span>
                <input type="button" id="Button3" value="浏 览" runat="server" class="btn" onclick="InputFile('form1','selImageList','image','0','');" />
                <input type="button" id="Button4" value="删 除" class="btn" runat="server" onclick="DelFile('form1','selImageList','0');" />
                
                <label id="Label4" runat ="server" ><input name="IsHDP" id="Checkbox2" runat ="server" type="checkbox" value="1" />是否幻灯片&nbsp; </label>
                <br />只能上传.jpg|.gif|.png|.bmp|.jpeg,2M以内的文件
                <span id="span3" runat ="server"></span>    
                <span id="span4" runat ="server" style="color:red;display:none"></span>
           </td>
        </tr> 
    </table>
    </div>
    </form>
</body>
</html>
