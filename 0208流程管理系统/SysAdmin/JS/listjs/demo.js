// JavaScript Document

$(document).ready(function(){
		
	// first example
	$("#navigation").treeview({
		persist: "location",
		collapsed: true,
		unique: true
	});
	
	// second example
	$("#browser").treeview();
	$("#add").click(function() {
		var branches = $("<li><span class='folder'>的是同方的身份上的</span><ul>" + 
			"<li><span class='file'>的发生的讲课费</span></li>" + 
			"<li><span class='file'>的是覅上的花费</span></li></ul></li>").appendTo("#browser");
		$("#browser").treeview({
			add: branches
		});
		branches = $("<li class='closed'><span class='folder'>所得分后开始</span><ul><li><span class='file'>速度快回复的</span></li><li><span class='file'>的福克斯的</span></li></ul></li>").prependTo("#folder21");
		$("#browser").treeview({
			add: branches
		});
	});
	
	// third example
	$("#red").treeview({
		animated: "fast",
		collapsed: true,
		unique: true,
		persist: "cookie",
		toggle: function() {
			window.console && console.log("%o was toggled", this);
		}
	});
	
	// fourth example
	$("#black, #gray").treeview({
		control: "#treecontrol",
		persist: "cookie",
		cookieId: "treeview-black"
	});

});