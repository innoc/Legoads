/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

jQuery(document).ready(function($) {
   $(".pending_hide_partner_section").click(function () {
   if ($('#pending_name_list').css('display') == 'none'){
   $('#pending_name_list').show();
   $(".pending_hide_partner_section").html("hide content")
   }
   else
   if ($("#pending_name_list").is(':visible')){
   $("#pending_name_list").hide();
   $(".pending_hide_partner_section").html("show content")
   }
 });
   $(".partner_hide_partner_section").click(function () {
   if ($('#partner_name_list').css('display') == 'none'){
   $('#partner_name_list').show();
   $(".partner_hide_partner_section").html("hide content")
   }
   else
   if ($("#partner_name_list").is(':visible')){
   $("#partner_name_list").hide();
   $(".partner_hide_partner_section").html("show content")
   }
 });
  $(".request_hide_partner_section").click(function () {
   if ($('#request_name_list').css('display') == 'none'){
   $('#request_name_list').show();
   $(".request_hide_partner_section").html("hide content")
   }
   else
   if ($("#request_name_list").is(':visible')){
   $("#request_name_list").hide();
   $(".request_hide_partner_section").html("show content")
   }
 });
 });

