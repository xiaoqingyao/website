/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

(function() {
    CKEDITOR.plugins.add('importppt', {
        requires: ['dialog'],
        init: function(a) {
        var b = a.addCommand('importppt', new CKEDITOR.dialogCommand('importppt'));
            b.modes = {
                wysiwyg: 1,
                source: 1
            };
            b.canUndo = false;
            a.ui.addButton('ImportPPT', {
            label: a.lang.importppt.title,
                icon:'images/importppt.png',
                command: 'importppt'
            });
            CKEDITOR.dialog.add('importppt', this.path + 'dialogs/importppt.js');
        }
    });
})();