
/*
Date Selection Box v 1.1  
===================================  
George MacKerron - 5 September 2002

PLEASE DO NOT REPRODUCE OR USE THIS CODE WITHOUT INCLUDING THIS HEADER

www.mackerron.co.uk
*/

var aMonthNames = new Array ( 'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro' ,'Outubro' , 'Novembro', 'Dezembro' );

var aDayLetters = new Array ( 'D', 'S', 'T', 'Q', 'Q', 'S', 'S' );

function DateSelectBox ( opContainer ) {

	this.date = new Date ();

	var opSelectBox = document.createElement ( 'table' );
		opSelectBox.cellPadding = opSelectBox.cellSpacing = opSelectBox.border = 0;
		opSelectBox.id = 'DSBSelectBox';
		opSelectBox.onclick = opSelectBox.dblclick = opSelectBox.onmousedown = opSelectBox.onkeyup = DSBTableClick;
		opSelectBox.width = '100%';
	var opTbody = document.createElement ( 'tbody' );
	var opRow = document.createElement ( 'tr' );
	var opDateCell = document.createElement ( 'td' );
		opDateCell.id = 'DSBSelectBoxDateCell';
		opDateCell.width = '100%';
		opDateCell.align = 'left';
	var opDropSwitchCell = document.createElement ( 'td' );
		opDropSwitchCell.id = 'DSBDropSwitchCell';
		opDropSwitchCell.tabIndex = 0;
	var opDropSwitchImage = document.createElement ( 'img' );
		opDropSwitchImage.src = '/proton/images/arrow-down.gif';

	opSelectBox.appendChild ( opTbody );
	opTbody.appendChild ( opRow );
	opRow.appendChild ( opDateCell );
	opRow.appendChild ( opDropSwitchCell );
	opDropSwitchCell.appendChild ( opDropSwitchImage );

	opContainer.appendChild ( opSelectBox );

	// set up calendar

/*	var opCalendar = document.createElement ( 'div' );
	opCalendar.id = 'DSBCalendar';
	opCalendar.style.position = 'absolute';
	opCalendar.style.width = '200px';
	opCalendar.style.display = '';
	opCalendar.onclick = opCalendar.onmousedown = opCalendar.onkeyup = DSBCalendarClick; */
	
	var opCalendar = document.createElement ( 'div' );
	opCalendar.id = 'DSBCalendar';
	opCalendar.style.position = 'absolute';
	opCalendar.style.width = '200px';
	opCalendar.style.display = '';
	opCalendar.onclick = opCalendar.onmousedown = opCalendar.onkeyup = DSBCalendarClick;
	

	var tHTML =	'<table cellpadding="0" cellspacing="0" border="0" width="100%"><tr>';
	tHTML +=	'<td align="left"><img src="/proton/images/arrow-left.gif" id="DSBLeftArrow" title="Mês Anterior" tabindex="0"></td>';
	tHTML +=	'<td id="DSBCalendarDateCell" align="center" width="100%"></td>';
	tHTML +=	'<td align="right"><img src="/proton/images/arrow-right.gif" id="DSBRightArrow" title="Próximo Mês" tabindex="0"></td>';
	tHTML +=	'</tr></table>';
	opCalendar.insertAdjacentHTML ( 'afterBegin', tHTML );

	var opCalendarTable = document.createElement ( 'table' );
		opCalendarTable.cellPadding = opCalendarTable.border = 0;
		opCalendarTable.cellSpacing = 0;
	opCalendarTable.width = '100%';
	opCalendarTbody = document.createElement ( 'tbody' );
	opCalendar.appendChild ( opCalendarTable );
	opCalendarTable.appendChild ( opCalendarTbody );

	var fDayCellMouseOver = new Function ( 'this.style.borderColor = "#000066";' );
	var fDayCellMouseOut =  new Function ( 'this.style.borderColor = this.style.backgroundColor;' );

	for ( var i = 0; i < 7; i ++ ) {
		var opCalendarRow = document.createElement ( 'tr' );
		if ( i != 0 ) opCalendarRow.id = 'DSBDayRow_' + ( i - 1 );
		opCalendarTbody.appendChild ( opCalendarRow );

		for ( var j = 0; j < 7; j ++ ) {
			var opCalendarCell = document.createElement ( 'td' );
			opCalendarCell.align = 'center';

			if ( i == 0 ) {
				opCalendarCell.className = 'DSBDayLetterCell';
				var opText = document.createTextNode ( aDayLetters [ j ] );
				opCalendarCell.appendChild ( opText );
			} else {
				opCalendarCell.id = 'DSBDayCell_' + ( i - 1 ) + '_' + j;
				opCalendarCell.onmouseover = fDayCellMouseOver;
				opCalendarCell.onmouseout = fDayCellMouseOut;
				opCalendarCell.date = new Date ();
				opCalendarCell.tabIndex = 0;
			}

			opCalendarRow.appendChild ( opCalendarCell );
		}
	}

	var opCreditRow = document.createElement ( 'tr' );
	var opCreditCell = document.createElement ( 'td' );
	opCreditCell.align = 'right';
	opCreditCell.className = 'DSBCredit';
	opCreditCell.colSpan = 7
	//opCreditCell.innerHTML = '&copy <a href="http://www.mackerron.co.uk/" class="DSBCreditLink" target="_new">George MacKerron</a> 2002';
	opCalendarTbody.appendChild ( opCreditRow );
	opCreditRow.appendChild ( opCreditCell );

	document.body.appendChild ( opCalendar );

	this.opSelectBox = opSelectBox;
	this.opCalendar = opCalendar;
	opSelectBox.oDSB = opCalendar.oDSB = this;

	this.show ();
	this.hide ();
}

DateSelectBox.prototype.evalOnDateChange = null;

DateSelectBox.prototype.setSelectBoxDate = function ( dDate ) {

	if ( ! this.selectBoxDate ) this.selectBoxDate = new Date ();
	this.selectBoxDate.setTime ( dDate.getTime () );

	this.opCalendar.all.DSBCalendarDateCell.innerText = this.selectBoxDate.MMMYYYY ();

	var dDateCursor = new Date ();
	dDateCursor.setTime ( this.selectBoxDate.getTime () ); // Set date cursor as the DSB current date
	dDateCursor.setDate ( 1 ); // Move cursor back to first of the month
	dDateCursor.setDate ( dDateCursor.getDate () - dDateCursor.getDay () ); // Move cursor back to the Saturday prior to this

	var dateDate = this.date.getDate ();
	var dateMonth = this.date.getMonth ();
	var dateYear = this.date.getYear ();

	var selectBoxDateMonth = this.selectBoxDate.getMonth ();

	for ( var i = 0; i < 6; i ++ ) this.opCalendar.all [ 'DSBDayRow_' + i ].style.display = 'none';

	for ( var i = 0; i < 6; i ++ ) {
		for ( var j = 0; j < 7; j ++ ) {

			var opDayCell = this.opCalendar.all [ 'DSBDayCell_' + i + '_' + j ];

			opDayCell.innerText = dDateCursor.getDate ();
			opDayCell.date.setTime ( dDateCursor.getTime () );
			opDayCell.title = dDateCursor.DDDMMMYYYY ();

			if ( dDateCursor.getDate () == dateDate && dDateCursor.getMonth () == dateMonth && dDateCursor.getYear () == dateYear ) {
				opDayCell.className = 'DSBSelectedDayCell';
			} else if ( dDateCursor.getMonth () == selectBoxDateMonth ) {
				opDayCell.className = ( j == 0 || j == 6 ? 'DSBWeekendDayCell' : 'DSBWeekDayCell' );
			} else {
				opDayCell.className = ( 'DSBOtherMonthDayCell' );
			}

			dDateCursor.setDate ( dDateCursor.getDate () + 1 );
		}

		this.opCalendar.all [ 'DSBDayRow_' + i ].style.display = 'block';
		if ( dDateCursor.getMonth () != selectBoxDateMonth ) break;
	}
}

DateSelectBox.prototype.setDate = function ( dDate ) {

	this.date.setTime ( dDate.getTime () );
	this.opSelectBox.all.DSBSelectBoxDateCell.innerText = this.date.DDMMYYYY ();
	this.setSelectBoxDate ( this.date );
}

DateSelectBox.prototype.show = function () {

	if ( window.DSBGlobalShowingCalendar ) DSBGlobalShowingCalendar.hide ();
	DSBGlobalShowingCalendar = this;

	DSBGlobalOriginalBodyOnMouseDown = document.body.onmousedown;
	document.body.onmousedown = this.hide;

	this.setSelectBoxDate ( this.date );

	this.opCalendar.style.left = absoluteLeft ( this.opSelectBox );
	this.opCalendar.style.top = absoluteTop ( this.opSelectBox ) + this.opSelectBox.offsetHeight - 1;

	this.opCalendar.style.display = 'block';
	this.opCalendar.all.DSBDayCell_0_0.focus ();
}

DateSelectBox.prototype.hide = function () {
	if ( DSBGlobalShowingCalendar ) {
		document.body.onmousedown = DSBGlobalOriginalBodyOnMouseDown;
		DSBGlobalShowingCalendar.opCalendar.style.display = 'none';
		DSBGlobalShowingCalendar = null;
	}
}

DateSelectBox.prototype.getDate = function () {

	var dRetDate = new Date ();
	dRetDate.setTime ( this.date.getTime () );
	return dRetDate;
}

function DSBTableClick () {

	if ( event.type != 'mousedown' && ! ( event.type == 'keyup' && event.keyCode != 13 && event.keyCode != 32 ) ) {

		var eopSrc = event.srcElement;
		var eoDSB = firstParentOfType ( eopSrc, 'table' ).oDSB;

		if ( eoDSB == DSBGlobalShowingCalendar ) DSBGlobalShowingCalendar.hide ();
		else ( eoDSB.show () );
	}
	event.cancelBubble = true;
}

function DSBCalendarClick () {

	if ( event.type != 'mousedown' && ! ( event.type == 'keyup' && event.keyCode != 13 && event.keyCode != 32 ) ) {

		var eopSrc = event.srcElement;
		var eoDSB = firstParentOfType ( eopSrc, 'div' ).oDSB;

		if ( eopSrc.date) {

			var dateChanged = ! ( DSBDatesAreEquivalent ( eoDSB.date, eopSrc.date ) );

			if (eopSrc.date > today) { eoDSB.setDate ( eopSrc.date ) };
			setTimeout ( 'DSBGlobalShowingCalendar.hide ();', 400 );

			if ( dateChanged ) eval ( eoDSB.evalOnDateChange );

		} else if ( eopSrc.id == 'DSBLeftArrow' || eopSrc.id == 'DSBRightArrow'  ) {

			var dSelectBoxDate = new Date ();
			dSelectBoxDate.setTime ( eoDSB.selectBoxDate.getTime () );
			dSelectBoxDate.setMonth ( dSelectBoxDate.getMonth () + ( eopSrc.id == 'DSBRightArrow' ? + 1 : - 1 ) );

			eoDSB.setSelectBoxDate ( dSelectBoxDate );
		}
	}
	event.cancelBubble = true;
}

Date.prototype.DDDMMMYYYY = function () {
	return this.getDate () + ' de ' + aMonthNames [ this.getMonth () ] + ' de ' + this.getYear ();
}
Date.prototype.DDMMMYYYY = function () {
	return this.getDate () + ' ' + aMonthNames [ this.getMonth () ] + ' ' + this.getYear ();
}
Date.prototype.DDMMYYYY = function () {
	return this.getDate () + '/' + (this.getMonth () + 1) + '/' + this.getYear ();
}
Date.prototype.MMMYYYY = function () {
	return aMonthNames [ this.getMonth () ] + ' ' + this.getYear ();
}

function DSBDatesAreEquivalent ( date1, date2 ) {
	if ( date1.getDate () != date2.getDate () ) return false;
	if ( date1.getMonth () != date2.getMonth () ) return false;
	if ( date1.getYear () != date2.getYear () ) return false;
	return true;
}

function absoluteLeft ( obj ) {

	// Returns pixel distance from left of window of any object

	var offset = 0;
	do {
		offset += obj.offsetLeft;
		obj = obj.offsetParent;
	} while ( obj.tagName != 'BODY' )
	return offset;
}

function absoluteTop ( obj ) {

	// Returns pixel distance from top of window of any object

	var offset = 0;
	do {
		offset += obj.offsetTop;
		obj = obj.offsetParent;
	} while ( obj.tagName != 'BODY' )
	return offset;
}

function firstParentOfType ( domObject, tagName ) {

	// Returns the first parent of the passed object with the specified tag name, or false if none found

	tagName = tagName.toUpperCase ();
	while ( domObject.tagName != 'BODY' ) {
		domObject = domObject.parentElement;
		if ( domObject.tagName == tagName ) return domObject;
	}
	return false;
}
