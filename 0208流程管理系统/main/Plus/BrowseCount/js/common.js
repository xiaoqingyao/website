

var url = document.getElementById('countjs').src;
//http: //localhost:4675/main/BrowseCount/js/common.js?nodecode=498001001&siteID=1&Type=1
var siteUrl = url.replace("/js/common.js", "/BrowseCountAPI.aspx"); //站点url


var src = siteUrl + "&curenturl=" + document.URL + "&lastUrl=" + document.referrer;

var loadscript = document.createElement('script');
loadscript.type = "text/javascript";
loadscript.src = src;
document.body.appendChild(loadscript);



