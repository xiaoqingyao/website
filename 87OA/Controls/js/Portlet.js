﻿/*
* Ext JS Library 2.0.2
* Copyright(c) 2006-2008, Ext JS, LLC.
* licensing＠extjs.com
* 
* extjs.com/license
*/

Ext.ux.Portlet = Ext.extend(Ext.Panel, {
    anchor: '100%',
    frame: true,
    collapsible: true,
    draggable: true,
    cls: 'x-portlet'
});
Ext.reg('portlet', Ext.ux.Portlet);