/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
   thisImg = 1;
   imgCt = 3;
   function newSlide(direction){
   thisImg = thisImg + direction;
   if (thisImg < 1) {thisImg = imgCt;}
   if (thisImg > imgCt){thisImg = 1;}

   document.getElementById('slideshows').src = "../../images/"+ thisImg + '.png';
   }

jQuery(document).ready(function() {

  //Show the paging and activate its first link
jQuery(".paging").show();
jQuery(".paging a:first").addClass("active");

//Get size of the image, how many images there are, then determin the size of the image reel.
var imageWidth = jQuery(".window").width();
var imageSum = jQuery(".image_reel img").size();
var imageReelWidth = imageWidth * imageSum;

//Adjust the image reel to its new size
jQuery(".image_reel").css({'width' : imageReelWidth});
//Paging  and Slider Function
rotate = function(){
    var triggerID = $active.attr("rel") - 1; //Get number of times to slide
    var image_reelPosition = triggerID * imageWidth; //Determines the distance the image reel needs to slide

    jQuery(".paging a").removeClass('active'); //Remove all active class
    $active.addClass('active'); //Add active class (the $active is declared in the rotateSwitch function)

    //Slider Animation
    jQuery(".image_reel").animate({
        left: -image_reelPosition
    }, 5000);

};

//Rotation  and Timing Event
rotateSwitch = function(){
    play = setInterval(function(){ //Set timer - this will repeat itself every 7 seconds
        $active = jQuery('.paging a.active').next(); //Move to the next paging
        if ( $active.length === 0) { //If paging reaches the end...
            $active = jQuery('.paging a:first'); //go back to first
        }
        rotate(); //Trigger the paging and slider function
    }, 7000); //Timer speed in milliseconds (7 seconds)
};

rotateSwitch(); //Run function on launch
////On Hover
jQuery(".image_reel a").hover(function() {
    clearInterval(play); //Stop the rotation
}, function() {
    rotateSwitch(); //Resume rotation timer
});

//On Click
jQuery(".paging a").click(function() {
    $active = jQuery(this); //Activate the clicked paging
    //Reset Timer
    clearInterval(play); //Stop the rotation
    rotate(); //Trigger rotation immediately
    rotateSwitch(); // Resume rotation timer
    return false; //Prevent browser jump to link anchor
});

});


