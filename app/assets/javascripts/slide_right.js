/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
jQuery(document).ready(function($) {
   $("#more").click(function () {
   if ($('div#moreDiv').css('display') == 'none'){
   $("div#moreDiv").slideDown(1000).show();
   }
   else
   if ($("div#moreDiv").is(':visible')){
   $("div#moreDiv").slideUp(1000);
   }
   });
   $('#moreDiv').hover(function(e) {
          $('div#moreDiv').show();
          //.css('top', e.pageY + moveDown)
          //.css('left', e.pageX + moveLeft)
          //.appendTo('body');
        }, function() {
          $('div#moreDiv').slideUp('slow', function() {
    // Animation complete.
          });
        });

    });



