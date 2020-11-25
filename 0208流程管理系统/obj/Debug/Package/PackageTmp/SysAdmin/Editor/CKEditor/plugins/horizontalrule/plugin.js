/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

(function(){(function(){var a={canUndo:false,exec:function(c){c.insertElement(c.document.createElement('hr'));}},b='horizontalrule';CKEDITOR.plugins.add(b,{init:function(c){c.addCommand(b,a);c.ui.addButton('HorizontalRule',{label:c.lang.horizontalrule,command:b});}});})();})();
