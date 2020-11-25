/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

(function() {
    CKEDITOR.plugins.add('importword', {
        requires: ['dialog'],
        init: function(a) {
            var b = a.addCommand('importword', new CKEDITOR.dialogCommand('importword'));
            b.modes = {
                wysiwyg: 1,
                source: 1
            };
            b.canUndo = false;
            a.ui.addButton('ImportWord', {
            label: a.lang.importword.title,
                icon:'images/importword.png',
                command: 'importword'
            });
            CKEDITOR.dialog.add('importword', this.path + 'dialogs/importword.js');
        }
    });
})();