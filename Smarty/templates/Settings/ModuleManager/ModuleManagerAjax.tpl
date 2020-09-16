{if $DIR_NOTWRITABLE_LIST && !empty($DIR_NOTWRITABLE_LIST)}
<table class="slds-table slds-table_cell-buffer slds-table_header-hidden slds-no-row-hover" width="100%" cellpadding=0 cellspacing=0 border=0>
	<tr>
		<td>
			<div style='background-color: #FFFABF; padding: 2px; margin: 0 0 2px 0; border: 1px solid yellow'>
			<b style='color: red'>{$MOD.VTLIB_LBL_WARNING}:</b> {', '|@implode:$DIR_NOTWRITABLE_LIST} <b>{$MOD.VTLIB_LBL_NOT_WRITEABLE}!</b>
		</td>
	</tr>
</table>
{/if}

<table class="slds-table slds-table_cell-buffer slds-table_header-hidden slds-no-row-hover" width="100%" cellspacing=0 border=0>
<tr class="slds-line-height_reset">
	<td class="tableHeading" colspan=5 width="10%" align="right">
{if !$coreBOSOnDemandActive}
		<form style="display: inline;" action="index.php?module=Settings&action=ModuleManager&module_import=Step1&parenttab=Settings" method="POST">
			<input type="submit" class="slds-button slds-button_brand" value='{$APP.LBL_IMPORT} {$APP.LBL_NEW}' title='{$APP.LBL_IMPORT}'>
		</form>
{/if}
	</td>
</tr>
<td colspan="2" valign="top">
<!-- Standard modules -->
<table border=0 cellspacing=0 cellpadding=3 width=100% class="slds-table slds-table_cell-buffer slds-no-row-hover slds-table_bordered" id="modmgr_standard">
<tr>
	<td  colspan=2 align="center">
		{include file='Components/PageSubTitle.tpl' PAGESUBTITLE=$MOD.VTLIB_LBL_MODULE_MANAGER_STANDARDMOD}
	</td>
	<td  colspan=4 width=10% align="center">&nbsp;</td>
</tr>
{foreach key=modulename item=modinfo from=$TOGGLE_MODINFO}
{if $modinfo.customized eq false}
	{assign var="modulelabel" value=$modulename|getTranslatedString:$modulename}
	<tr>
		<!--td class="cellLabel small" width="20px">&nbsp;</td -->
		<td  width="24px">
		<span class="slds-icon_container slds-icon-standard-account">
			<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
			<use xlink:href="include/LD/assets/icons/standard-sprite/svg/symbols.svg#account"></use>
			</svg>
		</span>
		</td>
		<td  {if $modinfo.presence eq 0 && $modinfo.hassettings} onclick="location.href='index.php?module=Settings&action=ModuleManager&module_settings=true&formodule={$modulename}&parenttab=Settings';"{/if}>{$modulelabel}</td>
		<td  width="15px" align=center>
			{if $modinfo.presence eq 0}
				<a href="javascript:void(0);" onclick="vtlib_toggleModule('{$modulename}', 'module_disable');">
				<span class="slds-icon_container slds-icon_container_circle slds-icon-action-approval" title="{$MOD.LBL_ENABLED}">
					<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
					<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#approval"></use>
					</svg>
					<span class="slds-assistive-text">{$MOD.LBL_ENABLED}</span>
				</span>
				</a>
			{else}
				<a href="javascript:void(0);" onclick="vtlib_toggleModule('{$modulename}', 'module_enable');">
				<span class="slds-icon_container slds-icon_container_circle slds-icon-action-close" title="{$MOD.LBL_DISABLED}">
					<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
					<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#close"></use>
					</svg>
					<span class="slds-assistive-text">{$MOD.LBL_DISABLED}</span>
				</span>
				</a>
			{/if}
		</td>
		<td  width="15px" align=center>&nbsp;</td>
		<td  width="15px" align=center>&nbsp;</td>
		<td  width="15px" align=center>
			{if $modinfo.presence eq 0 && $modinfo.hassettings}<a href="index.php?module=Settings&action=ModuleManager&module_settings=true&formodule={$modulename}&parenttab=Settings">
			<span class="slds-icon_container slds-icon_container_circle slds-icon-action-approval" title="{$MOD.LBL_DISABLED}">
				<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
				<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#fallback"></use>
				</svg>
				<span class="slds-assistive-text">{$MOD.LBL_DISABLED}</span>
			</span>
			</a>
			{elseif $modinfo.hassettings eq false}&nbsp;
			{/if}
		</td>
	</tr>
{/if}
{/foreach}
<tr>
	<td colspan=5>&nbsp;</td>
</tr>
<tr>
	<td  colspan=2 align="center">
	{include file='Components/PageSubTitle.tpl' PAGESUBTITLE=$MOD.LBL_LANGUAGES_PACKS}
	</td>
	<td  colspan=4 width=10% align="center">&nbsp;</td>
</tr>
{assign var="totalCustomModules" value=0}
{foreach key=langprefix item=langinfo from=$TOGGLE_LANGINFO}
	{assign var="totalCustomModules" value=$totalCustomModules+1}
	<tr>
		<td ><img src="{'text.gif'|@vtiger_imageurl:$THEME}" border=0"></td>
		<td onclick="location.href='index.php?module=Settings&action=LanguageEdit&parenttab=Settings&languageid={$langinfo.id}';">{$langinfo.label}</td>
		<td width="15px" align=center>
		{if !$coreBOSOnDemandActive}
			<a href="index.php?module=Settings&action=ModuleManager&module_update=Step1&src_module={$langprefix}&parenttab=Settings">
			<span class="slds-icon_container slds-icon_container_circle slds-icon-action-flow" title="{$MOD.LBL_ENABLED}">
				<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
				<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#change_record_type"></use>
				</svg>
				<span class="slds-assistive-text">{$MOD.LBL_UPGRADE} {$langinfo.label}</span>
			</span>
			</a>
		{/if}
		</td>
		<td width="15px" align=center>
		{if $langprefix neq 'en_us'}
		{if $langinfo.active eq 1}
			<a href="javascript:void(0);" onclick="vtlib_toggleModule('{$langprefix}', 'module_disable', 'language');">
			<span class="slds-icon_container slds-icon_container_circle slds-icon-action-approval" title="{$MOD.LBL_DISABLE} {$MOD.Language} {$langinfo.label}">
				<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
				<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#approval"></use>
				</svg>
				<span class="slds-assistive-text">{$MOD.LBL_DISABLE} {$MOD.Language} {$langinfo.label}</span>
			</span>
			</a>
		{else}
			<a href="javascript:void(0);" onclick="vtlib_toggleModule('{$langprefix}', 'module_enable', 'language');">
			<span class="slds-icon_container slds-icon_container_circle slds-icon-action-close" title="{$MOD.LBL_ENABLE} {$MOD.Language} {$langinfo.label}">
				<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
				<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#close"></use>
				</svg>
				<span class="slds-assistive-text">{$MOD.LBL_ENABLE} {$MOD.Language} {$langinfo.label}</span>
			</span>
			</a>
		{/if}
		{else}
			<span class="slds-icon_container slds-icon_container_circle slds-icon-action-approval" title="{$MOD.Language} {$langinfo.label} {$MOD.AlwaysActive}">
				<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
				<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#approval"></use>
				</svg>
				<span class="slds-assistive-text">{$MOD.Language} {$langinfo.label} {$MOD.AlwaysActive}</span>
			</span>
		{/if}
		</td>
		<td  width="15px" align=center>
		{if !$coreBOSOnDemandActive}
			<a href="index.php?modules=Settings&action=ModuleManagerExport&module_export={$langprefix}">
			<span class="slds-icon_container slds-icon_container_circle slds-icon-action-flow" title="{$APP.LBL_EXPORT} {$langinfo.label}">
				<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
				<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#download"></use>
				</svg>
				<span class="slds-assistive-text">{$APP.LBL_EXPORT} {$langinfo.label}</span>
			</span>
			</a>
		{/if}
		</td>
		<td width="10px" align=left>
			<a href="index.php?module=Settings&action=LanguageEdit&parenttab=Settings&languageid={$langinfo.id}">
			<span class="slds-icon_container slds-icon_container_circle slds-icon-action-approval" title="{$langinfo.label} {'LBL_SETTINGS'|@getTranslatedString}">
				<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
				<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#fallback"></use>
				</svg>
				<span class="slds-assistive-text">{$langinfo.label} {'LBL_SETTINGS'|@getTranslatedString}</span>
			</span>
			</a>
		</td>
	</tr>
{/foreach}

</table>

</td><td></td><td colspan="2" valign="top">

<!-- Custom Modules -->
<table border=0 cellspacing=0 cellpadding=3 width=100% class="slds-table slds-table_cell-buffer slds-no-row-hover slds-table_bordered" id="modmgr_custom">
<tr>
	<td colspan=2 align="center">
	{include file='Components/PageSubTitle.tpl' PAGESUBTITLE=$MOD.VTLIB_LBL_MODULE_MANAGER_CUSTOMMOD}
	</td>
	<td  colspan=4 align="center">&nbsp;</td>
</tr>

{assign var="totalCustomModules" value=0}

{foreach key=modulename item=modinfo from=$TOGGLE_MODINFO}
{if $modinfo.customized eq true}
	{assign var="totalCustomModules" value=$totalCustomModules+1}

	{assign var="modulelabel" value=$modulename|getTranslatedString:$modulename}
	<tr height="30px">
		<td width="20px">
		<span class="slds-icon_container slds-icon-standard-flow">
			<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
			<use xlink:href="include/LD/assets/icons/standard-sprite/svg/symbols.svg#assigned_resource"></use>
			</svg>
		</span>
		</td>
		<td {if $modinfo.presence eq 0 && $modinfo.hassettings} onclick="location.href='index.php?module=Settings&action=ModuleManager&module_settings=true&formodule={$modulename}&parenttab=Settings';"{/if}>{$modulelabel}</td>
		<td  width="15px" align=center>
		{if !$coreBOSOnDemandActive}
			<a href="index.php?module=Settings&action=ModuleManager&module_update=Step1&src_module={$modulename}&parenttab=Settings">
			<span class="slds-icon_container slds-icon_container_circle slds-icon-action-flow" title="{$MOD.LBL_ENABLED}">
				<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
				<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#change_record_type"></use>
				</svg>
			<span class="slds-assistive-text">{$MOD.LBL_UPGRADE} {$langinfo.label}</span>
			</span>
			</a>
		{/if}
		</td>
		<td class="cellText small" width="15px" align=center>
		{if $modinfo.presence eq 0}
			<a href="javascript:void(0);" onclick="vtlib_toggleModule('{$modulename}', 'module_disable');">
			<span class="slds-icon_container slds-icon_container_circle slds-icon-action-approval" title="{$MOD.LBL_DISABLE} {$modulelabel}">
				<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
				<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#approval"></use>
				</svg>
				<span class="slds-assistive-text">{$MOD.LBL_DISABLE} {$modulelabel}"</span>
			</span>
			</a>
		{else}
			<a href="javascript:void(0);" onclick="vtlib_toggleModule('{$modulename}', 'module_enable');">
			<span class="slds-icon_container slds-icon_container_circle slds-icon-action-close" title="{$MOD.LBL_ENABLE} {$modulelabel}">
				<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
				<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#close"></use>
				</svg>
				<span class="slds-assistive-text">{$MOD.LBL_ENABLE} {$modulelabel}</span>
			</span>
			</a>
		{/if}
		</td>
		<td class="cellText small" width="15px" align=center>
			{if $modulename eq 'Home'}
				<span class="slds-icon_container slds-icon_container_circle slds-icon-action-flow" title="">
					<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
					<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#upload"></use>
					</svg>
				<span class="slds-assistive-text"></span>
				</span>
			{elseif !$coreBOSOnDemandActive}
				<a href="index.php?modules=Settings&action=ModuleManagerExport&module_export={$modulename}">
				<span class="slds-icon_container slds-icon_container_circle slds-icon-action-flow" title="{$APP.LBL_EXPORT} {$modulelabel}">
					<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
					<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#download"></use>
					</svg>
				<span class="slds-assistive-text">{$APP.LBL_EXPORT} {$modulelabel}</span>
				</span>
				</a>
			{/if}
		</td>
		<td width="15px" align=center>
			{if $modinfo.presence eq 0 && $modinfo.hassettings}<a href="index.php?module=Settings&action=ModuleManager&module_settings=true&formodule={$modulename}&parenttab=Settings">
			<span class="slds-icon_container slds-icon_container_circle slds-icon-action-approval" title="{$langinfo.label} {'LBL_SETTINGS'|@getTranslatedString}">
				<svg class="slds-icon slds-icon_xx-small" aria-hidden="true">
				<use xlink:href="include/LD/assets/icons/action-sprite/svg/symbols.svg#fallback"></use>
				</svg>
				<span class="slds-assistive-text">{$modulelabel} {'LBL_SETTINGS'|@getTranslatedString}</span>
			</span>
			</a>
			{elseif $modinfo.hassettings eq false}&nbsp;
			{/if}
		</td>
	</tr>
{/if}
{/foreach}
{if $totalCustomModules eq 0}
	<tr>
		<td class="cellLabel small" colspan=4><b>{$MOD.VTLIB_LBL_MODULE_MANAGER_NOMODULES}</b></td>
	</tr>
{/if}
</table>
</td></tr></table>
