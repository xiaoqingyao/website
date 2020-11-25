var Advertising = {  //创建对像
    ddlSizeChange: function(strValue) {
        var strs = strValue.split("x");
        if (strs.length == 2) {  //合格数据
            $("#txtWidth").val(strs[0]);
            $("#txtHeight").val(strs[1]);
        }
    },
    lastTypeId: 1,
    lastAdvertisingTypeId: 0,
    TypeChange: function() { //点周类型操作
    var selectValue = $("input[type='radio'][id^='rbtlType_']:checked").val();
        if (selectValue == this.lastTypeId) {  //如果点击的操作是当前的
            return;
        }
        var tempTypeId = this.lastTypeId;
        this.lastTypeId = selectValue;
        this.TypeTwo(selectValue);
        var selectTypeValue = $("input[type='radio'][id^='rbtlAdvertisingType_']:checked").val();
        if (selectTypeValue == "0") { //如果当前选择的是默认设置,则不处理
            return;
        }

        this.TypeNext(selectValue, tempTypeId);
    },
    AdvertisingTypeChange: function() {
    var selectTypeValue = $("input[type='radio'][id^='rbtlAdvertisingType_']:checked").val();      
        if (selectTypeValue == this.lastAdvertisingTypeId) {
            return;
        }
        if (selectTypeValue == 0) {
            $("#TypeDiv" + this.lastTypeId).css("display", "none");
        }
        else {
            $("#TypeDiv" + this.lastTypeId).css("display", "");
        }
        this.lastAdvertisingTypeId = selectTypeValue;
    },
    TypeNext: function(strTypeId, tempTypeId) {  //真正操作的方法
        $("#TypeDiv" + strTypeId).css("display", "");
        $("#TypeDiv" + tempTypeId).css("display", "none");
    },
    TypeTwo: function(strTypeId) {

        switch (strTypeId) {
            case "1":
                $("#rbtlWeight_2").attr("disabled", "");
                break;
            case "2":
            case "3":
            case "4":
            case "5":
            case "6":
            case "7":
                $("#rbtlWeight_2").attr("disabled", "true");
                break;
        }
    },
    PopChanage: function(strName, strValue) {
        switch (strValue) {
            case "1":
                $("#" + strName + "Left").html("左");
                $("#" + strName + "Top").html("上");
                break;
            case "2":
                $("#" + strName + "Left").html("左");
                $("#" + strName + "Top").html("下");
                break;
            case "3":
                $("#" + strName + "Left").html("右");
                $("#" + strName + "Top").html("上");
                break;
            case "4":
                $("#" + strName + "Left").html("右");
                $("#" + strName + "Top").html("下");
                break;
        }
    },
    lastAdvertisementId: 1,
    AdvertisementTypeChange: function() {
    var selectValue = $("input[type='radio'][id^='rbtlType_']:checked").val();
        if (selectValue == this.lastAdvertisementId) {  //如果点击的操作是当前的
            return;
        }
        this.AdvertisementTypeTwo(selectValue);
        this.TypeNext(selectValue, this.lastAdvertisementId);
        this.lastAdvertisementId = selectValue;
    },
    AdvertisementTypeTwo: function(strTypeId) {

        switch (strTypeId) {
            case "1":
                $("#cblIsClick").attr("disabled", "");
                break;
            case "2":
            case "3":
            case "4":
            case "5":
                $("#cblIsClick").attr("disabled", "true");
                break;
        }
    }
}

