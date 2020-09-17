<?php
/*************************************************************************************************
 * Copyright 2020 JPL TSolucio, S.L. -- This file is a part of TSOLUCIO coreBOS Customizations.
 * Licensed under the vtiger CRM Public License Version 1.1 (the "License"); you may not use this
 * file except in compliance with the License. You can redistribute it and/or modify it
 * under the terms of the License. JPL TSolucio, S.L. reserves all rights not expressly
 * granted by the License. coreBOS distributed by JPL TSolucio S.L. is distributed in
 * the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. Unless required by
 * applicable law or agreed to in writing, software distributed under the License is
 * distributed on an "AS IS" BASIS, WITHOUT ANY WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language governing
 * permissions and limitations under the License. You may obtain a copy of the License
 * at <http://corebos.org/documentation/doku.php?id=en:devel:vpl11>
 *************************************************************************************************
 *  Module       : Workflow Expression Function Definitions
 *  Version      : 1.0

 * Definition Template *
'function name' => array( // see functions in modules/com_vtiger_workflow/expression_engine/VTExpressionsManager.inc
	'name' => usually the same as function name but may be different, will be shown to user,
	'desc' => description of the function,
	'params' => parameters of the function, array(
		'param name' => array(
			'type' => 'String' | 'Boolean' | 'Integer' | 'Float' | 'Date' | 'DateTime' | 'Multiple',
			'optional' => true/false,
			'desc' => 'description of the parameter',
		)
	),
	'categories' => array of categories the function belongs to
	'examples' => array of one-line examples,
)

 # the list of categories can be found n modules/com_vtiger_workflow/expression_engine/VTExpressionsManager.inc (expressionFunctionCategories)
 *************************************************************************************************/
$WFExpressionFunctionDefinitons = array(
'concat' => array(
	'name' => 'concat(a, b,...)',
	'desc' => 'Combine multiple text elements into one',
	'params' => array(
		array(
			'name' => 'a',
			'type' => 'String',
			'optional' => false,
			'desc' => 'any literal text string or valid field name',
		),
		array(
			'name' => 'b',
			'type' => 'String',
			'optional' => false,
			'desc' => 'any literal text string or valid field name',
		),
	),
	'categories' => array('Text'),
	'examples' => array(
		"concat(firstname, ' ', lastname)",
	),
),
'coalesce' => array(
	'name' => 'coalesce(a, b,...)',
	'desc' => 'Returns the first non-missing value found in the list of parameters',
	'params' => array(
		array(
			'name' => 'a',
			'type' => 'Multiple',
			'optional' => false,
			'desc' => 'any value or valid field name',
		),
		 array(
			'name' => 'b',
			'type' => 'Multiple',
			'optional' => false,
			'desc' => 'any value or valid field name',
		),
	),
	'categories' => array('Text'),
	'examples' => array(
		'coalesce(email1, email2)'
	),
),
'time_diffdays' => array(
	'name' => 'time_diffdays(a, b)',
	'desc' => 'Calculates the difference of time (in days) between two specific date fields',
	'params' => array(
		array(
			'name' => 'a',
			'type' => 'Date',
			'optional' => false,
			'desc' => 'any valid date or date type field name',
		),
		array(
			'name' => 'b',
			'type' => 'Date',
			'optional' => true,
			'desc' => 'any valid date or date type field name. if left empty the current date will be used',
		),
	),
	'categories' => array('Date and Time'),
	'examples' => array(
		'time_diffdays(invoicedate, duedate)',
		'time_diffdays(duedate)',
	),
),
'time_diffyears' => array(
	'name' => 'time_diffyears(a, b)',
	'desc' => 'Calculates the difference of time (in years) between two specific date fields',
	'params' => array(
		array(
			'name' => 'a',
			'type' => 'Date',
			'optional' => false,
			'desc' => 'any valid date or date type field name',
		),
		array(
			'name' => 'b',
			'type' => 'Date',
			'optional' => true,
			'desc' => 'any valid date or date type field name. if left empty the current date will be used',
		),
	),
	'categories' => array('Date and Time'),
	'examples' => array(
		'time_diffyears(invoicedate, duedate)',
		'time_diffyears(duedate)',
	),
),
'time_diffweekdays' => array(
	'name' => 'time_diffweekdays(a, b)',
	'desc' => 'Calculates the difference of time (in days) between two specific date fields excluding weekends',
	'params' => array(
		array(
			'name' => 'a',
			'type' => 'Date',
			'optional' => false,
			'desc' => 'any valid date or date type field name',
		),
		array(
			'name' => 'b',
			'type' => 'Date',
			'optional' => true,
			'desc' => 'any valid date or date type field name. if left empty the current date will be used',
		),
	),
	'categories' => array('Date and Time'),
	'examples' => array(
		'time_diffweekdays(invoicedate, duedate)',
		'time_diffweekdays(duedate)',
	),
),
'time_diff' => array(
	'name' => 'time_diff(a, b)',
	'desc' => 'Calculates the difference of time (in seconds) between two specific date fields',
	'params' => array(
		array(
			'name' => 'a',
			'type' => 'Date',
			'optional' => false,
			'desc' => 'any valid date or date type field name',
		),
		array(
			'name' => 'b',
			'type' => 'Date',
			'optional' => true,
			'desc' => 'any valid date or date type field name. if left empty the current date will be used',
		),
	),
	'categories' => array('Date and Time'),
	'examples' => array(
		'time_diff(invoicedate, duedate)',
		'time_diff(duedate)',
	),
),
'holidaydifference' => array(
	'name' => 'holidaydifference(startDate, endDate, include_saturdays, holidays)',
	'desc' => 'Calculates the difference of time (in days) between two specific date fields, excluding Saturdays and Holidays if given. Unlike networkdays it does not include the enddate so, usually, there is a one day difference',
	'params' => array(
		array(
			'name' => 'startDate',
			'type' => 'Date',
			'optional' => false,
			'desc' => 'any valid date or date type field name',
		),
		array(
			'name' => 'endDate',
			'type' => 'Date',
			'optional' => false,
			'desc' => 'any valid date or date type field name',
		),
		array(
			'name' => 'include_saturdays',
			'type' => 'Integer',
			'optional' => false,
			'desc' => 'if set to 0 saturdays will not be added, if set to any other value, they will be added',
		),
		array(
			'name' => 'holidays',
			'type' => 'String',
			'optional' => false,
			'desc' => 'name of an InformationMap that contains the holiday dates to exclude<br>'.nl2br(htmlentities("<map>\n<information>\n<infotype>Holidays in France 2020</infotype>\n<value>date1</value>\n<value>date2</value>\n</information>\n</map>")).'</pre>',
		),
	),
	'categories' => array('Date and Time'),
	'examples' => array(
		"holidaydifference('2020-01-01', '2020-06-30', 0, 'holidays in Spain 2020')",
		"holidaydifference('2020-01-01', '2020-06-30', 1, 'holidays in Spain 2020')",
		"holidaydifference('2020-01-01', '2020-06-30', 0, 'holidays in France 2020')",
	),
),
'networkdays' => array(
	'name' => 'networkdays(startDate, endDate, holidays)',
	'desc' => 'Returns the number of whole working days between start_date and end_date. Working days exclude weekends and any dates identified in holidays. Unlike holidaydifference it includes the enddate so, usually, there is a one day difference',
	'params' => array(
		array(
			'name' => 'startDate',
			'type' => 'Date',
			'optional' => false,
			'desc' => 'any valid date or date type field name',
		),
		array(
			'name' => 'endDate',
			'type' => 'Date',
			'optional' => false,
			'desc' => 'any valid date or date type field name',
		),
		array(
			'name' => 'holidays',
			'type' => 'String',
			'optional' => false,
			'desc' => 'name of an InformationMap that contains the holiday dates to exclude<br>'.nl2br(htmlentities("<map>\n<information>\n<infotype>Holidays in France 2020</infotype>\n<value>date1</value>\n<value>date2</value>\n</information>\n</map>")).'</pre>',
		),
	),
	'categories' => array('Date and Time'),
	'examples' => array(
		"networkdays('2020-01-01', '2020-06-30', 'holidays in Spain 2020')",
		"networkdays('2020-01-01', '2020-06-30', 'holidays in France 2020')",
	),
),

);

foreach (glob('modules/com_vtiger_workflow/language/en_us.fndefs.*.php', GLOB_BRACE) as $tcode) {
	include $tcode;
}
