$( "input" ).keyup(function() {
  var s = $(this).val();
  if(s=="" || s==null){
	  $(this).next().hide();
	  $(this).next().next().hide();
  }else{
	  $(this).next().show();
  }
});
$("button").click(function(){
    $(this).next().toggle();
});
var nav = $('.menu');
var pos = nav.offset().top;
$(window).bind('scroll', function() {
    if ($(window).scrollTop() >pos ) {
    	$('.body').addClass('fix-body');
        $('.menu').addClass('fixed');
        
    }
    else {
    	$('.body').removeClass('fix-body');
        $('.menu').removeClass('fixed');
    }
});
