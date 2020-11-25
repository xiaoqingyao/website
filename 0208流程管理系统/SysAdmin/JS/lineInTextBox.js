
//** by 胡志瑶 2010-9-20 文本框加行号
var num = "";

function line(n) {
    for (var i = 1; i <= n; i++) {
        if (document.all) {
            num += i + "\r\n";
        } else {
            num += i + "\n";
        }
    }
    $("#row").val(num);
    num = "";    
}

jQuery(function() {
    $("#txtLableContent").keyup(function() {
        var obj = $("#txtLableContent");
        var str = obj.val();
        str = str.replace(/\r/gi, "");
        str = str.split("\n");
        n = str.length;
        line(n);
    });
    $("#txtLableContent").keyup();
    $("#txtLableContent").scroll(function() {   
        document.getElementById("row").scrollTop = this.scrollTop;
    });
});