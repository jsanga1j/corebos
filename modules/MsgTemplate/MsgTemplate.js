/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************/

function submittemplate(recordid, value, target_fieldname, formname) {
	let idlist = (window.opener.document.getElementById('listofids')) !=null ? window.opener.document.getElementById('listofids').value: '';
	var calltype = (window.opener.document.getElementById('calltype') != null ? window.opener.document.getElementById('calltype').value : 'normalcall');
	if (calltype =='normalcall') {
		window.document.location.href = 'index.php?module=MsgTemplate&action=MsgTemplateAjax&file=TemplateMerge&listofids='+idlist+'&action_id='+recordid+'&calltype='+calltype;
	}
	if (calltype =='emailworkflow') {
		window.document.location.href = 'index.php?module=MsgTemplate&action=MsgTemplateAjax&file=TemplateMergeEmailTask&listofids='+idlist+'&action_id='+recordid+'&calltype='+calltype;
	}
	if (calltype =='mailManager') {
		var sub = '_mail_replyfrm_subject_';
		var tbody = '_mail_replyfrm_body_';
		var url = 'index.php?module=MailManager&action=MailManagerAjax&file=TemplateMergeMailManager&templateid='+recordid+'&subject='+sub+'&textbody='+tbody;
		window.document.location.href = url;
	}
}

function msgtFillInModuleFields() {
	let moduleName = document.getElementById('msgt_module').value;
	var vtinst = new VtigerWebservices('webservice.php');
	vtinst.extendSession(handleError(function (result) {
		vtinst.listTypes(handleError(function (accessibleModules) {
			getDescribeObjects(accessibleModules, moduleName, handleError(function (modules) {
				fillSelectBox('msgt_fields', modules, moduleName, null);
			}));
		}));
	}));
}

function msgtInsertIntoMsg() {
	let cont = document.getElementById('msgt_fields').value;
	var textarea = CKEDITOR.instances.template;
	var value = '$'+cont;
	textarea.insertHtml(value);
}

function fillSelectBox(id, modules, parentModule, filterPred) {
	if (filterPred==null) {
		filterPred = function () {
			return true;
		};
	}
	var parent = modules[parentModule];
	var fields = parent['fields'];
	function filteredFields(fields) {
		return filter(
			function (e) {
				var fieldCheck = !contains(['autogenerated', 'reference', 'owner', 'multipicklist', 'password'], e.type.name);
				var predCheck = filterPred(e);
				return fieldCheck && predCheck;
			},
			fields
		);
	}
	var parentFields = map(
		function (e) {
			return [e['name'], e['label']];
		},
		filteredFields(parent['fields'])
	);

	var referenceFieldTypes = filter(function (e) {
		return (e['type']['name']=='reference');
	}, parent['fields']);

	var moduleFieldTypes = {};
	$.each(modules, function (k, v) {
		moduleFieldTypes[k] = dict(map(function (e) {
			return [e['name'], e['type']];
		}, filteredFields(v['fields'])));
	});

	function fieldReferenceNames(referenceField) {
		var name = referenceField['name'];
		var label = referenceField['label'];
		function forModule(moduleName) {
			return map(
				function (field) {
					return ['('+name+' : ('+moduleName+') '+field['name']+')', label+' : ('+moduleName+') '+field['label']];
				},
				filteredFields(modules[moduleName]['fields'])
			);
		}
		return reduceR(concat, map(forModule, referenceField['type']['refersTo']), []);
	}

	var referenceFields = reduceR(concat, map(fieldReferenceNames, referenceFieldTypes), []);
	var fieldLabels = dict(parentFields.concat(referenceFields));
	document.getElementById(id).innerHTML = "";
	var select = $('#'+id);
	var optionClass = id+'_option';
	$.each(fieldLabels, function (k, v) {
		select.append('<option class="'+optionClass+'" value="'+k+'">' + v + '</option>');
	});
}

//Get an array containing the the description of a module and all modules
//refered to by it. This is passed to callback.
function getDescribeObjects(accessibleModules, moduleName, callback) {
	var vtinst = new VtigerWebservices('webservice.php');
	vtinst.extendSession(handleError(function (result) {
		vtinst.describeObject(moduleName, handleError(function (result) {
			var parent = referencify(result);
			var fields = parent['fields'];
			var referenceFields = filter(
				function (e) {
					return e['type']['name']=='reference';
				},
				fields
			);
			var referenceFieldModules = map(
				function (e) {
					return e['type']['refersTo'];
				},
				referenceFields
			);
			function union(a, b) {
				var newfields = filter(
					function (e) {
						return !contains(a, e);
					},
					b
				);
				return a.concat(newfields);
			}
			var relatedModules = reduceR(union, referenceFieldModules, [parent['name']]);

			// Remove modules that is no longer accessible
			//relatedModules = diff(accessibleModules, relatedModules);

			function executer(parameters) {
				var failures = filter(function (e) {
					return e[0]==false;
				}, parameters);
				if (failures.length!=0) {
					var firstFailure = failures[0];
					callback(false, firstFailure[1]);
				} else {
					var moduleDescriptions = map(
						function (e) {
							return referencify(e[1]);
						},
						parameters
					);
					var modules = dict(map(
						function (e) {
							return [e['name'], e];
						},
						moduleDescriptions
					));
					callback(true, modules);
				}
			}
			var p = parallelExecuter(executer, relatedModules.length);
			$.each(relatedModules, function (i, v) {
				p(function (callback) {
					vtinst.describeObject(v, callback);
				});
			});
		}));
	}));
}

function referencify(desc) {
	var fields = desc['fields'];
	for (var i=0; i<fields.length; i++) {
		var field = fields[i];
		var type = field['type'];
		if (type['name']=='owner') {
			type['name']='reference';
			type['refersTo']=['Users'];
		}
	}
	return desc;
}
//This is a wrapper to handle webservice errors.
function handleError(fn) {
	return function (status, result) {
		if (status) {
			fn(result);
		} else {
			errorDialog('Failure:'+result.message);
		}
	};
}
function errorDialog(message) {
	console.log(message);
}
function reduceR(fn, list, start) {
	var acc = start;
	$.each(list, function (i, v) {
		acc = fn(acc, v);
	});
	return acc;
}
function diff(reflist, list) {
	var fn = jQuery;
	var contains = fn.contains;
	var out = [];
	$.each(list, function (i, v) {
		if (contains(reflist, v)) {
			out.push(v);
		}
	});
	return out;
}
function parallelExecuter(executer, operationCount) {
	var parameters = [];
	var n = 0;
	var ctr = 0;
	function makeParallel(operation) {
		var id = n;
		n++;
		function cookie() {
			parameters[id] = arguments;
			ctr++;
			if (ctr == operationCount) {
				executer(parameters);
			}
		}
		operation(cookie);
	}
	return makeParallel;
}
function map(fn, list) {
	var out = [];
	$.each(list, function (i, v) {
		out[out.length]=fn(v);
	});
	return out;
}
function dict(list) {
	var out = {};
	$.each(list, function (i, v) {
		out[v[0]] = v[1];
	});
	return out;
}
function filter(pred, list) {
	var out = [];
	$.each(list, function (i, v) {
		if (pred(v)) {
			out[out.length]=v;
		}
	});
	return out;
}
function contains(list, value) {
	var ans = false;
	$.each(list, function (i, v) {
		if (v==value) {
			ans = true;
			return false;
		}
	});
	return ans;
}
function concat(lista, listb) {
	return lista.concat(listb);
}
let fileurl = 'module=MsgTemplate&action=MsgTemplateAjax&file=MsgFunctions';
$(document).ready(function () {
	if (document.getElementById('msgt_metavars') != null) {
		jQuery.ajax({
			method:'GET',
			url: 'index.php?' + fileurl
		}).done(function (response) {
			var options = JSON.parse(response);
			var ops;
			for (var g in options) {
				ops += '<option value='+JSON.stringify(options[g])+'>'+g+'</option>';
			}
			document.getElementById('msgt_metavars').innerHTML = ops;
		}).error(function (error) {
			console.log(error);
		});
		$('#msgt_metavars').change(function () {
			var textarea = CKEDITOR.instances.template;
			var value = '$'+$(this).val();
			textarea.insertHtml(value);
		});
	}
	// calling of message template module fields at time document is loading
	msgtFillInModuleFields();
});