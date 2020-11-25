/**
 * @package
 *
 * 
 *
 * @author J. Jiang <jiangjing@focus.cn>
 * @create 
 * @update 
 */

function modalDialog(url, title, height, width, property, cross_domain) {
	// @todo
	var s = "/common/js/modalDialog.php?title=" + title
		+ "&url=" + url.replace(/&/g, "%26");
	if (cross_domain) {
		s += "&cross_domain=true";
	}
	var sProperty = "center:yes; resizable:yes; scroll:no; status:no;"
		+ "dialogHeight:" + height + "px;"
		+ "dialogWidth:" + width + "px;"; 
	if ( property != null ) {
		sProperty += property;
	}
	return window.showModalDialog(s, null, sProperty);
}