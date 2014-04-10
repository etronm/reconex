$(document).ready(function() {

	/* For Button Animation */

	$(".sub-headline").hover(function() {
		$(".sub-headline .button").addClass('animated shake');
	}, function() {
		$(".sub-headline .button").removeClass('animated shake');
	});

	$(".team-thumbnail").hover(function() {
		$(".team-thumbnail-img img", this).addClass('animated flipInX');
	}, function() {
		$(".team-thumbnail-img img", this).removeClass('animated flipInX');
	});

	/* For Scroll to top */
	$('.up-arrow').click(function(event) {
		event.preventDefault();
		var liIndex = $(this).index();
		var contentPosTop = $('body').eq(liIndex).position().top;

		$('html, body').stop().animate({
			scrollTop : contentPosTop
		}, 1000);
	});

	/* ---------- Start : Portfoilo filter animation--------- */
	
			jQuery.browser={};(function(){jQuery.browser.msie=false;
			jQuery.browser.version=0;if(navigator.userAgent.match(/MSIE ([0-9]+)\./)){
			jQuery.browser.msie=true;jQuery.browser.version=RegExp.$1;}})();
	
	
	// get the action filter option item on page load
	var $filterType = $('#filtrable li.active a').attr('class'); 
	var $holder = $('ul.thumbnails'); 
	var $data = $holder.clone();
 
	$('#filtrable li a').click(function(e) {	 
		$('#filtrable li').removeClass('active'); 
		var $filterType = $(this).attr('class').split(' ').slice(-1)[0]; 
		$(this).parent().addClass('active');  
		if ($filterType == 'all') { 
			var $filteredData = $data.find('li');
		} else { 
			var $filteredData = $data.find('li[data-type=' + $filterType + ']');
		}

		// call quicksand and assign transition parameters
		$holder.quicksand($filteredData, {
			duration : 800, 
			easing : 'easeInOutQuad'
		});
		return false;
	});
	
	// Touch device porfolio Animation 
	$(".touch .thumbnail-box").hover(function() {
		$(".touch .thumbnail-box").addClass('portfolio-active');
	}, function() {
		$(".touch .thumbnail-box").removeClass('portfolio-active');
	});
	/* ---------- End : Portfoilo filter animation--------- */

});

$(window).resize(function() {
		setthumbsize();
	});

	function setthumbsize() {
		var thumbHeight = $('ul.thumbnails .item').height(), thumbWidth = $('ul.thumbnails .item').outerWidth();
		$('ul.thumbnails .item').css({
			'max-width' : thumbWidth,
			'max-height' : thumbHeight
		}); 
	}
setthumbsize();

