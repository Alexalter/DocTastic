{ajaxheader modname='DocTastic' filename='help.js'}
{pageaddvar name='stylesheet' value='modules/DocTastic/style/helpstyle.css'}
<div id='doctastic_help_container'>
    <h2>{$topmodule} {gt text='inline help'}</h2>
    <div>{$html}</div>
</div>
<div id='doctastic_linkrow'><span class='sub'>
    <a id="doctastic_help_collapse" class='doctastic_helplink' href="javascript:void(0);">
	<span class='z-icon-es-help' id="doctastic_help_showhide">{gt text='Help'}</span>
    </a>
</span></div>