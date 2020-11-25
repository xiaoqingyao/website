$(reviewFlowDisplay);  // 流程审核的显示

// 流程审核的显示
function reviewFlowDisplay() {
    var isAllowFlow;

    if ($("#hdnIsAllowFlow") != null) {
        isAllowFlow = $("#hdnIsAllowFlow").val();

        if (isAllowFlow == "0") {  // 当前节点不启用流程审核
            $("#Header_FlowState").css("display", "none");
            $(".ListItem_FlowState").css("display", "none");
        }
    }
}
