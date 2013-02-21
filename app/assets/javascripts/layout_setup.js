/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


jQuery(document).ready(function($) {
jQuery.event.add(window, "load", resizeFrame);
jQuery.event.add(window, "resize", resizeFrame);
function resizeFrame()
{
         var w = $(window).width();
         var h = $(window).height();
         if (w < 1210 && h < 800)
         {
          $(".index_header").css('position', 'relative')
          $(".index_header").css('margin-top', '-0.5%')
          $(".center_container").css('margin-top','0%')
          $(".left_container").css('margin-top','0.3%')
          $(".left_container").css('position', 'static')
          $(".center_container_index").css('margin-top','0%')
          $(".profile_page_container").css('margin-top','0%')
          $(".mid_page_container").css('margin-top','0%')

          $(".market_info_section").css('position', 'static')
          $(".market_info_section").css('margin-left','0%')
          $(".item_center_container").css('margin-top','0%')

   


         }
         else
         if (w > 1210 || w == 1210)
         {
         
          $(".left_container").css('position', 'fixed')
          $(".left_container").css('margin-top','-2.5%')
          $(".left_container").css('top','6em')
          $(".index_header").css('top','0')
          $(".center_container").css('margin-top','3.9%')
          $(".center_container_index").css('margin-top','3.9%')
          $(".profile_page_container").css('margin-top','3.9%')
          $(".mid_page_container").css('margin-top','3.9%')
          $(".index_header").css('margin-left','-1%')
          $(".index_header").css('position', 'fixed')
          $(".market_info_section").css('position', 'fixed')
       
          $(".market_info_section").css('left','8.5%')
     
           $(".market_info_section").css('margin-left','0%')
          $(".item_center_container").css('margin-top','3.9%')


         
         }
}

});