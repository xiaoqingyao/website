﻿/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

(function(){(function(){var a=/\.(avi|asf|fla|flv|mov|rm|rmvb|ra|mp3|mp4|mpg|mpeg|qt|swf|wma|wmv)(?:$|\?)/i,b=/^\d+(?:\.\d+)?$/;function c(f){if(b.test(f))return f+'px';return f;};function d(f){var g=f.attributes;return a.test(g.src||'');};function e(f,g){var h=f.createFakeParserElement(g,'cke_media','media',true),i=h.attributes.style||'',j=g.attributes.width,k=g.attributes.height;if(typeof j!='undefined')i=h.attributes.style=i+'width:'+c(j)+';';if(typeof k!='undefined')i=h.attributes.style=i+'height:'+c(k)+';';return h;};CKEDITOR.plugins.add('media',{init:function(f){f.addCommand('media',new CKEDITOR.dialogCommand('media'));f.ui.addButton('Media',{label:'媒体',command:'media',icon:this.path+'images/media.gif'});CKEDITOR.dialog.add('media',this.path+'dialogs/media.js');f.addCss('img.cke_media{background-image: url('+CKEDITOR.getUrl(this.path+'images/placeholder.png')+');'+'background-position: center center;'+'background-repeat: no-repeat;'+'border: 1px solid #a9a9a9;'+'width: 80px;'+'height: 80px;'+'}');},afterInit:function(f){var g=f.dataProcessor,h=g&&g.dataFilter;if(h)h.addRules({elements:{'cke:embed':function(i){if(!d(i))return null;return e(f,i);}}},4);},requires:['fakeobjects']});})();})();
