$(document).ready(function() {

$('.formQuestion').submit(function(event) {
//	var mySelection = $("input[name='choice'][type='radio']:checked").val();
	var choice = $('input:radio[name=choice]:checked').val();
//	var choice ='hello'; 
	
		
	var question = $('textarea[name=question]').val();
	var answer = $('textarea[name=answer]').val();
	
	if (question == null || question == "" || answer==null || answer=="" ) {     
    }else{
    	
    var formData = {
        'question'           : question,
        'answer'             : answer,
        'selected'           : choice,
    };
    $('textarea[name=question]').val("");
    $('textarea[name=answer]').val("");
    // process the form
    $.ajax({
        type        : 'POST', 
        url         : 'JavaStudy?form=questions',
        data        : formData, 
    });
//        $.done(function(data) {
//
//        	window.location.reload();
//
//            // here we will handle errors and validation messages
//        });

    // stop the form from submitting the normal way and refreshing the page
    event.preventDefault();
    }
});


$('.notesForm').submit(function(event) {
		
	var note = $('textarea[name=note]').val();
	
	
	if (note == null || note == "") {  
		
    }else{
    	
    var formData = {
        'note'           : note
       
    };
    $('textarea[name=note]').val("");
    // process the form
    $.ajax({
        type        : 'POST', 
        url         : 'JavaStudy?form=notes',
        data        : formData, 
    })
    
    .done(function(data) {

    	window.location.reload();

            // here we will handle errors and validation messages
        });

    event.preventDefault();
    }
});


});