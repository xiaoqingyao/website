/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

(function(){CKEDITOR.plugins.add('pagebreak',{init:function(a){var b=a.addCommand('pagebreak',new CKEDITOR.dialogCommand('pagebreak'));a.ui.addButton('PageBreak',{label:'插入分页符',command:'pagebreak'});CKEDITOR.dialog.add('pagebreak',this.path+'dialogs/pagebreak.js');}});})();
