
    function BuildGridView(typeID,title,href)
    {
        this.gridView = new Ext.Panel
        ({
            id: 'PanelArticleViewID' + typeID, layout: 'fit', title: title, collapsible: true, closable: true, //autoHeight:true,//
            frame: false,
            autoWidth: true,
            autoScroll: true,
            items:
            [
                {

                    html: "<iframe scrolling='true' width='100%' height='100%'  frameborder='0' src='"+href+"'></iframe>"
                }
            ]
        });
    }