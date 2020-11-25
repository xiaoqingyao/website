var SurveyItem = {
    lastTypeId: "1",
    TypeChange: function() {
    var selectValue = $("input[type='radio'][id^='rbtlType_']:checked").val();
        if (selectValue == this.lastTypeId) {  //如果点击的操作是当前的
            return;
        }
        switch (this.lastTypeId) {
            case "1":
            case "5":
            case "8":
                $("#dl1").css("display", "none");
                break;
            case "2":
            case "4":
            case "6":
            case "9":
                //if (this.lastTypeId == "2" || this.lastTypeId == "4") {
                    $("#dl3").css("display", "none");
               // }
                $("#dl2").css("display", "none");               
                break;
        }
        switch (selectValue) {  //根据所选的更改数据 
            case "1":
            case "5":
            case "8":
                $("#dl1").css("display", "");
                break;
            case "2":
            case "4":
            case "6":
            case "9":
              //  if (this.lastTypeId == "2" || this.lastTypeId == "4") {
                    $("#dl3").css("display", "");
             //   }
                $("#dl2").css("display", "");                
                break;
        }
        this.lastTypeId = selectValue;
    }
};
