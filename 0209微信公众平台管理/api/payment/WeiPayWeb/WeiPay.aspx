<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeiPay.aspx.cs" Inherits="MxWeiXinPF.Web.api.payment.WeiPayWeb.WeiPay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>���ں�JSAPI֧��������ҳ</title>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
  <%--  <script language="javascript" src="http://res.mail.qq.com/mmr/static/lib/js/jquery.js" type="text/javascript"></script>
    <script language="javascript" src="http://res.mail.qq.com/mmr/static/lib/js/lazyloadv3.js" type="text/javascript"></script>--%>

    <script src="JS/jquery.js" type="text/javascript"></script>
    <script src="JS/lazyloadv3.js" type="text/javascript"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1" />
 
</head>
<body>
 <form id="form1" runat="server">
     <div>
                 <table class="content">
                     <tr>
                         <td  class="td_title">�̻������ţ�</td>
                        <td class="td_input"><asp:Label ID="lblOrderSN" runat="server" Text=""></asp:Label></td>
                     </tr>
                       <tr>
                         <td class="td_title">֧�����(��)��</td>
                        <td class="td_input"> <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label></td>
                     </tr>
                       <tr>
                         <td class="td_title">��Ʒ������</td>
                        <td class="td_input"> <asp:Label ID="lblBody" runat="server" Text=""></asp:Label></td>
                     </tr>
                   
                     
                       <tr>
                         <td class="td_title">�Զ��������</td>
                        <td class="td_input">  <asp:Label ID="lblAttach" runat="server" Text=""></asp:Label>    </td>
                     </tr>
                     
                         <tr>
                         <td class="td_title">OpenId��</td>
                        <td class="td_input">  <asp:Label ID="lblOpenId" runat="server" Text=""></asp:Label>    </td>
                     </tr>
                          <tr>
                         <td class="td_title">&nbsp;</td>
                        <td class="td_input"> 
                         <input type="button" value="ȷ��֧��"  id="getBrandWCPayRequest" onclick="SavePay()" />
                          </td>
                     </tr>
                 </table>
        </div>
     
 
<%--    <div class="WCPay">
    <h1 class="title"  id="getBrandWCPayRequest" onclick="SavePay()" >�ύ</h1>
    
<a id="getBrandWCPayRequest" href="javascript:void(0);">
            <h1 class="title" onclick="">����ύ������΢��֧��</h1>
        </a>

    </div>--%>
        </form>
</body>
</html>


<script type="text/javascript">

function SavePay(){
    WeixinJSBridge.invoke('getBrandWCPayRequest', {
                   "appId": "<%= WeiPay.PayConfig.AppId %>", //���ں����ƣ����̻�����
                   "timeStamp": "<%= TimeStamp %>", //ʱ���
                   "nonceStr": "<%= NonceStr %>", //�����
                   "package": "<%= Package %>", //��չ��
                   "signType": "MD5", //΢��ǩ����ʽ:1.sha1
                   "paySign": "<%= PaySign %>" //΢��ǩ��
               }, 
               function(res) {
                   if (res.err_msg == "get_brand_wcpay_request:ok") {
                       alert("΢��֧���ɹ�!");
                   } else if (res.err_msg == "get_brand_wcpay_request:cancel") {
                       alert("�û�ȡ��֧��!");
                   } else {
                       alert(res.err_msg);
                       alert("֧��ʧ��!");
                   }
                   // ʹ�����Ϸ�ʽ�ж�ǰ�˷���,΢���Ŷ�֣����ʾ��res.err_msg�����û�֧���ɹ��󷵻�ok����������֤�����Կɿ���
                   //���΢���Ŷӽ��飬���յ�ok����ʱ�����̻���̨ѯ���Ƿ��յ����׳ɹ���֪ͨ�����յ�֪ͨ��ǰ��չʾ���׳ɹ��Ľ��棻����ʱδ�յ�֪ͨ���̻���̨�������ò�ѯ�����ӿڣ���ѯ�����ĵ�ǰ״̬����������ǰ��չʾ��Ӧ�Ľ��档
               });    
}
   


</script>