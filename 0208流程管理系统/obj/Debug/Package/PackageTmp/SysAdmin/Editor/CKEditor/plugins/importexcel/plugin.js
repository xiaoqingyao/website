/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

(function() {
    CKEDITOR.plugins.add('importexcel', {
        requires: ['dialog'],
        init: function(a) {
            var b = a.addCommand('importexcel', new CKEDITOR.dialogCommand('importexcel'));
            b.modes = {
                wysiwyg: 1,
                source: 1
            };
            b.canUndo = false;
            a.ui.addButton('ImportExcel', {
            label: a.lang.importexcel.title,
                icon:'images/importexcel.png',
                command: 'importexcel'
            });
            CKEDITOR.dialog.add('importexcel', this.path + 'dialogs/importexcel.js');
        }
    });
})();