/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



jQuery(document).ready(function($) {
   $(".drop_down").click(function () {
   if ($('#mini_drop_down').css('display') == 'none'){
   $("#mini_drop_down").show();
   }
   else
   if ($("#mini_drop_down").is(':visible')){
   $("#mini_drop_down").hide();
   }
 });
  $(".drop_down_application").click(function () {
   if ($('#mini_drop_down_application').css('display') == 'none'){
   $("#mini_drop_down_application").show();
   }
   else
   if ($("#mini_drop_down_application").is(':visible')){
   $("#mini_drop_down_application").hide();
   }
    
});
});

