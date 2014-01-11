$(function() {
	var newsletter_form = $('#hsForm_0868cd36-34fb-4ae3-af9a-6aa7dc749b6a')
	var submit_button  	= newsletter_form.find('.hs-button');
	var submit_spacing 	= newsletter_form.find('.actions');

	newsletter_form.addClass('center');
	newsletter_form.find('label').remove();
	
	submit_button.removeClass().addClass('btn btn-default');
	submit_button.css('padding','5px');

	submit_spacing.css({
		'padding':'0px',
		'margin':'0px',
		'margin-top':'20px'
	});
});