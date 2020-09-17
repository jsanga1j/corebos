<?php
/*+*******************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *********************************************************************************/

/**
 * @param WebserviceId $id
 * @param String $oldPassword
 * @param String $newPassword
 * @param String $confirmPassword
 * @param Users $user
 */
function vtws_changePassword($id, $oldPassword, $newPassword, $confirmPassword, $user) {
	vtws_preserveGlobal('current_user', $user);
	if (strpos($id, 'x')>0) {
		$idComponents = vtws_getIdComponents($id);
	} else {
		$idComponents = array(vtws_getEntityId('Users'), $id);
	}
	if ($idComponents[1] == $user->id || is_admin($user)) {
		if (!Users::is_ActiveUserID($idComponents[1])) {
			VTWS_PreserveGlobal::flush();
			throw new WebServiceException(WebServiceErrorCode::$INVALIDUSER, vtws_getWebserviceTranslatedString('LBL_'.WebServiceErrorCode::$INVALIDUSER));
		}
		$newUser = new Users();
		$newUser->retrieveCurrentUserInfoFromFile($idComponents[1]);
		if (!is_admin($user)) {
			if (empty($oldPassword)) {
				VTWS_PreserveGlobal::flush();
				throw new WebServiceException(WebServiceErrorCode::$INVALIDOLDPASSWORD, vtws_getWebserviceTranslatedString('LBL_'.WebServiceErrorCode::$INVALIDOLDPASSWORD));
			}
			if (!$user->verifyPassword($oldPassword)) {
				VTWS_PreserveGlobal::flush();
				throw new WebServiceException(WebServiceErrorCode::$INVALIDOLDPASSWORD, vtws_getWebserviceTranslatedString('LBL_'.WebServiceErrorCode::$INVALIDOLDPASSWORD));
			}
		}
		if (strcmp($newPassword, $confirmPassword) === 0) {
			$db = PearDatabase::getInstance();
			$db->dieOnError = false;
			$db->startTransaction();
			$success = $newUser->change_password($oldPassword, $newPassword, false);
			$error = $db->hasFailedTransaction();
			$db->completeTransaction();
			VTWS_PreserveGlobal::flush();
			if ($error) {
				throw new WebServiceException(WebServiceErrorCode::$DATABASEQUERYERROR, vtws_getWebserviceTranslatedString('LBL_'.WebServiceErrorCode::$DATABASEQUERYERROR));
			}
			if (!$success) {
				throw new WebServiceException(WebServiceErrorCode::$CHANGEPASSWORDFAILURE, vtws_getWebserviceTranslatedString('LBL_'.WebServiceErrorCode::$CHANGEPASSWORDFAILURE));
			}
		} else {
			VTWS_PreserveGlobal::flush();
			throw new WebServiceException(WebServiceErrorCode::$CHANGEPASSWORDFAILURE, vtws_getWebserviceTranslatedString('LBL_'.WebServiceErrorCode::$CHANGEPASSWORDFAILURE));
		}
		return array('message' => 'Changed password successfully');
	} else {
		VTWS_PreserveGlobal::flush();
		throw new WebServiceException(WebServiceErrorCode::$ACCESSDENIED, 'You do not have permission to change the password.');
	}
}
?>
