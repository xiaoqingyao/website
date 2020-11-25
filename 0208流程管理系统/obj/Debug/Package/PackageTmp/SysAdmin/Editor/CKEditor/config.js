/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    // config.uiColor = '#AADC6E';
	config.toolbar =
    [['Undo', 'Redo','Find', 'PasteFromWord'],
       ['Font', 'FontSize'],
       ['Bold', 'Italic', 'Underline', 'Strike', 'TextColor', 'BGColor', 'Image'],
       ['Outdent', 'Indent', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'], ['Source']];
};
