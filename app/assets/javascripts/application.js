// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


 jQuery(document).ready(function($) {
  $('a.hook').bind('inview', function(e,visible) {
    if( visible ) {
      $.getScript($(this).attr("href"));
    }
  });
});



 