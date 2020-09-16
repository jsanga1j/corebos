<div id="vtlib_modulemanager" style="display:block;position:absolute;width:500px;"></div>
{assign var="MODULEICON" value='side_list'}
{assign var="MODULESECTION" value=$MOD.VTLIB_LBL_MODULE_MANAGER}
{assign var="MODULESECTIONDESC" value=$MOD.VTLIB_LBL_MODULE_MANAGER_DESCRIPTION}
{include file='SetMenu.tpl'}
<section role="dialog" tabindex="-1" class="slds-fade-in-open slds-modal_large slds-app-launcher" aria-labelledby="header43">
<div class="slds-modal__container slds-p-around_none">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
<tr>
	<td class="showPanelBg" style="padding: 10px;" valign="top" width="100%">
	<br>
	<div align=center>
		<table border="0" cellpadding="10" cellspacing="0" width="100%">
		<tr>
			<td>
				<div id="vtlib_modulemanager_list">
					{include file="Settings/ModuleManager/ModuleManagerAjax.tpl"}
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