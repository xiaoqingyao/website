// JavaScript Document
jQuery.fn.selectobj=function(opt){
	var togger=true;
	jQuery("select")
	.hide()
	.each(function(index, domEle){
		//alert($(domEle).width());
		var sel=jQuery("<h4>")
		.addClass(opt.selectBar)
		.css({width:$(domEle).width()?$(domEle).width():""})
		.html(jQuery(this).getSelected(domEle))
		.click(function(){
			togger?jQuery(this).next().show():jQuery(this).next().hide();
			togger=!togger;
		})
		.insertBefore(domEle);
		
		var ul=jQuery("<ul>")
		.hide()
		.addClass(opt.list)
		.css({width:$(domEle).width()+10})
		.insertAfter(sel);
		
		jQuery(this).getOptions(domEle,ul,opt,sel)
		
		jQuery("*").click(function(ev){
			var e=jQuery(ev.target).attr("rel");
			var c=jQuery(ev.target).attr("class");
			//alert(e)
			if(c!=opt.selectBar)
			{
				jQuery(ul).hide();
				togger=true;
			}
			else{
				if(togger){
					jQuery(ul).hide();
					}
				}
		})
	});
}
jQuery.fn.getSelected=function(domEle){
	var t;
	$(domEle).children("option:selected")
	.each(function(){
		t=jQuery(this).html();
	})
	return t;
}
jQuery.fn.getOptions=function(domEle,ul,opt,sel){
	$(domEle,this).children("option")
	.each(function(index,optEle){
		var selected=this.selected;
		jQuery("<li>")
		.addClass(selected?opt.seled:opt.unseled)
		.css({width:$(domEle).width()+4})
		.click(function(){
			jQuery(this).setSelected(optEle,sel,opt);
		})
		.mouseover(function(){
			jQuery(this).siblings().removeClass(opt.seled);
			jQuery(this).addClass(opt.seled);
		})
		.mouseout(function(){
		})
		.html(jQuery(this).html())
		.appendTo(ul)
	})
}
jQuery.fn.setSelected=function(optEle,sel,opt){
	//如果selected 为false
	var selected=optEle.selected;
	sel.html($(optEle).html());
	jQuery(this).siblings().removeClass(opt.seled);
	jQuery(this).addClass(opt.seled)
	sel.next().hide();
	if(!selected){
		optEle.selected=true;
	}
	
}


jQuery.fn.radio=function(opt){
	jQuery(":radio",this)
	.hide()
	.each(function(){
	 	jQuery("<img>")
		.attr({src:this.checked?opt.checked:opt.unchecked,alt:""})
		.attr("class","checkboxclass")
		.click(function(){
			jQuery(this).radioTogger(opt)	
		})
		.insertBefore(this);
	})
}
jQuery.fn.radioTogger=function(opt){	
	var sname=jQuery(this).next().attr("name");
	jQuery(this).next()[0].checked=true;
	jQuery(this).setRadioGroups(sname,opt);
}
jQuery.fn.setRadioGroups=function(sname,opt){
	jQuery(":radio")
	.each(function(){
		var s=jQuery(this).attr("name");
		if(s==sname){
			var b=jQuery(this)[0].checked;
			jQuery(this).prev()
			.attr({src:b?

opt.checked:opt.unchecked,alt:""});
		}
	})
}

//checkbox
jQuery.fn.checkbox=function(opt){
	jQuery(":checkbox",this)
	.hide()
	.each(function(i){
		jQuery("<img>")
		//.attr({src:this.checked?opt.checked:opt.unchecked,alt:"全选",class:opt.checkboxclass,id:jQuery(this).attr("id")+i})
		.attr({src:this.checked?opt.checked:opt.unchecked,alt:"全选",id:jQuery(this).attr("id")+i})
		.attr("class","checkboxclass")
		.click(function(){
			jQuery(this).checkboxTogger(opt);
			}		   
		)
		.insertBefore(this)
	
	})
}
jQuery.fn.checkboxTogger=function(opt){
	var check=!jQuery(this).next()[0].checked;
	jQuery(this).next()[0].checked=check;
	jQuery(this)
	.attr({src:check?opt.checked:opt.unchecked});
}
