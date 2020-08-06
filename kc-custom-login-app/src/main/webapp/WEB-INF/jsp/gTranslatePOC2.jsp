<!DOCTYPE html>
<html lang="en-US">
<body>

<a href="#googtrans(en|en)" class="lang-en lang-select" data-lang="en">English</a>
<a href="#googtrans(en|hi)" class="lang-en lang-select" data-lang="hi">Hindi</a>
<p>This example displays a simple translate button, with no text.</p>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
    function googleTranslateElementInit() {
      new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.FloatPosition.TOP_LEFT},'google_translate_element');
    }

	/*function triggerHtmlEvent(element, eventName) {
	  var event;
	  if (document.createEvent) {
		event = document.createEvent('HTMLEvents');
		event.initEvent(eventName, true, true);
		alert(element+"::"+event);
		element.dispatchEvent(event);

	  } else {
		event = document.createEventObject();
		event.eventType = eventName;
		element.fireEvent('on' + event.eventType, event);
		alert(element+"::::"+event);
	  }
	}*/

	$('.lang-select').click(function() {
	  var theLang = jQuery(this).attr('data-lang');
	  jQuery('.goog-te-combo').val(theLang);
	  window.location = jQuery(this).attr('href');
	  $("div.skiptranslate").attr("style", "visibility: hidden");
	  $("div.goog-te-banner-frame").attr("style", "visibility: hidden");
	  location.reload();
	  $("div.skiptranslate").attr("style", "visibility: hidden");
	  $("div.goog-te-banner-frame").attr("style", "visibility: hidden");

	});
</script>
<script src="http://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script>
	$(document).ready(function() {
		$("#google_translate_element").hide();
		//$(".skiptranslate").attr("style", "display: none");

		//$("div.goog-te-banner-frame").attr("style", "visibility: hidden");
		
	});
	var count=1;
	$("body:first").on('HTMLEvents',function(){
		alert("accc")
	});
</script>
</body>
</html>