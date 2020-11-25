<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyTemplate.aspx.cs" Inherits="KingTop.Web.Admin.SurveyTemplate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
<link href="../../css/ustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../../js/jquery.ui.form.select.js"></script>
<script type="text/javascript" src="../../js/publicform.js"></script>
    
    <link href="../../CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />   
     <script src="../../JS/Common.js" type="text/javascript"></script>
    <script src="../../JS/jquery-validationEngine.js" type="text/javascript"></script>
        <script type="text/javascript" src="../../js/Advertising.js"></script>
        <script src="../../Calendar/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/<%=Resources.Common.formValidationLanguage %>"></script>
            <script type="text/javascript">
                $(document).ready(function() {
                    $("#theForm").validationEngine({ validationEventTriggers: "blur",  //�������¼�  validationEventTriggers:"keyup blur",
                        inlineValidation: true, //�Ƿ�ʱ��֤��falseΪ�ύ��ʱ��֤,Ĭ��true
                        success: false, //Ϊtrueʱ��ʹ�в����ϵ�Ҳ�ύ��,false��ʾֻ��ȫ��ͨ����֤�˲����ύ��,Ĭ��false
                        promptPosition: "topRight"//��ʾ���ڵ�λ�ã�topLeft, topRight, bottomLeft,  centerRight, bottomRight
                    })
                });
    </script>    
</head>
<body>
    <form id="theForm" runat="server">   
    <div>
    <table id="_ListInfoListTable" style="width: 100%;" border="0">  
    <asp:Panel ID="plContent" runat="server">
    <tr><td colspan="2"> �������2 </td></tr>
     <tr><td colspan="2"> dbo.k_sysmessage </td></tr>
         <tr><td>1. aaa</td></tr>

<tr><td><input type="text" name="q25" id="q25" maxlength = "255" class ="validate[required,custom[onlyNumber]]" size=10 /></td></tr>

<tr><td>2. RMB</td></tr>

<tr><td><input type="text" name="q32" id="q32" maxlength = "255" class ="validate[required]" /></td></tr>

<tr><td>3. ���ں�ʱ�����</td></tr>

<tr><td><input type="text" name="q33" id="q33" maxlength = "255" class ="validate[required]" onFocus="WdatePicker({lang:'zh-cn',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" /></td></tr>

<tr><td>4. EMail����</td></tr>

<tr><td><input type="text" name="q34" id="q34" maxlength = "255" class ="validate[required,custom[email]]" /></td></tr>

<tr><td>5. �����ı�����</td></tr>

<tr><td><textarea name="q35" id="q35" class ="validate[required]"/></textarea></td></tr>

<tr><td>6. ���������</td></tr>

<tr><td><select id="q36" name="q36"><option  selected='selected' value="1|27">1</option><option   value="2|28">2</option><option   value="3|29">3</option><option   value="4|30">4</option><option   value="5|31">5</option><option   value="6|32">6</option><option   value="7|33">7</option></select></td></tr>

<tr><td>7. ��ѡ�б����</td></tr>

<tr><td><select id="q37" class="validate[required]"  multiple="multiple" name="q37"><option  selected='selected' value="1|34">1</option><option   value="2|35">2</option><option   value="3|36">3</option><option   value="4|37">4</option><option   value="5|38">5</option></select></td></tr>

<tr><td>8. ��ѡ����</td></tr>

<tr><td><input  type="radio" checked='checked' id="q38" name="q38" value="1|39" />1<input  type="radio"  id="q38" name="q38" value="2|40" />2<input  type="radio"  id="q38" name="q38" value="3|41" />3<input  type="radio"  id="q38" name="q38" value="4|42" />4<input  type="radio"  id="q38" name="q38" value="5|43" />5</td></tr>

<tr><td>9. ��ѡ����</td></tr>

<tr><td><input class="validate[minCheckbox[1],maxCheckbox[1000]]" checked='checked' type="checkbox" id="q39" name="q39" value="1|44" />1<input class="validate[minCheckbox[1],maxCheckbox[1000]]"  type="checkbox" id="q39" name="q39" value="2|45" />2<input class="validate[minCheckbox[1],maxCheckbox[1000]]"  type="checkbox" id="q39" name="q39" value="3|46" />3<input class="validate[minCheckbox[1],maxCheckbox[1000]]"  type="checkbox" id="q39" name="q39" value="4|47" />4<input class="validate[minCheckbox[1],maxCheckbox[1000]]"  type="checkbox" id="q39" name="q39" value="5|48" />5</td></tr>

<tr><td>10. FAIA</td></tr>

<tr><td><input type="text" name="q20" id="q20" maxlength = "255" class ="validate[required]" /></td></tr>

   
         <tr><td><asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Save %>" onclick="btnSave_Click" /> </td></tr>
         </asp:Panel>
         <asp:Panel ID="plPwd" runat="server" Visible="false">
         <tr>
         <td colspan="2">���ʾ���Ҫ��������ύ,������������</td>
         </tr>
         <tr>
         <td>����:</td>
         <td><asp:TextBox ID="txtPwd" runat="server"></asp:TextBox></td>
         </tr>
         <tr><td colspan="2"><asp:Button ID="btnPwd" runat="server" Text="<%$Resources:Common,Save %>" onclick="btnPwd_Click" /></td></tr>
         </asp:Panel>
    </table>   
    <asp:HiddenField ID="hdnSurveyID" runat="server" Value="15" /><asp:HiddenField ID="hdnSurveyColumn" runat="server" Value="25|5,32|1,33|7,34|8,35|3,36|2,37|4,38|6,39|9,20|1" />
    
     
    
    <div>            
       
   </div> 
   </form>    
</body>
</html>
