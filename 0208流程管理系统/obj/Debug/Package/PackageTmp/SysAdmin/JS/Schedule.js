var showMD = function (sURL, vArguments, dialogWidth, dialogHeight) {
    var sf = "dialogWidth:" + dialogWidth + ";dialogHeight:" + dialogHeight + ";help:no;scroll:no"
    return vReturnValue = window.showModalDialog(sURL, vArguments, sf);
}
function closeAlldia() {
    var list = art.dialog.list;
    for (var i in list) {
        list[i].close();
    };
}
var count = 0;
var arr1 = new Array();
var arr2 = new Array();
var arr3 = new Array();
var arr4 = new Array();
var aArray = {}; //定义一个数组

arr1['_fc0'] = '我是神';
arr2['_fc0'] = '1';
arr3['_fc0'] = '12月17日~12月20日';
arr4['_fc0'] = '出差实施，提交出差申请';
arr1['_fc1'] = '人事是猪';
arr2['_fc1'] = '2';
arr3['_fc1'] = '12月19日';
arr4['_fc1'] = 'CRM会议';
arr1['_fc2'] = '你是神';
arr2['_fc2'] = '3';
arr3['_fc2'] = '12月22日 10:30';
arr4['_fc2'] = '系统换装';
arr1['_fc3'] = '是东方闪电';
arr2['_fc3'] = '3';
arr3['_fc3'] = '12月22日 12:00~12月22日 14:00';
arr4['_fc3'] = '下午会议';
//    Array.prototype.push.apply(arr1, arr2);
$(document).ready(function () {

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    var calendar = $('#calendar').fullCalendar({
        header: {
            left: '  prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay  '
        },
        selectable: true,
        selectHelper: true,
        select: function (start, end, allDay) {
            closeAlldia();
            $("#txtTitle").val("");
            $("#txtPe").val("");
            $("#txtContent").val("");
            $("#trCreator").hide();

            //对话框
            var info = $("#ScheduleNewDIV")[0];
            var a = $(this)[0];
            //显示时间格式
            var DateFStr = "M月d日"; if (allDay == false) DateFStr = "M月d日 HH:mm";
            var txtdf = $.fullCalendar.formatDate(start, DateFStr);
            var txtde = $.fullCalendar.formatDate(end, DateFStr);
            if (txtdf == txtde) txtde = ""; else txtde = "~" + txtde;
            $("#dateFrom").html(txtdf + txtde);
            //----------------
            //            $("#txtstartdate").datebox("setValue",start);
            //            $("#txtenddate").datebox("setValue", end);
            var txtbegin = $.fullCalendar.formatDate(start, "yyyy-MM-dd ");
            var txtend = $.fullCalendar.formatDate(end, "yyyy-MM-dd ");
            //------------------
            var txtbeginhh = $.fullCalendar.formatDate(start, "HH:mm");
            var txtendhh = $.fullCalendar.formatDate(end, "HH:mm");
            $("#beginhh").val(txtbeginhh);
            $("#endhh").val(txtendhh);

            art.dialog({
                id: 'input',
                title: '新建日程',
                content: info,
                lock: true,
                background: '#fff',
                opacity: 0.1,
                width: 300,
                height: 150,
                ok: function () {
                    var id = '_fc' + count++;
                    arr1[id] = $('#txtContent').val();
                    arr2[id] = $('#selType').val();
                    arr3[id] = txtdf + txtde;
                    arr4[id] = $("#txtTitle").val();
                    calendar.fullCalendar('renderEvent',
						{
						    id: id,
						    title: $("#txtTitle").val(),
						    start: start,
						    end: end,
						    backgroundColor: '#3a87ad',
						    allDay: allDay
						},
						true // make the event "stick"
					);
                    return true;
                },
                cancel: function () {

                },
                okVal: "保存"
            });
            $("#txtTitle").focus();
        },
        editable: true,
        events: [],
        eventClick: function (calEvent, jsEvent, view) {

            closeAlldia();
            var info = $("#ScheduleNewDIV")[0];
            var DateFStr = "M月d日"; if (calEvent.allDay == false) DateFStr = "M月d日 HH:mm";
            var txtdf = $.fullCalendar.formatDate(calEvent.start, DateFStr);
            var txtde = $.fullCalendar.formatDate(calEvent.end, DateFStr);
            if (txtdf == txtde) txtde = ""; else txtde = "~" + txtde;
            $("#dateFrom").html(txtdf + txtde);
            $("#txtTitle").val(calEvent.title);
            $("#txtPe").val('');
            $("#selType").val(arr2[calEvent.id]);
            $("#txtContent").val(arr1[calEvent.id]);

            art.dialog({
                id: 'show',
                padding: 0,
                content: info,
                title: '编辑日程',
                width: 300,
                height: 150,
                button: [{ name: '保存', callback: function () {
                    calendar.fullCalendar('updateEvent',
						{
						    id: calEvent.id,
						    title: $("#txtTitle").val(),
						    start: calEvent.start,
						    end: calEvent.end
						}
					);

                    var items = $(view.element[0]).find($(".fc-event-title"));
                    items.each(function () {
                        if ($(this).html() == calEvent.title) {
                            $(this).html($("#txtTitle").val())
                        }
                    });
                    calEvent.title = $("#txtTitle").val();
                    arr2[calEvent.id] = $("#selType").val();
                    arr1[calEvent.id] = $("#txtContent").val();
                    arr3[calEvent.id] = txtdf + txtde;
                    arr4[calEvent.id] = $("#txtTitle").val();
                }
                }, { name: '删除', callback: function () {
                    calendar.fullCalendar('updateEvent',
						{
						    _id: calEvent.id
						}
					);
                }
                }]
            });
        }
    });
});