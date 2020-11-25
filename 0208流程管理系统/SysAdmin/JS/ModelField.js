/*
时间:2010-03-12
作者:周武
用途:模型管理中字段管理的全部功能
*/
/// <reference path="jquery-3.2-vsdoc2.js" />

var ModelField = {
    $: jQuery,
    nextId: 1,  //中间值过渡字段
    isSelectRadio: "rbtlFieldControls", //已经选择了的字段类型
    selectRadioNext: function(radioName) {  //选择字段类型后进行的操作       
        if (radioName == this.isSelectRadio) {
            return;
        }
        $("input:checked[name='" + radioName + "']").attr("checked", "");
        this.isSelectRadio = radioName;
    }
    ,
    setMultiFile: function() {
        var currentValue;

        $("#radlIsMultiFile").find("input").each(function() {
            if ($(this).attr("checked") == true) {
                currentValue = $(this).val();
            }
        });

        if (currentValue == "1") {
            $("#dlMultiFieldHeigh").css("display", "block");
        }
        else {
            $("#dlMultiFieldHeigh").css("display", "none");
        }
    },
    onEditorChange: function() {
        var selectedValue;
        selectedValue = $("#ddlEditorType").val();

        switch (selectedValue) {
            case "1":
                $("#Editor_eWebEditor").css("display", "none");
                $("#Editor_CKEditor").css("display", "block");
                break;
            case "2":
                $("#Editor_CKEditor").css("display", "none");
                $("#Editor_eWebEditor").css("display", "block");
                break;
        }
    },
    BasicFieldChange: function(id) {  //替换选择
        var selectRadio = $("input:checked[name = '" + id + "']").val();
        if (this.nextId == selectRadio) {
            return;
        }


        var pasetSelectRadio = parseInt(selectRadio);
        if (pasetSelectRadio == 8 || pasetSelectRadio == 9 || pasetSelectRadio == 10) {
            $("#columnLength").css("display", "none");
        }
        else {
            $("#columnLength").css("display", "block");
        }
        if (pasetSelectRadio == 11) {
            $("#BasicImagesThumb").css("display", "block");
        }
        else {
            $("#BasicImagesThumb").css("display", "none");
        }
        var pastnextId = this.nextId;
        if (this.nextId > 9) { //大于9 则转成a,b,c这种形式
            pastnextId = pastnextId.toString(16);
        }
        if (pasetSelectRadio > 9) {
            pasetSelectRadio = pasetSelectRadio.toString(16);
        }
        $("dl[id^='tb" + pastnextId + "']").css("display", "none");


        if (this.nextId == 3 && pasetSelectRadio != 2) {  //不选择多行文本
            $("dl[id^='tb2']").css("display", "none");
        }
        else if (this.nextId == 4 && pasetSelectRadio != 5) {  //没有选择4的情况下
            $("dl[id^='tb5']").css("display", "none");
            $("dl[id^='te1']").css("display", "none");
        }
        else if (this.nextId == 5 || this.nextId == 6 || this.nextId == 7) {  //没有选择列表时
            $("dl[id^='tb4']").css("display", "none");
            $("dl[id^='te1']").css("display", "none");
        } else if (this.nextId == 8) { //没有选择货币时
            $("dl[id^='tb9']").css("display", "none");
        } else if (this.nextId == 12) {   //没有选择文件时
            $("dl[id^='tbb']").css("display", "none");
        }

        if (pasetSelectRadio == "3") {  //选择多行文本
            $("dl[id^='tb2']").css("display", "block");
        } else if (pasetSelectRadio == "4" || pasetSelectRadio == "5" || pasetSelectRadio == "6" || pasetSelectRadio == "7") { //选择列表
            if (pasetSelectRadio == "4") {
                $("dl[id^='tb5']").css("display", "block");
            }
            $("dl[id^='te1']").css("display", "none");
            $("#rbtlDropDownDataType_0").attr("checked", "true")
            $("dl[id^='tb4']").css("display", "block");
        } else if (pasetSelectRadio == "8") { //如果选择了数字
            $("dl[id^='tb9']").css("display", "block");
        } else if (selectRadio == "12") {
            $("dl[id^='tbb']").css("display", "block");
        }
        $("dl[id^='tb" + pasetSelectRadio + "']").css("display", "block");
        this.nextId = parseInt(selectRadio);
        $("#tcdefault").css("display", selectRadio == "10" ? "none" : "block");  //如果选择了日期,则隐藏默认值框        
        this.selectRadioNext("rbtlFieldControls");
        if (selectRadio != "1") {
            $("dl[id^='td']").css("display", "none");  //控制下面的验证框隐藏
            $("#rbtlValidationTypes_0").attr("checked", "true");
        }
    },
    BasicFieldInit: function(basicField) {  //替换选择
        var selectRadio = basicField;
        if ("1" != selectRadio) {
            $("dl[id^='tb11']").css("display", "none");
            $("dl[id^='tb12']").css("display", "none");
            $("dl[id^='tb13']").css("display", "none");
        }
        var pasetSelectRadio = parseInt(selectRadio);
        if (pasetSelectRadio == 8 || pasetSelectRadio == 9 || pasetSelectRadio == 10) {
            $("#columnLength").css("display", "none");
        } else {
            $("#columnLength").css("display", "block");
        }
        if (pasetSelectRadio == 11 || pasetSelectRadio == 12) {
            this.setMultiFile();
        }
        if (pasetSelectRadio == 11) {
            $("#BasicImagesThumb").css("display", "block");
        } else {
            $("#BasicImagesThumb").css("display", "none");
    }
        if (pasetSelectRadio == 3) {
            this.onEditorChange();
        }
        var pastnextId = this.nextId;
        if (this.nextId > 9) { //大于9 则转成a,b,c这种形式
            pastnextId = pastnextId.toString(16);
        }
        if (pasetSelectRadio > 9) {
            pasetSelectRadio = pasetSelectRadio.toString(16);
        }
        $("dl[id^='tb" + pastnextId + "']").css("display", "none");


        if (this.nextId == 3 && pasetSelectRadio != 2) {  //不选择多行文本
            $("dl[id^='tb2']").css("display", "none");
        }
        else if (this.nextId == 4 && pasetSelectRadio != 5) {  //没有选择4的情况下
            $("dl[id^='tb5']").css("display", "none");
            $("dl[id^='te1']").css("display", "none");
        }
        else if (this.nextId == 5 || this.nextId == 6 || this.nextId == 7) {  //没有选择列表时
            $("dl[id^='tb4']").css("display", "none");
            $("dl[id^='te1']").css("display", "none");
        } else if (this.nextId == 8) { //没有选择货币时
            $("dl[id^='tb9']").css("display", "none");
        } else if (this.nextId == 12) {   //没有选择文件时
            $("dl[id^='tbb']").css("display", "none");
        }

        if (pasetSelectRadio == "3") {  //选择多行文本
            $("dl[id^='tb2']").css("display", "block");
        } else if (pasetSelectRadio == "4" || pasetSelectRadio == "5" || pasetSelectRadio == "6" || pasetSelectRadio == "7") { //选择列表
            if (pasetSelectRadio == "4") {
                $("dl[id^='tb5']").css("display", "block");
            }
            $("dl[id^='te1']").css("display", "none");
            $("#rbtlDropDownDataType_0").attr("checked", "true")
            $("dl[id^='tb4']").css("display", "block");
        } else if (pasetSelectRadio == "8") { //如果选择了数字
            $("dl[id^='tb9']").css("display", "block");
        } else if (selectRadio == "12") {
            $("dl[id^='tbb']").css("display", "block");
        }
        $("dl[id^='tb" + pasetSelectRadio + "']").css("display", "block");
        this.nextId = parseInt(selectRadio);
        $("#tcdefault").css("display", selectRadio == "10" ? "none" : "block");  //如果选择了日期,则隐藏默认值框
        this.selectRadioNext("rbtlFieldControls");
        if (selectRadio != "1") {
            $("dl[id^='td']").css("display", "none");  //控制下面的验证框隐藏
            $("#rbtlValidationTypes_0").attr("checked", "true");
        }
        if (pasetSelectRadio == NaN || pasetSelectRadio < 1 || pasetSelectRadio > 12) {
            $("#tcdefault").css("display", "none");
            $("#columnLength").css("display", "none");
        }
    }
    ,
    FieldControlsChange: function() {  //系统预定义控件单击
        this.selectRadioNext("rbtlBasicField");
        $("dl[id^='tb']").css("display", "none");
    },
    ValidationTypesChange: function(id) {  //验证规则单击
        var selectId = $("input:checked[name = '" + id + "']");  //得到选中的对像     
        var selectRadio = selectId.val();
        $("dl[id^='td']").css("display", selectRadio == -1 ? "none" : "block");  //控制下面的验证框是否显示
        var selectIdParent = selectId.parent();
        var strMessage = selectIdParent.attr("message");
        var strValidation = selectIdParent.attr("Validation");
        $("#txtValidationMessage").val(strMessage);
        $("#TextBoxValidation").val(strValidation);
    },
    ValidationDefaultTimeClick: function(strDisplayValue) { //默认指定时间单击  
        $("#txtDefaultDateValue").css("display", strDisplayValue);
    },
    DropDownDataTypeClick: function(type) {   //下拉绑定点击
        var tbText = $("#tb42");
        var tbSql = $("dl[id^='te1']");
        if (type == 1) {
            if (tbText.css("display") == "none") {
                tbText.css("display", "block");
                tbSql.css("display", "none");
            }
        } else {
            if (tbSql.css("display") == "none") {
                tbText.css("display", "none");
                tbSql.css("display", "block");
            }
        }
    },
    CheckBoxClick: function(id, checked) {  //单选框单击    
        $("#" + id).css("display", checked ? "block" : "none");
    },
    IsUploadClick: function(id) {  //是否允许上传
        var selectId = $("input:checked[name = '" + id + "']");  //得到选中的对像     
        var selectRadio = selectId.val();
        if (selectRadio == "0") {  //不允许
            $("dl[id^='tbb21']").css("display", "none");
        } else {
            $("dl[id^='tbb21']").css("display", "block");
        }
    },
    EditLoad: function() {   //修改时初始化状态
        $("#IsSearchDiv").css("display", $("#IsSearch").attr("checked") ? "block" : "none");
        $("#IsListEnableDiv").css("display", $("#IsListEnable").attr("checked") ? "block" : "none");
        $("#ListIsLinkDiv").css("display", $("#ListIsLink").attr("checked") ? "block" : "none");
        $("#ListIsOrderDiv").css("display", $("#ListIsOrder").attr("checked") ? "block" : "none");
        $("#ListIsDefaultOrderDiv").css("display", $("#ListIsDefaultOrder").attr("checked") ? "block" : "none");
    },
    SelectColumn: function(strValue) { //读取此表下的列
        $.ajax({
            url: "../../ajax/SysAdmin/Model/ModelFiledSelectColumn.ashx",
            cache: false,
            data: { tableId: strValue },
            success: function(msg) {
                msg = eval(msg);
                var strValue = "";
                $.each(msg, function(i, n) {
                    strValue += "<option>" + n.name + "</option>";

                });
                $("#ddlTextColumn").html(strValue);
                $("#ddlValueColumn").html(strValue);
                window.ModelField.selectColumnSql();
                //                window.ModelField.selectColumnSq(); 
            },
            error: function(msg, textStatus) {
                alert(textStatus);
            }
        });
    },
    selectColumnSql: function() { //选择下拉列后自动生成sql语句
        var strWhere = $("#txtSqlWhere").val();
        strWhere = strWhere != "" ? " where " + strWhere : "";  //如果有条件 则自动加上where 关键字
        var TextColumn = $("#ddlTextColumn").val();
        var ValueColumn = $("#ddlValueColumn").val();
        $("#txtDropDownSql").val("select " + TextColumn + "," + ValueColumn + " from " + $("#ddlDataBase option[selected]").text() + strWhere);
        $("#hidValueColumn").val(ValueColumn);
        $("#hidTextColumn").val(TextColumn);
    }
}