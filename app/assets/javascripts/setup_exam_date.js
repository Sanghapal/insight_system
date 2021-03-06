$A.bind(window, 'load', function(){

	// Syntax : setCalendar( ID , TriggeringElement , TargetEditField , EnableComments , clickHandler , config )

	// Basic calendar with comment editing disabled

	$A.setCalendar('BasicCalendar', $A.getEl('imgCalendar_exam_date'), $A.getEl('exam_date-alt'), false, function(ev, dc, targ)
{
		// Return the desired date string
		targ.value = dc.range.wDays[dc.range.current.wDay].lng + ' ' + dc.range[dc.range.current.month].name + ' '
			+ dc.range.current.mDay + ', ' + dc.range.current.year;
		// Then close the date picker
		dc.close();
	});

});
