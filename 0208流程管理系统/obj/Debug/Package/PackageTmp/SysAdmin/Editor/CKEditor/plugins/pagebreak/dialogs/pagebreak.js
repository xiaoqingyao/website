/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

(function(){CKEDITOR.dialog.add('pagebreak',function(a){return{title:'插入分页符',minWidth:350,minHeight:150,onOk:function(){var b={},c;this.commitContent(b);c='<p>[NextPage'+b.name+']</p>';a.insertHtml(c);this.commitContent({element:c});},contents:[{id:'info',elements:[{id:'_cke_pagebreak_name',type:'text',label:'分页标题（不需要标题可以为空）','default':'',commit:function(b){b.name=this.getValue();}}]}]};});})();
