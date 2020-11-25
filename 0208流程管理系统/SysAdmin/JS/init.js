// JavaScript Document

jQuery(function($) {
    $("html").css({ overflow: "hidden" })
    var dh = document.documentElement.clientHeight;
    var headHeight = $("#header").height();
    var footHeight = $("#footer").height();

    $("#mainTable").css({ height: dh - headHeight - footHeight + "px" });

    $("#nav>ul>li").hover(
		function() {
		    var offset = $(this).offset();
		    $(this).children("ul").css({ left: offset.left })
		    $(this).children("ul").show();
		},
		function() {
		    $("#nav li").children("ul").hide();
		});
    setInterval(roll, 2000);
    function roll() {
        $("#showNote ul")
		.animate({ marginTop: -22 },
				 function() {
				     $("#showNote li:first-child").appendTo(this)
				     $(this).css({ marginTop: 0 })
				 })
    }

    //弹出窗口
    var inittime = 30;

    //setIntervlal= setInterval(getMessage,1000);
    getMessage();
    function getMessage() {
        $.get("../SysManage/regexp.aspx",
			  function(data) {
			      data = data.replace(/<script.*>.*<\/script>/ig, "");
			      data = data.replace(/<\/?link.*>/ig, "");
			      data = data.replace(/<\/?html.*>/ig, "");
			      data = data.replace(/<\/?body.*>/ig, "");
			      data = data.replace(/<\/?head.*>/ig, "");
			      data = data.replace(/<\/?!doctype.*>/ig, "");
			      data = data.replace(/<title.*>.*<\/title>/ig, "");
			      data = data.replace(/<meta.*>.*<\/meta>/ig, "");
			      data = data.replace(/" "/ig, "");

			      if (data == "true") {
			          //alert(data);
			          var page = '../SysManage/MsgShow.aspx';
			          getData(page);
			          //sese();
			          v = setInterval(sese, 1000);
			          //clearInterval(setIntervlal);
			      } else {
			          closeMessage();
			      }
			  }

		);
    }
    function ins() {
        $("body").find("#message").remove();
        $('<div id="message">')
		  .append('<h4 class="msgtitle"><a class="close" href="javascript:;">X</a>信息提示</a></h4>')
		  .find(".close")
		  .click(function() {
		      closeMessage();
		  })
		  .end()
		  .append('<div id="msgcontainer"></div>')
		  .css({ top: getScroll() - 195 })
		  .appendTo("body");
    }

    function getData(path) {


        $.ajax({
            url: path,
            cache: false,
            success: function(data) {
                data = data.replace(/<\/?link.*>/ig, "");
                data = data.replace(/<\/?html.*>/ig, "");
                data = data.replace(/<\/?body.*>/ig, "");
                data = data.replace(/<\/?head.*>/ig, "");
                data = data.replace(/<\/?!doctype.*>/ig, "");
                data = data.replace(/<title.*>.*<\/title>/ig, "");
                data = data.replace(/<\/?meta.*>/ig, "");
                data = data.replace(/" "/ig, "");
                ins();
                //alert(data);
                $("#msgcontainer").html(data)
                $(".mnb").click(function() {
                    closeMessage();
                })
            }
        });
    }
    function sese() {
        inittime--;

        if (inittime > 0) {
            $("#showTime").html(inittime);
        } else {
            closeMessage();
        }

    }
    function reShowWIn() {
        inittime = 30;
        //setIntervlal= setInterval(getMessage,1000);
        getMessage();
    }


    //setInterval(setWinTime,5000)
    function closeMessage() {
       // clearInterval(v)
        $("body").find("#message").remove();
        //clearInterval(setIntervlal);				
        setTimeout(reShowWIn, 5000);
    }

    function getScroll() {
        var top = 0;
        var dh = document.documentElement.clientHeight;
        if (document.documentElement && document.documentElement.scrollTop) {
            top = document.documentElement.scrollTop;
        }
        else if (document.body) {
            top = document.body.scrollTop;
        }
        return top + dh;
    }
})