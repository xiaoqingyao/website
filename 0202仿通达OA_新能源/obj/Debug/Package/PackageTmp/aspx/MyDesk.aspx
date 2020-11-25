<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyDesk.aspx.cs" Inherits="OA.aspx.MyDesk" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache">
        <meta http-equiv="Expires" content="0">
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
        <title>个人桌面</title>

        <link href="../../css/main.css" rel="stylesheet" />
        <link rel="stylesheet" href="../../css/personal/desktop.css" type="text/css" />
    </head>

    <body>
        <div class="slideBox">
            <div id="control">
                <div class="controlCon">
                    <span class="control-l"></span>
                    <span class="control-c"></span>
                    <span class="control-r">
                        <a class="cfg"  href="javascript: location.reload()" title="刷新工作台"  id="openAppBox"></a>
                    </span>
                </div>
            </div>

            <div id="swiperBox">
            </div>
        </div>
    </body>

    <script src="../../common-js/WdatePicker/WdatePicker.js"></script>
    <script src="../../common-js/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="../../common-js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../common-js/bootstrap/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="../../common-js/publicFunction.js"></script>
    <script type="text/javascript" src="../../common-js/tab.js"></script>
    <script src="../js/layer/layer.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/main.js"></script>

    <script type="text/javascript">
        //所有桌面数据
        var dtObj =  <%=DeskTopObjJson %>;

    </script>

    <script type="text/javascript" src="../../common-js/idangerous.swiper/idangerous.swiper.js"></script>
    <script type="text/javascript" src="../js/personal/desktop.js"></script>
    <script type="text/javascript" language="javascript">loadDesktopData();</script>
</html>
