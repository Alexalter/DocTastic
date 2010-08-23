{ajaxheader modname='DocTastic' filename='doctastic.js'}
{include file="admin/menu.tpl"}
<div class="z-admincontainer">
    <div class="z-adminpageicon">{img modname='core' set='icons/large' src='info.gif'}</div>
    <h2>{gt text="DocTastic Module Overrides"}&nbsp;({gt text="version"}&nbsp;{$version})</h2>

    <a id="appendajax" onclick="moduleappend();" style="margin-bottom: 1em;" class="z-floatleft z-icon-es-new z-hide" title="{gt text="Create new override"}" href="javascript:void(0);">{gt text="Create new override"}</a>

    {* general use authid *}
    <input type="hidden" id="moduleauthid" name="authid" value="{insert name="generateauthkey" module="DocTastic"}" />
    <div class="modulebox z-clearer">
        <ol id="modulelist" class="z-itemlist">
            <li class="z-itemheader z-clearfix">
                <span class="z-itemcell z-w30">{gt text="Module Name"}</span>
                <span class="z-itemcell z-w25">{gt text="Navigation Type"}</span>
                <span class="z-itemcell z-w25">{gt text="Language Filter Enabled"}</span>
                <span class="z-itemcell z-w20">{gt text="Actions"}</span>
            </li>
        {foreach item="module" from=$modules}
            <li id="module_{$module.id}" class="{cycle values='z-odd,z-even'} z-clearfix">
                <div id="modulecontent_{$module.id}">
                    <input type="hidden" id="mtypeid_{$module.id}" value="{$module.mtype}" />
                    <input type="hidden" id="modifystatus_{$module.id}" value="0" />
                    {* this doesn't change *}
                    <span id="modulename_{$module.id}" class="z-itemcell z-w30">
                        {$module.modname|safetext}
                    </span>
                    {* *}
                    <span id="modulenavtype_{$module.id}" class="z-itemcell z-w25">
                        {$module.navtype_disp|safetext}
                    </span>
                    {* Hidden until called *}
                    <span id="editmodulenavtype_{$module.id}" class="z-itemcell z-w25 z-hide">
                        <select id="navtype_{$module.id}" name="navtype_{$module.id}">
                            {html_options options=$navTypeSelector selected=$module.navtype}
                        </select>
                    </span>
                    {* *}
                    <span id="moduleenable_lang_{$module.id}" class="z-itemcell z-w25">
                        {$module.enable_lang|yesno|safetext}
                    </span>
                    {* Hidden until called *}
                    <span id="editmoduleenable_lang_{$module.id}" class="z-itemcell z-w25 z-hide">
                        <select id="enable_lang_{$module.id}" name="enable_lang_{$module.id}">
                            {html_options options=$yesno selected=$module.enable_lang}
                        </select>
                    </span>
                    {* *}
                    <span id="moduleaction_{$module.id}" class="z-itemcell z-w20">
                        <button class="z-imagebutton z-hide" id="modifyajax_{$module.id}"   title="{gt text="Edit"}">{img src=xedit.gif modname=core set=icons/extrasmall __title="Edit" __alt="Edit"}</button>
                        <a id="modify_{$module.id}"  href="{$module.editurl|safetext}" title="{gt text="Edit"}">{img src=xedit.gif modname=core set=icons/extrasmall __title="Edit" __alt="Edit"}</a>
                        <a id="delete_{$module.id}"     href="{$module.deleteurl|safetext}" title="{gt text="Delete"}">{img src=14_layer_deletelayer.gif modname=core set=icons/extrasmall __title="Delete" __alt="Delete"}</a>
                        <script type="text/javascript">
                            Element.addClassName('insert_{{$module.id}}', 'z-hide');
                            Element.addClassName('modify_{{$module.id}}', 'z-hide');
                            Element.addClassName('delete_{{$module.id}}', 'z-hide');
                            Element.removeClassName('modifyajax_{{$module.id}}', 'z-hide');
                            Event.observe('modifyajax_{{$module.id}}', 'click', function(){modulemodifyinit({{$module.id}})}, false);
                        </script>
                    </span>
                    <span id="editmoduleaction_{$module.id}" class="z-itemcell z-w20 z-hide">
                        <button class="z-imagebutton" id="moduleeditsave_{$module.id}"   title="{gt text="Save"}">{img src=button_ok.gif modname=core set=icons/extrasmall __alt="Save" __title="Save"}</button>
                        <button class="z-imagebutton" id="moduleeditdelete_{$module.id}" title="{gt text="Delete"}">{img src=14_layer_deletelayer.gif modname=core set=icons/extrasmall __alt="Delete" __title="Delete"}</button>
                        <button class="z-imagebutton" id="moduleeditcancel_{$module.id}" title="{gt text="Cancel"}">{img src=button_cancel.gif modname=core set=icons/extrasmall __alt="Cancel" __title="Cancel"}</button>
                    </span>
                </div>
            </li>
        {foreachelse}
            <li id="module_1" class="z-hide z-clearfix">
                <div id="modulecontent_1" class="modulecontent">
                    <input type="hidden" id="mtypeid_1" value="" />
                    <input type="hidden" id="moduleid_1" value="{$module.id}" />
                    <input type="hidden" id="modifystatus_{$module.id}" value="0" />
                    <span id="modulename_1" class="z-itemcell z-w30 z-hide">
                        {$module.modname|safetext}
                    </span>
                    {* Hidden until called *}
                    <span id="editmodulename_1" class="z-itemcell z-w30">
                        {$moduleSelector}
                    </span>
                    {* *}
                    <span id="modulenavtype_1" class="z-itemcell z-w25 z-hide">
                        {gt text="$module.navtype_disp|safetext}
                    </span>
                    {* Hidden until called *}
                    <span id="editmodulenavtype_1" class="z-itemcell z-w25">
                        <select id="navtype_1" name="navtype_1">
                            {html_options options=$navTypeSelector selected=$module.navtype}
                        </select>
                    </span>
                    {* *}
                    <span id="moduleenable_lang_1" class="z-itemcell z-w25 z-hide">
                        {$module.enable_lang|yesno|safetext}&nbsp;
                    </span>
                    {* Hidden until called *}
                    <span id="editmoduleenable_lang_1" class="z-itemcell z-w25">
                        <select id="enable_lang_1" name="enable_lang_1">
                            {html_options options=$yesno selected=$module.enable_lang}
                        </select>
                    </span>

                    {* *}
                    <span id="moduleaction_1" class="z-itemcell z-w20 z-hide">
                        <button class="z-imagebutton" id="modifyajax_1"   title="{gt text="Edit"}">{img src=xedit.gif modname=core set=icons/extrasmall __title="Edit" __alt="Edit"}</button>
                    </span>
                    <span id="editmoduleaction_1" class="z-itemcell z-w20">
                        <button class="z-imagebutton" id="moduleeditsave_1"   title="{gt text="Save"}">{img src=button_ok.gif modname=core set=icons/extrasmall __alt="Save" __title="Save"}</button>
                        <button class="z-imagebutton" id="moduleeditdelete_1" title="{gt text="Delete"}">{img src=14_layer_deletelayer.gif modname=core set=icons/extrasmall __alt="Delete" __title="Delete"}</button>
                        <button class="z-imagebutton" id="moduleeditcancel_1" title="{gt text="Cancel"}">{img src=button_cancel.gif modname=core set=icons/extrasmall __alt="Cancel" __title="Cancel"}</button>
                    </span>
                </div>
                <div id="moduleinfo_1" class="z-hide z-moduleinfo">&nbsp;</div>
            </li>
        {/foreach}
        </ol>
    </div>
</div><!-- /z-admincontainer -->

<script type="text/javascript">
    Event.observe(window, 'load', function(){moduleinit({{$modules[0].id}});}, false);

    // some defines
    var updatingmodule = '...{{gt text="Updating module override"}}...';
    var deletingmodule = '...{{gt text="Deleting module override"}}...';
    var confirmDeleteModule = '{{gt text="Do you really want to delete this module override?"}}';
</script>