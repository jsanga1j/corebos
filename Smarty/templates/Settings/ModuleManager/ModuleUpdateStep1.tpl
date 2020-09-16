{literal}
<script type="text/javascript">
function modulemanager_import_validate(form) {
	if(form.module_zipfile.value == '' && form.module_url.value == '') {
		alert("Please select the zip file before proceeding.");
		return false;
	}
	return true;
}
function changeInstallType(obj) {
	if (!obj.checked) {
		return;
	}
	switch (obj.value) {
		case 'file':
			document.form.module_zipfile.disabled = '';
			document.form.module_url.disabled = 'disabled';
			break;
		case 'url':
			document.form.module_url.disabled = '';
			document.form.module_zipfile.disabled = 'disabled';
			break;
	}
}
</script>
{/literal}

<div id="vtlib_modulemanager_update" style="display:block;position:absolute;width:500px;"></div>
{assign var="MODULEICON" value='side_list'}
{assign var="MODULESECTION" value=$MOD.VTLIB_LBL_MODULE_MANAGER|cat:" &gt;  "|cat:$MOD.LBL_UPGRADE}
{assign var="MODULESECTIONDESC" value=$MOD.VTLIB_LBL_MODULE_MANAGER_DESCRIPTION}
{include file='SetMenu.tpl'}
<section role="dialog" tabindex="-1" class="slds-fade-in-open slds-modal_large slds-app-launcher" aria-labelledby="header43">
<div class="slds-modal__container slds-p-around_none">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
<tr>
	<td class="showPanelBg" style="padding: 10px;" valign="top" width="100%">
	<br>

	<div align=center>
		<table border="0" class="slds-table slds-table_cell-buffer slds-table_header-hidden" cellpadding="10" cellspacing="0" width="100%">
		<tr>
			<td>
				<div id="vtlib_modulemanager_update_div">
					<form method="POST" action="index.php" enctype="multipart/form-data" name="form">					
						{include file='Components/PageSubTitle.tpl' PAGESUBTITLE=$MOD.VTLIB_LBL_SELECT_PACKAGE_FILE}
						<table cellpadding=5 class="slds-table slds-table_cell-buffer slds-no-row-hover slds-table_bordered" cellspacing=0 border=0 width=100%>
						<tr valign=top>
							<td >
								<input type="radio" name="installtype" id="installtypefile" value="file" onclick="changeInstallType(this);"> <b><label for="module_zipfile" onclick="document.getElementById('installtypefile').checked=true;changeInstallType(document.getElementById('installtypefile'));">{$MOD.VTLIB_LBL_FILE_LOCATION}</label></b>
							</td>
							<td class='cellText small'>
								<input type="file" class="small" name="module_zipfile" id="module_zipfile" size=50 disabled>
								<p>{$MOD.VTLIB_LBL_PACKAGE_FILE_HELP}</p>
							</td>
						</tr>
						<tr valign=top>
							<td class='cellLabel small'>
								<input type="radio" name="installtype" id="installtypeurl" value="url" onclick="changeInstallType(this);"> <b><label for="module_zipfile" onclick="document.getElementById('installtypeurl').checked=true;changeInstallType(document.getElementById('installtypeurl'));">{$MOD.VTLIB_LBL_PACKAGE_URL}</label></b>
							</td>
							<td class='cellText small'>
								<input class="slds-input" name="module_url" size="50" disabled>
								<p>{$MOD.VTLIB_LBL_PACKAGE_URL_HELP}</p>
							</td>
						</tr>
						</table>
						<table class='slds-table slds-table_cell-buffer slds-no-row-hover slds-table_bordered' cellpadding=5 cellspacing=0 border=0 width=100%>
						<tr valign=top>
							<td class='cblds-t-align_right' colspan=2 align=right>
								<input type="hidden" name="module" value="Settings">
								<input type="hidden" name="action" value="ModuleManager">
								<input type="hidden" name="module_update" value="Step2">
								<input type="hidden" name="parenttab" value="Settings">
								<input type="hidden" name="target_modulename" value="{$smarty.request.src_module|@vtlib_purify}">
								<button type="submit" class="slds-button slds-button_success edit" onclick="return modulemanager_update_validate(this.form)">
								<svg class="slds-button__icon slds-icon-text-success slds-button__icon_left" aria-hidden="true"> <use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#save"></use></svg>
								 {$MOD.LBL_UPGRADE}
								</button>
								<button type="submit" class="slds-button slds-button_destructive delete" onclick="this.form.module_update.value='';">
								<svg class="slds-button__icon slds-icon-text-neutral slds-button__icon_left" aria-hidden="true"> <use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#reply"></use></svg>
								{$APP.LBL_CANCEL_BUTTON_LABEL}
								</button>
							</td>
						</tr>
						</table>
					</form>
                </div>
			</td>
		</tr>
		</table>
		<!-- End of Display -->
		</td>
        </tr>
        </table>
        </td>
        </tr>
        </table>
   </div>

        </td>
	</tr>
</table>
</div>
</section>
