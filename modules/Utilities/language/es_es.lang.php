<?php
/*********************************************************************************
  ** The contents of this file are subject to the vtiger CRM Public License Version 1.0
   * ("License"); You may not use this file except in compliance with the License
   * The Original Code is:  vtiger CRM Open Source
   * The Initial Developer of the Original Code is vtiger.
   * Portions created by vtiger are Copyright (C) vtiger.
   * All Rights Reserved.
 ********************************************************************************
*  Module       : Utilities
*  Language     : Español
*  Version      : 504
*  Created Date : 2007-03-30
 ********************************************************************************/

$mod_strings = array(
	// Translations for JS (please use the prefix JSLBL in key)
	'JSLBL_Saving_And_Verifying' => 'Guardando y Verificando',
	'JSLBL_PASSWORD_CANNOT_BE_EMPTY'=>'La contraseña no puede estar vacía',
	'JSLBL_SERVERNAME_CANNOT_BE_EMPTY'=>'El nombre del servidor no puede estar vacío',
	'JSLBL_USERNAME_CANNOT_BE_EMPTY'=>'El nombre de usuario no puede estar vacío',
	'JSLBL_ERROR' => 'Error',

	// General translations
	'SUCCESSFUL_REGISTRATION_TITLE' => 'Authentification correct',
	'SUCCESSFUL_REGISTRATION_MESSAGE' => 'You have correctly established authentification credentials with %s. You can now start using the functionality.',
	'UNSUCCESSFUL_REGISTRATION_TITLE' => 'Authentification Incorrect',
	'UNSUCCESSFUL_REGISTRATION_MESSAGE' => 'You have NOT established authentification credentials with %s. You will have to repeat the process if you want to start using the functionality.',
	'IntegrationAuthorizationClick' => 'Pulsa sobre este enlace para establecer la autoización con %s',
	'HubSpot Activation' => 'Activación HubSpot',
	'hubspot_active' => 'Integración Activa',
	'hubspot_mssync' => 'Sincronización Maestro/Esclavo Activa',
	'hubspot_clientId' => 'ID Cliente HubSpot',
	'hubspot_oauthclientId' => 'ID Cliente oAuth',
	'hubspot_clientSecret' => 'Clave Acceso API o Secreto oAuth',
	'hubspot_apiurl' => 'URL API',
	'hubspot_pollFrequency' => 'Frecuencia de Sondeo a HubSpot',
	'hubspot_relateDealWith' => 'Relacionar Oportunidades con',
	'GContacts Activation' => 'Activación Contactos de Google',
	'_active' => 'Integración Activa',
	'_apiurl' => 'URL API',
	'_clientId' => 'ID Cliente',
	'_clientSecret' => 'Clave Acceso API',
	'2FA Activation' => 'Activación Verificación en Dos Pasos',
	'GoTo2FAActivation' => 'Verificación en Dos Pasos',
	'2FA Secret Code' => 'Código Secreto Dos Pasos',
	'Available Integrations' => 'Integraciones Disponibles',
	'Zendesk Activation' => 'Activación Zendesk',
	'zendesk_active' => 'Integración Activa',
	'zendesk_apiurl' => 'Dominio API',
	'zendesk_accessCode' => 'Token Acceso Zendesk',
	'zendesk_username' => 'Nombre Usuario Zendesk',
	'Whatsapp Activation' => 'Activación Whatsapp',
	'whatsapp_sid' => 'Whatsapp SID',
	'whatsapp_token' => 'Token Acceso Whatsapp',
	'whatsapp_senderphone'=> 'Whatsapp Teléfono Envíos',
	'SendGrid Activation' => 'Activación SendGrid',
	'TransEmail_title' => 'Configuración para Email Transaccional',
	'TransEmail_subtitle' => 'Sustituye el servidor de correo saliente',
	'MktEmail_title' => 'Configuración para Email Marketing',
	'MktEmail_subtitle' => 'Solo para mensajes, emails programados y procesos creados especificamente',
	'LBL_CONFIG_INCOMING_MAIL_SERVER' => 'Configurar Correo Entrante',
	'LBL_SELECT_SERVER_TYPE' => 'Selecciona Tipo Servidor',
	'LBL_CONFIG_OUTGOING_MAIL_SERVER' => 'Configurar Correo Saliente',
	'LBL_USER_SMTP_CONFIG' => 'Configuración IMAP/SMTP por Usuario',
	'LBL_IC_SUCCESS_CONFIG_VALIDATION' => 'Configuración del servidor de correo entrante guardada y validada',
	'LBL_IC_WARNING_CONFIG_VALIDATION' => 'Configuración del servidor de correo entrante no validada',
	'LBL_IC_CONFIG_VALIDATION_FAIL' => 'Falló la validación de la configuración del servidor de correo entrante',
	'LBL_OG_SUCCESS_CONFIG_VALIDATION' => 'Configuración del servidor de correo saliente guardada y validada',
	'LBL_OG_WARNING_CONFIG_VALIDATION' => 'Configuración del servidor de correo saliente no validada',
	'LBL_OG_CONFIG_VALIDATION_FAIL' => 'Falló la validación de la configuración del servidor de correo saliente',
	'LBL_ERROR' => 'Error',
	'GMP Activation' => 'Activación Protocolo Mesura de Google',
	'gmp_gid' => 'ID Analíticas Universales de Google',
	'gmp_gversion' => 'Versión de Measurement Protocol',
	'gmp_deacterror' => '¡Existen flujos de trabajo que usan esta tarea! Elimínelos antes de desactivar la funcionalidad.',
	'Record Versioning' => 'Versionado de Registros',
	'Record Versioning_Desc' => 'Añade versiones a tus registros',
	'GoTo2FAActivation_Desc' => 'Añade autenticación de dos pasos para tus usuarios',
	'GVEditable' => 'El módulo de Variable Global debe ser editable para activar esta característica.',
	'HubSpot Activation_Desc' => 'Sincroniza tu información con HubSpot',
	'SMTP Configuration_Desc' => 'Configura cuentas de correo electrónico entrantes y salientes para tus usuarios',
	'Zendesk Activation_Desc' => 'Sincroniza tu información con ZenDesk',
	'Whatsapp Activation_Desc' => 'Envía notificaciones a tus contactos usando Whatsapp',
	'SendGrid Activation_Desc' => 'Enviar correos electrónicos usando SendGrid',
	'GMP Activation_Desc' => 'Envía tus ventas a Google Analytics',
	'Elasticsearch_Desc' => 'Crea Indices en ElasticSearch para cada módulo',
	'ElasticSearch Activation' => 'Activación ElasticSearch',
	'LogAll Activation' => 'Registrar todo',
	'LogAll_Desc' => 'Registra todos los eventos y cambios de datos que ocurren en la aplicación a la cola de mensajes.',
	'LogAll_Active' => 'Actualmente registrando todo.',
	'LogAll_Inactive' => 'Actualmente no se está registrando nada.',
	'Login Sync Activation' => 'Sincronización de Acceso al Sistema',
	'Login_Synic Desc' => 'Acceder automaticamente al API web service de otros coreBOS usando Road Runner al acceder a esta instalación.',
	'cbInstalls' => 'Instalaciones coreBOS',
	'PrivateKeyNotSet' => 'No hay Clave Privada',
	'PrivateKeyIsSet' => 'Hay Clave Privada',
	'setPrivateKey' => 'Establecer Clave Privada',
	'noServerSelected' => 'No has seleccionado ningún servidor para la actualización',
	'noServerValue' => 'El servidor seleccionado está vacío',
	'Map_Query' => 'Seleccionar el Mapa de Consulta',
	'choosemap' => 'Elige Mapa',
	'sel_fields_es' => 'Selecciona los Campos para el Mapeado de Elasticsearch',
	'Analyzed' => 'Analizado',
	'Missing_GlobalVar' => 'Falta la variable global de IP ElasticSearch',
);
?>
